#!/bin/bash
set -e

apt-get install libtool libusb-1.0-0-dev autoconf pkg-config

mkdir -p output

OPENOCD_DIR=${PWD}/output

# Build openocd
rm -rf openocd
git clone https://github.com/OpenROV/openocd_pac5223.git openocd --depth 1
cd openocd
./bootstrap
./configure --prefix=/usr/ --enable-sysfsgpio --enable-maintainer-mode --enable-bcm2835gpio
make -j8
make install DESTDIR=${OPENOCD_DIR}
cd ..

