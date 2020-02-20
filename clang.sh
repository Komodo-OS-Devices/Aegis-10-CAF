#!/usr/bin/env bash
export KBUILD_BUILD_USER="wahyu"
export KBUILD_BUILD_HOST="wahyu-build"
export ARCH=arm64

make O=out ARCH=arm64 aegis_defconfig

PATH="/home/wahyuh/project/clang/bin:/home/wahyuh/project/gcc/bin:$PATH" \

make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
			2>&1 | tee log.jancok

