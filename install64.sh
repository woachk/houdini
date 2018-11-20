#!/bin/bash

# Run this as root.
mkdir -p $DESTDIR/usr/libexec
install -m 755 arm64_x64/houdini64 $DESTDIR/usr/libexec/houdini64
install -m 755 armv7_x64/houdini $DESTDIR/usr/libexec/houdini

mkdir -p $DESTDIR/usr/lib/houdini
install -m 644 arm64_x64/cpuinfo $DESTDIR/usr/lib/houdini/cpu64
install -m 644 armv7_x64/cpuinfo $DESTDIR/usr/lib/houdini/cpu32
ln -s /lib/ld-linux-armhf.so.3 $DESTDIR/usr/lib/houdini/ld.so

mkdir -p $DESTDIR/etc/binfmt.d
install -m 644 houdini.conf $DESTDIR/etc/binfmt.d/houdini.conf
