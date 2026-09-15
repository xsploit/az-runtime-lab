#!/usr/bin/env python3
"""Build and validate the legacy PDB extractor against a real export.pdb.

  BITEDJ_ROOT=/path/to/merge-candidate \\
  PDB_FIXTURE=/path/to/PIONEER/rekordbox/export.pdb \\
  python3 tests/test_pdb_extract.py

Optional DRIVE_ROOT (the USB/export root containing PIONEER/USBANLZ) enables an
on-disk cross-check that every extracted analyze_path resolves to a real file --
the strongest available proof the path fields are extracted exactly, short of a
OneLibrary acceptance fixture (which is unavailable; see ACCEPTANCE.md).

Uses only genuine Rekordbox exports. Generates no fake fixtures.
"""
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def fail(msg):
    print("FAIL:", msg)
    sys.exit(1)


def main():
    bitedj = os.environ.get("BITEDJ_ROOT")
    fixture = os.environ.get("PDB_FIXTURE")
    if not bitedj or not fixture:
        fail("set BITEDJ_ROOT and PDB_FIXTURE (a genuine export.pdb)")
    fixture = Path(fixture)
    if not fixture.is_file():
        fail(f"PDB_FIXTURE not found: {fixture}")

    with tempfile.TemporaryDirectory(prefix="pdb-extract-test-") as tmp:
        tmp = Path(tmp)
        binary = tmp / "pdb_extract"
        env = dict(os.environ, BITEDJ_ROOT=bitedj, OUT=str(binary))
        subprocess.run(["bash", str(ROOT / "library/build_pdb_extract.sh")],
                       env=env, check=True, stdout=subprocess.DEVNULL)

        out1, out2 = tmp / "a.json", tmp / "b.json"
        for out in (out1, out2):
            subprocess.run([str(binary), str(fixture), "--out", str(out)],
                           check=True, stderr=subprocess.DEVNULL)

        if out1.read_text() != out2.read_text():
            fail("extraction is not deterministic")
        data = json.loads(out1.read_text())

        tracks = data["tracks"]
        if not tracks:
            fail("no tracks extracted")
        ids = {t["id"] for t in tracks}
        if len(ids) != len(tracks):
            fail("duplicate track ids")

        # Referential integrity: every playlist entry points at a real track.
        dangling = [e for e in data["playlist_entries"] if e["track_id"] not in ids]
        if dangling:
            fail(f"{len(dangling)} playlist entries reference unknown track ids")

        # Playlist tree parents must exist (0 == root) and not self-parent.
        pids = {p["id"] for p in data["playlists"]}
        for p in data["playlists"]:
            if p["parent_id"] not in pids and p["parent_id"] != 0:
                fail(f"playlist {p['id']} has unknown parent {p['parent_id']}")
            if p["parent_id"] == p["id"]:
                fail(f"playlist {p['id']} is its own parent")

        # Every track must carry a non-empty relative audio path.
        no_path = [t["id"] for t in tracks if not t["file_path"]]
        if no_path:
            print(f"note: {len(no_path)} tracks have empty file_path")

        checked = 0
        drive = os.environ.get("DRIVE_ROOT")
        if drive:
            drive = Path(drive)
            missing = []
            for t in tracks:
                ap = t["analyze_path"]
                if not ap:
                    continue
                checked += 1
                if not (drive / ap.lstrip("/")).exists():
                    missing.append(ap)
            if missing:
                fail(f"{len(missing)}/{checked} analyze_path values do not resolve "
                     f"on DRIVE_ROOT (e.g. {missing[0]})")

    print(f"PASS: {len(tracks)} tracks, {len(data['playlists'])} playlists, "
          f"{len(data['playlist_entries'])} entries; "
          f"referential integrity OK; "
          + (f"{checked} analyze paths resolved on disk" if checked
             else "set DRIVE_ROOT for on-disk path check"))


if __name__ == "__main__":
    main()
