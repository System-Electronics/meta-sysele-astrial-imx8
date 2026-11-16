# Both this recipe and meta-oe's protobuf ship a library literally named
# libprotobuf.so. debian.bbclass renames every package of a recipe based on
# the library file it finds inside, so both recipes' -dev/-dbg/-compiler
# packages collide on the identical name "libprotobuf-*", regardless of
# their different PN. do_create_spdx is the first task that enforces
# uniqueness on that name across the whole build and fails on it.
#
# This recipe already strips its own libprotobuf.so symlinks in
# do_install:append to avoid colliding with the real protobuf at the file
# level; keeping its own PN-based package names instead of the
# renamed ones closes the same gap at the name level.
#
# DEBIAN_NAMES = "0" is the documented way to disable this, but this BSP's
# poky pin (yocto-4.0.4) never actually reads that variable: the rename
# loop in debian.bbclass iterates AUTO_LIBNAME_PKGS unconditionally, which
# defaults to ${PACKAGES}. Emptying it here is what actually has an effect
# on this poky version (verified: DEBIAN_NAMES alone did nothing).
AUTO_LIBNAME_PKGS = ""
