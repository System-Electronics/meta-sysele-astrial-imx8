# Fix vendored waflib for modern Python: the 'imp' module was removed in
# 3.12, and several files have invalid-escape-sequence regexes that emit a
# SyntaxWarning corrupting `waf --version`'s output parsing. Fixing one
# instance isn't enough (there are more); suppress the warning category
# for the waf invocations instead of patching every occurrence.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-waflib-fix-compatibility-with-python-3.12.patch"
SRC_URI += "file://0002-waflib-Utils.py-silence-invalid-escape-sequence-warning.patch"

export PYTHONWARNINGS = "ignore::SyntaxWarning"
