#!/bin/bash

CWD=$(pwd)
pushd src/main/obj/local/
for dir in "arm64-v8a" "armeabi-v7a" "x86" "x86_64"; do
  find ${dir} -name "redis-*" -type f -d 1 -print | zip "${CWD}/release_zip/${dir}.zip" -@
done
popd
