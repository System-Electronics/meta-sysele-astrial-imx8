# Pin pseudo to a newer upstream commit for openat2() support (needed by
# tar >= 1.35 on Ubuntu 24.04), without bumping the poky pin, which would
# break NXP's proprietary OpenSSL CAAM offload patch (meta-imx/meta-bsp).
SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"

# The fix commit is only reachable from pseudo's master branch, not oe-core
# (the branch the kirkstone poky pin uses for this recipe). Fetch over https.
SRC_URI:remove = "git://git.yoctoproject.org/pseudo;branch=oe-core"
SRC_URI:prepend = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https "

SRC_URI:remove = "file://0001-configure-Prune-PIE-flags.patch"
SRC_URI:remove:class-native = "file://older-glibc-symbols.patch"
SRC_URI:remove:class-nativesdk = "file://older-glibc-symbols.patch"
