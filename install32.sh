#!/bin/bash

# Run this as root.

install -m 755 armv7_x86/houdini /usr/libexec/houdini

mkdir -p /usr/lib/houdini
install -m 644 armv7_x86/cpuinfo /usr/lib/houdini/cpu32
ln -s /lib/ld-linux-armhf.so.3 /usr/lib/houdini/ld.so

