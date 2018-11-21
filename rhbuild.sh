#!/bin/bash
mkdir -p houdini-7
cp -r *.sfs houdini.conf build.sh install64.sh patch.sh houdini-7/
tar cvf houdini-7.tar houdini-7
cp houdini-7.tar $HOME/rpmbuild/SOURCES/houdini-6.tar
rpmbuild -bb houdini.spec
rm -rf houdini-7
rm -rf houdini-7.tar
