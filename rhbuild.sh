#!/bin/bash
mkdir -p houdini-6
cp -r *.sfs houdini.conf build.sh install64.sh patch.sh houdini-6/
tar cvf houdini-6.tar houdini-6
cp houdini-6.tar $HOME/rpmbuild/SOURCES/houdini-6.tar
rpmbuild -bb houdini.spec
