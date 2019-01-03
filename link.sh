#!/bin/bash

if [ -z "$1" -o ! -d  "binaries/$1" ]
then
  echo "Expected: directory name under binaries"
  exit 1
fi

baseDir=`pwd`

ls binaries/$1/* | while read line
do
  ln $line d-install/mini-dinstall/incoming/
done

ls d-install/mini-dinstall/incoming/*$1*.dsc | while read dsc
do
  #NB: This needs double squares to work properly
  if [[ "$dsc" != *"-1.dsc" ]]; then
    sourceFile=`grep orig.tar.xz $dsc | head -n 1 | cut -f 4 -d " "`
    changesFile=`echo $dsc | sed 's/.dsc/_amd64.changes/g'`
    destination=`grep Distribution $changesFile | head -n 1 | cut -f 2 -d " "`
    echo "Making $baseDir/d-install/$destination"
    mkdir -p $baseDir/d-install/$destination
    echo "Renaming $baseDir/d-install/mini-dinstall/incoming/$sourceFile to $baseDir/d-install/$destination/"
    mv $baseDir/d-install/mini-dinstall/incoming/$sourceFile $baseDir/d-install/$destination/
  fi
done
