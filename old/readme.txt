- Install mini-dinstall
- Symlink (or move) incoming binaries to binaries (eg: binaries/3.1, binaries/4.x)

For bulk updates:

- bash rebuild.sh
- bash sync.sh

Individually:

- bash build.sh
- bash link.sh $name
- bash build.sh
- bash sync.sh

Notes:
- When promoting a build upwards towards stable, one must *replace* the relevant buildinfo file in d-install/mini-dinstall/incoming as part of the copy above
  - link.sh will spit out a message if this happens, just remember to do something about it!
- To remove a package (like, say, 3.0) just remove the relevant files and run build.sh again
- apt line looks like "deb http://$repo/$foo $suite/".  Note that the / at the end is important
