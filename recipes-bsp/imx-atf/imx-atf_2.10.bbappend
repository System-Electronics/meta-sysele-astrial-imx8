#
# Copyright (C)2024 KOAN sas - <https://koansoftware.com>
#

# ATF comes from NXP unchanged (SRCREV of the NXP recipe, tree identical to lf-6.6.52-2.2.0).
# The only System Electronics change is a patch: UART1, the Astrial debug serial, is added to
# the RDC peripheral permission tables of the i.MX8MP.
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-imx8mp_bl31_setup-add-UART1-to-peripherals-permission-list.patch"
