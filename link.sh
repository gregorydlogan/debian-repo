#!/bin/bash

if [ -z "$1" -o ! -d  "binaries/$1" ]
then
  echo "Expected: directory name under binaries"
  exit 1
fi

ls binaries/$1/* | while read line
do
  ln $line d-install/mini-dinstall/incoming/
done
