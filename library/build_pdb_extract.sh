#!/usr/bin/env bash
# Build the legacy Device Library extractors against BiteDJ's generated Kaitai
# parsers. BiteDJ source is compiled read-only from its own checkout; nothing
# there is modified. Set BITEDJ_ROOT to that checkout (merge-candidate).
# OUT_DIR selects where the binaries land; TOOLS selects which to build.
set -euo pipefail

BITEDJ_ROOT="${BITEDJ_ROOT:?set BITEDJ_ROOT to the bitedj merge-candidate checkout}"
HERE="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="${OUT_DIR:-$HERE}"
CXX="${CXX:-c++}"
TOOLS="${TOOLS:-pdb_extract anlz_extract}"

META="$BITEDJ_ROOT/lib/rekordbox-metadata"
KRT="$BITEDJ_ROOT/lib/kaitai"

for f in "$META/rekordbox_pdb.cpp" "$META/rekordbox_anlz.cpp" \
         "$KRT/kaitai/kaitaistream.cpp"; do
    [ -f "$f" ] || { echo "missing $f" >&2; exit 1; }
done

mkdir -p "$OUT_DIR"

# KS_STR_ENCODING_NONE: the .ksy declares its own encodings and these tools
# decode device UTF-16 strings themselves, so the runtime does no charset work.
# -Wno-switch / -Wno-unused-but-set-variable: BiteDJ's generated parsers have
# non-exhaustive enum switches and an unused loop counter.
common=(-std=c++17 -O2 -Wall -Wno-switch -Wno-unused-but-set-variable -DKS_STR_ENCODING_NONE
        -I"$META" -I"$KRT" -I"$HERE")

for tool in $TOOLS; do
    case "$tool" in
        pdb_extract) generated="$META/rekordbox_pdb.cpp" ;;
        anlz_extract) generated="$META/rekordbox_anlz.cpp" ;;
        *) echo "unknown tool $tool" >&2; exit 1 ;;
    esac
    # OUT stays supported for single-tool builds so existing callers keep working.
    if [ "${OUT:-}" ] && [ "$(echo "$TOOLS" | wc -w)" = 1 ]; then
        target="$OUT"
    else
        target="$OUT_DIR/$tool"
    fi
    "$CXX" "${common[@]}" -o "$target" \
        "$HERE/$tool.cpp" "$generated" "$KRT/kaitai/kaitaistream.cpp"
    echo "built $target"
done
