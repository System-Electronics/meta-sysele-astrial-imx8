# clang-native do_compile fallisce su Ubuntu 24.04 (GCC 13): stesso bug di
# rust-llvm-native e apt-native, qui nella copia llvm-project 14.0.3 usata
# da meta-clang (fetchata via git, non tarball): Signals.h usa uintptr_t
# senza includere <cstdint>.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-llvm-Support-Signals.h-add-missing-cstdint-include.patch"
