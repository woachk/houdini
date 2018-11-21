#!/bin/bash

# Currently, Houdini 6 is used because it doesn't require libaeabi_map.

# Remove already-existing squashfs-root
rm -rf squashfs-root

# remove directories
rm -rf arm64_x64
rm -rf armv7_x64
rm -rf armv7_x86

# create directories
mkdir arm64_x64
mkdir armv7_x64
mkdir armv7_x86

# Uncompress & copy

unsquashfs houdini-7_z.sfs
cp squashfs-root/houdini64 arm64_x64/
cp squashfs-root/cpuinfo arm64_x64/
cp squashfs-root/linker64 arm64_x64/
rm -rf squashfs-root

unsquashfs houdini-7_y.sfs
cp squashfs-root/houdini armv7_x64/
cp squashfs-root/cpuinfo armv7_x64/
cp squashfs-root/linker armv7_x64/
rm -rf squashfs-root

unsquashfs houdini-7_x.sfs
cp squashfs-root/houdini armv7_x86/
cp squashfs-root/cpuinfo armv7_x86/
cp squashfs-root/linker armv7_x86/
rm -rf squashfs-root

# patching
source ./patch.sh

patch_strings_in_file arm64_x64/houdini64 "/system/lib64/arm64/cpuinfo" "/usr/lib/houdini/cpu64"
patch_strings_in_file arm64_x64/houdini64 "/system/lib64/arm64/linker64" "/lib/ld-linux-aarch64.so.1"
patch_strings_in_file arm64_x64/houdini64 "/system/lib64/arm64/libaeabi_map.so" ""
patch_strings_in_file_1p arm64_x64/houdini64 "armv8" "aarch64"

patch_strings_in_file armv7_x64/houdini "/system/lib/arm/cpuinfo" "/usr/lib/houdini/cpu32"
patch_strings_in_file armv7_x64/houdini "/system/lib/arm/linker" "/usr/lib/houdini/ld.so"
patch_strings_in_file armv7_x64/houdini "/system/lib/arm/libaeabi_map.so" ""

patch_strings_in_file armv7_x86/houdini "/system/lib/arm/cpuinfo" "/usr/lib/houdini/cpu32"
patch_strings_in_file armv7_x86/houdini "/system/lib/arm/linker" "/usr/lib/houdini/ld.so"
# Version 6.1 is used instead of 7 for x86_32 so this does nothing, keeping it though.
patch_strings_in_file armv7_x86/houdini "/system/lib/arm/libaeabi_map.so" ""

