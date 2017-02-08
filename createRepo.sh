#!/bin/bash

rm -rf db dists lists pool
reprepro -Vb . includedeb wheezy ../debs/*.deb
reprepro -Vb . includedeb jessie ../debs/*.deb
reprepro -Vb . includedeb trusty ../debs/*.deb
reprepro -Vb . includedeb xenial ../debs/*.deb
