#!/usr/bin/env python3
"""Validate the staged Device Library database against EP147's own expectations.

  BITEDJ_ROOT=/path/to/merge-candidate \\
  DRIVE_ROOT=/path/to/export/root \\
  PDB_FIXTURE=$DRIVE_ROOT/PIONEER/rekordbox/export.pdb \\
  python3 tests/test_build_device_library.py

This test does not apply the SQLCipher key. Exact firmware acceptance is tracked
separately in the native acceptance report. What this checks is much stronger
than "a file that happens to be SQLite":

  * the structural part of EP147's mount sequence runs: SELECT * FROM property,
    PRAGMA main.journal_mode=delete, the sqlite_master table listing and a
    PRAGMA table_info for every table;
  * all 22 tables of EP147's entity list are present;
  * every SQL fragment recovered verbatim from EP147's rodata compiles against
    the schema (joins, playlist ordering predicate, sub-query aliases, ...);
  * every column EP147 is seen to read (onelibrary-column-xrefs.json) exists;
  * and the content preserves the ORIGINAL export: track ids, titles, bpm,
    audio paths, playlist membership and order, and analysis paths kept
    verbatim and still resolving to real ANLZ files on disk.
"""
import json
import os
import re
import sqlite3
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
XREFS = ROOT / "analysis/legacy-library-20260915/onelibrary-column-xrefs.json"

# EP147's 22-table entity list (NATIVE-ANLZ-SUPPORT.md / ONELIBRARY-SCHEMA.md).
ENTITIES = {"history", "history_content", "hotCueBankList", "hotCueBankList_cue",
            "cue", "key", "label", "color", "recommendedLike", "menuItem",
            "myTag", "myTag_content", "playlist", "playlist_content",
            "property", "category", "sort", "content", "artist", "image",
            "genre", "album"}

# SQL taken from EP147 rodata; %u placeholders filled so they can be compiled.
EP147_SQL = [
    "SELECT * FROM property",
    "SELECT name from sqlite_master WHERE TYPE='table'",
    "SELECT * FROM content INNER JOIN playlist_content"
    " ON content.content_id = playlist_content.content_id",
    "SELECT * FROM playlist_content WHERE ( playlist_id = 1 AND sequenceNo <= 5 )",
    "SELECT * FROM content INNER JOIN history_content"
    " ON content.content_id = history_content.content_id",
    "SELECT * FROM ( SELECT * FROM content ) AS sub"
    " INNER JOIN album ON sub.album_id = album.album_id",
    "SELECT * FROM ( SELECT * FROM content ) AS sub"
    " INNER JOIN artist ON sub.artist_id_artist = artist.artist_id",
    "SELECT * FROM ( SELECT * FROM content ) AS sub"
    " INNER JOIN artist ON sub.artist_id_remixer = artist.artist_id",
    "SELECT * FROM ( SELECT * FROM content ) AS sub"
    " INNER JOIN artist ON sub.artist_id_originalArtist = artist.artist_id",
    "SELECT * FROM hotCueBankList_cue INNER JOIN cue"
    " ON hotCueBankList_cue.cue_id = cue.cue_id",
    "SELECT * FROM cue INNER JOIN ( SELECT * FROM hotCueBankList_cue ) AS sub"
    " ON cue.cue_id = sub.cue_id",
    "SELECT * FROM content INNER JOIN ( SELECT * FROM playlist_content ) AS sub"
    " ON content.content_id = sub.content_id",
    "SELECT * FROM ( SELECT * FROM hotCueBankList_cue ) AS sub"
    " WHERE sub.hotCueBankList_id = 1",
    "SELECT * FROM content WHERE genre_id = 1",
    "SELECT * FROM history_content WHERE history_id = 1",
    "SELECT * FROM hotCueBankList WHERE hotCueBankList_id = 1",
    "SELECT * FROM content WHERE content_id > 0",
    'SELECT * FROM content WHERE dateAdded LIKE "2026-__-__"',
    "SELECT * FROM hotCueBankList ORDER BY sequenceNo, hotCueBankList_id",
    "SELECT content_id_1, content_id_2 FROM recommendedLike",
    "SELECT * FROM content INNER JOIN myTag_content"
    " ON content.content_id = myTag_content.content_id",
    "SELECT * FROM category INNER JOIN menuItem"
    " ON category.menuItem_id = menuItem.menuItem_id",
    "SELECT * FROM sort INNER JOIN menuItem"
    " ON sort.menuItem_id = menuItem.menuItem_id",
]

failures = []


def check(condition, message):
    if not condition:
        failures.append(message)


def main():
    bitedj = os.environ.get("BITEDJ_ROOT")
    fixture = os.environ.get("PDB_FIXTURE")
    drive = os.environ.get("DRIVE_ROOT")
    if not (bitedj and fixture):
        print("FAIL: set BITEDJ_ROOT and PDB_FIXTURE")
        return 1

    with tempfile.TemporaryDirectory(prefix="device-library-test-") as tmp:
        tmp = Path(tmp)
        env = dict(os.environ, BITEDJ_ROOT=bitedj, OUT_DIR=str(tmp))
        subprocess.run(["bash", str(ROOT / "library/build_pdb_extract.sh")],
                       env=env, check=True, stdout=subprocess.DEVNULL)
        lib_json = tmp / "library.json"
        subprocess.run([str(tmp / "pdb_extract"), fixture, "--out", str(lib_json)],
                       check=True, stderr=subprocess.DEVNULL)
        source = json.loads(lib_json.read_text())

        cmd = [sys.executable, str(ROOT / "library/build_device_library.py"),
               str(lib_json), "--out-dir", str(tmp / "staged"),
               "--device-name", "TEST"]
        if drive:
            cmd += ["--verify-against", drive]
        r = subprocess.run(cmd, capture_output=True, text=True)
        check(r.returncode == 0, f"generator failed: {r.stderr.strip()}")
        check("exact AZ SQLCipher library and EP147" in r.stdout,
              "generator must state the bounded native acceptance result")

        db_path = tmp / "staged/PIONEER/rekordbox/exportLibrary.db"
        check(db_path.is_file(), "no database was produced")
        if failures:
            print("FAIL:")
            for f in failures:
                print("  -", f)
            return 1

        db = sqlite3.connect(db_path)

        # --- structural part of EP147's mount sequence ---------------------
        prop = db.execute("SELECT * FROM property").fetchall()
        check(len(prop) == 1, f"expected exactly one property row, got {len(prop)}")
        check(db.execute("PRAGMA main.journal_mode=delete").fetchone()[0] == "delete",
              "journal_mode=delete was refused")
        tables = {r[0] for r in
                  db.execute("SELECT name from sqlite_master WHERE TYPE='table'")}
        missing = ENTITIES - tables
        check(not missing, f"entity tables missing from the database: {sorted(missing)}")
        for t in tables:
            check(bool(db.execute(f"PRAGMA table_info({t})").fetchall()),
                  f"PRAGMA table_info({t}) returned nothing")

        # --- EP147's own SQL must compile ---------------------------------
        for sql in EP147_SQL:
            try:
                db.execute(sql)
            except sqlite3.Error as e:
                failures.append(f"EP147 SQL failed: {e}: {sql[:70]}")

        # --- every column EP147 reads must exist --------------------------
        wanted = set(json.loads(XREFS.read_text())["column_calls"])
        have = set()
        for t in tables:
            for row in db.execute(f"PRAGMA table_info({t})"):
                have.add(row[1])
        absent = sorted(wanted - have)
        check(not absent, f"columns EP147 reads are absent: {absent}")

        # --- preservation of the ORIGINAL export --------------------------
        src_ids = {t["id"] for t in source["tracks"]}
        db_ids = {r[0] for r in db.execute("SELECT content_id FROM content")}
        check(src_ids == db_ids,
              f"track ids not preserved ({len(src_ids)} source vs {len(db_ids)} staged)")

        mismatched = 0
        for t in source["tracks"]:
            row = db.execute(
                "SELECT title, bpmx100, path, analysisDataFilePath, length,"
                " rating, isrc, dateAdded, djPlayCount"
                " FROM content WHERE content_id = ?", (t["id"],)).fetchone()
            if row is None:
                mismatched += 1
                continue
            if (row[0] != t["title"] or row[1] != round(t["bpm"] * 100)
                    or row[2] != t["file_path"] or row[3] != t["analyze_path"]
                    or row[4] != t["duration_sec"] or row[5] != t["rating"]
                    or row[6] != t["isrc"] or row[7] != t["date_added"]
                    or row[8] != t["play_count"]):
                mismatched += 1
        check(mismatched == 0,
              f"{mismatched} tracks differ from the source export")

        # ISRC is stored behind the UTF-16 body type but holds tagged ASCII;
        # a regression there shows up as CJK mojibake, so assert the real shape.
        # Case-insensitive on purpose: one track in a genuine export carries a
        # lowercase-typed ISRC ("Us57M2124205"), which is source data, not a
        # decoding fault.
        isrc_pattern = re.compile(r"^[A-Za-z]{2}[A-Za-z0-9]{3}[0-9]{7}$")
        isrcs = [r[0] for r in db.execute(
            "SELECT isrc FROM content WHERE isrc != ''")]
        bad_isrc = [i for i in isrcs if not isrc_pattern.match(i)]
        check(not bad_isrc,
              f"{len(bad_isrc)}/{len(isrcs)} ISRC values are not valid ISRCs "
              f"(e.g. {bad_isrc[0] if bad_isrc else ''})")

        # dateAdded must keep the YYYY-MM-DD shape EP147's browse predicate
        # `dateAdded LIKE "%u-__-__"` matches against.
        dates = [r[0] for r in db.execute(
            "SELECT dateAdded FROM content WHERE dateAdded != ''")]
        bad_dates = [d for d in dates if not re.match(r"^\d{4}-\d{2}-\d{2}$", d)]
        check(not bad_dates,
              f"{len(bad_dates)}/{len(dates)} dateAdded values are not YYYY-MM-DD")
        if dates:
            year = dates[0][:4]
            hits = db.execute(
                'SELECT COUNT(*) FROM content WHERE dateAdded LIKE ?',
                (f"{year}-__-__",)).fetchone()[0]
            check(hits > 0,
                  "EP147's dateAdded browse predicate matches nothing")

        # Artist roles must land in their own columns, not collapse into artist.
        for role, column in (("remixer", "artist_id_remixer"),
                             ("composer", "artist_id_composer"),
                             ("original_artist", "artist_id_originalArtist")):
            expected = sorted(t[role] for t in source["tracks"] if t.get(role))
            got = sorted(r[0] for r in db.execute(
                f"SELECT a.name FROM content c JOIN artist a"
                f" ON c.{column} = a.artist_id"))
            check(expected == got,
                  f"{role} not preserved into {column}: "
                  f"{len(expected)} in source vs {len(got)} staged")

        bad_order = []
        for p in source["playlists"]:
            expected = [e["track_id"] for e in
                        sorted((e for e in source["playlist_entries"]
                                if e["playlist_id"] == p["id"]),
                               key=lambda e: e["entry_index"])]
            got = [r[0] for r in db.execute(
                "SELECT content_id FROM playlist_content WHERE playlist_id = ?"
                " ORDER BY sequenceNo", (p["id"],))]
            if got != expected:
                bad_order.append(p["name"])
        check(not bad_order, f"playlist order/membership lost for: {bad_order}")

        src_pl = {p["id"] for p in source["playlists"]}
        db_pl = {r[0] for r in db.execute("SELECT playlist_id FROM playlist")}
        check(src_pl == db_pl, "playlist ids not preserved")

        # Folder vs playlist must survive the attribute mapping.
        for p in source["playlists"]:
            attr = db.execute("SELECT attribute FROM playlist WHERE playlist_id = ?",
                              (p["id"],)).fetchone()[0]
            check(bool(attr) == bool(p["is_folder"]),
                  f"folder flag lost for playlist {p['name']!r}")

        # fileType uses EP147's own extension mapping (VA 0x117c650), where an
        # unrecognised suffix yields 0. A real music export should not contain
        # any track the firmware would classify as unknown.
        unknown = db.execute(
            "SELECT COUNT(*) FROM content WHERE fileType = 0 AND path != ''"
        ).fetchone()[0]
        check(unknown == 0,
              f"{unknown} tracks have fileType 0 (extension EP147 does not map)")
        for suffix, code in ((".mp3", 1), (".m4a", 4), (".flac", 5),
                             (".wav", 11), (".aiff", 12)):
            wrong = db.execute(
                "SELECT COUNT(*) FROM content WHERE lower(path) LIKE ?"
                " AND fileType != ?", (f"%{suffix}", code)).fetchone()[0]
            check(wrong == 0, f"{wrong} {suffix} tracks do not have fileType {code}")

        # Album art from the export's ARTWORK table must survive as image rows.
        src_art = {t["artwork_path"] for t in source["tracks"] if t["artwork_path"]}
        db_art = {r[0] for r in db.execute("SELECT path FROM image")}
        check(src_art == db_art,
              f"artwork paths not preserved ({len(src_art)} source vs "
              f"{len(db_art)} staged)")
        linked = db.execute("SELECT COUNT(*) FROM content c JOIN image i"
                            " ON c.image_id = i.image_id").fetchone()[0]
        check(linked == len([t for t in source["tracks"] if t["artwork_path"]]),
              "content rows are not linked to their artwork")

        # --- analysis paths must still resolve on the real drive ----------
        resolved = 0
        if drive:
            drive_path = Path(drive)
            unresolved = []
            for (anlz,) in db.execute(
                    "SELECT analysisDataFilePath FROM content"
                    " WHERE analysisDataFilePath != ''"):
                resolved += 1
                if not (drive_path / anlz.lstrip("/")).exists():
                    unresolved.append(anlz)
            check(not unresolved,
                  f"{len(unresolved)}/{resolved} staged analysis paths do not resolve")

        db.close()

        # --- browse category copy hook ------------------------------------
        # Mechanism test only: build a throwaway reference database here to
        # exercise copy_browse_categories(). These rows are NOT device evidence
        # with a native wire kind. The original small-ID failure must be rejected.
        reference = tmp / "reference.db"
        ref = sqlite3.connect(reference)
        ref.execute("CREATE TABLE menuItem (menuItem_id INTEGER, kind INTEGER, name TEXT)")
        ref.execute("CREATE TABLE category (category_id INTEGER, menuItem_id INTEGER,"
                    " sequenceNo INTEGER, isVisible INTEGER)")
        ref.execute("CREATE TABLE sort (sort_id INTEGER, menuItem_id INTEGER,"
                    " sequenceNo INTEGER, isVisible INTEGER,"
                    " isSelectedAsSubColumn INTEGER)")
        ref.execute("INSERT INTO menuItem VALUES (1, 129, 'Artist')")
        ref.execute("INSERT INTO category VALUES (1, 1, 0, 1)")
        ref.execute("INSERT INTO sort VALUES (1, 1, 0, 1, 0)")
        ref.commit()
        ref.close()

        r2 = subprocess.run(
            [sys.executable, str(ROOT / "library/build_device_library.py"),
             str(lib_json), "--out-dir", str(tmp / "staged2"),
             "--categories-from", str(reference)],
            capture_output=True, text=True)
        check(r2.returncode == 0, f"--categories-from failed: {r2.stderr.strip()}")
        db2 = sqlite3.connect(tmp / "staged2/PIONEER/rekordbox/exportLibrary.db")
        for table in ("menuItem", "category", "sort"):
            n = db2.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]
            check(n == 1, f"--categories-from did not copy {table} (got {n} rows)")
        check(db2.execute("SELECT name FROM menuItem").fetchone()[0] == "Artist",
              "copied menuItem content is wrong")
        db2.close()
        # Regression: public semantic IDs previously passed schema checks but
        # produced an empty native browser. Fail loudly on such an override.
        ref = sqlite3.connect(reference)
        ref.execute("UPDATE menuItem SET kind=2")
        ref.commit()
        ref.close()
        rejected = subprocess.run(
            [sys.executable, str(ROOT / "library/build_device_library.py"),
             str(lib_json), "--out-dir", str(tmp / "bad-reference"),
             "--categories-from", str(reference)], capture_output=True, text=True)
        check(rejected.returncode != 0 and "unsupported AZ wire kinds" in rejected.stderr,
              "small semantic menu kinds must fail instead of creating an empty browser")
        # Without an override, use the native AZ wire defaults.
        db3 = sqlite3.connect(db_path)
        expected_counts = {"menuItem": 18, "category": 18, "sort": 10}
        for table, expected in expected_counts.items():
            n = db3.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]
            check(n == expected,
                  f"default {table} count should be {expected}, got {n}")
        check(db3.execute(
            "SELECT kind, name FROM menuItem WHERE menuItem_id=5").fetchone()
              == (0x84, "\ufffaPLAYLIST\ufffb"),
              "default PLAYLIST menu row differs from observed OneLibrary data")
        check(db3.execute(
            "SELECT menuItem_id, sequenceNo, isSelectedAsSubColumn"
            " FROM sort WHERE sort_id=1").fetchone() == (4, 1, 1),
              "default TRACK sort row differs from observed OneLibrary data")
        check(db3.execute(
            "SELECT kind, name FROM menuItem WHERE menuItem_id=21").fetchone()
              == (0x8c, "\ufffaDATE ADDED\ufffb"),
              "DATE ADDED must use the native browse wire code")
        check(db3.execute(
            "SELECT COUNT(*) FROM menuItem WHERE kind=34").fetchone()[0] == 0,
              "Small semantic kind IDs must not leak into the native browse protocol")
        db3.close()
        check("seeded browse categories" in r.stdout,
              "generator must report the default browse rows")

        # EP147's mount point holds both PIONEER and .PIONEER basenames, so the
        # hidden layout must be stageable too.
        r3 = subprocess.run(
            [sys.executable, str(ROOT / "library/build_device_library.py"),
             str(lib_json), "--out-dir", str(tmp / "staged3"), "--hidden"],
            capture_output=True, text=True)
        check(r3.returncode == 0, f"--hidden failed: {r3.stderr.strip()}")
        check((tmp / "staged3/.PIONEER/rekordbox/exportLibrary.db").is_file(),
              "--hidden did not stage under .PIONEER/")

        # The staged tree must not contain copies of the analysis or audio.
        staged_files = {p.name for p in (tmp / "staged").rglob("*") if p.is_file()}
        check(staged_files == {"exportLibrary.db"},
              f"staging tree should hold only the database, found {sorted(staged_files)}")

    if failures:
        print("FAIL:")
        for f in failures:
            print("  -", f)
        return 1
    print(f"PASS: {len(db_ids)} tracks and {len(db_pl)} playlists staged; "
          f"all {len(ENTITIES)} entity tables present; "
          f"{len(EP147_SQL)}/{len(EP147_SQL)} EP147 SQL fragments compile; "
          f"{len(wanted)}/{len(wanted)} read columns exist; "
          f"ids/fields/playlist order preserved"
          + (f"; {resolved} analysis paths resolve on disk" if resolved else "")
          + ". Native encrypted acceptance is documented separately.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
