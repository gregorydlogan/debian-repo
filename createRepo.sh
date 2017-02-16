#!/bin/bash

sudo apt-get install reprepro

rm -rf db dists lists pool

for suite in wheezy jessie trusty xenial
do
  reprepro -Vb . includedeb $suite ../debs/*.deb

  ls ../debs/*.dsc | while read item
  do
    reprepro -Vb . includedsc $suite $item
  done

  ls ../debs/*.changes | while read item
  do
    reprepro -Vb . include $suite $item
  done
done
