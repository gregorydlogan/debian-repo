#!/bin/bash

#Note that we really, really want H and l to preserve any linking!
rsync -avhSPuKHlc --delete --exclude=*.db --exclude=mini-dinstall --delete-excluded d-install/ root@apt-cacher:/var/www/repo
#rsync -avhSPuKHlc --delete --exclude=*.db --exclude=mini-dinstall --delete-excluded d-install/ greglogan@pkg.opencast.org:/srv/www/pkg.opencast.org/debs
