# Bug Perl: due script di build-aux usano feature sperimentali di Perl
# (given/when, smartmatch) rimosse nelle versioni recenti (Perl 5.38 su
# Ubuntu 24.04). Misurato in due passi:
#   1. BuildCommon.pm ("when is deprecated", do_configure falliva) -> fix
#      upstream ce562f4 "Make BuildCommon.pm compatible with latest perl".
#   2. gen-crypt-h ("given is deprecated", do_compile falliva dopo il primo
#      fix) -> fix upstream 95d6e03 "Remove smartmatch usage from
#      gen-crypt-h", dichiarato esplicitamente "Needed for Perl 5.38",
#      successivo al primo sullo stesso branch.
# Bump mirato della sola SRCREV al secondo fix (include anche il primo),
# stesso principio usato per pseudo, non tocca il resto della ricetta.
#
# La patch locale fix_cflags_handling.patch e' gia' inclusa a monte nella
# nuova SRCREV (stesso filtro "grep {$_} @CFLAGS" in compute-symver-floor,
# solo con spaziatura diversa): va rimossa per non farla fallire come
# "already applied".
SRCREV = "95d6e03ae37f4ec948474d111105bbdd2938aba2"

SRC_URI:remove = "file://fix_cflags_handling.patch"
