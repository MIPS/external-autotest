# Generated by the protocol buffer compiler.  DO NOT EDIT!

from googlepb.protobuf import descriptor
from googlepb.protobuf import message
from googlepb.protobuf import reflection
from googlepb.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)



DESCRIPTOR = descriptor.FileDescriptor(
  name='autotest.proto',
  package='',
  serialized_pb='\n\x0e\x61utotest.proto\"\xc0\x02\n\x05\x42uild\x12\r\n\x05\x62oard\x18\x01 \x02(\t\x12\x0c\n\x04name\x18\x02 \x02(\t\x12\x0f\n\x07version\x18\x03 \x01(\t\x12\x0c\n\x04hash\x18\x04 \x01(\t\x12\x0b\n\x03seq\x18\x05 \x01(\x05\x12\x10\n\x08netbooks\x18\x06 \x03(\t\x12\x1b\n\x11\x62uildlog_json_url\x18\x07 \x01(\t:\x00\x12\x16\n\x0c\x62uildlog_url\x18\x08 \x01(\t:\x00\x12\x19\n\x0f\x62uild_image_url\x18\t \x01(\t:\x00\x12\x1d\n\x12\x62uild_started_time\x18\n \x01(\x02:\x01\x30\x12\x1e\n\x13\x62uild_finished_time\x18\x0b \x01(\x02:\x01\x30\x12\x15\n\nbuild_time\x18\x0c \x01(\x02:\x01\x30\x12\x18\n\x0e\x63hrome_version\x18\r \x01(\t:\x00\x12\x1c\n\x11\x63hrome_svn_number\x18\x0e \x01(\x05:\x01\x30\"*\n\x0cHostKeyValue\x12\x0b\n\x03key\x18\x02 \x02(\t\x12\r\n\x05value\x18\x03 \x02(\t\",\n\rPerfKerValues\x12\x0b\n\x03key\x18\x02 \x02(\t\x12\x0e\n\x06values\x18\x03 \x03(\x02\"\xf0\x02\n\x04Test\x12\n\n\x02id\x18\x01 \x01(\x03\x12\x13\n\x0btko_test_id\x18\x02 \x01(\x03\x12\x11\n\ttest_name\x18\x03 \x02(\t\x12\x1c\n\x11test_started_time\x18\x04 \x01(\x02:\x01\x30\x12\x1d\n\x12test_finished_time\x18\x05 \x01(\x02:\x01\x30\x12\x12\n\nafe_job_id\x18\x06 \x01(\x03\x12\x0f\n\x07netbook\x18\x07 \x01(\t\x12\r\n\x05\x62oard\x18\x08 \x01(\t\x12\r\n\x05\x62uild\x18\t \x01(\t\x12\r\n\x05owner\x18\n \x01(\t\x12\x0e\n\x06status\x18\x0b \x01(\t\x12\x10\n\x08hostname\x18\x0c \x01(\t\x12\x16\n\x0e\x63hrome_version\x18\r \x01(\t\x12\x14\n\x0ctest_log_url\x18\x0e \x01(\t\x12#\n\x0chost_keyvals\x18\x0f \x03(\x0b\x32\r.HostKeyValue\x12 \n\x08perfkeys\x18\x10 \x03(\x0b\x32\x0e.PerfKerValues\x12\x0e\n\x06reason\x18\x11 \x01(\t\"\xb5\x03\n\x03Job\x12\n\n\x02id\x18\x01 \x01(\x03\x12\x12\n\nafe_job_id\x18\x02 \x01(\x03\x12\x10\n\x08job_name\x18\x03 \x02(\t\x12\x0f\n\x07netbook\x18\x04 \x01(\t\x12\r\n\x05\x62oard\x18\x05 \x01(\t\x12\r\n\x05\x62uild\x18\x06 \x01(\t\x12\r\n\x05owner\x18\x07 \x01(\t\x12\x12\n\njob_status\x18\x08 \x01(\x08\x12\x1b\n\x10job_created_time\x18\t \x01(\x02:\x01\x30\x12\x1a\n\x0fjob_queued_time\x18\n \x01(\x02:\x01\x30\x12\x1b\n\x10job_started_time\x18\x0b \x01(\x02:\x01\x30\x12\x1c\n\x11job_finished_time\x18\x0c \x01(\x02:\x01\x30\x12\x1c\n\x11test_started_time\x18\r \x01(\x02:\x01\x30\x12\x1d\n\x12test_finished_time\x18\x0e \x01(\x02:\x01\x30\x12\x11\n\x06passed\x18\x0f \x01(\x05:\x01\x30\x12\x10\n\x05total\x18\x10 \x01(\x05:\x01\x30\x12\x1a\n\x0b\x65mail_alert\x18\x11 \x01(\x08:\x05\x66\x61lse\x12\x14\n\x05tests\x18\x12 \x03(\x0b\x32\x05.Test\x12\x11\n\tcompleted\x18\x13 \x01(\x08\x12\x0f\n\x07\x61\x62orted\x18\x14 \x01(\x08')




_BUILD = descriptor.Descriptor(
  name='Build',
  full_name='Build',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    descriptor.FieldDescriptor(
      name='board', full_name='Build.board', index=0,
      number=1, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='name', full_name='Build.name', index=1,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='version', full_name='Build.version', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='hash', full_name='Build.hash', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='seq', full_name='Build.seq', index=4,
      number=5, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='netbooks', full_name='Build.netbooks', index=5,
      number=6, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='buildlog_json_url', full_name='Build.buildlog_json_url', index=6,
      number=7, type=9, cpp_type=9, label=1,
      has_default_value=True, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='buildlog_url', full_name='Build.buildlog_url', index=7,
      number=8, type=9, cpp_type=9, label=1,
      has_default_value=True, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='build_image_url', full_name='Build.build_image_url', index=8,
      number=9, type=9, cpp_type=9, label=1,
      has_default_value=True, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='build_started_time', full_name='Build.build_started_time', index=9,
      number=10, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='build_finished_time', full_name='Build.build_finished_time', index=10,
      number=11, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='build_time', full_name='Build.build_time', index=11,
      number=12, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='chrome_version', full_name='Build.chrome_version', index=12,
      number=13, type=9, cpp_type=9, label=1,
      has_default_value=True, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='chrome_svn_number', full_name='Build.chrome_svn_number', index=13,
      number=14, type=5, cpp_type=1, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  extension_ranges=[],
  serialized_start=19,
  serialized_end=339,
)


_HOSTKEYVALUE = descriptor.Descriptor(
  name='HostKeyValue',
  full_name='HostKeyValue',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    descriptor.FieldDescriptor(
      name='key', full_name='HostKeyValue.key', index=0,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='value', full_name='HostKeyValue.value', index=1,
      number=3, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  extension_ranges=[],
  serialized_start=341,
  serialized_end=383,
)


_PERFKERVALUES = descriptor.Descriptor(
  name='PerfKerValues',
  full_name='PerfKerValues',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    descriptor.FieldDescriptor(
      name='key', full_name='PerfKerValues.key', index=0,
      number=2, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='values', full_name='PerfKerValues.values', index=1,
      number=3, type=2, cpp_type=6, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  extension_ranges=[],
  serialized_start=385,
  serialized_end=429,
)


_TEST = descriptor.Descriptor(
  name='Test',
  full_name='Test',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    descriptor.FieldDescriptor(
      name='id', full_name='Test.id', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='tko_test_id', full_name='Test.tko_test_id', index=1,
      number=2, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='test_name', full_name='Test.test_name', index=2,
      number=3, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='test_started_time', full_name='Test.test_started_time', index=3,
      number=4, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='test_finished_time', full_name='Test.test_finished_time', index=4,
      number=5, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='afe_job_id', full_name='Test.afe_job_id', index=5,
      number=6, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='netbook', full_name='Test.netbook', index=6,
      number=7, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='board', full_name='Test.board', index=7,
      number=8, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='build', full_name='Test.build', index=8,
      number=9, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='owner', full_name='Test.owner', index=9,
      number=10, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='status', full_name='Test.status', index=10,
      number=11, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='hostname', full_name='Test.hostname', index=11,
      number=12, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='chrome_version', full_name='Test.chrome_version', index=12,
      number=13, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='test_log_url', full_name='Test.test_log_url', index=13,
      number=14, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='host_keyvals', full_name='Test.host_keyvals', index=14,
      number=15, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='perfkeys', full_name='Test.perfkeys', index=15,
      number=16, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='reason', full_name='Test.reason', index=16,
      number=17, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  extension_ranges=[],
  serialized_start=432,
  serialized_end=800,
)


_JOB = descriptor.Descriptor(
  name='Job',
  full_name='Job',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    descriptor.FieldDescriptor(
      name='id', full_name='Job.id', index=0,
      number=1, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='afe_job_id', full_name='Job.afe_job_id', index=1,
      number=2, type=3, cpp_type=2, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='job_name', full_name='Job.job_name', index=2,
      number=3, type=9, cpp_type=9, label=2,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='netbook', full_name='Job.netbook', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='board', full_name='Job.board', index=4,
      number=5, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='build', full_name='Job.build', index=5,
      number=6, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='owner', full_name='Job.owner', index=6,
      number=7, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=unicode("", "utf-8"),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='job_status', full_name='Job.job_status', index=7,
      number=8, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='job_created_time', full_name='Job.job_created_time', index=8,
      number=9, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='job_queued_time', full_name='Job.job_queued_time', index=9,
      number=10, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='job_started_time', full_name='Job.job_started_time', index=10,
      number=11, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='job_finished_time', full_name='Job.job_finished_time', index=11,
      number=12, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='test_started_time', full_name='Job.test_started_time', index=12,
      number=13, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='test_finished_time', full_name='Job.test_finished_time', index=13,
      number=14, type=2, cpp_type=6, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='passed', full_name='Job.passed', index=14,
      number=15, type=5, cpp_type=1, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='total', full_name='Job.total', index=15,
      number=16, type=5, cpp_type=1, label=1,
      has_default_value=True, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='email_alert', full_name='Job.email_alert', index=16,
      number=17, type=8, cpp_type=7, label=1,
      has_default_value=True, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='tests', full_name='Job.tests', index=17,
      number=18, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='completed', full_name='Job.completed', index=18,
      number=19, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    descriptor.FieldDescriptor(
      name='aborted', full_name='Job.aborted', index=19,
      number=20, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  options=None,
  is_extendable=False,
  extension_ranges=[],
  serialized_start=803,
  serialized_end=1240,
)

_TEST.fields_by_name['host_keyvals'].message_type = _HOSTKEYVALUE
_TEST.fields_by_name['perfkeys'].message_type = _PERFKERVALUES
_JOB.fields_by_name['tests'].message_type = _TEST
DESCRIPTOR.message_types_by_name['Build'] = _BUILD
DESCRIPTOR.message_types_by_name['HostKeyValue'] = _HOSTKEYVALUE
DESCRIPTOR.message_types_by_name['PerfKerValues'] = _PERFKERVALUES
DESCRIPTOR.message_types_by_name['Test'] = _TEST
DESCRIPTOR.message_types_by_name['Job'] = _JOB

class Build(message.Message):
  __metaclass__ = reflection.GeneratedProtocolMessageType
  DESCRIPTOR = _BUILD
  
  # @@protoc_insertion_point(class_scope:Build)

class HostKeyValue(message.Message):
  __metaclass__ = reflection.GeneratedProtocolMessageType
  DESCRIPTOR = _HOSTKEYVALUE
  
  # @@protoc_insertion_point(class_scope:HostKeyValue)

class PerfKerValues(message.Message):
  __metaclass__ = reflection.GeneratedProtocolMessageType
  DESCRIPTOR = _PERFKERVALUES
  
  # @@protoc_insertion_point(class_scope:PerfKerValues)

class Test(message.Message):
  __metaclass__ = reflection.GeneratedProtocolMessageType
  DESCRIPTOR = _TEST
  
  # @@protoc_insertion_point(class_scope:Test)

class Job(message.Message):
  __metaclass__ = reflection.GeneratedProtocolMessageType
  DESCRIPTOR = _JOB
  
  # @@protoc_insertion_point(class_scope:Job)

# @@protoc_insertion_point(module_scope)
