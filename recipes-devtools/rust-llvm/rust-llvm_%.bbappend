# Add the missing <cstdint> include required by GCC 13, in the llvm-project
# copy vendored inside the rustc 1.59.0 source tarball.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Support-Signals.h-add-missing-cstdint-include-for-GCC13.patch;striplevel=2"
