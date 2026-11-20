#
# Copyright (C)2024 KOAN sas - <https://koansoftware.com>
#

# change the NXP repo with the System Electronics custom one
LINUX_IMX_SRC = "git://github.com/System-Electronics/linux-sysele-imx;protocol=https;branch=${SRCBRANCH}"
# USB3 on the CM4 PCIe connector pins, on top of the usual scarthgap kernel:
# the PCIe controller itself stays internal to the Hailo-8, only the DT
# status of the second USB3 PHY changes, see linux-sysele-imx history.
SRCBRANCH = "feature/usb3-cm4-pcie-pins"
SRCREV = "f7f0799414d862ae15e09d8a8162ff3314846e76"

# set local version
LOCALVERSION = "-sysele"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://caam.cfg"
