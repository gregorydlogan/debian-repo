#!/bin/bash

sudo apt-get install reprepro

rm -rf db dists lists pool
reprepro -Vb . includedeb wheezy ../debs/*.deb
reprepro -Vb . includedeb jessie ../debs/*.deb
reprepro -Vb . includedeb trusty ../debs/*.deb
reprepro -Vb . includedeb xenial ../debs/*.deb
