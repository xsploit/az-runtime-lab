# Legacy library work status (Claude, 2026-09-15)

## Target (corrected 2026-09-15, resumed session)

**Device Library = the OLD `export.pdb` / `exportExt.pdb` + ANLZ format.** That is the
input the user actually has and wants supported. OneLibrary is the *new* format and is
only ever an internal adaptation detail — generating one is a permitted means, never the
goal, and must not redefine the target.

Goal: native AZ browsing/loading of existing old USB libraries, preserving playlists,
cues, loops, colors and beat grids, **without a mandatory re-export**.

DSP/performance is Codex/Sol's work and is not touched here.

## Native acceptance update (root takeover, 2026-09-15)

The old library now populates the native AZ browser and loads tracks with original
waveforms, grids, phrases, artwork, coloured hot cues and saved loop slots.
Playback advanced and produced nonzero decoded PCM in the Pi lab.

Root cause was wrong menu wire kinds, not COMMENT alone. Small semantic IDs were
forwarded unchanged and discarded by the UI; defaults now use verified protocol
codes (TRACK 0x83, PLAYLIST 0x84). A separate test mount hid USBANLZ; read-only
source mounts fixed waveform/cue loading. See `NATIVE-ACCEPTANCE-20260915.md` for
exact evidence and boundaries. Original USB unchanged. No stock-device acceptance
or physical audio listening claim is made.

## Running processes

Native experiments are bounded. Verify and stop any remaining diagnostic process,
detach GDB, and restore the prior BiteDJ supervisor before treating the Pi as returned
to daily use.

## Resumed again 2026-09-15 (after quota stop at 08fe00f)

Input-side extraction is done and committed (c4ce75d, 2bee04e, 4d06079); not repeating it.
Now working the **native integration gap**: how EP147 itself reads old-format data.
Lead in progress: EP147 contains a complete `analyze_file` / `track_info_repository`
ANLZ atom stack (PMAI/PPTH/PQTZ/PCOB/PCO2/PCPT/PCP2 + USBANLZ path validation), which
would mean the analysis half of the Device Library is natively consumed unconverted.

## Resumed 2026-09-15

Priority per user: finish ANLZ cue/loop/beat-grid extraction with BiteDJ parsers against
real local fixtures, add `exportExt.pdb` linkage where useful, validate semantics and path
handling, then push native local-library reader/schema research as far as evidence allows.
Tests must check real original fixture content and preservation, not just self-consistency.

## Evidence so far

- Fixtures on this PC: genuine legacy exports only (`runtime-lab/fixtures/exported-usb` export.pdb, and a
  Windows-drive audit copy with export.pdb + exportExt.pdb + USBANLZ). **No genuine OneLibrary
  `exportLibrary.db` exists locally.** Cannot prove native acceptance without one.
- EP147 SQLCipher key path (static): SqliteMountPoint reads cabinet `encryption/lsdk.dat` (must be
  64 chars), builds a JUCE BlowFish context from it, and transforms one embedded 96-char candidate
  (base64/hex -> Blowfish-ECB decrypt, big-endian words -> unpad) into the `sqlite3_key` string.
  Key values are never printed or committed. See `ONELIBRARY-SCHEMA.md`.
- Local OneLibrary table set recovered from the entity initializer: 22 tables (documented).
- Column/type map from getter/writer code via `library/az_schema_xrefs.py` (75 columns);
  evidence saved to `onelibrary-column-xrefs.json`.
- Cue `kind` (0..16) maps 1:1 to internal cue-type enum; loop/color fields identified.
- **BUILT + TESTED input side:** `library/pdb_extract.cpp` reuses BiteDJ's generated Kaitai
  parser (no Qt) to emit a JSON intermediate (tracks/playlists/entries with original IDs,
  names, relative media/ANLZ paths, sequence order). `tests/test_pdb_extract.py` PASSES on
  both genuine fixtures: deterministic; 667/667 entries reference valid track IDs; 602/602
  analyze_path values resolve to real ANLZ files on the audit drive.

## Input side COMPLETE and tested (2026-09-15)

The whole old-format input is now extracted and validated against genuine fixtures.

- `library/anlz_extract.cpp` — ANLZ cues, loops, colours, comments and beat grids.
  Measured on the real export: 602/602 pairs parse, 232 raw cues -> 116 merged slots,
  0 cue-time conflicts, 3 saved loops with loop fractions, 116 cues carrying RGB.
- **Cue-source semantics (new evidence).** BiteDJ's `readAnalyzeFiles` reads cues from
  the `.EXT` when present. Measured: the `.EXT`'s own PCOB holds only pads 4-9 while its
  PCO2 holds 1-9, and the `.DAT`'s PCOB holds the track's legacy list. On this library
  the `.EXT` is a strict superset (0 tracks where the `.DAT` has cues the `.EXT` lacks),
  so BiteDJ loses nothing here -- but the sets are *not* identical, so `anlz_extract`
  reads both by default, tags each cue with its file, and merges to one cue per slot
  (PCO2 wins; it alone carries colour/loop fraction/comment).
- `library/pdb_extract.cpp` — now also LABELS, COLORS and ARTWORK. COLORS reads
  1..8 = Pink/Red/Orange/Yellow/Green/Aqua/Blue/Purple, matching BiteDJ's enum.
  Neither library sets a *track* colour; colour lives in the ANLZ cue RGB.
- **Robustness defects found and fixed in my own tools:** `exportExt.pdb` aborted the
  process (uncaught `std::length_error`) and a non-PDB file silently "succeeded" with
  zero rows. Both now refuse cleanly; per-row parse errors are counted, not fatal.
- `library/pdb_raw.py` — schema-free PDB framing reader, cross-validated against the
  Kaitai parser (identical row counts on all 10 populated table types, both exports).
- `library/exportext_extract.py` — decodes exportExt MyTags: Genre(7), Components(8),
  Situation(8), Untitled Column(1); 0 skipped rows, 0 orphans.
  **No local export carries a tag-to-track mapping**, so exportExt contributes no
  per-track data to preserve; the larger export has no exportExt.pdb at all.

Cross-source validation (independent files agreeing, not self-consistency):
602/602 ANLZ PPTH paths equal the export.pdb `file_path`; 600/600 beat grids contain
the export.pdb BPM; 667/667 playlist entries resolve to real tracks; 602/602
`analyze_path` values resolve on disk.

## Native integration answered (2026-09-15) — see NATIVE-ANLZ-SUPPORT.md

**EP147 already parses the ANLZ half of the Device Library natively, read and write.**
`analyze_file` implements the old atom format (PMAI/PPTH/PQTZ/PCOB/PCPT/PCO2/PCP2/
waveforms/phrases) and `track_info_repository` exposes request/register/delete tickets
for memory+hot cues, beat grid and offset, seek table, waveforms and phrases, with
`FileManager` building legacy `USBANLZ/.../ANLZnnnn.xxx` paths.
**There is no `export.pdb` reader at all** — the literal appears once, and all 19
references sit in device/mount constant tables; `PdbMountPoint`/`PdbDataBase`/`DeviceSQL`
are absent from the binary.

Consequence: cues, loops, colours and beat grids need **no translation**. Only the
database half is missing, and it only has to point at the original ANLZ files.

## Staged database generator (2026-09-15)

`library/build_device_library.py` turns the export into
`PIONEER/rekordbox/exportLibrary.db` in the local schema, pointing
`analysisDataFilePath` at the **original** ANLZ files. It never reads, copies or
modifies `USBANLZ`/`Contents`; the staged tree holds exactly one file.

`tests/test_build_device_library.py` passes on both exports (602 and 13646 tracks):
structural mount sequence runs; all 22 entity tables present; **23/23 SQL fragments
taken verbatim from EP147 rodata compile**; **75/75 columns EP147 reads exist**;
track ids/fields/playlist order/folder flags preserved; 602/602 analysis paths still
resolve on disk.

Also fixed a real decoding fault: ISRC is dispatched to the UTF-16 body type but holds
`0x03` + ASCII + NUL, so values came out as CJK mojibake. All 293 / 2604 ISRCs are now
valid ISRCs. Artist roles (remixer/composer/original), `djPlayCount`, `dateAdded`
(YYYY-MM-DD, matching EP147's browse predicate) and `fileName` are now preserved too.

## Unknowns closed since (all static, all on genuine data)

- **Schema creation / versioning is not a gate.** The music_library SQL vocabulary has no
  `CREATE TABLE`, `CREATE INDEX`, `ALTER TABLE` or `PRAGMA user_version`; every such
  literal in the binary belongs to the Beatport SDK. The firmware never creates or
  migrates this schema, so the database must arrive complete (hence 22/22 tables and
  75/75 columns), but no schema version has to be guessed and column order is irrelevant.
- **`property.dbVersion` has no comparison constant** anywhere in the music_library
  region; `Unsupported data version!` belongs to the IPC request dispatcher instead.
- **`content.fileType` is now firmware-derived**, from EP147's own extension chain at
  `0x117c650`, not a guess.
- **The ANLZ directory is allocated, not derivable** (599/599 unique, no path hash or
  track-id relation), so `analysisDataFilePath` is the reliable link to existing cues and
  grids — the database half is not optional.
- Both `PIONEER` and hidden `.PIONEER` layouts are supported end to end.

## Remaining blockers

1. EP147 reaches BROWSE but renders an empty list after the loading overlay clears.
   Trace `sqlite3_step` results and bound parameters, then distinguish query rows from
   category selection and post-query UI filtering.
2. Track selection/loading and original ANLZ cues, loops, waveforms and beat grids are
   not yet demonstrated through the converted database.
3. The generator intentionally remains plaintext. Encryption is an external packaging
   step; no key material is printed or committed.
4. Stock hotplug selection and physical AZ behavior remain unverified. The initial
   offline runs used a documented GDB selector alteration.

## Highest-value next experiment (needs authorisation, not run here)

Run a legacy USB and observe whether cues, loops and beat grids appear in Folder mode.
The oracle already exists: `pdb_extract` + `anlz_extract` produce the expected record set
to compare against.
