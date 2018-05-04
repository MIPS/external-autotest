#! /usr/bin/python

# Copyright 2015 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

"""
Manage swarming bots.

* Launch bots, e.g. 200 bots:
    $ swarming_bots.py launch --working_dir WORKING_DIR --id_range '1-200'

* Kill bot 1-200:
    $ swarming_bots.py kill --working_dir WORKING_DIR --id_range '1-200'

* Check bot 1-200, start if not running:
    $ swarming_bots.py check --working_dir WORKING_DIR --id_range '1-200'

* The hierachy of working dir is like
  WORKING_DIR
    |-- bot_0
    |   |-- 092b5bd4562f579711823f61e311de37247c853a-cacert.pem
    |   |-- bot_config.log
    |   |-- swarming_bot.log
    |   |-- swarming_bot.zip
    |   |-- swarming_bot.pid
    |-- bot_1
        |-- 092b5bd4562f579711823f61e311de37247c853a-cacert.pem
        |-- bot_config.log
        |-- swarming_bot.log
        |-- swarming_bot.zip
        |-- pid
  Note bot_config.py:get_dimensions() will rely on the the bot number
  in the path to generate bot id.

* TODO (fdeng):
    ** Restart a bot given a bot id.
"""
import argparse
import logging
import logging.handlers
import os
import re
import shutil
import signal
import socket
import subprocess
import sys
import threading
import time
import urllib

import common

from autotest_lib.client.common_lib import global_config


LOGGING_FORMAT = '%(asctime)s - %(levelname)s - %(message)s'
LOG_FILE_SIZE = 1024 * 5000 # 5000 KB
LOG_FILE_BACKUPCOUNT = 5
DEFAULT_SWARMING_PROXY = global_config.global_config.get_config_value(
        'CROS', "swarming_proxy", default=None)
ID_RANGE_FMT = r'(\d+)-(\d+)'
KILL_PROC_TIMEOUT_SECS = 3600 * 3 # 3 hours
MAX_KILL_PROC_SLEEP_SECS = 60


class BotManagementError(Exception):
    """Raised for any bot management related error."""


class PidMisMatchError(BotManagementError):
    """Raised if pid file doesn't match what's found by pgrep."""

    def __init__(self, known_pid, new_pid):
        """Initialize.

        @param known_pid: pid in the pid file.
        @param new_pid: new pid found by pgrep.

        """
        self.known_pid = known_pid
        self.new_pid = new_pid
        msg = 'pid does not match, pid: %s, found %s' % (
                self.known_pid, self.new_pid)
        super(PidMisMatchError, self).__init__(msg)


class DuplicateBotError(BotManagementError):
    """Raised when multiple processes are detected for the same bot id."""


def get_hostname():
    return socket.getfqdn().split(u'.', 1)[0]


class SwarmingBot(object):
    """Class represent a swarming bot."""


    PID_FILE = 'swarming_bot.pid'
    BOT_DIR_FORMAT = 'bot_%s'
    BOT_FILENAME = 'swarming_bot.zip'
    # Used to search for bot process
    # The process may bootstrap itself into swarming_bot.1.zip and swarming_bot.2.zip
    BOT_CMD_PATTERN = 'swarming_bot.*zip start_bot'


    def __init__(self, bot_id, parent_dir, swarming_proxy,
                 specify_bot_id=False):
        """Initialize.

        @param bot_id: An integer.
        @param bot_dir: The working directory for the bot.
                        The directory is used to store bot code,
                        log file, and any file generated by the bot
                        at run time.
        @param swarming_proxy: URL to the swarming instance.
        """
        self.bot_id = bot_id
        self.specify_bot_id = specify_bot_id
        if specify_bot_id:
            self.bot_id = '%s-%s' % (get_hostname(), str(self.bot_id))

        self.swarming_proxy = swarming_proxy
        self.parent_dir = os.path.abspath(os.path.expanduser(parent_dir))
        self.bot_dir = os.path.join(self.parent_dir,
                                    self.BOT_DIR_FORMAT % self.bot_id)
        self.pid_file = os.path.join(self.bot_dir, self.PID_FILE)
        self.pid = None
        self._refresh_pid()
        if self.pid is None:
            logging.debug('[Bot %s] Initialize: bot is not running',
                          self.bot_id)
        else:
            logging.debug('[Bot %s] Initialize: bot is running '
                          'as process %s', self.bot_id, self.pid)


    def _write_pid(self):
        """Write pid to file"""
        with open(self.pid_file, 'w') as f:
            f.write(str(self.pid))


    def _cleanup_pid(self):
        """Cleanup self.pid and pid file."""
        self.pid = None
        if os.path.exists(self.pid_file):
            os.remove(self.pid_file)


    def _is_process_running(self):
        """Check if the process is running."""
        pattern = os.path.join(self.bot_dir, self.BOT_CMD_PATTERN)
        pattern = '%s %s' % (sys.executable, pattern)
        cmd = ['pgrep', '-f', pattern]
        logging.debug('[Bot %s] check process running: %s',
                      self.bot_id, str(cmd))
        try:
            output = subprocess.check_output(cmd)
            pids = output.splitlines()
            if len(pids) > 1:
                raise DuplicateBotError('Multiple processes (pid: %s) detected for Bot %s'
                                        % (str(pids), self.bot_id))
            pid = int(pids[0])
            if pid != self.pid:
                raise PidMisMatchError(self.pid, pid)
            return True
        except subprocess.CalledProcessError as e:
            if e.returncode == 1:
                return False
            else:
                raise


    def _refresh_pid(self):
        """Check process status and update self.pid accordingly."""
        # Reload pid from pid file.
        if os.path.exists(self.pid_file):
            with open(self.pid_file) as f:
                try:
                    pid = f.readline().strip()
                    self.pid = int(pid)
                except ValueError as e:
                    self.pid = None
        try:
            if not self._is_process_running():
                self._cleanup_pid()
        except PidMisMatchError as e:
            logging.error('[Bot %s] %s, updating pid file',
                          self.bot_id, str(e))
            self.pid = e.new_pid
            self._write_pid()


    def is_running(self):
        """Return if the bot is running."""
        self._refresh_pid()
        return bool(self.pid)


    def ensure_running(self):
        """Start a swarming bot."""
        if self.is_running():
            logging.info(
                    '[Bot %s] Skip start, bot is already running (pid %s).',
                    self.bot_id, self.pid)
            return
        logging.debug('[Bot %s] Bootstrap bot in %s', self.bot_id, self.bot_dir)
        if os.path.exists(self.bot_dir):
            shutil.rmtree(self.bot_dir)
        os.makedirs(self.bot_dir)
        dest = os.path.join(self.bot_dir, self.BOT_FILENAME)
        new_env = dict(os.environ)
        logging.debug('[Bot %s] Getting bot code from: %s/bot_code',
                      self.bot_id, self.swarming_proxy)
        if self.specify_bot_id:
            url = '%s/bot_code?bot_id=%s' % (self.swarming_proxy, self.bot_id)
            new_env['SWARMING_BOT_ID'] = self.bot_id
        else:
            url = '%s/bot_code' % self.swarming_proxy

        logging.info('Download bot code from %s', url)
        urllib.urlretrieve(url, dest)
        cmd = [sys.executable, self.BOT_FILENAME]
        logging.debug('[Bot %s] Calling command: %s', self. bot_id, cmd)
        process = subprocess.Popen(
                cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                cwd=self.bot_dir, env=new_env)
        self.pid = process.pid
        self._write_pid()
        logging.info('[Bot %s] Created bot (pid: %d)', self.bot_id, self.pid)


    def kill(self):
        """Kill the bot."""
        if not self.is_running():
            logging.info('[Bot %s] Skip killing bot, Bot is not running',
                          self.bot_id)
            return
        try:
            logging.info('[Bot %s] killing bot (pid: %d)',
                          self.bot_id, self.pid)
            os.kill(self.pid, signal.SIGTERM)
            start = time.time()
            sleep = 1
            while(time.time() - start < KILL_PROC_TIMEOUT_SECS):
                if not self.is_running():
                    return
                sleep = min(sleep * 2, MAX_KILL_PROC_SLEEP_SECS)
                logging.debug('[Bot %s] Waiting %d secs for bot to finish'
                              ' any running task and exist.',
                              self.bot_id, sleep)
                time.sleep(sleep)
            else:
                logging.error(
                        '[Bot %s] Failed to kill pid %s within %d secs, '
                        'the bot may be running a long running task, you '
                        'can retry the script. SIGKILL the process is not '
                        'recommended, it might lead to unexpected error.',
                        self.bot_id, self.pid, KILL_PROC_TIMEOUT_SECS)
        except Exception as e:
            raise BotManagementError('[Bot %s] %s' % (self.bot_id, str(e)))


class BotManager(object):
    """Class that manages swarming bots."""


    CHECK_BOTS_PATTERN = '{executable} {working_dir}.*{bot_cmd_pattern}'


    def __init__(self, bot_ids, working_dir, swarming_proxy,
                 specify_bot_id=False):
        """Initialize.

        @param bot_ids: a set of integers.
        @param working_dir: Working directory of the bots.
                            Store temporary files.
        @param swarming_proxy: The swarming instance to talk to.
        """
        self.bot_ids = bot_ids
        self.working_dir = os.path.abspath(os.path.expanduser(working_dir))
        self.bots = [SwarmingBot(bid, self.working_dir, swarming_proxy,
                                 specify_bot_id)
                     for bid in bot_ids]

    def launch(self):
        """Launch bots."""
        for bot in self.bots:
          try:
              bot.ensure_running()
          except BotManagementError as e:
              logging.error('[BotManager] Failed to start Bot %s: %s',
                            bot.bot_id, str(e))
        # If we let the process exit immediately, the last process won't
        # be launched sometimes. So sleep for 3 secs.
        # The right way is to query the server until all bots are seen
        # by the server by visiting
        # https://SWARMING_PROXY/swarming/api/v1/client/bots
        # However, this would require oauth authentication (install
        # oauth library and install credentials).
        logging.info('Wait 3 seconds for process creation to complete.')
        time.sleep(3)


    def kill(self):
        """Kill running bots."""
        # Start threads to kill bots.
        threads = []
        for bot in self.bots:
            t = threading.Thread(target=bot.kill)
            threads.append(t)
            t.setDaemon(True)
            t.start()
        # Wait on threads.
        try:
            while threading.active_count() > 1:
                time.sleep(0.1)
        except KeyboardInterrupt:
            msg = 'Ctrl-c recieved! Bots status not confirmed. Exit.'
            logging.error(msg)
            print msg


    def check(self):
        """Check running bots, start it if not running."""
        pattern =  self.CHECK_BOTS_PATTERN.format(
                executable=sys.executable, working_dir=self.working_dir,
                bot_cmd_pattern=SwarmingBot.BOT_CMD_PATTERN)
        cmd = ['pgrep', '-f', pattern]
        logging.debug('[BotManager] Check bot counts: %s', str(cmd))
        try:
            output = subprocess.check_output(cmd)
            bot_count = len(output.splitlines())
        except subprocess.CalledProcessError as e:
            if e.returncode == 1:
                bot_count = 0
            else:
                raise
        missing_count = len(self.bot_ids) - bot_count
        logging.info(
                '[BotManager] Check bot counts: %d bots running, missing: %d',
                bot_count, missing_count)
        if missing_count > 0:
            logging.info('[BotManager] Checking all bots')
            self.launch()


def parse_range(id_range):
    """Convert an id range to a set of bot ids.

    @param id_range: A range of integer, e.g "1-200".

    @returns a set of bot ids set([1,2,...200])
    """
    m = re.match(ID_RANGE_FMT, id_range)
    if not m:
        raise ValueError('Could not parse %s' % id_range)
    min, max = int(m.group(1)), int(m.group(2))
    return set(bid for bid in range(min, max+1))


def _parse_args(args):
    """Parse args.

    @param args: Argument list passed from main.

    @return: A tuple with the parsed args, as returned by parser.parse_args.
    """
    parser = argparse.ArgumentParser(
            description='Launch swarming bots on a autotest server')
    action_help = ('launch: launch bots. '
                  'kill: kill bots. '
                  'check: check if bots are running, if not, starting bots.')
    parser.add_argument(
            'action', choices=('launch', 'kill', 'check'), help=action_help)
    parser.add_argument(
            '-r', '--id_range', type=str, dest='id_range', required=True,
            help='A range of integer, each bot created will be labeled '
                 'with an id from this range. E.g. "1-200"')
    parser.add_argument(
            '-d', '--working_dir', type=str, dest='working_dir', required=True,
            help='A working directory where bots will store files '
                 'generated at runtime')
    parser.add_argument(
            '-p', '--swarming_proxy', type=str, dest='swarming_proxy',
            default=DEFAULT_SWARMING_PROXY,
            help='The URL of the swarming instance to talk to, '
                 'Default to the one specified in global config')
    parser.add_argument(
            '-f', '--log_file', dest='log_file',
            help='Path to the log file.')
    parser.add_argument(
            '-v', '--verbose', dest='verbose', action='store_true',
            help='Verbose mode')

    return parser.parse_args(args)


def setup_logging(verbose, log_file):
    """Setup logging.

    @param verbose: bool, if True, log at DEBUG level, otherwise INFO level.
    @param log_file; path to log file.
    """
    log_formatter = logging.Formatter(LOGGING_FORMAT)
    if not log_file:
        handler = logging.StreamHandler()
    else:
        handler = logging.handlers.RotatingFileHandler(
                filename=log_file, maxBytes=LOG_FILE_SIZE,
                backupCount=LOG_FILE_BACKUPCOUNT)
    handler.setFormatter(log_formatter)
    logger = logging.getLogger()
    log_level = logging.DEBUG if verbose else logging.INFO
    logger.setLevel(log_level)
    logger.addHandler(handler)


def main(args):
    """Main.

    @args: A list of system arguments.
    """
    args = _parse_args(args)
    setup_logging(args.verbose, args.log_file)

    if not args.swarming_proxy:
        logging.error(
                'No swarming proxy instance specified. '
                'Specify swarming_proxy in [CROS] in shadow_config, '
                'or use --swarming_proxy')
        return 1
    if not args.swarming_proxy.startswith('https://'):
        swarming_proxy = 'https://' + args.swarming_proxy
    else:
        swarming_proxy = args.swarming_proxy

    logging.info('Connecting to %s', swarming_proxy)
    m = BotManager(parse_range(args.id_range),
                   args.working_dir, args.swarming_proxy)

    if args.action == 'launch':
        m.launch()
    elif args.action == 'kill':
        m.kill()
    elif args.action == 'check':
        m.check()


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
