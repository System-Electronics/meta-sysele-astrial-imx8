# nodejs-native do_compile fallisce su Ubuntu 24.04 (GCC 13): stesso bug di
# rust-llvm-native/apt-native/clang-native, qui nel V8 vendorizzato dentro il
# tarball di node (deps/v8/src/base/logging.h), <cstdint> non piu' incluso
# in modo transitivo tramite <cstring>; l'errore si propaga anche in
# macros.h, che include logging.h.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-v8-base-logging.h-add-missing-cstdint-include.patch"
