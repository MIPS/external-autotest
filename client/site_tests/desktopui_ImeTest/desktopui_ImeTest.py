# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import os, string, time, gtk
from autotest_lib.client.bin import site_ui_test, test
from autotest_lib.client.common_lib import error, site_ui, utils


class desktopui_ImeTest(site_ui_test.UITest):
    version = 1
    preserve_srcdir = True

    def setup(self):
        # TODO: We shouldn't use ibusclient, we should talk to Chrome directly
        self.job.setup_dep(['ibusclient'])


    # TODO: Get rid of this function.
    def run_ibusclient(self, options):
        cmd = site_ui.xcommand_as('%s %s' % (self.exefile, options), 'chronos')
        return utils.system_output(cmd, retain_output=True)


    # TODO: Make this function talk to chrome directly
    def preload_engines(self, engine_list):
        engine_names = string.join(engine_list, " ")
        out = self.run_ibusclient('preload_engines %s' % engine_names)
        if not 'OK' in out:
            raise error.TestFail('Failed to preload engines: %s' % engine_names)

        # ibus takes some time to preload the engines, and they can't be
        # activated until they are done loading.  Since we don't get notified
        # when they are ready, we have to wait here to give them time.
        time.sleep(2)


    # TODO: Make this function talk to chrome directly
    def activate_engine(self, engine_name):
        out = self.run_ibusclient('activate_engine %s' % engine_name)
        if not 'OK' in out:
            raise error.TestFail('Failed to activate engine: %s' % engine_name)


    # TODO: Make this function set the config value directly, instead of
    # attempting to navigate the UI.
    def toggle_ime_process(self):
        # Before we try to activate the options menu, we need to wait for
        # previous actions to complete.  Most notably is that pressing F5
        # immediately after login gets lost.
        time.sleep(3)
        ax = self.get_autox()

        # Open the config dialog.
        ax.send_hotkey('F5')
        time.sleep(2)

        # Select the "Languages and Input" button.
        ax.send_text('\t\t\t\t\t\t\t\t\t\t\t ')

        # Select the "International keyboard" checkbox.
        ax.send_text('\t\t\t\t\t\t ')

        # Close the window.
        ax.send_hotkey('Ctrl+w')
        time.sleep(1)


    def get_current_text(self):
        # Because there can be a slight delay between entering text and the
        # output from the ime being received, we need to sleep here.
        time.sleep(1)
        ax = self.get_autox()

        # Select all the text so that it can be accessed via the clipboard.
        ax.send_hotkey('Ctrl-a')
        time.sleep(1)

        # The DISPLAY environment variable isn't set, so we have to manually get
        # the proper display.
        display = gtk.gdk.Display(":0.0")

        clip = gtk.Clipboard(display, "PRIMARY")
        return clip.wait_for_text()


    def test_ibus_start_process(self):
        # Check that enabling the IME launches ibus.
        self.toggle_ime_process()
        success = False
        start_time = time.time()
        while time.time() - start_time < 10:
            if os.system('pgrep ^ibus-daemon$') == 0:
                success = True
                break
            time.sleep(1)
        if not success:
            raise error.TestFail('ibus-daemon did not start via config')


    def test_ibus_stop_process(self):
        # Check that disabling the IME stops ibus.
        self.toggle_ime_process()
        success = False
        start_time = time.time()
        while time.time() - start_time < 10:
            if os.system('pgrep ^ibus-daemon$') != 0:
                success = True
                break
            time.sleep(1)
        if not success:
            raise error.TestFail('ibus-daemon did not stop via config')


    def test_engine(self, engine_name, input_string, expected_string):
        self.preload_engines([engine_name])
        self.activate_engine(engine_name)

        ax = self.get_autox()

        # Focus on the omnibox so that we can enter text.
        ax.send_hotkey('Ctrl-l')

        ax.send_text(input_string)

        text = self.get_current_text()
        if text != expected_string:
            raise error.TestFail(
                'Engine %s failed: Got %s, expected %s' % (engine_name, text,
                                                           expected_string))


    def run_once(self):
        dep = 'ibusclient'
        dep_dir = os.path.join(self.autodir, 'deps', dep)
        self.job.install_pkg(dep, 'dep', dep_dir)

        self.exefile = os.path.join(self.autodir,
                                    'deps/ibusclient/ibusclient')

        self.test_ibus_start_process()
        self.test_engine('mozc', 'nihongo \n',
                         '\xE6\x97\xA5\xE6\x9C\xAC\xE8\xAA\x9E')
        self.test_engine('chewing', 'hol \n', '\xE6\x93\x8D')
        self.test_engine('hangul', 'wl ', '\xEC\xA7\x80 ')
        self.test_engine('pinyin', 'nihao ', '\xE4\xBD\xA0\xE5\xA5\xBD')
        self.test_ibus_stop_process()
