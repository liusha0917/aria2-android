#!/bin/bash -e

cd libssh2
echo -e "\n\n----- Build libssh2 (`git describe --tags`) -----"
./buildconf

INSTALL_DIR="$1"

echo -e "\n++ Build libssh2 armeabi-v7a ++"
../androidbuildlib out_path=../libs \
	minsdkversion=24 \
	target_abis="armeabi-v7a" \
	configure_params="--disable-shared --enable-static --with-libssl-prefix=$INSTALL_DIR/armeabi-v7a" \
	silent="$SILENT" custom_silent="--silent"

cd ..
