#!/bin/sh
qemu-system-x86_64 -kernel ./linux-4.9.301/arch/x86/boot/bzImage -initrd ./initramfs.cpio.gz -append "nokaslr console=ttyS0" -s -S -nographic
