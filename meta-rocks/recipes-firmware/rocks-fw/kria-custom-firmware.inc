LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

CUSTOM_BITSTREAM_DIR := "${@bb.utils.which(d.getVar('BBPATH'), 'hw-description/rocks')}"
CUSTOM_DTFILE_DIR := "${@bb.utils.which(d.getVar('BBPATH'), 'conf/dts/rocks/pl-overlay-dfx')}"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
FILESEXTRAPATHS:prepend := "${CUSTOM_BITSTREAM_DIR}:"
FILESEXTRAPATHS:prepend := "${CUSTOM_DTFILE_DIR}:"

SRC_URI:append = " \
    file://shell.json \
    file://rocks_sdt/rocks.bit \
    file://pl.dtsi \
    file://custom-overlay.dts \
"

inherit dfx_user_dts

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:kria = "${MACHINE}"
