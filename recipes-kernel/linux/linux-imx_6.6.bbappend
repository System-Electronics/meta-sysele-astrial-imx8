#
# Copyright (C)2024 KOAN sas - <https://koansoftware.com>
#

# change the NXP repo with the System Electronics custom one
LINUX_IMX_SRC = "git://github.com/System-Electronics/linux-sysele-imx;protocol=https;branch=${SRCBRANCH}"
SRCBRANCH = "lf-6.6.52-2.2.0-sysele"
SRCREV = "43bfb260beee7fbe48078e78eee54a8bce3984a0"

# set local version
LOCALVERSION = "-sysele"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://caam.cfg"
