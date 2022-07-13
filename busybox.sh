#!/bin/sh
wget https://busybox.net/downloads/busybox-1.32.1.tar.bz2
tar -xf busybox-1.32.1.tar.bz2
cd busybox-1.32.1
cp ../busybox-config .config
make -j8 && make install
ls ./_install/

