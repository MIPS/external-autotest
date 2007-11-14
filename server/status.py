#!/usr/bin/python
import sys, re


class Machine:
	"""
	Represents the current state of a machine. Possible values are:
		TESTING     currently running a test
		REBOOTING   currently rebooting
		BROKEN      busted somehow (e.g. reboot timed out)
		OTHER       none of the above

	The implementation is basically that of a state machine. From an
	external point of view the only relevant attributes are:
	        details     text description of the current status
		test_count  number of tests run
	"""
	def __init__(self):
		self.state = "OTHER"
		self.details = "Running"
		self.test_name = ""
		self.test_count = 0


	def process_line(self, line):
		self.handlers[self.state](self, line)


	def _OTHER_handler(self, line):
		match = self.job_start.match(line)
		if match:
			self.state = "TESTING"
			self.tab_level = len(match.group(1))
			self.test_name = match.group(2)
			self.test_status = "GOOD"
			self.details = "Running %s" % self.test_name
			return

		match = self.reboot_start.match(line)
		if match:
			self.boot_status = match.group(1)
			if self.worse_status("GOOD", self.boot_status) == "GOOD":
				self.state = "REBOOTING"
				self.details = "Rebooting"
			else:
				self.state = "BROKEN"
				self.details = "Reboot failed - machine broken"
			return


	def _TESTING_handler(self, line):
		match = self.job_status.match(line)
		if match:
			if len(match.group(1)) != self.tab_level + 1:
				return   # we don't care about subgroups
			if self.test_name != match.group(3):
				return   # we don't care about other tests
			self.test_status = self.worse_status(self.test_status,
							     match.group(2))
			self.details = "Running %s: %s" % (self.test_name,
							    match.group(4))
			return

		match = self.job_end.match(line)
		if match:
			if len(match.group(1)) != self.tab_level:
				return   # we don't care about subgroups
			if self.test_name != match.group(3):
				raise Exception("Group START and END name mismatch")
			self.state = "OTHER"
			self.test_status = self.worse_status(self.test_status,
							     match.group(2))
			self.test_name = ""
			del self.test_status
			self.details = "Running"
			self.test_count += 1
			return


	def _REBOOTING_handler(self, line):
		match = self.reboot_done.match(line)
		if match:
			status = self.worse_status(self.boot_status,
						   match.group(1))
			del self.boot_status
			if status == "GOOD":
				self.state = "OTHER"
				self.details = "Running"
			else:
				self.state = "BROKEN"
				self.details = "Reboot failed - machine broken"
			return


	def _BROKEN_handler(self, line):
		pass    # just do nothing - we're broken and staying broken


	handlers = {"OTHER": _OTHER_handler,
		    "TESTING": _TESTING_handler,
		    "REBOOTING": _REBOOTING_handler,
		    "BROKEN": _BROKEN_handler}


	status_list = ["GOOD", "WARN", "FAIL", "ABORT", "ERROR"]
	order_dict = {None: -1}
	order_dict.update((status, i)
			  for i, status in enumerate(status_list))


	job_start = re.compile(r"^(\t*)START\t----\ttest\.([^\t]+).*$")
	job_status = re.compile(r"^(\t*)(%s)\t([^\t]+)\t(?:[^\t]+).*\t([^\t]+)$" %
				"|".join(status_list))
	job_end = re.compile(r"^(\t*)END (%s)\t----\ttest\.([^\t]+).*$" %
			     "|".join(status_list))
	reboot_start = re.compile(r"^\t?(%s)\t[^\t]+\treboot\.start.*$" %
				  "|".join(status_list))
	reboot_done = re.compile(r"^\t?(%s)\t[^\t]+\treboot\.verify.*$" %
				 "|".join(status_list))

	@classmethod
	def worse_status(cls, old_status, new_status):
		if cls.order_dict[new_status] > cls.order_dict[old_status]:
			return new_status
		else:
			return old_status


def parse_status(status_log):
	parser = Machine()
	for line in file(status_log):
		parser.process_line(line)
	result = {
	    "status": parser.details,
	    "test_on": parser.test_name,
	    "test_num_complete": parser.test_count
	    }
	return result


if __name__ == "__main__":
 	args = sys.argv[1:]
 	if len(args) != 1:
 		print "USAGE: status.py status_log"
 		sys.exit(1)
	print parse_status(args[0])
