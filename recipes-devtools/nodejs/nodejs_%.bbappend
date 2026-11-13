# Add the missing <cstdint> include required by GCC 13, in the V8 copy
# vendored inside the node source tarball.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-v8-base-logging.h-add-missing-cstdint-include.patch"
SRC_URI += "file://0002-v8-inspector-string-conversions.h-add-missing-cstdint.patch"
