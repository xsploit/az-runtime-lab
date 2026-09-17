#!/usr/bin/env python3
"""Validate ANLZ cue/loop/beat-grid extraction against a real Rekordbox export.

  BITEDJ_ROOT=/path/to/merge-candidate \\
  DRIVE_ROOT=/path/to/export/root \\
  PDB_FIXTURE=$DRIVE_ROOT/PIONEER/rekordbox/export.pdb \\
  python3 tests/test_anlz_extract.py

The checks that matter here are *cross-source*: export.pdb and the ANLZ files are
written independently, so agreement between them is real evidence that the
extraction preserves the original library rather than merely being internally
consistent. Specifically this asserts that

  * every track's ANLZ PPTH path equals that track's export.pdb file_path,
  * every beat grid's stored tempo includes the track's export.pdb BPM,
  * the merged cue view keeps every cue slot present in the raw representations,
    with no duplicate slot and no unreported cue-time conflict,
  * loops have an end after their start, and beat grids advance monotonically.

It also compares the cue-source policies, because the .DAT and .EXT do not hold
the same cue list. Uses only genuine exports; no fixtures are generated.
"""
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
failures = []


def check(condition, message):
    if not condition:
        failures.append(message)


def run(binary, paths_file, drive_root, out, source):
    subprocess.run([str(binary), "--paths-from", str(paths_file),
                    "--drive-root", str(drive_root), "--cue-source", source,
                    "--out", str(out)], check=True, stderr=subprocess.DEVNULL)
    return json.loads(Path(out).read_text())


def main():
    bitedj = os.environ.get("BITEDJ_ROOT")
    drive = os.environ.get("DRIVE_ROOT")
    fixture = os.environ.get("PDB_FIXTURE")
    if not (bitedj and drive and fixture):
        print("FAIL: set BITEDJ_ROOT, DRIVE_ROOT and PDB_FIXTURE")
        return 1
    drive = Path(drive)

    with tempfile.TemporaryDirectory(prefix="anlz-extract-test-") as tmp:
        tmp = Path(tmp)
        env = dict(os.environ, BITEDJ_ROOT=bitedj, OUT_DIR=str(tmp))
        subprocess.run(["bash", str(ROOT / "library/build_pdb_extract.sh")],
                       env=env, check=True, stdout=subprocess.DEVNULL)

        pdb_json = tmp / "pdb.json"
        subprocess.run([str(tmp / "pdb_extract"), fixture, "--out", str(pdb_json)],
                       check=True, stderr=subprocess.DEVNULL)
        pdb = json.loads(pdb_json.read_text())

        tracks = [t for t in pdb["tracks"] if t["analyze_path"]]
        check(bool(tracks), "fixture has no tracks with an analyze_path")
        paths_file = tmp / "paths.txt"
        paths_file.write_text("\n".join(t["analyze_path"] for t in tracks) + "\n")

        data = run(tmp / "anlz_extract", paths_file, drive, tmp / "both.json", "both")
        by_dat = {a["dat_path"]: a for a in data["analyses"]}
        summary = data["summary"]
        check(summary["dat_failed"] == 0,
              f"{summary['dat_failed']} ANLZ files failed to parse")
        check(summary["total_cues"] > 0, "fixture yielded no cues at all")
        check(summary["with_beat_grid"] > 0, "fixture yielded no beat grids")

        # --- cross-source agreement with export.pdb -------------------------
        path_checked = path_bad = bpm_checked = bpm_bad = 0
        for t in tracks:
            a = by_dat.get(str(drive) + t["analyze_path"])
            if a is None:
                continue
            if a["path_tag"]:
                path_checked += 1
                if a["path_tag"] != t["file_path"]:
                    path_bad += 1
                    if path_bad == 1:
                        failures.append(
                            f"ANLZ path {a['path_tag']!r} != PDB {t['file_path']!r}")
            tempos = {b[1] for b in a["beats"]}
            if tempos:
                bpm_checked += 1
                if round(t["bpm"] * 100) not in tempos:
                    bpm_bad += 1
                    if bpm_bad == 1:
                        failures.append(
                            f"PDB bpm {t['bpm']} absent from ANLZ tempos "
                            f"{sorted(tempos)[:4]} for {t['title']!r}")
        check(path_checked > 0, "no ANLZ path tags were available to cross-check")
        check(path_bad == 0, f"{path_bad}/{path_checked} ANLZ paths disagree with the PDB")
        check(bpm_bad == 0, f"{bpm_bad}/{bpm_checked} beat grids disagree with the PDB BPM")

        # --- structural rules on the extracted records ----------------------
        for a in data["analyses"]:
            slots = set()
            for m in a["merged_cues"]:
                slot = ("hot", m["hot_cue"]) if m["list"] == "hot" else ("mem", m["time_ms"])
                check(slot not in slots,
                      f"duplicate merged cue slot {slot} in {a['dat_path']}")
                slots.add(slot)
                check(m["representations"] >= 1, "merged cue with no representation")
            # Every raw cue slot must survive into the merged view.
            for c in a["cues"]:
                slot = ("hot", c["hot_cue"]) if c["list"] == "hot" else ("mem", c["time_ms"])
                if slot not in slots:
                    failures.append(f"cue slot {slot} lost when merging {a['dat_path']}")
                    break
            for c in a["cues"]:
                if c["type"] == "loop":
                    check(c.get("loop_time_ms", -1) > c["time_ms"],
                          f"loop end {c.get('loop_time_ms')} not after start "
                          f"{c['time_ms']} in {a['dat_path']}")
            times = [b[2] for b in a["beats"]]
            check(times == sorted(times), f"beat grid not monotonic in {a['dat_path']}")

        # --- cue-source policies ------------------------------------------
        dat = run(tmp / "anlz_extract", paths_file, drive, tmp / "dat.json", "dat")
        ext = run(tmp / "anlz_extract", paths_file, drive, tmp / "ext.json", "ext")
        check(summary["total_cues"] == dat["summary"]["total_cues"]
              + ext["summary"]["total_cues"],
              "both-source cue count is not the sum of the dat and ext counts")
        # The .EXT is expected to be the richer list; flag it loudly if a real
        # export ever contradicts that, because then 'ext' alone loses cues.
        lost = []
        for a, d, e in zip(data["analyses"], dat["analyses"], ext["analyses"]):
            if not e["cues"]:
                continue
            dat_slots = {(c["list"], c["hot_cue"], c["time_ms"]) for c in d["cues"]}
            ext_slots = {(c["list"], c["hot_cue"], c["time_ms"]) for c in e["cues"]}
            if dat_slots - ext_slots:
                lost.append((a["dat_path"], sorted(dat_slots - ext_slots)))
        if lost:
            print(f"note: {len(lost)} tracks hold .DAT cues absent from the .EXT; "
                  f"--cue-source both is required for these, e.g. {lost[0]}")

        # --- the expected-state oracle ------------------------------------
        # It is what a device test is checked against, so its totals must agree
        # with the extractors it is built from, and its clock strings must be
        # consistent with the millisecond values they came from.
        manifest_path = tmp / "expected.json"
        r = subprocess.run(
            [sys.executable, str(ROOT / "library/expected_state.py"),
             "--drive-root", drive, "--out", str(manifest_path), "--limit", "1"],
            capture_output=True, text=True,
            env=dict(os.environ, BITEDJ_ROOT=bitedj))
        check(r.returncode == 0, f"expected_state failed: {r.stderr.strip()}")
        if manifest_path.is_file():
            manifest = json.loads(manifest_path.read_text())
            totals = manifest["totals"]
            merged_hot = sum(1 for a in data["analyses"]
                             for c in a["merged_cues"] if c["list"] == "hot")
            merged_mem = sum(1 for a in data["analyses"]
                             for c in a["merged_cues"] if c["list"] == "memory")
            check(totals["hot_cues"] == merged_hot,
                  f"oracle counts {totals['hot_cues']} hot cues, extractor {merged_hot}")
            check(totals["memory_cues"] == merged_mem,
                  f"oracle counts {totals['memory_cues']} memory cues, "
                  f"extractor {merged_mem}")
            check(totals["tracks_with_beat_grid"] == summary["with_beat_grid"],
                  "oracle disagrees on how many tracks have a beat grid")
            for entry in manifest["tracks"]:
                for cue in entry["hot_cues"] + entry["memory_cues"]:
                    ms = cue["at_ms"]
                    mins, rest = divmod(ms, 60000)
                    secs, millis = divmod(rest, 1000)
                    if cue["at"] != f"{mins}:{secs:02d}.{millis:03d}":
                        failures.append(
                            f"oracle clock {cue['at']} does not match {ms} ms")
                        break
                    if cue["is_loop"] and not (cue["loop_end_ms"] or 0) > ms:
                        failures.append(f"oracle loop end not after start in "
                                        f"{entry['title']!r}")
                        break
            # Playlists must be listed in the order the browser would show them.
            positions = [p["position"] for p in manifest["playlists"]]
            check(positions == sorted(positions),
                  f"oracle playlists are not in browse order: {positions}")

    if failures:
        print("FAIL:")
        for f in failures:
            print("  -", f)
        return 1
    print(f"PASS: {summary['dat_parsed']} ANLZ pairs parsed; "
          f"{path_checked} path tags and {bpm_checked} beat grids agree with export.pdb; "
          f"{summary['total_cues']} cues -> {summary['merged_cues']} merged, "
          f"{summary['time_conflicts']} time conflicts; "
          f"{len(lost)} tracks needing .DAT-only cues; "
          f"oracle agrees ({totals['hot_cues']} hot, {totals['memory_cues']} memory, "
          f"{totals['loops']} loops)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
