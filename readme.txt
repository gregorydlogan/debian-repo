- Install mini-dinstall
- run mini-dinstall -vbc mini-dinstall.conf
- Copy debs, dsc, changes, buildinfo, sources into d-install/mini-dinstall/incoming
-> ls ../debs/*.* | grep -v build.sh | while read line; do ln $line d-install/mini-dinstall/incoming/; done
- run mini-dinstall -vbc mini-dinstall.conf again
- run sync.sh to copy to testing repo

Notes:
- When promoting a build upwards towards stable, one must *replace* the relevant buildinfo file in d-install/mini-dinstall/incoming as part of the copy above
- To remove a package (like, say, 3.0) just remove the relevant files and run mini-dinstall again
- apt line looks like "deb http://apt-cacher/debian stable/".  Note that the / at the end is important
