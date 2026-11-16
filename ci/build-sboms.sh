#!/bin/bash
# Derives the two delivery SBOMs from Yocto's SPDX documents, with names that
# state their type.
#
#   system-astrial-image-<machine>-build.spdx.json      everything used to
#                                 build, including build dependencies
#                                 (CISA taxonomy's Build type)
#   system-astrial-image-<machine>-deployed.spdx.json   only what's installed
#                                 on the board, per buildhistory's exact list
#                                 (Deployed type)
#
# Fails if Yocto didn't produce the archive: a build that asks for the SBOM
# and doesn't get one must say so, not exit green empty-handed.
set -euo pipefail

BSP="$1"
MACHINE="$2"
IMG=system-astrial-image
OUT="$BSP/build/tmp/deploy/images/$MACHINE"
HERE="$(cd "$(dirname "$0")" && pwd)"

ARCHIVE=$(ls -t "$OUT/$IMG-$MACHINE"*.spdx.tar.zst 2>/dev/null | head -1 || true)
if [ -z "$ARCHIVE" ]; then
  echo "ERROR: no SPDX archive in $OUT."
  echo "The build asked for the SBOM but didn't produce one: check that SYSELE_SBOM"
  echo "reached bitbake and that create-spdx is in INHERIT."
  exit 1
fi
echo "archive: $(basename "$ARCHIVE")"

WORK=$(mktemp -d); trap 'rm -rf "$WORK"' EXIT
tar --zstd -xf "$ARCHIVE" -C "$WORK"

INSTALLED=$(find "$BSP/build/buildhistory/images" -name installed-package-names.txt \
            -path "*$MACHINE*" 2>/dev/null | head -1 || true)
[ -n "$INSTALLED" ] && echo "installed list: $(wc -l < "$INSTALLED") packages" \
                    || echo "WARNING: buildhistory has no installed list, falling back to name matching"

python3 "$HERE/make_sbom.py" "$WORK" -t build --lean \
        -n "$IMG-$MACHINE" -o "$OUT/$IMG-$MACHINE-build.spdx.json"
python3 "$HERE/make_sbom.py" "$WORK" -t deployed --lean \
        ${INSTALLED:+--installed "$INSTALLED"} \
        -n "$IMG-$MACHINE" -o "$OUT/$IMG-$MACHINE-deployed.spdx.json"

ls -l "$OUT/$IMG-$MACHINE"-{build,deployed}.spdx.json
