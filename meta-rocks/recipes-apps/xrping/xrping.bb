DESCRIPTION = "rping server application"
SECTION = "misc"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI ="\
    file://xrping.c \
    file://xrping.h \
"

DEPENDS += " rdma-core umm"
RDEPENDS_${PN} = "libgcc"
FILESEXTRAPATHS:prepend = "${THISDIR}/files/:" 
S = "${WORKDIR}"

DEBUG_FLAGS = "-g3 -O0"

# Specifies to build packages with debugging information
DEBUG_BUILD = "1"

# Do not remove debug symbols
INHIBIT_PACKAGE_STRIP = "1"

TARGET_CC_ARCH += "${LDFLAGS}"

LIB_PATH = "${STAGING_DIR_TARGET}/usr/lib"
do_compile () {
	echo ${STAGING_DIR_TARGET} > ~/bblog
	${CC} -g xrping.c -o xrping -lrdmacm -libverbs -lpthread -lumm
}

do_install () {
    export DIST_ROOT=${D}
    install -d ${D}${sbindir}
    install -m 0755 xrping ${D}${sbindir}/
}
