#!/bin/sh
wget http://ftp.sjtu.edu.cn/sites/ftp.kernel.org/pub/linux/kernel/v4.x/linux-4.9.301.tar.gz
tar -xzf ./linux-4.9.301.tar.gz
cd linux-4.9.301/ 
cp ../linux-config .config
make -j8
