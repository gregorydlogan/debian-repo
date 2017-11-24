#!/bin/bash

mini-dinstall -vbc mini-dinstall.conf
ls binaries | while read line
do
  if [ -d "binaries/$line" -a ! -L "binaries/$line" ]
   then
  ./link.sh $line
  fi
done
mini-dinstall -vbc mini-dinstall.conf
