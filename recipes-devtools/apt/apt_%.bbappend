# apt-native do_compile fallisce su Ubuntu 24.04 (GCC 13): stesso bug di
# rust-llvm-native, <cstdint> non piu' incluso in modo transitivo tramite
# <cstring>, qui in apt-pkg/contrib/mmap.cc (uint16_t).
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-mmap.cc-add-missing-cstdint-include-for-GCC13.patch"
