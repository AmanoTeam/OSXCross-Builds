#!/bin/bash

set -eu

declare -r workdir="${PWD}"

declare -r toolchain_directory='/tmp/darwin'
declare -r share_directory="${toolchain_directory}/usr/local/share/darwin"

declare -r darwin_tarball='/tmp/darwin.tar.xz'
declare -r darwin_url='https://github.com/AmanoTeam/OSXCross-Builds/releases/latest/download/x86_64-unknown-linux-gnu.tar.xz'

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
sudo bash './llvm.sh' '21'

for old in '/usr/bin/'*'-21'; do
	declare new="$(sed 's/-21//g' <<< "${old}")"
	sudo unlink "${new}" 2>/dev/null || true
	sudo ln --symbolic "${old}" "${new}"
done

if [ "${1}" = 'build' ]; then
	git \
		clone \
		--branch 'testing' \
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
else
	curl \
		--url "${darwin_url}" \
		--retry '30' \
		--retry-delay '0' \
		--retry-all-errors \
		--retry-max-time '0' \
		--location \
		--silent \
		--output "${darwin_tarball}"
	
	tar \
		--directory="$(dirname "${toolchain_directory}")" \
		--extract \
		--file="${darwin_tarball}"
fi