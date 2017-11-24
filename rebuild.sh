#!/bin/bash

./build.sh
ls binaries | while read line
do
  if [ -d "binaries/$line" -a ! -L "binaries/$line" ]
   then
  ./link.sh $line
  fi
done
./build.sh
