#!/bin/bash


need_pass=183
failures=0
PIGLIT_PATH=/usr/local/piglit/lib/piglit/
export PIGLIT_SOURCE_DIR=/usr/local/piglit/lib/piglit/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PIGLIT_PATH/lib
export DISPLAY=:0
export XAUTHORITY=/home/chronos/.Xauthority


function run_test()
{
  local name="$1"
  local time="$2"
  local command="$3"
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+ Running test [$name] of expected runtime $time sec: [$command]"
  sync
  $command
  if [ $? == 0 ] ; then
    let "need_pass--"
    echo "+ pass :: $name"
  else
    let "failures++"
    echo "+ fail :: $name"
  fi
}


pushd $PIGLIT_PATH
run_test "spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-05" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-05.shader_test -auto"
run_test "spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-06" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-06.shader_test -auto"
run_test "spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-09" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/samplers/glsl-fs-shadow2D-09.shader_test -auto"
run_test "spec/glsl-1.10/execution/samplers/in-parameter-array" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/samplers/in-parameter-array.shader_test -auto"
run_test "spec/glsl-1.10/execution/samplers/in-parameter-nested-struct" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/samplers/in-parameter-nested-struct.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-array-mat4-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-temp-mat4-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-array-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-uniform-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/fs-varying-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/fs-varying-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-index-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-index-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-index-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-array-mat4-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-temp-mat4-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-index-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-array-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-col-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-col-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-col-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-col-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-uniform-mat4-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-array-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat2-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-col-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-row-rd" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-row-rd.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat3-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat4-col-row-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat4-col-row-wr.shader_test -auto"
run_test "spec/glsl-1.10/execution/variable-indexing/vs-varying-mat4-col-wr" 0.0 "bin/shader_runner tests/spec/glsl-1.10/execution/variable-indexing/vs-varying-mat4-col-wr.shader_test -auto"
popd

if [ $need_pass == 0 ] ; then
  echo "+---------------------------------------------+"
  echo "| Overall pass, as all 183 tests have passed. |"
  echo "+---------------------------------------------+"
else
  echo "+-----------------------------------------------------------+"
  echo "| Overall failure, as $need_pass tests did not pass and $failures failed. |"
  echo "+-----------------------------------------------------------+"
fi
exit $need_pass

