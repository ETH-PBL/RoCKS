# Copyright 2023 Google. All rights reserved.
#
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
ARG UBUNTU_VERSION=24.04

FROM ubuntu:${UBUNTU_VERSION}

# Ubuntu 24.04 creates default user "ubuntu", remove it
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

ARG INSTALL_TARGET_DIR
ARG HOST_TOOL_ARCHIVE_NAME

ENV XILINX_INSTALL_LOCATION=$INSTALL_TARGET_DIR
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
		tar \
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
		libswt-glx-gtk-4-jni \
		zip \
		libeigen3-dev \
		libboost-all-dev \
		python3-setuptools \
		cmake

RUN apt-get update && \
		wget http://mirrors.kernel.org/ubuntu/pool/main/libi/libidn/libidn11_1.33-2.2ubuntu2_amd64.deb && \
		apt install ./libidn11_1.33-2.2ubuntu2_amd64.deb

RUN apt-get install -y \
	 	# libboost-signals-dev \
	 	google-perftools \
		default-jre

# TODO: filmil - there is a more canonical way to set the locale.
RUN env LANG=en_US.UTF-8 locale-gen --purge en_US.UTF-8 \
	&& echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

COPY ./install_config.txt /install_config.txt
RUN mkdir -p $XILINX_INSTALL_LOCATION

# Install
RUN  --mount=type=bind,source=${HOST_TOOL_ARCHIVE_NAME},target=/mnt  cd /mnt  \
    &&./xsetup --config /install_config.txt \
		--batch Install \
		--location ${XILINX_INSTALL_LOCATION} \
		--agree XilinxEULA,3rdPartyEULA

RUN ln -sf ${XILINX_INSTALL_LOCATION}/Vitis/2024.2/tps/lnx64/cmake-3.24.2/libs/Rhel/9/* /usr/lib

ARG USERNAME
ARG USER_ID
ARG GROUP_ID
ARG PASSWORD

# create user
RUN groupadd -g ${GROUP_ID} ${USERNAME} && useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/bash ${USERNAME} && usermod -aG sudo ${USERNAME} && echo "${USERNAME}:${PASSWORD}" | chpasswd
USER ${USERNAME}

WORKDIR /home/${USERNAME}
RUN echo "source $XILINX_INSTALL_LOCATION/2025.2.1/Vitis/settings64.sh" >> /home/${USERNAME}/.bashrc
