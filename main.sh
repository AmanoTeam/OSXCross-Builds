#!/bin/bash

declare -r toolchain_directory='/tmp/darwin'
declare -r share_directory="${toolchain_directory}/usr/local/share/darwin"

sudo \
	apt-get \
	--assume-yes \
	install \
	lsb-release \
	wget \
	software-properties-common \
	gnupg \
	build-essential

cd '/tmp'

wget 'https://apt.llvm.org/llvm.sh'
sudo bash './llvm.sh' '22'

if [ "${1}" = 'build' ]; then
	git \
		clone \
		--depth '1' \
		'https://github.com/tpoechtrager/osxcross'
	
	cd 'osxcross'
	
	wget \
		'https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX11.3.sdk.tar.xz' \
		--directory-prefix="${PWD}/tarballs"
	
	TARGET_DIR='/tmp/darwin' UNATTENDED='1' ./build.sh
	
	mkdir --parent "${share_directory}"
	
	cp \
		--recursive \
		"${workdir}/tools/dev/"* \
		"${share_directory}"
	
	[ -d "${toolchain_directory}/build" ] || mkdir "${toolchain_directory}/build"
	
	ln \
		--symbolic \
		--relative \
		"${share_directory}/"* \
		"${toolchain_directory}/build"
fi