#!/bin/bash

rm -rf d-install

./build.sh
ls binaries | while read line
do
  if [[ -d "binaries/$line" && ! -L "binaries/$line" ]]; then
  ./link.sh $line
  fi
done
./build.sh
