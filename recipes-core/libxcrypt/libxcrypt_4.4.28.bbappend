# Pin libxcrypt to a newer upstream commit: two build-aux scripts use a
# Perl feature (given/when) removed in Perl 5.38 (Ubuntu 24.04). The
# pinned patch below is already included upstream at this SRCREV.
SRCREV = "95d6e03ae37f4ec948474d111105bbdd2938aba2"

SRC_URI:remove = "file://fix_cflags_handling.patch"
