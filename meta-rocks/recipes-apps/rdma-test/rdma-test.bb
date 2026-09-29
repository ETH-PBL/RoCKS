DESCRIPTION = "rdma-test application"
PN = "rdma-test"
SECTION = "misc"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI ="\
  file://main.c \
  file://qp_connections.h \
  file://qp_connections.c \
  file://rdma_write.c \
  file://rdma_write.h \
  file://rdma_ip.c \
  file://rdma_ip.h \
  file://xstream_generator_hw.h \
"
FILESEXTRAPATHS:prepend="{THISDIR}/files/:"
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
    ${CC} -g main.c qp_connections.c rdma_write.c rdma_ip.c -o rdma-test
}
do_install () {
    export DIST_ROOT=${D}
    install -d ${D}${sbindir}
    install -m 0755 rdma-test ${D}${sbindir}/
}