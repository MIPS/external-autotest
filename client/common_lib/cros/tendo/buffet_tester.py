# Copyright 2015 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import dbus
import json
import logging
import os
import shutil
import tempfile
import time

from autotest_lib.client.cros import dbus_util
from autotest_lib.client.common_lib import error
from autotest_lib.client.common_lib import utils
from autotest_lib.client.common_lib.cros.fake_device_server import \
        fake_gcd_helper
from autotest_lib.client.common_lib.cros.fake_device_server.client_lib import \
        commands
from autotest_lib.client.common_lib.cros.fake_device_server.client_lib import \
        devices
from autotest_lib.client.common_lib.cros.fake_device_server.client_lib import \
        fail_control
from autotest_lib.client.common_lib.cros.fake_device_server.client_lib import \
        oauth
from autotest_lib.client.common_lib.cros.fake_device_server.client_lib import \
        registration
from autotest_lib.client.common_lib.cros.tendo import buffet_config


TEST_NAME = 'test_name '
TEST_DESCRIPTION = 'test_description '
TEST_LOCATION = 'test_location '

DBUS_INTERFACE_OBJECT_MANAGER = 'org.freedesktop.DBus.ObjectManager'

TEST_COMMAND_CATEGORY = 'registration_test'
TEST_COMMAND_NAME = '_TestEcho'
TEST_COMMAND_PARAM = 'message'
TEST_COMMAND_DEFINITION = {
    TEST_COMMAND_CATEGORY: {
        TEST_COMMAND_NAME: {
            'parameters': { TEST_COMMAND_PARAM: { 'type': 'string' } },
            'results': {},
            'name': 'Test Echo Command',
        }
    }
}


def _assert_has(resource, key, value, resource_description):
    if resource is None:
        raise error.TestFail('Wanted %s[%s]=%r, but %s is None.' %
                (resource_description, key, value))
    if key not in resource:
        raise error.TestFail('%s not in %s' % (key, resource_description))

    if resource[key] != value:
        raise error.TestFail('Wanted %s[%s]=%r, but got %r' %
                (resource_description, key, value, resource[key]))


class BuffetTester(object):
    """Helper class for buffet tests."""


    def __init__(self):
        """Initialization routine."""
        # We're going to confirm buffet is polling by issuing commands to
        # the mock GCD server, then checking that buffet gets them.  The
        # commands are test.TestEcho commands with a single parameter
        # |message|.  |self._expected_messages| is a list of these messages.
        self._expected_messages = []
        # We store our command definitions under this root.
        self._temp_dir_path = None
        self._bus = dbus.SystemBus()
        # Spin up our mock server.
        self._gcd = fake_gcd_helper.FakeGCDHelper()
        self._gcd.start()
        # Create the command definition we want to use.
        self._temp_dir_path = tempfile.mkdtemp()
        commands_dir = os.path.join(self._temp_dir_path, 'commands')
        os.mkdir(commands_dir)
        command_definition_path = os.path.join(
                commands_dir, '%s.json' % TEST_COMMAND_CATEGORY)
        with open(command_definition_path, 'w') as f:
            f.write(json.dumps(TEST_COMMAND_DEFINITION))
        utils.run('chown -R buffet:buffet %s' % self._temp_dir_path)
        logging.debug('Created test commands definition: %s',
                      command_definition_path)
        # Create client proxies for interacting with oyr fake server.
        self._registration_client = registration.RegistrationClient(
                server_url=buffet_config.LOCAL_SERVICE_URL,
                api_key=buffet_config.TEST_API_KEY)
        self._device_client = devices.DevicesClient(
                server_url=buffet_config.LOCAL_SERVICE_URL,
                api_key=buffet_config.TEST_API_KEY)
        self._oauth_client = oauth.OAuthClient(
                server_url=buffet_config.LOCAL_SERVICE_URL,
                api_key=buffet_config.TEST_API_KEY)
        self._fail_control_client = fail_control.FailControlClient(
                server_url=buffet_config.LOCAL_SERVICE_URL,
                api_key=buffet_config.TEST_API_KEY)
        self._command_client = commands.CommandsClient(
                server_url=buffet_config.LOCAL_SERVICE_URL,
                api_key=buffet_config.TEST_API_KEY)
        self._config = buffet_config.BuffetConfig(
                log_verbosity=3,
                test_definitions_dir=self._temp_dir_path)


    def check_buffet_status_is(self, expected_status,
                               expected_device_id='',
                               timeout_seconds=0):
        """Assert that buffet has the given registration status.

        Optionally, a timeout can be specified to wait until the
        status changes.

        @param expected_device_id: device id created during registration.
        @param expected_status: the status to wait for.
        @param timeout_seconds: number of seconds to wait for status to change.

        """
        manager_properties = dbus.Interface(
                self._bus.get_object(buffet_config.SERVICE_NAME,
                                     buffet_config.MANAGER_OBJECT_PATH),
                dbus_interface='org.freedesktop.DBus.Properties')

        start_time = time.time()
        while True:
            actual_status = manager_properties.Get(
                buffet_config.MANAGER_INTERFACE,
                buffet_config.MANAGER_PROPERTY_STATUS)
            actual_device_id = manager_properties.Get(
                buffet_config.MANAGER_INTERFACE,
                buffet_config.MANAGER_PROPERTY_DEVICE_ID)
            if (actual_status == expected_status and
                actual_device_id == expected_device_id):
                return
            time_spent = time.time() - start_time
            if time_spent > timeout_seconds:
                if actual_status != expected_status:
                    raise error.TestFail('Buffet should be %s, but is %s '
                                         '(waited %.1f seconds).' %
                                         (expected_status, actual_status,
                                          time_spent))
                if actual_device_id != expected_device_id:
                    raise error.TestFail('Device ID  should be %s, but is %s '
                                         '(waited %.1f seconds).' %
                                         (expected_device_id, actual_device_id,
                                          time_spent))
            time.sleep(0.5)


    def check_buffet_is_polling(self, device_id, timeout_seconds=30):
        """Assert that buffet is polling for new commands.

        @param device_id: string device id created during registration.
        @param timeout_seconds: number of seconds to wait for polling
                to start.

        """
        new_command_message = ('This is message %d' %
                               len(self._expected_messages))
        command_resource = {
            'name': '%s.%s' % (TEST_COMMAND_CATEGORY, TEST_COMMAND_NAME),
            'deviceId': device_id,
            'parameters': {TEST_COMMAND_PARAM: new_command_message}
        }
        self._expected_messages.append(new_command_message)
        self._command_client.create_command(device_id, command_resource)
        # Confirm that the command eventually appears on buffet.
        object_manager = dbus.Interface(
                self._bus.get_object(buffet_config.SERVICE_NAME,
                                     buffet_config.OBJECT_MANAGER_PATH),
                dbus_interface=DBUS_INTERFACE_OBJECT_MANAGER)
        polling_interval_seconds = 0.5
        start_time = time.time()
        while time.time() - start_time < timeout_seconds:
            objects = dbus_util.dbus2primitive(
                    object_manager.GetManagedObjects())
            cmds = [interfaces[buffet_config.COMMAND_INTERFACE]
                    for path, interfaces in objects.iteritems()
                    if buffet_config.COMMAND_INTERFACE in interfaces]
            # |cmds| is a list of property sets
            if len(cmds) != len(self._expected_messages):
                # Still waiting for our pending command to show up.
                time.sleep(polling_interval_seconds)
                continue
            logging.debug('Finally saw the right number of commands over '
                          'DBus: %r', cmds)
            messages = [cmd['Parameters'][TEST_COMMAND_PARAM] for cmd in cmds
                        if (cmd['Category'] == TEST_COMMAND_CATEGORY and
                            cmd['Name'] == '%s.%s' % (TEST_COMMAND_CATEGORY,
                                                      TEST_COMMAND_NAME))]
            if sorted(messages) != sorted(self._expected_messages):
                raise error.TestFail(
                        'Expected commands with messages=%r but got %r.' %
                        (self._expected_messages, messages))
            logging.info('Buffet has DBus proxies for commands with '
                         'messages: %r', self._expected_messages)
            return
        raise error.TestFail('Timed out waiting for Buffet to expose '
                             'pending commands with messages: %r' %
                             self._expected_messages)


    def register_with_server(self):
        """Make buffet register with the cloud server.

        This includes the whole registration flow and ends with buffet
        obtained an access token for future interactions. The status
        is guaranteed to be buffet_config.STATUS_CONNECTED when this
        method returns.

        @return string: the device_id obtained during registration.

        """
        ticket = self._registration_client.create_registration_ticket()
        logging.info('Created ticket: %r', ticket)
        manager_proxy = dbus.Interface(
                self._bus.get_object(buffet_config.SERVICE_NAME,
                                     buffet_config.MANAGER_OBJECT_PATH),
                dbus_interface=buffet_config.MANAGER_INTERFACE)
        registration_params = dbus.Dictionary(signature='sv')
        registration_params.update({
                'ticket_id': ticket['id'],
                'name': TEST_NAME,
                'description': TEST_DESCRIPTION,
                'location': TEST_LOCATION,
        })
        device_id = dbus_util.dbus2primitive(
                manager_proxy.RegisterDevice(registration_params))
        # Confirm that registration has populated some fields.
        device_resource = self._device_client.get_device(device_id)
        logging.debug('Got device resource=%r', device_resource)
        _assert_has(device_resource, 'name', TEST_NAME,
                    'device resource')
        _assert_has(device_resource, 'modelManifestId', 'AATST',
                    'device resource')
        logging.info('Registration successful')
        self.check_buffet_status_is(
                buffet_config.STATUS_CONNECTED, expected_device_id=device_id,
                timeout_seconds=5)
        return device_id


    def restart_buffet(self, reset_state):
        """Function for restarting the buffet daemon.

        @param reset_state: If True, all local buffet state will be deleted.
        """
        self._config.restart_with_config(clean_state=reset_state)


    def close(self):
        """Cleanup to be used when done with this instance."""
        buffet_config.BuffetConfig.naive_restart()
        self._gcd.close()
        if self._temp_dir_path is not None:
            shutil.rmtree(self._temp_dir_path, True)
