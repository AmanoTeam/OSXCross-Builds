#/bin/bash

kopt="${-}"

set -eu

CROSS_COMPILE_TRIPLET='x86_64-apple-darwin'
CROSS_COMPILE_SYSTEM='darwin'
CROSS_COMPILE_ARCHITECTURE='x86_64'

CC='/tmp/darwin/bin/x86_64h-apple-darwin20.4-clang'
CXX='/tmp/darwin/bin/x86_64h-apple-darwin20.4-clang++'
AR='/usr/bin/llvm-ar'
AS='/usr/bin/llvm-as'
LD='/tmp/darwin/bin/x86_64h-apple-darwin20.4-ld'
NM='/usr/bin/llvm-nm'
RANLIB='/usr/bin/llvm-ranlib'
STRIP='/usr/bin/llvm-strip'
OBJCOPY='/usr/bin/llvm-objcopy'
READELF='/usr/bin/llvm-readelf'

export \
	CROSS_COMPILE_TRIPLET \
	CROSS_COMPILE_SYSTEM \
	CROSS_COMPILE_ARCHITECTURE \
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
