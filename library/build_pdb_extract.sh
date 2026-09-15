#!/usr/bin/env bash
# Build the legacy PDB extractor against BiteDJ's generated Kaitai parser.
# BiteDJ source is compiled read-only from its own checkout; nothing there is
# modified. Set BITEDJ_ROOT to that checkout (merge-candidate). Output binary
# path is configurable via OUT.
set -euo pipefail

BITEDJ_ROOT="${BITEDJ_ROOT:?set BITEDJ_ROOT to the bitedj merge-candidate checkout}"
OUT="${OUT:-$(dirname "$0")/pdb_extract}"
CXX="${CXX:-c++}"

META="$BITEDJ_ROOT/lib/rekordbox-metadata"
KRT="$BITEDJ_ROOT/lib/kaitai"

for f in "$META/rekordbox_pdb.cpp" "$KRT/kaitai/kaitaistream.cpp"; do
    [ -f "$f" ] || { echo "missing $f" >&2; exit 1; }
done

# KS_STR_ENCODING_NONE: the .ksy declares its own encodings and this tool
# decodes device UTF-16 strings itself, so the runtime does no charset work.
# -Wno-switch: BiteDJ's generated parser has non-exhaustive enum switches.
"$CXX" -std=c++17 -O2 -Wall -Wno-switch -DKS_STR_ENCODING_NONE -o "$OUT" \
    -I"$META" -I"$KRT" \
    "$(dirname "$0")/pdb_extract.cpp" \
    "$META/rekordbox_pdb.cpp" \
    "$KRT/kaitai/kaitaistream.cpp"

echo "built $OUT"
