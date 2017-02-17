#!/bin/bash
#suite=""
suite="testing"

for distro in wheezy jessie trusty xenial
do
  freight add *.deb apt/$distro/$suite
  freight add *.dsc apt/$distro/$suite
  freight add *.orig.* apt/$distro/$suite
  freight add *.tar.xz apt/$distro/$suite
done
freight cache
