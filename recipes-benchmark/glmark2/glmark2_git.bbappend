# Fix vendored waflib for modern Python: the 'imp' module was removed in
# 3.12, and an invalid escape sequence elsewhere emits a SyntaxWarning that
# corrupts `waf --version`'s output parsing.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-waflib-fix-compatibility-with-python-3.12.patch"
SRC_URI += "file://0002-waflib-Utils.py-silence-invalid-escape-sequence-warning.patch"
