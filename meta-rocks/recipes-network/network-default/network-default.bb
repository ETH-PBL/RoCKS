SUMMARY = "network-default"
DESCRIPTION = "default network settings"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://20-wired.network \
"

S = "${WORKDIR}"

do_install() {
    install -d 0644 ${D}/etc/systemd/network
    install -m 0644 ${WORKDIR}/20-wired.network ${D}/etc/systemd/network
}
