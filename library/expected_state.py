#!/usr/bin/env python3
"""Expected on-device state for a staged Device Library — the test oracle.

Joins what export.pdb says about each track with what its ANLZ files actually
contain, so that when someone is finally able to mount a staged library on a
device they have a concrete, per-track expectation to check against instead of
an impression. Nothing here touches a device; it only reads the source volume.

Why it exists: preserving cues, loops, colours and beat grids is the point of
the exercise, and EP147 reads those from the original ANLZ files (see
NATIVE-ANLZ-SUPPORT.md). So the check that matters is "does the deck show the
cues this track's ANLZ actually holds", and that list has to be written down
before the test, not after.

Outputs a JSON manifest and, by default, a short human-checkable summary of the
tracks that carry cues -- those are the ones worth eyeballing on the hardware.

Usage:
  BITEDJ_ROOT=... python3 library/expected_state.py --drive-root DIR
                          [--out manifest.json] [--limit N] [--all]
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
PDB_CANDIDATES = ("PIONEER/rekordbox/export.pdb", ".PIONEER/rekordbox/export.pdb")


def ms_to_clock(ms):
    seconds, millis = divmod(int(ms), 1000)
    minutes, seconds = divmod(seconds, 60)
    return f"{minutes}:{seconds:02d}.{millis:03d}"


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--drive-root", type=Path, required=True)
    ap.add_argument("--out", type=Path)
    ap.add_argument("--limit", type=int, default=10,
                    help="tracks to print in the summary (default 10)")
    ap.add_argument("--all", action="store_true", help="print every track with cues")
    ap.add_argument("--bitedj-root", type=Path, default=os.environ.get("BITEDJ_ROOT"))
    args = ap.parse_args()

    if not args.bitedj_root:
        print("error: set BITEDJ_ROOT or pass --bitedj-root", file=sys.stderr)
        return 2
    drive = args.drive_root.resolve()
    export = next((drive / rel for rel in PDB_CANDIDATES if (drive / rel).is_file()), None)
    if export is None:
        print(f"error: no export.pdb under {drive}", file=sys.stderr)
        return 1

    with tempfile.TemporaryDirectory(prefix="expected-state-") as tmp:
        tmp = Path(tmp)
        subprocess.run(["bash", str(HERE / "build_pdb_extract.sh")],
                       env=dict(os.environ, BITEDJ_ROOT=str(args.bitedj_root),
                                OUT_DIR=str(tmp)),
                       check=True, stdout=subprocess.DEVNULL)
        lib_json = tmp / "library.json"
        subprocess.run([str(tmp / "pdb_extract"), str(export), "--out", str(lib_json)],
                       check=True, stderr=subprocess.DEVNULL)
        library = json.loads(lib_json.read_text())

        tracks = {t["id"]: t for t in library["tracks"]}
        paths = [t["analyze_path"] for t in library["tracks"] if t["analyze_path"]]
        by_path = {}
        if paths:
            listing = tmp / "paths.txt"
            listing.write_text("\n".join(paths) + "\n")
            anlz_json = tmp / "anlz.json"
            subprocess.run([str(tmp / "anlz_extract"), "--paths-from", str(listing),
                            "--drive-root", str(drive), "--out", str(anlz_json)],
                           check=True, stderr=subprocess.DEVNULL)
            for a in json.loads(anlz_json.read_text())["analyses"]:
                by_path[a["dat_path"]] = a

    # Playlist membership, in the order the deck should show it.
    playlists = []
    for p in sorted(library["playlists"], key=lambda p: (p["parent_id"], p["sort_order"])):
        members = sorted((e for e in library["playlist_entries"]
                          if e["playlist_id"] == p["id"]),
                         key=lambda e: e["entry_index"])
        playlists.append({
            "id": p["id"], "name": p["name"], "parent_id": p["parent_id"],
            "is_folder": p["is_folder"], "position": p["sort_order"],
            "track_count": len(members),
            "first_tracks": [tracks[e["track_id"]]["title"]
                             for e in members[:5] if e["track_id"] in tracks],
        })

    entries = []
    for t in library["tracks"]:
        a = by_path.get(str(drive) + t["analyze_path"]) if t["analyze_path"] else None
        if a is None:
            continue
        cues = a["merged_cues"]
        beats = a["beats"]
        entries.append({
            "content_id": t["id"],
            "title": t["title"],
            "artist": t["artist"],
            "bpm": t["bpm"],
            "path": t["file_path"],
            "analysis": t["analyze_path"],
            "beat_grid": {
                "beats": len(beats),
                "first_beat_ms": beats[0][2] if beats else None,
                "tempo_x100": sorted({b[1] for b in beats}) if beats else [],
            },
            "hot_cues": [{"pad": c["hot_cue"], "at_ms": c["time_ms"],
                          "at": ms_to_clock(c["time_ms"]),
                          "loop_end_ms": c.get("loop_time_ms"),
                          "is_loop": c["type"] == "loop",
                          "rgb": c.get("rgb"), "comment": c.get("comment", "")}
                         for c in cues if c["list"] == "hot"],
            "memory_cues": [{"at_ms": c["time_ms"], "at": ms_to_clock(c["time_ms"]),
                             "is_loop": c["type"] == "loop",
                             "loop_end_ms": c.get("loop_time_ms"),
                             "rgb": c.get("rgb"), "comment": c.get("comment", "")}
                            for c in cues if c["list"] == "memory"],
        })

    manifest = {
        "source_export": str(export),
        "drive_root": str(drive),
        "totals": {
            "tracks": len(entries),
            "tracks_with_cues": sum(1 for e in entries
                                    if e["hot_cues"] or e["memory_cues"]),
            "hot_cues": sum(len(e["hot_cues"]) for e in entries),
            "memory_cues": sum(len(e["memory_cues"]) for e in entries),
            "loops": sum(1 for e in entries
                         for c in e["hot_cues"] + e["memory_cues"] if c["is_loop"]),
            "tracks_with_beat_grid": sum(1 for e in entries if e["beat_grid"]["beats"]),
            "playlists": len(playlists),
        },
        "playlists": playlists,
        "tracks": entries,
    }

    if args.out:
        args.out.write_text(json.dumps(manifest, indent=1) + "\n")
        print(f"wrote {args.out}", file=sys.stderr)

    t = manifest["totals"]
    print(f"Expected on-device state for {export}\n")
    print(f"  {t['tracks']} tracks, {t['tracks_with_beat_grid']} with a beat grid")
    print(f"  {t['tracks_with_cues']} tracks carry cues: "
          f"{t['hot_cues']} hot, {t['memory_cues']} memory, {t['loops']} loops")
    print(f"  {t['playlists']} playlists/folders\n")

    print("Playlists, in the order the browser should show them:")
    for p in playlists:
        kind = "folder" if p["is_folder"] else "playlist"
        print(f"  [{p['position']}] {p['name']} ({kind}, {p['track_count']} tracks)")
        for title in p["first_tracks"]:
            print(f"        {title}")
    print()

    with_cues = [e for e in entries if e["hot_cues"] or e["memory_cues"]]
    shown = with_cues if args.all else with_cues[:args.limit]
    print(f"Tracks with cues ({len(shown)} of {len(with_cues)} shown) -- "
          f"load these on the deck and compare:")
    for e in shown:
        grid = e["beat_grid"]
        tempo = ", ".join(f"{v/100:g}" for v in grid["tempo_x100"][:3]) or "none"
        print(f"\n  #{e['content_id']} {e['title']} - {e['artist']}")
        print(f"    grid: {grid['beats']} beats @ {tempo} BPM, first at "
              f"{ms_to_clock(grid['first_beat_ms']) if grid['first_beat_ms'] is not None else 'n/a'}")
        for c in sorted(e["hot_cues"], key=lambda c: c["pad"]):
            extra = f" loop->{ms_to_clock(c['loop_end_ms'])}" if c["is_loop"] else ""
            rgb = f" rgb{tuple(c['rgb'])}" if c["rgb"] else ""
            print(f"    hot pad {c['pad']}: {c['at']}{extra}{rgb}")
        for c in sorted(e["memory_cues"], key=lambda c: c["at_ms"]):
            extra = f" loop->{ms_to_clock(c['loop_end_ms'])}" if c["is_loop"] else ""
            print(f"    memory: {c['at']}{extra}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
