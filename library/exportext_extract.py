#!/usr/bin/env python3
"""Decode exportExt.pdb MyTag definitions -> JSON.

exportExt.pdb reuses the PDB page/table framing but not the export.pdb row
layouts, so the bundled Kaitai schema cannot read it (it aborts -- see
library/pdb_extract.cpp). This decoder works from the raw framing in
library/pdb_raw.py and a row layout derived by inspecting a genuine export.

Row layout of table type 3 (MyTag), offsets from the row start:

  0x00 u2  marker, 0x0680 on every observed row
  0x02 u2  index shift, rises by 0x20 per row
  0x0c u4  parent category id; 0 marks a category row
  0x10 u4  sequence within the parent
  0x14 u4  id: small and sequential for categories, hash-like for tags
  0x1e u1  offset of the trailing (second, empty on all observed rows) string
  0x1f u1  device_sql short-ascii header for the name: length = (byte >> 1) - 1
  0x20 ..  name text

This layout is inferred from one library's file, not from a specification. The
decoder therefore validates as it goes and reports what it could not read,
rather than inventing values. Categories and tags are the whole of the MyTag
definition; a tag-to-track mapping table has NOT been observed (see
--report for what a given file actually contains).

Usage: python3 library/exportext_extract.py exportExt.pdb [--out FILE] [--report]
"""
from __future__ import annotations

import argparse
import json
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from pdb_raw import PdbFile  # noqa: E402

MYTAG_TABLE_TYPE = 3
MYTAG_MARKER = 0x0680
NAME_HEADER_OFFSET = 0x1F


def short_ascii(data: bytes, pos: int):
    """Decode a device_sql short-ascii string at pos, or return None."""
    if pos >= len(data):
        return None
    header = data[pos]
    if not header & 1:          # long strings use a different header
        return None
    length = (header >> 1) - 1
    if length < 0 or pos + 1 + length > len(data):
        return None
    try:
        return data[pos + 1:pos + 1 + length].decode("utf-8")
    except UnicodeDecodeError:
        return data[pos + 1:pos + 1 + length].decode("latin-1")


def decode_mytags(pdb: PdbFile):
    tables = [t for t in pdb.tables() if t.type == MYTAG_TABLE_TYPE]
    rows, skipped = [], []
    for table in tables:
        for row in pdb.iter_rows(table):
            d = row.data
            if len(d) < 0x20:
                skipped.append({"offset": row.offset, "reason": "row shorter than header"})
                continue
            marker = struct.unpack_from("<H", d, 0)[0]
            if marker != MYTAG_MARKER:
                skipped.append({"offset": row.offset,
                                "reason": f"unexpected marker {marker:#06x}"})
                continue
            name = short_ascii(d, NAME_HEADER_OFFSET)
            if name is None:
                skipped.append({"offset": row.offset, "reason": "unreadable name"})
                continue
            parent, sequence, ident = struct.unpack_from("<III", d, 0x0C)
            rows.append({"id": ident, "parent_id": parent, "sequence": sequence,
                         "name": name, "is_category": parent == 0})
    return rows, skipped


def build_tree(rows):
    categories = {r["id"]: dict(r, tags=[]) for r in rows if r["is_category"]}
    orphans = []
    for r in rows:
        if r["is_category"]:
            continue
        cat = categories.get(r["parent_id"])
        if cat is None:
            orphans.append(r)
        else:
            cat["tags"].append(r)
    for cat in categories.values():
        cat["tags"].sort(key=lambda t: t["sequence"])
    ordered = sorted(categories.values(), key=lambda c: c["sequence"])
    return ordered, orphans


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("file", type=Path)
    ap.add_argument("--out", type=Path)
    ap.add_argument("--report", action="store_true",
                    help="also list every table and row count in the file")
    args = ap.parse_args()

    try:
        pdb = PdbFile(args.file)
    except ValueError as e:
        print(f"refusing {args.file}: {e}", file=sys.stderr)
        return 1

    rows, skipped = decode_mytags(pdb)
    categories, orphans = build_tree(rows)

    result = {
        "source": str(args.file),
        "counts": {
            "categories": len(categories),
            "tags": sum(len(c["tags"]) for c in categories),
            "orphan_tags": len(orphans),
            "skipped_rows": len(skipped),
        },
        "categories": categories,
        "orphan_tags": orphans,
        "skipped_rows": skipped,
    }
    if args.report:
        result["tables"] = [{"index": t.index, "type": t.type,
                             "rows": sum(1 for _ in pdb.iter_rows(t))}
                            for t in pdb.tables()]
        # No tag-to-track mapping table has been observed in any local export;
        # record the fact per file instead of assuming it either way.
        result["non_empty_table_types"] = [t["type"] for t in result["tables"] if t["rows"]]

    text = json.dumps(result, indent=1)
    if args.out:
        args.out.write_text(text + "\n")
        print(f"wrote {args.out} ({result['counts']['categories']} categories, "
              f"{result['counts']['tags']} tags, "
              f"{result['counts']['skipped_rows']} rows skipped)", file=sys.stderr)
    else:
        print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
