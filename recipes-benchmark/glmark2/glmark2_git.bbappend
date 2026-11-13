# Fix vendored waflib for Python 3.12, which removes the 'imp' module.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-waflib-fix-compatibility-with-python-3.12.patch"
