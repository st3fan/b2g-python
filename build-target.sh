#!/bin/sh

set -x

# Change this to the location of the Android NDK
export ANDROID_NDK="$HOME/Google/android-ndk-r8c"

export PATH="$PATH:$ANDROID_NDK/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86/bin"

export CC=arm-linux-androideabi-gcc
export CXX=arm-linux-androideabi-g++
export AR=arm-linux-androideabi-ar
export RANLIB=arm-linux-androideabi-ranlib
export STRIP="arm-linux-androideabi-strip --strip-unneeded"

export CFLAGS="-DANDROID -mandroid -fomit-frame-pointer --sysroot=$ANDROID_NDK/platforms/android-9/arch-arm"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-Wl,--allow-shlib-undefined --sysroot=$ANDROID_NDK/platforms/android-9/arch-arm"

HERE=`pwd`

(cd target/Python-2.7.3 && ./configure --host=arm-linux-androideabi --build=x86_64-linux-gnu --enable-shared --prefix=/data/python)

(cd target/Python-2.7.3 && make EXTRA_CFLAGS="$CFLAGS" HOSTPYTHON="$HERE/host/Python-2.7.3/python" HOSTPGEN="$HERE/host/Python-2.7.3/Parser/hostpgen" CROSS_COMPILE=arm-linux-androideabi- CROSS_COMPILE_TARGET=yes HOSTARCH=arm BUILDARCH=x86_64-linux-gnu DESTDIR="$HERE/install")

tar cvfz python.tgz -C install data

