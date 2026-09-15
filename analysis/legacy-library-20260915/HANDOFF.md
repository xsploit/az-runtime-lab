# Device Library compatibility — handoff (Claude, 2026-09-15)

Branch `research/claude-legacy-library-20260915`, worktree `az-library-claude`.
Nothing merged or pushed. No Pi access, no DSP work, no USB modification, no firmware
or key material committed, no cloud authentication. BiteDJ is compiled read-only from
its own checkout and is not modified. The main runtime-lab checkout is untouched.

**Target**: native AZ browsing/loading of existing OLD `export.pdb`/`exportExt.pdb` +
ANLZ libraries, preserving playlists, cues, loops, colours and beat grids, without a
mandatory re-export.

## The finding that reframes the work

**EP147 already reads and writes the ANLZ half of the Device Library, in the old
on-disk format. It has no `export.pdb` reader at all.**

- `analyze_file` implements the legacy atom format: `AnalyzeFile`, `AnalyzeAtom`,
  `BeatGridAtom`, waveform and phrase atoms, with the fourcc table `PMAI PPTH PQTZ
  PCOB PCPT PCO2 PCP2 PVBR PWVC PTBL PMNG PKEY PSUM PIMG PDPR PDLS`.
- `track_info_repository` exposes request/register/**delete** tickets for memory+hot
  cues, beat grid (`Quantize`) and offset, seek table, detailed/overview waveforms and
  track phrases, over `CueManagementAtomData` / `PcptAtomData` / `Pcp2AtomData`.
- `FileManager` builds legacy paths: `ANLZ%04d.%s`, an `ANLZ*.` directory glob,
  `configAnalyzingFilePath`, and an `AnalyzedFileRemover` that validates a DB-recorded
  path as `/ANLZ[0-9]{4}.[0-9A-Z]{1,4}/` under `USBANLZ`.
- Conversely `rekordbox/export.pdb` occurs once, and all 19 references sit in device and
  mount constant string tables beside `usb`, `sd`, `PIONEER`, `MYSETTING.DAT`.
  `PdbMountPoint`, `PdbDataBase`, `DeviceSQL` and `exportExt` are absent entirely.

Consequence: **cues, loops, colours and beat grids do not need translating.** Only the
database half is missing, and it only has to point at the original ANLZ files. Full
evidence with addresses in [NATIVE-ANLZ-SUPPORT.md](NATIVE-ANLZ-SUPPORT.md).

## What is built and tested

All tools take paths as arguments; nothing is hard-coded. Run everything with
`BITEDJ_ROOT=<bitedj merge-candidate checkout>`.

| Tool | Purpose |
| --- | --- |
| `library/pdb_extract.cpp` | `export.pdb` -> JSON record set, reusing BiteDJ's generated Kaitai parser (no Qt) |
| `library/anlz_extract.cpp` | ANLZ `.DAT`/`.EXT` -> cues, loops, colours, comments, beat grids, path tag |
| `library/pdb_raw.py` | schema-free PDB framing reader (works on variants the Kaitai schema cannot read) |
| `library/exportext_extract.py` | `exportExt.pdb` MyTag categories and tags |
| `library/build_device_library.py` | record set -> staged `exportLibrary.db` in the native local schema |
| `library/stage_from_usb.py` | one command: USB root -> staged library + preservation report |
| `library/expected_state.py` | per-track expected cues/loops/colours/grid + playlist order: the oracle for a device test |
| `library/az_schema_xrefs.py` | static column/type map of EP147's local SQLite readers |

One command, end to end:

```
BITEDJ_ROOT=/path/to/bitedj-compat/merge-candidate \
python3 library/stage_from_usb.py --drive-root /path/to/usb --out-dir /tmp/staged
```

It finds `export.pdb` under `PIONEER/` or hidden `.PIONEER/`, reports what was read,
parses the ANLZ tree for verification only, and writes exactly one file:
`<out>/PIONEER/rekordbox/exportLibrary.db`. The source volume is only read — verified on
the genuine export by checking no file on it was modified afterwards. Undo is "delete the
output directory". It exits non-zero, with the reason, if the staged analysis paths do
not resolve.

### Evidence from the genuine exports (602-track and 13646-track)

Cross-source agreement, i.e. independent files agreeing rather than self-consistency:

- 602/602 ANLZ `PPTH` path tags equal the `export.pdb` `file_path`.
- 600/600 beat grids contain the `export.pdb` BPM.
- 667/667 playlist entries resolve to real tracks; 602/602 `analyze_path` values resolve
  to real files on disk; 602/602 and 13646/13646 match the path format EP147 accepts.
- 232 raw cues merge to 116 slots with 0 cue-time conflicts, each confirmed by exactly
  two representations.

Against EP147's own expectations:

- All 22 tables of EP147's entity list are present in the staged database.
- **23/23 SQL fragments recovered verbatim from EP147 rodata compile** against it,
  including the `playlist_content` join, the `( playlist_id = %u AND sequenceNo <= %u )`
  ordering predicate and the sub-query aliases.
- **75/75 columns EP147 is seen to read exist.**
- The structural part of the mount sequence runs: `SELECT * FROM property`,
  `PRAGMA main.journal_mode=delete`, the `sqlite_master` listing, `table_info` per table.

Preservation: track ids, titles, `bpmx100`, length, rating, ISRC, `dateAdded`,
`djPlayCount`, audio paths and analysis paths verbatim; playlist ids, folder flags,
membership and order; artist roles into their own columns; album art as `image` rows.

Run the tests:

```
AUDIT=/path/to/rekordbox-usb-audit-20260904
BITEDJ_ROOT=$B DRIVE_ROOT=$AUDIT PDB_FIXTURE=$AUDIT/PIONEER/rekordbox/export.pdb \
  EXT_FIXTURE=$AUDIT/PIONEER/rekordbox/exportExt.pdb \
  python3 tests/test_pdb_extract.py          # and test_anlz_extract,
                                             # test_exportext_extract,
                                             # test_build_device_library
```

All pass on both genuine exports.

## Defects found and fixed along the way

- `pdb_extract` **aborted the process** on `exportExt.pdb` (uncaught `std::length_error`;
  same framing, different row layouts) and silently "succeeded" with zero rows on a
  non-PDB file. Both now refuse cleanly; per-row parse errors are counted, not fatal.
- **ISRC came out as CJK mojibake.** The field is dispatched to the UTF-16LE body type
  but holds `0x03` + plain ASCII + NUL. All 293 / 2604 ISRCs are now valid ISRCs and
  non-ASCII titles still decode.
- `fileType` was a guess; replaced with EP147's own mapping at VA `0x117c650`
  (`.mp3`->1, `.aac`->2, `.mp4`->3, `.m4a`->4, `.fla`/`.flac`->5, `.wav`->11,
  `.aif`/`.aiff`->12, unmatched->0), which added the missing `.aac` and `.mp4`.
- ANLZ cue sourcing: BiteDJ's rule reads cues from the `.EXT` when present. Measured,
  the `.EXT`'s own PCOB holds only pads 4-9 while its PCO2 holds 1-9, and the `.DAT`'s
  PCOB holds the legacy list. On this library the `.EXT` is a strict superset so BiteDJ
  loses nothing, but the sets are not identical, so `anlz_extract` reads both by default
  and merges per slot.

## Blockers — what stops this being finished, exactly

1. **No genuine device-library (`exportLibrary.db`) fixture exists on this machine.**
   Verified by a filesystem sweep: only legacy `export.pdb`/`exportExt.pdb` + ANLZ are
   present. Without one, two enums stay unconfirmed and are deliberately **not invented**:
   - `playlist.attribute` folder flag (assumed 0/1 from rekordbox convention; the getter
     is virtual, so no caller could be traced statically);
   - `menuItem.kind`, which selects and orders browse categories. EP147 renders the
     labels from its own GUI table (`gui::browse` at `0x2b7b958`), so these rows probably
     choose categories rather than name them. `menuItem`/`category`/`sort` are therefore
     staged **empty**, the generator says so, and `--categories-from REFERENCE_DB` copies
     the real rows verbatim once a genuine library is available. **Browse categories may
     be missing until then.**
2. **The output is plaintext SQLite; EP147 opens the file with `sqlite3_key()`.** The key
   derivation mechanism is documented (cabinet `lsdk.dat` 64 chars + an embedded 96-char
   candidate through JUCE Blowfish) but **no key is read, derived, printed or committed
   here**, and applying it is a separate step for whoever legitimately holds it.
3. **No device or emulator has accepted any generated database.** EP147 was not executed;
   only static read/disassembly was in scope. Do not describe the output as accepted.

What is *no longer* a blocker: schema creation and versioning. The `music_library` SQL
vocabulary contains no `CREATE TABLE`, `CREATE INDEX`, `ALTER TABLE` or
`PRAGMA user_version` — every such literal in the binary belongs to the Beatport SDK. So
the firmware never creates or migrates this schema (the database must arrive complete,
which is why all 22 tables and 75 columns are generated), no schema version has to be
guessed, and column order does not matter since readers resolve columns by name.

## Next steps, in value order

1. **Run the legacy USB in Folder mode and look at whether cues, loops and beat grids
   appear.** EP147 can derive an analysis path from the music content path as well as
   from the DB, and globs `ANLZ*.`. If the derived directory matches rekordbox's own
   `USBANLZ/Pxxx/xxxxxxxx/` choice, old cues and grids may already load today with no
   database at all. This is the single highest-value experiment and needs someone
   authorised to run EP147 or the hardware. Not run here.
2. **Obtain one genuine device library** (a USB exported by current rekordbox as Device
   Library Plus). That single fixture resolves blocker 1 outright: dump its
   `menuItem`/`category`/`sort` and feed them to `--categories-from`, confirm the
   `playlist.attribute` values, and diff its schema against the generated one.
3. Apply the device key to a staged database and attempt a real mount, in an isolated
   copy, with the original USB left read-only.
4. Only then: compare browsed playlists, cues and grids against the oracle. Generate it
   first, before touching the device, so the expectation is written down rather than
   reconstructed afterwards:

   ```
   BITEDJ_ROOT=... python3 library/expected_state.py --drive-root /path/to/usb        --out expected.json --all
   ```

   It prints the playlists in the order the browser should show them and, per track,
   the beat grid and every hot/memory cue with its clock position, loop end and colour
   (on the fixture: 41 tracks carrying 111 hot cues, 5 memory cues and 3 loops).

## Commits

`14d000f` scope correction · `c4ce75d` ANLZ extractor · `2bee04e` pdb_extract hardening +
labels/colours/artwork · `4d06079` exportExt MyTags + raw framing reader · `a6f90e3`
native ANLZ support finding · `5fbf1ac` staged database generator · `7a31775` artist
roles/ISRC/dateAdded + ISRC decode fix · `189b545` album art + category hook · `6b3ae26`
fileType from firmware · `338762a` one-command driver · `2288f4b` schema creation ruled out.
