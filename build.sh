#!/bin/bash

set -uxe

mkdir -p d-install/mini-dinstall/incoming/
for dsc in `ls d-install/mini-dinstall/incoming/*.dsc | grep -v "\-1.dsc" | head -n 1 | cut -f 4 -d " "`
do
  sourceFile=`grep orig.tar.xz $dsc | head -n 1 | cut -f 4 -d " "`
  changesFile=`echo $dsc | sed 's/.dsc/_amd64.changes/g'
  destination=`grep Distribution $changesFile | cut -f 2 -d " "`
  mkdir -p d-install/$destination
  mv d-install/mini-dinstall/incoming/$sourceFile d-install/$destination/
done
mini-dinstall -vbc mini-dinstall.conf
