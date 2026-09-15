# Legacy library work status (Claude, 2026-09-15)

Scope: legacy `export.pdb`/`exportExt.pdb` + ANLZ -> private staged OneLibrary tree for native AZ.
DSP/performance is Codex/Sol's work and is not touched here.

## Running processes

None. All work is static analysis plus host-side tools. No EP147 execution, no Pi, no USB writes.

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

## Next

1. Extend `pdb_extract` to also read ANLZ (DAT/EXT) cues/loops/beatgrid — mirror BiteDJ
   `readAnalyze`, emit `cue`-shaped records (kind, in/outUsec, loop, colorTableIndex).
2. Host key-derivation tool (from user-supplied EP147 + lsdk.dat) with Blowfish test vectors.
3. OneLibrary writer: JSON intermediate -> SQLCipher `exportLibrary.db` using the AZ rootfs's
   own `sqlcipher`/`libsqlcipher` under qemu-user. **Blocked on schema exactness** — needs a
   genuine OneLibrary sample to fix CREATE TABLE/user_version/indexes.
4. Replay native open/key/property/journal/table_info gate against generated output in the
   isolated qemu launch; compare browsed playlists/cues to the source record set.
