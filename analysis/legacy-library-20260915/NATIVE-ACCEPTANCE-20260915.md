# Native AZ acceptance, 2026-09-15

## Result

The old `export.pdb` conversion now has direct native-firmware acceptance through
database open and initial model queries. A populated browser and track/cue load are
not yet accepted.

The tested input was the 13,646-track legacy export. The generated database contained
13,646 content rows, 6 playlists, 667 playlist entries, 21 menu items, 21 categories,
and 10 sorts. EP147 consumed all category rows, then stopped at menu kind 34
(`COMMENT`) with `unknown rootCategory`; the AZ default now omits that row while
retaining `DATE ADDED`. The original USB remained read-only and did not receive an
`exportLibrary.db`.

## Evidence tiers

### Host conversion

`tests/test_pdb_extract.py` passes with 13,646 tracks, 6 playlists and 667 entries.
`tests/test_build_device_library.py` passes with all 22 entity tables, all 23 recovered
EP147 SQL fragments, all 75 statically observed read columns, and preserved IDs,
fields and playlist order.

The generator now follows the published OneLibrary column layout and seeds the 20
AZ-compatible menu/category rows plus 10 sort rows by default. `--categories-from`
remains available to copy a user's category visibility and sort preferences.

### Exact firmware SQLCipher library

A no-libc AArch64 probe was dynamically linked against the AZ rootfs
`/usr/lib/libsqlcipher.so.0`. The database key was supplied over standard input and was
not printed or committed. Opening the encrypted generated database and running the
sort/menu join produced:

```
OPEN=0
KEY=0
PREPARE=0
STEP=100
ROWS=10
```

This proves encryption compatibility and readable sort/menu rows with the exact
firmware SQLCipher library.

### Exact EP147 executable

The native ARM64 EP147 executable opened the encrypted generated database and issued:

```
SELECT * FROM property
SELECT sort_id, menuItem_id, sequenceNo, isVisible, isSelectedAsSubColumn FROM sort
SELECT deviceName, dbVersion, createdDate, numberOfContents, backGroundColorType FROM property
SELECT playlist_id, playlist_id_parent, sequenceNo, name, image_id, attribute FROM playlist
```

The trace also showed successful schema enumeration and `PRAGMA table_info` for all 22
tables. No wrong-key, decrypt, missing-database, or `sort is null` error appeared.

The first diagnostic launcher omitted the mixer fixture, leaving the native input FIFO
without a reader. After fixing the preload rewrite and enabling the fixture, both the
SQL trace and offline mixer shim were mapped, EP147 held `/tmp/mixer-rx.fifo` open, and
native encoder pulses moved focus from the USB to Local Library and opened BROWSE. The
loading overlay then cleared to an empty list. A bounded step trace proved that all 6
playlist rows and all 21 initial category rows reached `SQLITE_DONE`; it also identified
the unsupported COMMENT root category above. This is not evidence that playlist or
content rows rendered.

## Lab-only selector alteration

The plain offline USB shim reports the fixture as a legacy mount, so the SQLite mount
selector argument was changed from 1 to 0 at EP147 creator address `0x12c2540` in the
initial GDB runs. This is a bounded lab alteration and does not prove that stock AZ
hotplug logic selects the generated SQLite database.

With the corrected mixer fixture, the selector was observed as 0 before alteration,
but the run still used diagnostic shims. Automatic selection on unmodified hardware
remains unverified.

## Acceptance boundary

Verified:

- legacy export conversion counts and referential integrity;
- encrypted database compatibility with the exact firmware SQLCipher library;
- exact EP147 database open, schema enumeration and initial property/sort/playlist
  queries;
- real native browse input delivery in the offline lab.

Not verified:

- row consumption for sort, property and individual menu-item queries;
- visible category or playlist names;
- track selection/loading;
- cue, loop, waveform or beat-grid loading from the original ANLZ files;
- automatic SQLite selection during a stock device hotplug;
- behavior on physical AZ hardware.
