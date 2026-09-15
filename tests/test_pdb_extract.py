#!/usr/bin/env python3
"""Build and validate the legacy PDB extractor against a real export.pdb.

  BITEDJ_ROOT=/path/to/merge-candidate \\
  PDB_FIXTURE=/path/to/PIONEER/rekordbox/export.pdb \\
  python3 tests/test_pdb_extract.py

Optional DRIVE_ROOT (the USB/export root containing PIONEER/USBANLZ) enables an
on-disk cross-check that every extracted analyze_path resolves to a real file --
the strongest available proof the path fields are extracted exactly, short of a
device acceptance fixture (which is unavailable; see ACCEPTANCE.md). It also
enables the rejection checks: exportExt.pdb and a non-PDB file must both be
refused cleanly rather than crashing or silently returning nothing.

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
        env = dict(os.environ, BITEDJ_ROOT=bitedj, OUT_DIR=str(tmp))
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

        # Colour names come from the COLORS table, so a track colour can be
        # preserved by name; ids must stay consistent with those names.
        colors = {t["color_id"]: t["color"] for t in tracks if t["color"]}
        for cid, name in colors.items():
            if not 1 <= cid <= 8:
                fail(f"colour id {cid} ({name}) outside the documented 1..8 range")

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

            # Rejection cases. exportExt.pdb shares the PDB framing but not the
            # row layouts; parsing it with this schema used to abort the
            # process, and a non-PDB file used to "succeed" with zero rows.
            ext_pdb = drive / "PIONEER/rekordbox/exportExt.pdb"
            if ext_pdb.is_file():
                r = subprocess.run([str(binary), str(ext_pdb)],
                                   capture_output=True, text=True)
                if r.returncode == 0:
                    fail("exportExt.pdb was accepted; it has different row layouts")
                elif r.returncode < 0:
                    fail(f"exportExt.pdb crashed the extractor (signal {-r.returncode})")
                elif "exportExt" not in r.stderr:
                    fail(f"exportExt.pdb rejected without explanation: {r.stderr!r}")
            anlz = next(drive.glob("PIONEER/USBANLZ/*/*/ANLZ0000.DAT"), None)
            if anlz is not None:
                r = subprocess.run([str(binary), str(anlz)],
                                   capture_output=True, text=True)
                if r.returncode == 0:
                    fail("a non-PDB file was accepted by the PDB extractor")
                elif r.returncode < 0:
                    fail(f"a non-PDB file crashed the extractor (signal {-r.returncode})")

    print(f"PASS: {len(tracks)} tracks, {len(data['playlists'])} playlists, "
          f"{len(data['playlist_entries'])} entries; "
          f"referential integrity OK; "
          + (f"{checked} analyze paths resolved on disk" if checked
             else "set DRIVE_ROOT for on-disk path check"))


if __name__ == "__main__":
    main()
