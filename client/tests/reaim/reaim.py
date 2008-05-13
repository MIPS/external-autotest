# Needs autoconf & automake & libtool to be installed. Ewwwwwwwwwwwwwwwwwwwwww
import test, os_dep, re
from autotest_utils import *

class reaim(test.test):
	version = 1

	# http://prdownloads.sourceforge.net/re-aim-7/osdl-aim-7.0.1.13.tar.gz
	def setup(self, tarball = 'osdl-aim-7.0.1.13.tar.gz'):
		tarball = unmap_url(self.bindir, tarball, self.tmpdir)
		extract_tarball_to_dir(tarball, self.srcdir)

		self.job.setup_dep(['libaio'])
		libs = '-L' + self.autodir + '/deps/libaio/lib -laio'
		cflags = '-I ' + self.autodir + '/deps/libaio/include'
		var_libs = 'LIBS="' + libs + '"'
		var_cflags  = 'CFLAGS="' + cflags + '"'
		self.make_flags = var_libs + ' ' + var_cflags

		os_dep.commands('autoconf', 'automake', 'libtoolize')
		os.chdir(self.srcdir)
		system('./bootstrap')
		system('./configure')
		# we can't use patch here, as the Makefile is autogenerated
		# so we can't tell exactly what it looks like.
		# Perform some foul in-place sed hackery instead.
		for file in ('Makefile', 'src/Makefile'):
			system('sed -i "s/^CFLAGS =/CFLAGS +=/" ' + file)
			system('sed -i "s/^LIBS =/LIBS +=/" ' + file)
		system(self.make_flags + ' make')
		os.rename('src/reaim', 'reaim')


	def initialize(self):
		self.ldlib = 'LD_LIBRARY_PATH=%s/deps/libaio/lib'%(self.autodir)


	def execute(self, iterations = 1, workfile = 'workfile.short', 
			start = 1, end = 10, increment = 2,
			extra_args = '', tmpdir = None):
		if not tmpdir:
			tmpdir = self.tmpdir

		# -f workfile
		# -s <number of users to start with>
		# -e <number of users to end with>
		# -i <number of users to increment>
		workfile = os.path.join('data', workfile)
		args = "-f %s -s %d -e %d -i %d" %(workfile,start,end,increment)
		config = os.path.join(self.srcdir, 'reaim.config')
		system('cp -f %s/reaim.config %s' % (self.bindir, config))
		args += ' -c ./reaim.config'
		open(config, 'a+').write("DISKDIR %s\n" % (tmpdir))
		os.chdir(self.srcdir)
		print os.getcwd()
		cmd = self.ldlib + ' ./reaim ' + args + ' ' + extra_args
		results = ''

		profilers = self.job.profilers
		if not profilers.only():
			for i in range(iterations):
				results += system_output(cmd) + '\n'

		# Do a profiling run if necessary
		if profilers.present():
			profilers.start(self)
			results += system_output(cmd) + '\n'
			profilers.stop(self)
			profilers.report(self)

		print results
		self.__format_results(results)


	def __format_results(self, results):
		out = open(self.resultsdir + '/keyval', 'w')
		for line in results.split('\n'):
			m = re.match('Max Jobs per Minute (\d+)', line)
			if m:
				max_jobs_per_min = m.group(1)
			if re.match(r"^[0-9\. ]+$", line):
				fields = line.split()
		print >> out, """\
max_jobs_per_min=%s
num_forked=%s
parent_time=%s
child_systime=%s
child_utime=%s
jobs_min=%s
jobs_min_child=%s
std_dev_time=%s
std_dev_pct=%s
jti=%s
""" % tuple([max_jobs_per_min] + fields)
		out.close()
