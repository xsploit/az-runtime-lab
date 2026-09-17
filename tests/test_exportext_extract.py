#!/usr/bin/env python3
"""Validate the raw PDB framing reader and the exportExt MyTag decoder.

  BITEDJ_ROOT=/path/to/merge-candidate \\
  PDB_FIXTURE=/path/to/PIONEER/rekordbox/export.pdb \\
  EXT_FIXTURE=/path/to/PIONEER/rekordbox/exportExt.pdb \\
  python3 tests/test_exportext_extract.py

Two independent implementations read the same file here: the generated Kaitai
parser (via pdb_extract) and the schema-free framing reader in pdb_raw.py. The
row counts they produce for export.pdb must agree -- that is what justifies
trusting pdb_raw on exportExt.pdb, which the Kaitai schema cannot read at all.

The MyTag checks are structural and content-based: every tag must belong to a
declared category, sequences must be contiguous, names must be non-empty, and
no row may be skipped as unreadable.

EXT_FIXTURE is optional; not every export has one.
"""
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "library"))
from pdb_raw import PdbFile  # noqa: E402

failures = []


def check(condition, message):
    if not condition:
        failures.append(message)


def main():
    bitedj = os.environ.get("BITEDJ_ROOT")
    fixture = os.environ.get("PDB_FIXTURE")
    if not (bitedj and fixture):
        print("FAIL: set BITEDJ_ROOT and PDB_FIXTURE")
        return 1

    # --- pdb_raw must agree with the generated Kaitai parser ---------------
    with tempfile.TemporaryDirectory(prefix="pdb-raw-test-") as tmp:
        tmp = Path(tmp)
        env = dict(os.environ, BITEDJ_ROOT=bitedj, OUT_DIR=str(tmp))
        subprocess.run(["bash", str(ROOT / "library/build_pdb_extract.sh")],
                       env=env, check=True, stdout=subprocess.DEVNULL)
        out = tmp / "pdb.json"
        subprocess.run([str(tmp / "pdb_extract"), fixture, "--out", str(out)],
                       check=True, stderr=subprocess.DEVNULL)
        typed = json.loads(out.read_text())["counts"]

    pdb = PdbFile(fixture)
    raw = {t.type: sum(1 for _ in pdb.iter_rows(t)) for t in pdb.tables()}
    # PAGE_TYPE_TRACKS=0, GENRES=1, ARTISTS=2, ALBUMS=3, LABELS=4, KEYS=5,
    # COLORS=6, PLAYLIST_TREE=7, PLAYLIST_ENTRIES=8, ARTWORK=13
    for name, type_id in (("tracks", 0), ("genres", 1), ("artists", 2),
                          ("albums", 3), ("labels", 4), ("keys", 5),
                          ("colors", 6), ("playlists", 7), ("entries", 8),
                          ("artwork", 13)):
        check(raw.get(type_id, 0) == typed[name],
              f"pdb_raw counted {raw.get(type_id, 0)} rows for {name} but the "
              f"Kaitai parser reported {typed[name]}")

    # --- exportExt MyTag decoding -----------------------------------------
    ext = os.environ.get("EXT_FIXTURE")
    tags = cats = 0
    if ext and Path(ext).is_file():
        result = subprocess.run(
            [sys.executable, str(ROOT / "library/exportext_extract.py"), ext,
             "--report"], capture_output=True, text=True, check=True)
        data = json.loads(result.stdout)
        counts = data["counts"]
        cats, tags = counts["categories"], counts["tags"]
        check(counts["skipped_rows"] == 0,
              f"{counts['skipped_rows']} exportExt rows could not be decoded")
        check(counts["orphan_tags"] == 0,
              f"{counts['orphan_tags']} tags reference a missing category")
        check(cats > 0, "no MyTag categories decoded")
        check(tags > 0, "no MyTags decoded")
        seen_ids = set()
        for cat in data["categories"]:
            check(bool(cat["name"].strip()), f"category {cat['id']} has a blank name")
            check(cat["id"] not in seen_ids, f"duplicate id {cat['id']}")
            seen_ids.add(cat["id"])
            seqs = [t["sequence"] for t in cat["tags"]]
            check(seqs == list(range(len(seqs))),
                  f"category {cat['name']!r} has non-contiguous tag order {seqs}")
            for tag in cat["tags"]:
                check(bool(tag["name"].strip()),
                      f"tag {tag['id']} in {cat['name']!r} has a blank name")
                check(tag["id"] not in seen_ids, f"duplicate id {tag['id']}")
                seen_ids.add(tag["id"])
                check(tag["parent_id"] == cat["id"], "tag/category link mismatch")
        # Record, do not assert: no local export has carried a tag-to-track
        # mapping, so MyTags add no per-track data to preserve yet.
        if 0 in data["non_empty_table_types"]:
            print("note: this exportExt has a non-empty table type 0; "
                  "check whether it carries tag-to-track links")

    if failures:
        print("FAIL:")
        for f in failures:
            print("  -", f)
        return 1
    print(f"PASS: pdb_raw agrees with the Kaitai parser on all 10 table types "
          f"({typed['tracks']} tracks); "
          + (f"exportExt decoded {cats} MyTag categories / {tags} tags cleanly"
             if tags else "no EXT_FIXTURE supplied"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
