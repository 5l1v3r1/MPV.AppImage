# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)
DESTINATION="MPlayer.AppImage"

all: clean

	mkdir --parents $(PWD)/build

	wget  --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mpv-0.32.0-6.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mpv-libs-0.32.0-6.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mplayer-tools-1.4-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libdvdread-5.0.3-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/PowerTools/x86_64/os/Packages/enca-1.19-1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/x/x264-libs-0.157-12.20190717git34c06d1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/l/lirc-libs-0.10.0-19.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libvdpau-1.1.1-7.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/c/compat-lua-libs-5.1.5-15.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/v/vapoursynth-libs-48-7.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/z/zimg-2.9.3-1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/python3-libs-3.6.8-23.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/PowerTools/x86_64/os/Packages/SDL2-2.0.10-2.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libjpeg-turbo-1.5.3-10.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/l/libavdevice-4.2.4-1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget  --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/openal-soft-1.18.2-7.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..




	cp -r --force $(PWD)/AppDir $(PWD)/build
	cp -r --force $(PWD)/build/usr/* $(PWD)/build/AppDir

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/AppDir $(PWD)/MPV.AppImage
	make clean


clean:
	rm -rf $(PWD)/build
