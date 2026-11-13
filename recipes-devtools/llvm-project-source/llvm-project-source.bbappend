# Add the missing <cstdint> include required by GCC 13, in the
# llvm-project 14.0.3 source used by meta-clang.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-llvm-Support-Signals.h-add-missing-cstdint-include.patch"
