#!/bin/bash

export ANDROID_ROOT_DIR="$HOME/ANDROID_NDK_ROOT/android-ndk-r21b"
ANDROID_NDK="${ANDROID_ROOT_DIR}"

cmake -S . -B build -G Ninja                                                            \
      -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI="arm64-v8a"                                                 \
      -DANDROID_STL=c++_static                                                  \
      -DANDROID_NATIVE_API_LEVEL=28                                             \
      -DANDROID_NDK=${ANDROID_NDK}                                              \
      -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}                                     \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON                                        \
      -DCMAKE_VERBOSE_MAKEFILE=OFF \
      -DCMAKE_INSTALL_PREFIX="./install" \
      -DUSE_THREAD=OFF \
      -DUSE_LOCKING=OFF \
      -DNUM_THREADS=1 \
      -DNUM_PARALLEL=1 \
      -DTARGET="CORTEXA76" \
      -DBUILD_BENCHMARKS=ON \
      -DFIXED_LIBNAME=ON

# cmake --build build
# cmake --install build

# export PATH=${ANDROID_NDK}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/:${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

# export LDFLAGS="-L${ANDROID_NDK}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/lib/gcc/aarch64-linux-android/4.9.x -lm"
# # export CLANG_FLAGS="-target aarch64-linux-android --sysroot ${ANDROID_NDK}/platforms/android-28/arch-arm64 -gcc-toolchain ${ANDROID_NDK}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/"
# export CLANG_FLAGS="-target aarch64-linux-android --sysroot ${ANDROID_NDK}/platforms/android-28/arch-arm64 -gcc-toolchain ${ANDROID_NDK}/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/ -I${ANDROID_NDK}/sysroot/usr/include -I${ANDROID_NDK}/sysroot/usr/include/aarch64-linux-android"
# which clang
# echo $(clang --version)
# make USE_THREAD=0 USE_LOCKING=0 TARGET=CORTEXA76 FIXED_LIBNAME=1 PREFIX=./install AR=ar CC="clang ${CLANG_FLAGS}" HOSTCC=gcc -j16
