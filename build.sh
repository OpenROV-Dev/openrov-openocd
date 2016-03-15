#!/bin/bash
set -e

apt-get install libtool libusb-1.0-0-dev autoconf pkg-config

mkdir -p output/usr/local/

OPENOCD_DIR=${PWD}/output/usr/local

# Build openocd
git clone http://repo.or.cz/openocd.git
cd openocd
./bootstrap
./configure --prefix=${OPENOCD_DIR} --enable-sysfsgpio --enable-maintainer-mode --enable-bcm2835gpio
make -j8
make install
cd ..
rm -rf openocd

