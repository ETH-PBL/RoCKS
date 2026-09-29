# Copyright 2023 Google. All rights reserved.
#
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
ARG UBUNTU_VERSION

FROM ubuntu:${UBUNTU_VERSION}

# Ubuntu 24.04 creates default user "ubuntu", remove it
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

ARG USERNAME
ARG USER_ID
ARG GROUP_ID
ARG PASSWORD

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "dash dash/sh boolean false" | debconf-set-selections 
RUN DEBIAN_FRONTEND=$DEBIAN_FRONTEND dpkg-reconfigure dash

RUN apt-get update && apt-get install -y \
		locales-all \
		locales \
		tofrodos \
		iproute2 \
		gawk \
		xvfb \
		git \
		make \
		net-tools \
		libncurses5-dev \
		update-inetd \
		tftpd-hpa \
		zlib1g-dev \
		libssl-dev \
		flex \
		bison \
		libselinux1 \
		gnupg \
		wget \
		diffstat \
		chrpath \
		socat \
		xterm \
		autoconf \
		libtool \
		libtool-bin \
		unzip \
		texinfo \
		zlib1g-dev \
		gcc-multilib \
		build-essential \
		libsdl1.2-dev \
		libglib2.0-dev \
		screen \
		pax \
		gzip \
		python3-gi \
		less \
		lsb-release \
		fakeroot \
		libgtk2.0-0 \
		libgtk2.0-dev \
		cpio \
		rsync \
		xorg \
		expect \
		dos2unix \
		bc \
		zlib1g \
		libncurses5-dev \
		libusb-dev

# downgrade to tar 1.34
# (see here https://adaptivesupport.amd.com/s/question/0D5Pd00001ChOsUKAV/20252-dopackage-fails-with-wrong-path?language=zh_CN)
RUN wget https://ftp.gnu.org/gnu/tar/tar-1.34.tar.gz && \
	tar -xzf tar-1.34.tar.gz && \
	cd tar-1.34 && \
	./configure FORCE_UNSAFE_CONFIGURE=1 && \
	make && \
	rm -rf tar-1.34

RUN apt-get install -y \
	 	# libboost-signals-dev \
	 	google-perftools \
		default-jre

RUN apt-get install -y \
		gawk wget git diffstat unzip texinfo \
		gcc build-essential chrpath socat cpio \
		python3 python3-pip python3-pexpect xz-utils \
		debianutils iputils-ping python3-git python3-jinja2 \
		libegl1-mesa-dev libsdl1.2-dev xterm python3-subunit \
		mesa-common-dev zstd liblz4-tool chrpath diffstat lz4 \
		repo device-tree-compiler

RUN wget http://security.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.3-2ubuntu0.3_amd64.deb && \
		apt-get install ./libtinfo5_6.3-2ubuntu0.3_amd64.deb

# TODO: filmil - there is a more canonical way to set the locale.
RUN env LANG=en_US.UTF-8 locale-gen --purge en_US.UTF-8 \
	&& echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

RUN groupadd -g ${GROUP_ID} ${USERNAME} && useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/bash ${USERNAME} && usermod -aG sudo ${USERNAME} && echo "${USERNAME}:${PASSWORD}" | chpasswd
USER ${USERNAME}

WORKDIR /home/${USERNAME}
