# Pin pseudo to a newer upstream commit for openat2() support (needed by
# tar >= 1.35 on Ubuntu 24.04), without bumping the poky pin, which would
# break NXP's openssl_3.2.%.bbappend (meta-imx-bsp) on the OpenSSL 3.2->3.5
# jump. The patches below are already included upstream at this SRCREV.
SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"

SRC_URI:remove = "file://0001-configure-Prune-PIE-flags.patch"
SRC_URI:remove = "file://glibc238.patch"
SRC_URI:remove:class-native = "file://older-glibc-symbols.patch"
SRC_URI:remove:class-nativesdk = "file://older-glibc-symbols.patch"
