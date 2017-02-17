#!/bin/bash

wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|sudo apt-key add -
echo "deb http://build.openvpn.net/debian/freight_team $(lsb_release -sc) main" | sudo tee  /etc/apt/sources.list.d/freight.list
sudo apt-get update
sudo apt-get -y install freight

mkdir -p /opt/freight
chown -R $USER:$USER /opt/freight
