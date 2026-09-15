# Legacy library — handoff (Claude, 2026-09-15)

Branch `research/claude-legacy-library-20260915`, worktree `az-library-claude`.
Not merged/pushed. DSP/performance untouched (Codex/Sol own it).

## What was done

Turned the legacy-library problem from static-only notes into a **working, tested
input-side pipeline** plus **verified native output-schema evidence**, and drew an
honest line at the one thing that cannot be proven locally.

### New code (all in the worktree)

- `library/pdb_extract.cpp` + `library/build_pdb_extract.sh` — reuse BiteDJ's generated
  Kaitai `rekordbox_pdb.{h,cpp}` and the kaitai runtime (no Qt, BiteDJ compiled read-only)
  to walk `export.pdb` exactly as `rekordboxfeature.cpp::parseDeviceDB` does and emit a
  stable JSON intermediate: tracks (original `id`, resolved artist/album/genre/key, relative
  `file_path`/`analyze_path`, bpm, rating, color, comment…), playlist tree
  (`id`/`parent_id`/`sort_order`/`is_folder`/`name`), and ordered `playlist_entries`.
  `getText` and the null-strip mirror BiteDJ; cyclic page chains are bounded.
- `library/az_schema_xrefs.py` — disassembles the local `music_library::Sqlite*` reader
  range, resolves ADRP+ADD string materializations, and maps each column-name literal to
  the `sqlite3_column_*`/`bind_*` (incl. one-call wrapper functions like the text16 getters)
  that consumes it. Emits `onelibrary-column-xrefs.json`. Emits identifier strings only —
  no key bytes.
- `tests/test_pdb_extract.py` — builds the extractor and asserts: deterministic output,
  unique track IDs, referential integrity (every entry → a real track), sane playlist tree,
  and (with `DRIVE_ROOT`) that every `analyze_path` resolves to a real file on disk.

### New evidence docs

- `analysis/legacy-library-20260915/ONELIBRARY-SCHEMA.md` — confirmed open/key/`property`/
  journal/`table_info` mount gate; SQLCipher key-derivation *mechanism* (cabinet
  `lsdk.dat` 64ch + embedded 96ch → JUCE Blowfish → `sqlite3_key`); the 22-table local
  OneLibrary set; a 75-column type map; and cue `kind` 0..16 → internal cue-type mapping.
- `STATUS.md` — running state, evidence, next steps, blockers.

## Tests run (genuine fixtures only)

```
AUDIT=/run/media/subsect/64E26780E26754F8/Users/SUBSECT/Documents/Codex/\
2026-08-18/hey-i-need-you-to-research/artifacts/rekordbox-usb-audit-20260904
BITEDJ=/home/subsect/Documents/Codex/2026-09-10-in-my-pc-im-workin-on/bitedj-compat/merge-candidate

BITEDJ_ROOT=$BITEDJ PDB_FIXTURE=$AUDIT/PIONEER/rekordbox/export.pdb \
  DRIVE_ROOT=$AUDIT python3 tests/test_pdb_extract.py
# PASS: 602 tracks, 6 playlists, 667 entries; referential integrity OK; 602 analyze paths resolved

BITEDJ_ROOT=$BITEDJ \
  PDB_FIXTURE=.../runtime-lab/fixtures/exported-usb/PIONEER/rekordbox/export.pdb \
  python3 tests/test_pdb_extract.py
# PASS: 13646 tracks, 6 playlists, 667 entries; referential integrity OK
```

Regenerate the schema xref evidence:
```
AZ_ROOTFS=.../runtime-lab/xdjaz/rootfs python3 library/az_schema_xrefs.py \
  --out analysis/legacy-library-20260915/onelibrary-column-xrefs.json
```

## Limitations / blockers (honest)

- **No genuine local `exportLibrary.db` (OneLibrary) fixture exists.** Verified by a
  filesystem sweep — only legacy `export.pdb`/`exportExt.pdb` + ANLZ are present. So the
  exact `CREATE TABLE` column lists, `PRAGMA user_version`, indexes, load-critical vs
  optional columns, and the writer's acceptance **cannot be proven here**. No fake fixture
  was generated to paper over this.
- The extractor covers PDB only; ANLZ cue/loop/beatgrid extraction (step 1 in STATUS) is
  designed but not yet built. `exportExt.pdb` linkage likewise pending.
- Key derivation is understood statically but not yet reproduced as a host tool; it needs
  the user's own EP147 + `lsdk.dat` and must never emit key material.
- Static addresses are specific to EP147 SHA-256
  `736bdc93…3a77a6`; the scanner warns if a different build is supplied.

## Reproduction / commit

Build tool: `BITEDJ_ROOT=<merge-candidate> OUT=<path> bash library/build_pdb_extract.sh`.
Run: `pdb_extract <export.pdb> --out out.json`.
Commits on `research/claude-legacy-library-20260915` (see `git log`). Nothing pushed;
no USB/Pi/firmware/BiteDJ/main-checkout modified; no keys committed.
