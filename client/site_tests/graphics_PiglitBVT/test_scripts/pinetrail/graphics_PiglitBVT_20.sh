#!/bin/bash


need_pass=166
failures=0
PIGLIT_PATH=/usr/local/autotest/deps/piglit/piglit/
export PIGLIT_SOURCE_DIR=/usr/local/autotest/deps/piglit/piglit/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PIGLIT_PATH/lib


function run_test()
{
  local name="$1"
  local time="$2"
  local command="$3"
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "Running test "$name" of expected runtime $time sec: $command"
  sync
  $command
  if [ $? == 0 ] ; then
    let "need_pass--"
  else
    let "failures++"
  fi
}


pushd $PIGLIT_PATH
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-index-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-index-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-index-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-index-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-index-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-index-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-index-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-array-mat4-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-col-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-row-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-row-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-wr" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-temp-mat4-wr.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-array-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-col-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-col-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-uniform-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat2-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat2-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat3-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat3-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-mat2-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-mat2-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-mat3-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-mat3-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-mat4-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/variable-indexing/vs-varying-mat4-row-rd" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/variable-indexing/vs-varying-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-all-equal-bool-array" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-all-equal-bool-array.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-assign-varied-struct" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-assign-varied-struct.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2x2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2x2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2x2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2x2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2x3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2x3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2x3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2x3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2x4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2x4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat2x4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat2x4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3x2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3x2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3x2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3x2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3x3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3x3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3x3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3x3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3x4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3x4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat3x4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat3x4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4x2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4x2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4x2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4x2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4x3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4x3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4x3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4x3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4x4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4x4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-const-mat4x4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-const-mat4x4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2x2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2x2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2x2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2x2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2x3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2x3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2x3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2x3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2x4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2x4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat2x4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat2x4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3x2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3x2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3x2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3x2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3x3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3x3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3x3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3x3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3x4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3x4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat3x4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat3x4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4x2" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4x2.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4x2-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4x2-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4x3" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4x3.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4x3-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4x3-ivec.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4x4" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4x4.shader_test -auto"
run_test "spec/glsl-1.20/execution/vs-outerProduct-mat4x4-ivec" 0.0 "framework/../bin/shader_runner tests/spec/glsl-1.20/execution/vs-outerProduct-mat4x4-ivec.shader_test -auto"
run_test "spec/glsl-1.20/recursion/indirect" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 indirect"
run_test "spec/glsl-1.20/recursion/indirect-complex" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 indirect-complex"
run_test "spec/glsl-1.20/recursion/indirect-complex-separate" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 indirect-complex-separate"
run_test "spec/glsl-1.20/recursion/indirect-separate" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 indirect-separate"
run_test "spec/glsl-1.20/recursion/simple" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 simple"
run_test "spec/glsl-1.20/recursion/unreachable" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 unreachable"
run_test "spec/glsl-1.20/recursion/unreachable-constant-folding" 0.0 "framework/../bin/recursion -auto -rlimit 268435456 unreachable-constant-folding"
popd

if [ $need_pass == 0 ] ; then
  echo "+---------------------------------------------+"
  echo "| Overall pass, as all 166 tests have passed. |"
  echo "+---------------------------------------------+"
else
  echo "+-----------------------------------------------------------+"
  echo "| Overall failure, as $need_pass tests did not pass and $failures failed. |"
  echo "+-----------------------------------------------------------+"
fi
exit $need_pass

