SUMMARY = "dfx-default"
DESCRIPTION = "add default path for dfx"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://default_firmware \
"

S = "${WORKDIR}"

do_install() {
    install -d 0644 ${D}/etc/dfx-mgrd
    install -m 0755 ${WORKDIR}/default_firmware ${D}/etc/dfx-mgrd
}
