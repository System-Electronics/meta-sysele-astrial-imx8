# do_configure di glmark2 fallisce su Ubuntu 24.04 (Python 3.12): il waflib
# vendorizzato ha un fix per Python 3.11 ma non per la 3.12, che rimuove del
# tutto il modulo 'imp' (era solo deprecato dalla 3.4/3.11). L'unico uso
# reale in questa versione di waflib e' imp.new_module(), equivalente a
# types.ModuleType().
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-waflib-fix-compatibility-with-python-3.12.patch"
