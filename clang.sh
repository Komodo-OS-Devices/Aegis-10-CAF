#!/usr/bin/env bash
export KBUILD_BUILD_USER="Wahyu"
export KBUILD_BUILD_HOST="Aegis-Build"
export ARCH=arm64
export CROSS_COMPILE_ARM32=/home/wahyu/project/gcc49arm/bin/arm-linux-androideabi-

make O=out ARCH=arm64 aegis_defconfig

PATH="/home/wahyu/project/clang10/bin:/home/wahyu/project/gcc/bin:$PATH" \

make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
			2>&1 | tee log.jancok
