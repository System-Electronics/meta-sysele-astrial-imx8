# rust-llvm-native do_compile fallisce su Ubuntu 24.04 (GCC 13): la copia di
# llvm-project vendorizzata nel tarball di rustc-1.59.0 non compila perche'
# Signals.h usa uintptr_t senza includere <cstdint>, e GCC 13/libstdc++ non lo
# porta piu' in modo transitivo tramite <string>. Stesso tipo di bug di
# pseudo/libxcrypt (ricetta vecchia, host nuovo), qui pero' il sorgente e' in
# un tarball e non in un repo git separato, quindi si applica una patch invece
# di avanzare una SRCREV.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Support-Signals.h-add-missing-cstdint-include-for-GCC13.patch;striplevel=2"
