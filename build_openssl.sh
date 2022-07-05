#!/bin/bash -e

cd openssl
INSTALL_DIR="$1"
ANDROID_NDK_ROOT="$NDK"
PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
echo -e "\n\n----- Build openssl (`git describe --tags`) -----"

VERBOSE_FLAGS=""
if [ "$SILENT" == "true" ]; then
	VERBOSE_FLAGS="-s V=0"
	echo "Using non-verbose mode"
fi

echo -e "\n++ Build openssl armeabi-v7a ++"
./Configure no-shared android-arm -D__ANDROID_API__=24 --prefix="$INSTALL_DIR/armeabi-v7a"
make $VERBOSE_FLAGS clean
make -j4 $VERBOSE_FLAGS
make install_sw

cd ..
