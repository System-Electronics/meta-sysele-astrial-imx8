# Add the missing <cstdint> include required by GCC 13 in
# apt-pkg/contrib/mmap.cc.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-mmap.cc-add-missing-cstdint-include-for-GCC13.patch"
