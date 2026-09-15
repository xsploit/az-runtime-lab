#!/usr/bin/env python3
"""Stage a native-shaped library database from an old Device Library export.

Input  : the JSON that library/pdb_extract.cpp produces from export.pdb.
Output : a SQLite database in the local (USB) schema EP147's music_library
         SQLite readers address, plus a staging tree that leaves the original
         export completely untouched.

Why this shape: EP147 already parses the ANLZ half of the Device Library in its
original on-disk format -- cues, loops, colours, beat grids and waveforms all go
through analyze_file / track_info_repository (see NATIVE-ANLZ-SUPPORT.md). So
this tool does NOT translate analysis data. It only supplies the database half,
with every track's analysisDataFilePath pointing at the ORIGINAL, unmodified
ANLZ file. PIONEER/USBANLZ and PIONEER/Contents are never read for content,
never copied and never modified.

IMPORTANT -- what is and is not established:

  * The table and column names come from static evidence in EP147 (see
    ONELIBRARY-SCHEMA.md): the 22-table entity list and a 75-column type map
    recovered from the getter/writer code. Columns marked INFERRED below are
    plausible but unconfirmed semantics.
  * EP147 opens this file with sqlite3_key(), i.e. SQLCipher. This tool writes
    a PLAINTEXT database and never handles key material. Applying the device
    key is a separate step for whoever legitimately holds it; no key is read,
    derived, printed or committed here.
  * NO device or emulator has accepted a database produced by this tool. There
    is no genuine OneLibrary fixture on this machine to compare against, so
    CREATE TABLE exactness, PRAGMA user_version and index requirements are
    unverified. Do not describe this output as accepted.

Usage:
  python3 library/build_device_library.py LIBRARY.json --out-dir DIR
                                          [--device-name NAME]
                                          [--verify-against DRIVE_ROOT]
"""
from __future__ import annotations

import argparse
import datetime
import json
import sqlite3
import sys
from pathlib import Path

# Playlist rows carry a folder/playlist discriminator in `attribute`.
# INFERRED from rekordbox convention (0 = playlist, 1 = folder); EP147 reads the
# column but the value mapping was not recovered statically.
ATTRIBUTE_PLAYLIST = 0
ATTRIBUTE_FOLDER = 1

# Column lists are evidence-backed (ONELIBRARY-SCHEMA.md). Types follow the
# sqlite3_column_* call each column is read with; SQLite affinity is not
# enforced by the readers, which resolve columns by name via PRAGMA table_info.
SCHEMA = {
    "property": """
        deviceName TEXT, dbVersion TEXT, createdDate TEXT,
        numberOfContents INTEGER, backGroundColorType INTEGER""",
    "artist": "artist_id INTEGER PRIMARY KEY, name TEXT",
    "album": "album_id INTEGER PRIMARY KEY, name TEXT, artist_id INTEGER, image_id INTEGER",
    "genre": "genre_id INTEGER PRIMARY KEY, name TEXT",
    "key": "key_id INTEGER PRIMARY KEY, name TEXT",
    "label": "label_id INTEGER PRIMARY KEY, name TEXT",
    "color": "color_id INTEGER PRIMARY KEY, name TEXT",
    "image": "image_id INTEGER PRIMARY KEY, path TEXT",
    "content": """
        content_id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT,
        artist_id_artist INTEGER, artist_id_remixer INTEGER,
        artist_id_originalArtist INTEGER, artist_id_composer INTEGER,
        artist_id_lyricist INTEGER, album_id INTEGER, genre_id INTEGER,
        label_id INTEGER, key_id INTEGER, color_id INTEGER, image_id INTEGER,
        bpmx100 INTEGER, length INTEGER, trackNo INTEGER, bitrate INTEGER,
        rating INTEGER, releaseYear INTEGER, djPlayCount INTEGER,
        djComment TEXT, isrc TEXT, dateAdded TEXT, fileName TEXT,
        fileType INTEGER, path TEXT, analysisDataFilePath TEXT,
        masterDbId INTEGER, masterContentId INTEGER,
        isHotCueAutoLoadOn INTEGER, isKuvoDeliverStatusOn INTEGER,
        kuvoDeliveryComment TEXT, hasModified INTEGER""",
    "playlist": """
        playlist_id INTEGER PRIMARY KEY, playlist_id_parent INTEGER,
        sequenceNo INTEGER, name TEXT, image_id INTEGER, attribute INTEGER,
        numberOfContents INTEGER""",
    "playlist_content": """
        playlist_id INTEGER, content_id INTEGER, sequenceNo INTEGER""",
    # Present so the reader's sqlite_master / table_info enumeration finds the
    # whole entity set; empty because the old export carries no such data (or,
    # for cue, because analysis lives in the ANLZ files instead).
    "cue": """
        cue_id INTEGER PRIMARY KEY, content_id INTEGER, kind INTEGER,
        colorTableIndex INTEGER, cueComment TEXT, isActiveLoop INTEGER,
        beatLoopNumerator INTEGER, beatLoopDenominator INTEGER,
        inUsec INTEGER, outUsec INTEGER, in150FramePerSec INTEGER,
        out150FramePerSec INTEGER, inMpegFrameNumber INTEGER,
        outMpegFrameNumber INTEGER, inMpegAbs INTEGER, outMpegAbs INTEGER,
        inDecodingStartFramePosition INTEGER,
        outDecodingStartFramePosition INTEGER, inFileOffsetInBlock INTEGER,
        outFileOffsetInBlock INTEGER, inNumberOfSampleInBlock INTEGER,
        outNumberOfSampleInBlock INTEGER""",
    "hotCueBankList": """
        hotCueBankList_id INTEGER PRIMARY KEY,
        hotCueBankList_id_parent INTEGER, sequenceNo INTEGER, name TEXT,
        image_id INTEGER, attribute INTEGER""",
    "hotCueBankList_cue": "hotCueBankList_id INTEGER, cue_id INTEGER, sequenceNo INTEGER",
    "history": """
        history_id INTEGER PRIMARY KEY, history_id_parent INTEGER,
        sequenceNo INTEGER, name TEXT, attribute INTEGER""",
    "history_content": "history_id INTEGER, content_id INTEGER, sequenceNo INTEGER",
    "myTag": """
        myTag_id INTEGER PRIMARY KEY, myTag_id_parent INTEGER,
        sequenceNo INTEGER, name TEXT, attribute INTEGER""",
    "myTag_content": "myTag_id INTEGER, content_id INTEGER, sequenceNo INTEGER",
    "menuItem": "menuItem_id INTEGER PRIMARY KEY, kind INTEGER, name TEXT",
    "category": """
        category_id INTEGER PRIMARY KEY, menuItem_id INTEGER,
        sequenceNo INTEGER, isVisible INTEGER""",
    "sort": """
        sort_id INTEGER PRIMARY KEY, menuItem_id INTEGER, sequenceNo INTEGER,
        isVisible INTEGER, isSelectedAsSubColumn INTEGER""",
    "recommendedLike": "content_id_1 INTEGER, content_id_2 INTEGER",
}

# Order matters only for readability of the generated file.
TABLE_ORDER = ["property", "artist", "album", "genre", "key", "label", "color",
               "image", "content", "playlist", "playlist_content", "cue",
               "hotCueBankList", "hotCueBankList_cue", "history",
               "history_content", "myTag", "myTag_content", "menuItem",
               "category", "sort", "recommendedLike"]

# EP147's own extension -> fileType mapping, read out of the string-compare
# chain at VA 0x117c650 (music_library): each branch compares the file
# extension and returns the code below, with 0 for anything unmatched. The old
# export has no file-type scalar, so the type is derived from the suffix the
# same way the firmware does.
FILE_TYPE_BY_SUFFIX = {".mp3": 1, ".aac": 2, ".mp4": 3, ".m4a": 4,
                       ".fla": 5, ".flac": 5, ".wav": 11, ".aif": 12,
                       ".aiff": 12}


def intern(table, name, cache, rows):
    """Assign a stable 1-based id to each distinct non-empty name."""
    if not name:
        return 0
    if name not in cache:
        cache[name] = len(cache) + 1
        rows.append((cache[name], name))
    return cache[name]


def copy_browse_categories(db, reference):
    """Copy menuItem/category/sort rows verbatim from a reference library.

    EP147 renders browse category labels from its own GUI string table, so these
    tables most likely carry *which* categories exist and in what order, not
    their names. The `kind` enum was not recovered statically and inventing
    values would be a guess, so by default these tables are created empty and
    this hook exists to copy the real rows out of a genuine device library when
    one becomes available. Returns the number of rows copied per table.
    """
    src = sqlite3.connect(f"file:{reference}?mode=ro", uri=True)
    copied = {}
    try:
        for table in ("menuItem", "category", "sort"):
            cols = [r[1] for r in db.execute(f"PRAGMA table_info({table})")]
            src_cols = [r[1] for r in src.execute(f"PRAGMA table_info({table})")]
            shared = [c for c in cols if c in src_cols]
            if not shared:
                copied[table] = 0
                continue
            rows = src.execute(
                f"SELECT {', '.join(shared)} FROM {table}").fetchall()
            db.executemany(
                f"INSERT INTO {table} ({', '.join(shared)})"
                f" VALUES ({', '.join('?' * len(shared))})", rows)
            copied[table] = len(rows)
    finally:
        src.close()
    return copied


def build(library, db_path, device_name, categories_from=None):
    if db_path.exists():
        db_path.unlink()
    db = sqlite3.connect(db_path)
    try:
        for table in TABLE_ORDER:
            db.execute(f"CREATE TABLE {table} ({SCHEMA[table].strip()})")

        artists, albums, genres, keys, labels, colors = ({} for _ in range(6))
        arows, alrows, grows, krows, lrows, crows = ([] for _ in range(6))
        # Album art: the export records a per-track artwork path, which becomes
        # an image row so the native browser can find the same file.
        images, imrows = {}, []

        content = []
        for t in library["tracks"]:
            path = t["file_path"]
            suffix = Path(path).suffix.lower() if path else ""
            content.append((
                t["id"],
                t["title"], t.get("mix_name", ""),
                intern("artist", t["artist"], artists, arows),
                # The export distinguishes artist roles and the native schema
                # has a column for each, so they are carried, not collapsed.
                intern("artist", t.get("remixer", ""), artists, arows),
                intern("artist", t.get("original_artist", ""), artists, arows),
                intern("artist", t.get("composer", ""), artists, arows),
                0,
                intern("album", t["album"], albums, alrows),
                intern("genre", t["genre"], genres, grows),
                intern("label", t.get("label", ""), labels, lrows),
                intern("key", t["key"], keys, krows),
                # Colour is preserved by id; the colour table is written below
                # with the export's own names so the id keeps its meaning.
                t["color_id"],
                intern("image", t.get("artwork_path", ""), images, imrows),
                int(round(t["bpm"] * 100)),
                t["duration_sec"],
                t["track_number"],
                t["bitrate"],
                t["rating"],
                t["year"],
                t.get("play_count", 0),
                t["comment"],
                t.get("isrc", ""),
                # Already YYYY-MM-DD in the export, which is the shape EP147's
                # `dateAdded LIKE "%u-__-__"` browse predicate expects.
                t.get("date_added", ""),
                t.get("filename") or (Path(path).name if path else ""),
                FILE_TYPE_BY_SUFFIX.get(suffix, 0),
                path,
                # The whole point: point at the ORIGINAL analysis file.
                t["analyze_path"],
                0, 0, 0, 0, "", 0,
            ))
        db.executemany(
            "INSERT INTO content VALUES (" + ",".join(["?"] * 34) + ")", content)

        for t in library["tracks"]:
            if t["color_id"] and t["color"]:
                colors.setdefault(t["color_id"], t["color"])
        for table, rows in (("artist", arows), ("album", None), ("genre", grows),
                            ("key", krows), ("label", lrows)):
            if rows is not None:
                db.executemany(f"INSERT INTO {table} VALUES (?, ?)", rows)
        db.executemany("INSERT INTO album VALUES (?, ?, 0, 0)", alrows)
        db.executemany("INSERT INTO color VALUES (?, ?)", sorted(colors.items()))
        db.executemany("INSERT INTO image VALUES (?, ?)", imrows)

        # Playlists: preserve the original ids, parents and ordering.
        counts = {}
        for e in library["playlist_entries"]:
            counts[e["playlist_id"]] = counts.get(e["playlist_id"], 0) + 1
        db.executemany(
            "INSERT INTO playlist VALUES (?, ?, ?, ?, 0, ?, ?)",
            [(p["id"], p["parent_id"], p["sort_order"], p["name"],
              ATTRIBUTE_FOLDER if p["is_folder"] else ATTRIBUTE_PLAYLIST,
              counts.get(p["id"], 0))
             for p in library["playlists"]])
        db.executemany(
            "INSERT INTO playlist_content VALUES (?, ?, ?)",
            [(e["playlist_id"], e["track_id"], e["entry_index"])
             for e in library["playlist_entries"]])

        copied = {}
        if categories_from:
            copied = copy_browse_categories(db, categories_from)

        db.execute("INSERT INTO property VALUES (?, ?, ?, ?, ?)",
                   (device_name, "1.0.0",
                    datetime.date.today().isoformat(),
                    len(content), 0))
        db.commit()
    finally:
        db.close()
    return len(content), copied


def verify(db_path, drive_root):
    """Check every path the database references exists on a real drive root."""
    db = sqlite3.connect(db_path)
    missing_audio = missing_anlz = checked_audio = checked_anlz = 0
    try:
        for path, anlz in db.execute(
                "SELECT path, analysisDataFilePath FROM content"):
            if path:
                checked_audio += 1
                if not (drive_root / path.lstrip("/")).exists():
                    missing_audio += 1
            if anlz:
                checked_anlz += 1
                if not (drive_root / anlz.lstrip("/")).exists():
                    missing_anlz += 1
    finally:
        db.close()
    return {"audio_checked": checked_audio, "audio_missing": missing_audio,
            "anlz_checked": checked_anlz, "anlz_missing": missing_anlz}


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("library_json", type=Path)
    ap.add_argument("--out-dir", type=Path, required=True)
    ap.add_argument("--device-name", default="DEVICE")
    ap.add_argument("--verify-against", type=Path, metavar="DRIVE_ROOT")
    ap.add_argument("--categories-from", type=Path, metavar="REFERENCE_DB",
                    help="copy menuItem/category/sort rows from a genuine "
                         "device library; see copy_browse_categories()")
    args = ap.parse_args()

    library = json.loads(args.library_json.read_text())
    staged = args.out_dir / "PIONEER" / "rekordbox"
    staged.mkdir(parents=True, exist_ok=True)
    db_path = staged / "exportLibrary.db"

    n, copied = build(library, db_path, args.device_name, args.categories_from)
    print(f"wrote {db_path} ({n} content rows, "
          f"{len(library['playlists'])} playlists, "
          f"{len(library['playlist_entries'])} playlist entries)")
    if copied:
        print("copied browse categories: "
              + ", ".join(f"{k}={v}" for k, v in sorted(copied.items())))
    else:
        print("NOTE: menuItem/category/sort are empty. EP147 reads them and the "
              "`kind` enum is unknown, so no values are invented; browse "
              "categories may be missing until --categories-from is given a "
              "genuine device library.")
    print("NOTE: plaintext SQLite. EP147 opens this path with sqlite3_key(); "
          "applying the device key is a separate step and no key is handled here. "
          "No device has accepted this output.")

    if args.verify_against:
        r = verify(db_path, args.verify_against)
        print(f"path check against {args.verify_against}: "
              f"audio {r['audio_checked'] - r['audio_missing']}/{r['audio_checked']}, "
              f"analysis {r['anlz_checked'] - r['anlz_missing']}/{r['anlz_checked']} resolve")
        if r["anlz_missing"]:
            return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
