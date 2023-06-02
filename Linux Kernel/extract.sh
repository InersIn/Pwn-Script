#!/bin/bash

# Decompress a .cpio.gz packed file system
mkdir initramfs
pushd . && pushd initramfs
cp ../rootfs.cpio.gz .
gzip -dc rootfs.cpio.gz | cpio -idm &>/dev/null && rm rootfs.cpio.gz
popd
