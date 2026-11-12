# Bug pseudo/openat2: tar >= 1.35 (Ubuntu 24.04) usa openat2(), che il pin
# scarthgap di pseudo (1.9.0+git, prima del supporto openat2) non intercetta.
# Bump mirato della sola SRCREV di pseudo (upstream git.yoctoproject.org/pseudo),
# senza toccare il pin di poky: evita così il salto di OpenSSL 3.2->3.5 che
# romperebbe il bbappend di NXP (openssl_3.2.%.bbappend, meta-imx-bsp).
#
# Le patch locali sotto sono già incluse upstream nella nuova SRCREV
# (rispettivamente nei commit "configure: Prune PIE flags" e "Add wrapper
# functions to operate correctly with glibc 2.38 onwards", quest'ultimo in
# due varianti: quella generica e quella nativa/nativesdk): vanno rimosse
# per non farle fallire come "already applied". Misurato: rimuovere solo le
# prime due non basta, "older-glibc-symbols.patch" (solo class-native/
# nativesdk) fallisce allo stesso modo.
SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"

SRC_URI:remove = "file://0001-configure-Prune-PIE-flags.patch"
SRC_URI:remove = "file://glibc238.patch"
SRC_URI:remove:class-native = "file://older-glibc-symbols.patch"
SRC_URI:remove:class-nativesdk = "file://older-glibc-symbols.patch"
