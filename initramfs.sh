#!/bin/sh
mkdir initramfs
cd initramfs/

cp -rf ../busybox-1.32.1/_install/* ./ 
mkdir dev proc sys
ln -sf /dev/null /dev/tty1
ln -sf /dev/null /dev/tty2
ln -sf /dev/null /dev/tty3
ln -sf /dev/null /dev/tty4
cp -a /dev/{null,console,tty,tty1,tty2,tty3,tty4} dev/
rm -f linuxrc
cp ../init ./
chmod a+x init
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz

cd ..
ls | grep 'initramfs'
