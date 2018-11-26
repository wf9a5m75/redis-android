#!/bin/bash

pushd $(dirname "$0")/../src/main/libs/

rm -rf ../../../release_zip/
mkdir -p ../../../release_zip/

DIRS=$(find . -maxdepth 1 -type d | cut -c 3- | tail -n 4)

for dir in $DIRS; do
  echo ">>> generate ${dir}.zip"
  find ${dir} -path "*/*.so" -prune -o -type f -print | zip "${dir}.zip" -@
  mv "${dir}.zip" ../../../release_zip/
done
popd
