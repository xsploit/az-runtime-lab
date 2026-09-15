# AZ EP147 legacy Rekordbox library trace (static, 2026-09-15)

## Observed behavior and boundary

The existing PC run with the real USB reports `PIONEER/rekordbox/export.pdb` and `exportExt.pdb` but no OneLibrary database. AZ displayed “rekordbox OneLibrary (Device Library Plus) not found,” then browsed Folder and loaded audio. See `runtime-lab/analysis/flx6-live-20260913/RESULT.md:23` and `runtime-lab/TRACKER.md:1266-1267`. The old prepared playlists were not loaded. That is an observed format rejection at the user-facing library path, not evidence that audio or paths are unusable.

## Binary evidence

The exact local EP147 is a stripped AArch64 ELF, 57,874,328 bytes. Its rodata contains:

SHA-256: `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`. These addresses apply to that exact file.

| String | File offset / ELF virtual address | Direct code references |
| --- | --- | --- |
| `rekordbox/export.pdb` | `0x22fcc30` / `0x26fcc30` | 21 ADRP+ADD pairs, mostly static string initializers around `0x469de4` through `0x548f10`; also `0xb0c8e8` and `0xb0d61c` with intervening instructions. |
| `exportLibrary.db` | `0x245dca0` / `0x285dca0` | `0x12977a0` + `0x12977a8` in the SqliteMountPoint cluster. |
| `rekordbox OneLibrary (Device Library Plus) not found!` | `0x25c2110` / `0x29c2110` | No direct ADRP+ADD materialization found; it appears in localization data, so this scan cannot locate the warning decision. |

At `0x12977a0`, the code constructs a string from `exportLibrary.db` into an object at `x19+0x58` via `0x2333ce0` (string constructor), following several other filename/configuration strings. The adjacent source path literal `../../Source/Domain/MusicLibrary/Server/Rekordbox/MountPoint/SqliteMountPoint.cpp` is referenced in code at `0x1293b64`, `0x1294cb0`, `0x1294d48`, `0x1296690`, `0x12969a4`, `0x1296a3c`, `0x1297e48`, and `0x12980b8`. The SqliteMountPoint region also contains `sqlite3_finalize@plt` call at `0x1297330`. Source paths and RTTI strings identify `music_library::SqliteMountPoint`, `SqliteDataBase`, `NoDBMountPoint`, `NoDBDataBase`, and `ExternalStorageMountPointCreator` (RTTI name at file offset `0x2461ff0`; creator source path at `0x2463490`, code references `0x12c2608` and `0x12c279c`). The concrete creator decision is established below.

### Confirmed mount-point creator decision

The RTTI object for `music_library::ExternalStorageMountPointCreator` is at virtual address `0x2862028` (file offset `0x2462028`). Its vtable header at virtual `0x28629c0` (file `0x24629c0`) points to that RTTI at `0x28629c8`; the third method slot at virtual `0x28629e0` points to code `0x12c2540`. The pointers were read as little-endian ELF data and checked against `llvm-objdump`.

The method at `0x12c2540` receives a byte-like argument in `w5` and a result pointer in AArch64 indirect-result register `x8`. It executes `tst w5,#0xff` at `0x12c2544`; `b.ne 0x12c2604` at `0x12c2578`. The observed branches are:

```text
ExternalStorageMountPointCreator method 0x12c2540
  w5 low byte == 0:
    allocate 0x70 at 0x12c257c
    call 0x1297700 at 0x12c2598 (SqliteMountPoint constructor)
    construct exportLibrary.db string at 0x12977a0-0x12977ac
    wrap object in shared_ptr
    call virtual slot +0x10 at 0x12c25d0-0x12c25dc
    nonzero return branches to diagnostic/error path 0x12c2798
  w5 low byte != 0:
    allocate 0x40 at 0x12c2698
    call 0x1292b58 at 0x12c26b4 (NoDBMountPoint constructor)
    wrap object in shared_ptr
    call virtual slot +0x10 at 0x12c270c-0x12c2718
```

`0x1292b58` writes the NoDB vtable pointer `0x285d1e8` at `0x1292b98-0x1292ba0`; the Sqlite constructor's RTTI/vtable is at `0x285d558`/`0x285d5f0`, and its filename construction is at `0x12977a0`. The creator does **not** inspect `export.pdb` inside this method. Selection is upstream in whoever supplies `w5`; its source and semantic name are still unknown. The SQLite path also has a post-construction virtual result check, whose precise meaning remains unknown.

The legacy `export.pdb` string is real, but its dominant xrefs are static initializers, not a demonstrated PDB opener. It appears beside `mount`, `player`, `rekobopc`, `usb`, and `sd` identifiers in rodata. No `PdbMountPoint`, `PdbDataBase`, or old PDB parser source path or RTTI string was found in this EP147 string scan, while many `DataBase/SQLite/Sqlite*.{h,cpp}` paths are present. This is evidence against an obvious compiled legacy-library mount point, not proof that every parser path is absent. “LegacySearchListCache” does appear, but search UI nomenclature is not a PDB decoder.

## Implication for old exports

Simply making the old `export.pdb` visible is unlikely to select the OneLibrary mount path. The observed warning and `exportLibrary.db` SQLite path point to a format gate. A safe first implementation is a **sidecar importer** in our host application: read `export.pdb` and `exportExt.pdb` from a copied or read-only USB, resolve track IDs to existing audio paths, preserve playlist hierarchy and entry order, then read adjacent Rekordbox ANLZ files for cue/beat/waveform metadata. Expose that as a separate host library while keeping native AZ Folder playback. The local BiteDJ metadata schema `bitedj-compat/merge-candidate/lib/rekordbox-metadata/rekordbox_pdb.ksy` already describes `playlist_tree_row`, `playlist_entry_row`, and `track_row` (around lines 489-573); it is a parsing lead only, and BiteDJ was not modified. Cue fidelity needs ANLZ and exportExt inspection on a real copied fixture; a PDB-only converter should not claim to preserve them.

Producing a synthetic `exportLibrary.db` for the native firmware is a separate, higher-risk route. We would need a legitimate OneLibrary fixture, schema and version checks, mount-property/encryption behavior, path conventions, playlist/cue linkage, and an isolated copied-USB acceptance probe before claiming native compatibility. The SQLite source paths show a possible insertion format, but this trace has not established that arbitrary SQLite is accepted or that a host-generated DB would preserve prepared cues/playlists.

## Verification limits and next static target

`string_xrefs.py` scans only direct ADRP+ADD pairs within eight instructions and can produce stale-register false positives. The address pairs above were spot-checked with `llvm-objdump`; `string-xrefs.json` contains all raw pairs for reproduction. No firmware was executed, no Pi contacted, and no proprietary bytes were copied into this report. The next bounded trace should identify the caller that supplies `w5` to the creator method and the SQLite mount's slot `+0x10` result semantics. Neither file existence nor property validation is yet confirmed as the condition behind the user-visible warning.

## Release interpretation

This is a static checkpoint, not an implemented legacy importer. A host-side browser alone does not fulfill native AZ playlist/cue support. Next prove the creator caller selector and accepted database schema before choosing a native adapter/conversion approach. No original USB contents were altered.
