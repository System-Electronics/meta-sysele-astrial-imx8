# Bug Perl: lo script build-aux/scripts/BuildCommon.pm usa la keyword "when",
# una feature sperimentale di Perl rimossa nelle versioni recenti (Perl 5.38
# su Ubuntu 24.04, "when is deprecated" seguito da un errore di compilazione
# dello script e "configure: error: bad value 'all' for --enable-hashes").
# Fix upstream dedicato: commit ce562f4 "Make BuildCommon.pm compatible with
# latest perl". Bump mirato della sola SRCREV (stesso principio usato per
# pseudo), non tocca il resto della ricetta.
#
# La patch locale fix_cflags_handling.patch e' gia' inclusa a monte nella
# nuova SRCREV (stesso filtro "grep {$_} @CFLAGS" in compute-symver-floor,
# solo con spaziatura diversa): va rimossa per non farla fallire come
# "already applied".
SRCREV = "ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c"

SRC_URI:remove = "file://fix_cflags_handling.patch"
