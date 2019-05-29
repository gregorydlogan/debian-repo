#!/bin/bash

#Note that we really, really want H and l to preserve any linking!
rsync -avhSPuKHlc d-install/stable/ root@repo:/var/www/repo/stable
rsync -avhSPuKHlc d-install/testing/ root@repo:/var/www/repo/testing
#rsync -avhSPuKHlc d-install/stable/ greglogan@pkg.opencast.org:/srv/www/pkg.opencast.org/debs/stable
#rsync -avhSPuKHlc d-install/testing/ greglogan@pkg.opencast.org:/srv/www/pkg.opencast.org/debs/testing
