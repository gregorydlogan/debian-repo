#!/bin/bash

#Note that we really, really want H and l to preserve any linking!
rsync -avhSPuKHlc --delete repo root@oc-cache:/var/www/
#rsync -avhSPuKHlc --delete repo greglogan@pkg.opencast.org:/srv/www/pkg.opencast.org/debs/
