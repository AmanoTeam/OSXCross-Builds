#/bin/bash

kopt="${-}"

set -eu

CROSS_COMPILE_TRIPLET='aarch64-apple-darwin'
CROSS_COMPILE_SYSTEM='darwin'
CROSS_COMPILE_ARCHITECTURE='arm64'
CROSS_COMPILE_SYSROOT='/tmp/darwin/SDK/MacOSX11.3.sdk'

CC='/tmp/darwin/bin/aarch64-apple-darwin20.4-clang'
CXX='/tmp/darwin/bin/aarch64-apple-darwin20.4-clang++'
AR='/usr/bin/llvm-ar'
AS='/usr/bin/llvm-as'
LD='/tmp/darwin/bin/aarch64-apple-darwin20.4-ld'
NM='/usr/bin/llvm-nm'
RANLIB='/usr/bin/llvm-ranlib'
STRIP='/usr/bin/llvm-strip'
OBJCOPY='/usr/bin/llvm-objcopy'
READELF='/usr/bin/llvm-readelf'

export \
	CROSS_COMPILE_TRIPLET \
	CROSS_COMPILE_SYSTEM \
	CROSS_COMPILE_ARCHITECTURE \
	CROSS_COMPILE_SYSROOT \
	CC \
	CXX \
	AR \
	AS \
	LD \
	NM \
	RANLIB \
	STRIP \
	OBJCOPY \
	READELF

[[ "${kopt}" = *e*  ]] || set +e
[[ "${kopt}" = *u*  ]] || set +u
