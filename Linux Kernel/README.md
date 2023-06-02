# Requirement
* qemu-system
* musl-gcc

# Debug
## For kernel debugging add paramater `-s -S` in file `run.sh` or in qemu command.
Example:
```sh
#!/bin/bash

qemu-system-x86_64 \
    -s -S \
    -m 128M \
    -nographic \
    -kernel ./bzImage \
    -append 'console=ttyS0 loglevel=3 oops=panic panic=1 nokaslr' \
    -monitor /dev/null \
    -initrd ./rootfs.cpio.gz  \
    -cpu qemu64 \
    -smp cores=2 \
```
## And run gdb, then use `target remote :1234` to connect to qemu.
## To add breakpoint in gdb, first find the base address of the ko file, by opening file `/dev/<drive name>`, driver name can find in ko file.


for more details, will create the tutorial in https://inersin.medium.com (tbc)
