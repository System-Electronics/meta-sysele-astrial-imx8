# Bug pseudo/openat2: tar >= 1.35 (Ubuntu 24.04) usa openat2(), che il pin
# kirkstone di pseudo (1.9.0+git, prima del supporto openat2) non intercetta.
# Stesso identico fix verificato su scarthgap (vedi commit corrispondente su
# quel branch): bump mirato della sola SRCREV di pseudo, senza toccare il pin
# di poky. Qui il bump di poky e' stato provato e scartato per un motivo
# diverso da scarthgap: il bbappend OpenSSL di NXP (meta-imx/meta-bsp) applica
# una patch proprietaria di offload hardware (CAAM, non upstream) che non
# applica piu' pulita a partire da un certo point-release di poky piu' avanti
# (conflitto di contenuto, non di nome file come su scarthgap). Il bump mirato
# di pseudo evita il problema perche' non tocca openssl.
#
# Qui (a differenza di scarthgap) non esiste glibc238.patch: il pin di
# pseudo di kirkstone e' piu' vecchio e non lo ha mai incluso. Le due patch
# sotto sono gia' incluse upstream nella nuova SRCREV (stesso principio
# verificato su scarthgap: "configure: Prune PIE flags" e "Add wrapper
# functions to operate correctly with glibc 2.38 onwards").
SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"

SRC_URI:remove = "file://0001-configure-Prune-PIE-flags.patch"
SRC_URI:remove:class-native = "file://older-glibc-symbols.patch"
SRC_URI:remove:class-nativesdk = "file://older-glibc-symbols.patch"
