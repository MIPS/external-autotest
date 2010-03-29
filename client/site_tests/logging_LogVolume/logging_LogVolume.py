# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

import logging, os, re, subprocess, utils
from autotest_lib.client.bin import site_login, site_ui_test, test
from autotest_lib.client.common_lib import error


class logging_LogVolume(site_ui_test.UITest):
    version = 1


    def log_stateful_used(self):
        output = utils.system_output('df /mnt/stateful_partition/')
        matches = re.search('(\d+)%', output)
        if matches is None:
            error.TestError('df failed')
        self._perf['percent_stateful_used'] = int(matches.group(1))


    def run_once(self):
        if not site_login.wait_for_cryptohome():
            raise error.TestFail('Could not wait for crytohome')

        self._perf = {}
        self.log_stateful_used()
        whitelist = open(os.path.join(self.bindir,
                                      'stateful_whitelist.txt'))
        patterns = {}
        for pattern in whitelist.readlines():
            pattern = pattern.strip()
            if pattern == '' or pattern[0] == '#':
                continue
            if pattern in patterns:
                logging.error('Duplicate pattern in file: %s' % pattern)
            patterns[pattern] = {
                'regexp': re.compile(pattern + '$'),
                'count': 0
                }

        find_handle = subprocess.Popen(['find',
                                        '/mnt/stateful_partition'],
                                       stdout=subprocess.PIPE)
        stateful_files = 0
        # Count number of files that were found but were not whitelisted.
        unexpected_files = 0
        for filename in find_handle.stdout.readlines():
            filename = filename.strip()[len('/mnt/stateful_partition'):]
            if filename == '':
                continue
            stateful_files += 1
            match = False
            for pattern in patterns:
                regexp = patterns[pattern]['regexp']
                if regexp.match(filename):
                    match = True
                    patterns[pattern]['count'] += 1
                    break
            if not match:
                logging.error('Unexpected file %s' % filename)
                unexpected_files += 1

        unmatched_patterns = 0
        for pattern in patterns:
            if patterns[pattern]['count'] == 0:
                logging.warn('No files matched: %s' % pattern)
                unmatched_patterns += 1

        self._perf['percent_unused_patterns'] = \
            int(100 * unmatched_patterns / len(patterns))

        self._perf['files_in_stateful_partition'] = stateful_files

        self.write_perf_keyval(self._perf)

        if unexpected_files > 0:
            raise error.TestError('There were %d unexpected files' %
                                  unexpected_files)
