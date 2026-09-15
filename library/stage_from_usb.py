#!/usr/bin/env python3
"""One command: old Device Library USB -> staged native-shaped library.

Runs the whole pipeline and reports what was preserved:

  export.pdb  --pdb_extract-->  library.json  --build_device_library-->
      OUT/PIONEER/rekordbox/exportLibrary.db
  ANLZ tree   --anlz_extract-->  cue/loop/beat-grid inventory (verification only)

The source volume is opened read-only and never written. PIONEER/USBANLZ and
PIONEER/Contents are not copied: the staged database points at the ORIGINAL
analysis files, because EP147 parses the old ANLZ format natively (see
analysis/legacy-library-20260915/NATIVE-ANLZ-SUPPORT.md). The output is one
SQLite file, so it is trivially removable.

This does NOT produce a database any device has accepted. The file is plaintext
while EP147 opens it with sqlite3_key(), and no OneLibrary fixture exists here
to confirm schema exactness. See STATUS.md for that blocker.

Usage:
  BITEDJ_ROOT=/path/to/merge-candidate \\
  python3 library/stage_from_usb.py --drive-root /path/to/usb --out-dir DIR
                                    [--device-name NAME] [--categories-from DB]
                                    [--skip-analysis-check]

All paths are arguments; nothing is hard-coded.
"""
from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

# Both layouts rekordbox writes on removable media.
PDB_CANDIDATES = ("PIONEER/rekordbox/export.pdb", ".PIONEER/rekordbox/export.pdb")


def find_export(drive_root: Path):
    for rel in PDB_CANDIDATES:
        candidate = drive_root / rel
        if candidate.is_file():
            return candidate
    return None


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--drive-root", type=Path, required=True,
                    help="the USB/export root that contains PIONEER/")
    ap.add_argument("--out-dir", type=Path, required=True)
    ap.add_argument("--device-name", default=None)
    ap.add_argument("--categories-from", type=Path)
    ap.add_argument("--skip-analysis-check", action="store_true",
                    help="skip parsing the ANLZ tree for the preservation report")
    ap.add_argument("--bitedj-root", type=Path,
                    default=os.environ.get("BITEDJ_ROOT"),
                    help="bitedj merge-candidate checkout (or set BITEDJ_ROOT)")
    args = ap.parse_args()

    if not args.bitedj_root:
        print("error: set BITEDJ_ROOT or pass --bitedj-root", file=sys.stderr)
        return 2
    drive = args.drive_root.resolve()
    if not drive.is_dir():
        print(f"error: {drive} is not a directory", file=sys.stderr)
        return 2
    export = find_export(drive)
    hidden = export is not None and ".PIONEER" in export.parts
    if export is None:
        print(f"error: no export.pdb under {drive} "
              f"(looked for {', '.join(PDB_CANDIDATES)})", file=sys.stderr)
        return 1

    device_name = args.device_name or drive.name or "DEVICE"
    print(f"source export : {export}")
    print(f"layout        : {'.PIONEER (hidden)' if hidden else 'PIONEER'}")
    print(f"device name   : {device_name}")

    with tempfile.TemporaryDirectory(prefix="stage-device-library-") as tmp:
        tmp = Path(tmp)
        env = dict(os.environ, BITEDJ_ROOT=str(args.bitedj_root), OUT_DIR=str(tmp))
        subprocess.run(["bash", str(HERE / "build_pdb_extract.sh")],
                       env=env, check=True, stdout=subprocess.DEVNULL)

        library_json = tmp / "library.json"
        subprocess.run([str(tmp / "pdb_extract"), str(export),
                        "--out", str(library_json)],
                       check=True, stderr=subprocess.DEVNULL)
        library = json.loads(library_json.read_text())
        counts = library["counts"]
        print(f"\nread from export.pdb: {counts['tracks']} tracks, "
              f"{counts['playlists']} playlists, {counts['entries']} entries, "
              f"{counts['artists']} artists, {counts['labels']} labels, "
              f"{counts['artwork']} artwork rows")
        if library.get("row_errors") or library.get("table_errors"):
            print(f"  note: {library.get('row_errors', 0)} unreadable rows, "
                  f"{library.get('table_errors', 0)} unreadable tables")

        # Analysis inventory: verification only, nothing is copied or modified.
        if not args.skip_analysis_check:
            paths = [t["analyze_path"] for t in library["tracks"] if t["analyze_path"]]
            if paths:
                listing = tmp / "anlz.txt"
                listing.write_text("\n".join(paths) + "\n")
                anlz_json = tmp / "anlz.json"
                subprocess.run([str(tmp / "anlz_extract"), "--paths-from", str(listing),
                                "--drive-root", str(drive), "--out", str(anlz_json)],
                               check=True, stderr=subprocess.DEVNULL)
                summary = json.loads(anlz_json.read_text())["summary"]
                print(f"analysis tree (left in place): "
                      f"{summary['dat_parsed']}/{summary['inputs']} ANLZ pairs parse, "
                      f"{summary['with_beat_grid']} beat grids, "
                      f"{summary['merged_cues']} cues/loops, "
                      f"{summary['dat_failed']} unreadable")

        cmd = [sys.executable, str(HERE / "build_device_library.py"),
               str(library_json), "--out-dir", str(args.out_dir),
               "--device-name", device_name, "--verify-against", str(drive)]
        if args.categories_from:
            cmd += ["--categories-from", str(args.categories_from)]
        # Mirror whichever layout the source volume uses.
        if hidden:
            cmd.append("--hidden")
        print()
        result = subprocess.run(cmd)
        if result.returncode != 0:
            return result.returncode

    staged = (args.out_dir / (".PIONEER" if hidden else "PIONEER")
              / "rekordbox/exportLibrary.db")
    print(f"\nstaged library : {staged}")
    print("the original export was not modified; remove the output directory to undo.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
