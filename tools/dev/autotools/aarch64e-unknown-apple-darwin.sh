#/bin/bash

kopt="${-}"

set -eu

CROSS_COMPILE_TRIPLET='aarch64-apple-darwin'
CROSS_COMPILE_SYSTEM='darwin'
CROSS_COMPILE_ARCHITECTURE='arm64'
CROSS_COMPILE_SYSROOT='/tmp/darwin/SDK/MacOSX11.3.sdk'

CMAKE_TOOLCHAIN_FILE='/tmp/darwin/build/cmake/aarch64e-unknown-apple-darwin.cmake'

CC='/tmp/darwin/bin/arm64e-apple-darwin20.4-clang'
CXX='/tmp/darwin/bin/arm64e-apple-darwin20.4-clang++'
AR='/usr/bin/llvm-ar'
AS='/usr/bin/llvm-as'
LD='/tmp/darwin/bin/arm64e-apple-darwin20.4-ld'
NM='/usr/bin/llvm-nm'
RANLIB='/usr/bin/llvm-ranlib'
STRIP='/usr/bin/llvm-strip'
OBJCOPY='/usr/bin/llvm-objcopy'
OBJDUMP='/usr/bin/llvm-objdump'
READELF='/usr/bin/llvm-readelf'

MACOSX_DEPLOYMENT_TARGET='11.3'

export \
	CROSS_COMPILE_TRIPLET \
	CROSS_COMPILE_SYSTEM \
	CROSS_COMPILE_ARCHITECTURE \
	CROSS_COMPILE_SYSROOT \
	CMAKE_TOOLCHAIN_FILE \
	CC \
	CXX \
	AR \
	AS \
	LD \
	NM \
	RANLIB \
	STRIP \
	OBJCOPY \
	OBJDUMP \
	READELF \
	MACOSX_DEPLOYMENT_TARGET

[[ "${kopt}" = *e*  ]] || set +e
[[ "${kopt}" = *u*  ]] || set +u
