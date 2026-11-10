#
# Copyright (C)2024 KOAN sas - <https://koansoftware.com>
#

# change the NXP repo with the System Electronics custom one
KERNEL_SRC = "git://github.com/System-Electronics/linux-sysele-imx;protocol=https;branch=${SRCBRANCH}"
SRCBRANCH = "lf-5.15.71-2.2.0-sysele"
SRCREV = "273bcd356a161cf1d209c59f1d1712493964a858"

# set local version
LOCALVERSION = "-sysele"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-backport-pca9450-driver-from-upstream-83808c5.patch"
SRC_URI += "file://caam.cfg"
