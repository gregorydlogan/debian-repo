#!/bin/bash

#Note that we really, really want H and l to preserve any linking!
rsync -avhSPuKHlc --delete d-install/ root@apt-cacher:/var/www/repo
#rsync -avhSPuKHlc --delete d-install/ root@oc-cache:/var/www/repo
#rsync -avhSPuKHlc --delete d-install/ greglogan@pkg.opencast.org:/srv/www/pkg.opencast.org/debs
