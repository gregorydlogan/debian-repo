#!/bin/bash
#suite=""
suite="testing"

for distro in jessie stretch xenial
do
  freight add ../debs/*.deb apt/$distro/$suite
  freight add ../debs/*.dsc apt/$distro/$suite
  freight add ../debs/*.orig.* apt/$distro/$suite
  freight add ../debs/*.tar.xz apt/$distro/$suite
  freight add ../debs/*.buildinfo apt/$distro/$suite
  freight add ../debs/*.changes apt/$distro/$suite
done
freight cache

#Note that we really, really want H and l to preserve any linking!
#rsync -avhSPuKHlc --delete /opt/freight/cache/ greglogan@pkg.opencast.org:/srv/www/pkg.opencast.org/debs/
