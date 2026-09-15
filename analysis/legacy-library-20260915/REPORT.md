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
    nonzero return branches to diagnostic/fallback path 0x12c2798
  w5 low byte != 0:
    allocate 0x40 at 0x12c2698
    call 0x1292b58 at 0x12c26b4 (NoDBMountPoint constructor)
    wrap object in shared_ptr
    call virtual slot +0x10 at 0x12c270c-0x12c2718
```

`0x1292b58` writes the NoDB vtable pointer `0x285d1e8` at `0x1292b98-0x1292ba0`; the Sqlite constructor's RTTI/vtable is at `0x285d558`/`0x285d5f0`, and its filename construction is at `0x12977a0`. The creator does **not** inspect `export.pdb` inside this method. Selection is upstream in whoever supplies `w5`; its source and semantic name are still unknown.

### Confirmed SQLite failure and native fallback

The Sqlite vtable's slot `+0x10` at virtual `0x285d600` points to `0x1297ac0`. That initialization routine returns `-1` through `0x1298018` for early path checks and through `0x1297b48-0x1297b64` when a later check fails. Its success cleanup at `0x1297d7c` sets `w20=0`, then returns that value through `0x1297b60`. At `0x12c25d0-0x12c25e0`, the creator calls this slot and branches on nonzero return to `0x12c2798`. The fallback path constructs the literal `SQLite DB NotFound.   Try NoDB.` at `0x12c27e4-0x12c27f0`, logs it, then branches at `0x12c2814` to `0x12c2680` and allocates/calls `NoDBMountPoint`. Thus the fallback is an actual native code branch, not just a warning string.

The first checks in `0x1297ac0` are filesystem operations: `0x232cce0` calls `access(path,F_OK)`; `0x232cc90` calls `__xstat64` and extracts mode bit 14, **S_IFDIR** (octal `0040000`); `0x232cd20` calls `access` and returns true if the path is **not** a directory; `0x233e4f0` checks existence plus write access for a non-root effective user. The Sqlite routine tests the first path at `0x1297afc-0x1297b18` and requires it to be an accessible directory. Its vtable slot `+0x28` is `0x1293958`: it starts from a root path carried in constructor member `x19+0x10` (the root prefix is unknown here), checks member `x19+0x20` at `0x1293988-0x1293994`, chooses `.PIONEER` from `x19+0x48` when nonzero or `PIONEER` from `x19+0x40` when zero (`0x1293a0c`), and then adds `rekordbox` from `x19+0x50` at `0x12939ec-0x12939f4`. Constructor literals confirm `PIONEER` at virtual `0x25ec970`, `.PIONEER` at `0x28471f0`, and `rekordbox` at `0x27baf10`. This establishes the directory basename chain, with selection of visible versus hidden PIONEER tied to that member byte. It does not establish the root prefix or which branch the observed USB used.

The routine copies `exportLibrary.db` from `x19+0x58` at `0x1297b1c-0x1297b28` and passes that name plus the directory object to `0x234fe90` at `0x1297b38`, obtaining a derived path at `sp+0x60`. The helper processes a relative name by manipulating the base path at `0x235026c-0x23502a4`; its exact child/sibling semantics still need controlled confirmation. The confirmed facts are that the derived path carries the `exportLibrary.db` name and that the following checks operate on that same `sp+0x60` object. Do not use these bytes alone to assert a full on-disk absolute path.

The derived `exportLibrary.db` path is checked with `0x232cd20` at `0x1297b3c-0x1297b4c`, which requires it to exist and **not** be a directory. The next call `0x233e4f0` at `0x1297b78-0x1297b84` checks that same path for effective writability. It calls `geteuid`; effective UID 0 treats an existing path as writable without invoking `access(W_OK)` (`0x233e53c-0x233e544`), while non-root checks `access(path,W_OK)` (`0x233e548-0x233e558`). If this helper returns false, branch `0x1297b84` enters the warning/cleanup path at `0x1297e44`, sets `w20=-1` at `0x1297f10`, and returns via `0x1297b60`; the creator then falls back to NoDB. Therefore a non-root write-permission failure **can** trigger NoDB. With EP147 running as root in the observed lab, existence/path type is the stronger gate at this stage; this static trace does not verify the permissions or mount identity in that run.

This proves directory → derived `exportLibrary.db` non-directory → effective-writability gating before constructing the SQLite database object at `0x1297ce8`. It does not prove that an accessible file passes schema, encryption, and application property checks. We cannot yet say whether the failed real USB lacked only this file or also failed the required `PIONEER`/`.PIONEER` and `rekordbox` directory check.

The legacy `export.pdb` string is real, but its dominant xrefs are static initializers, not a demonstrated PDB opener. It appears beside `mount`, `player`, `rekobopc`, `usb`, and `sd` identifiers in rodata. No `PdbMountPoint`, `PdbDataBase`, or old PDB parser source path or RTTI string was found in this EP147 string scan, while many `DataBase/SQLite/Sqlite*.{h,cpp}` paths are present. This is evidence against an obvious compiled legacy-library mount point, not proof that every parser path is absent. “LegacySearchListCache” does appear, but search UI nomenclature is not a PDB decoder.

## Implication for old exports

Simply making the old `export.pdb` visible is unlikely to select the OneLibrary mount path. The observed warning and confirmed `exportLibrary.db` gate point toward a **native format-conversion path**: read `export.pdb` and `exportExt.pdb` from a copied or read-only USB, preserve track IDs/paths, playlist hierarchy and entry order, and use adjacent Rekordbox ANLZ files for cue/beat/waveform metadata; then generate a valid OneLibrary database in a private writable overlay for native AZ acceptance. The local BiteDJ metadata schema `bitedj-compat/merge-candidate/lib/rekordbox-metadata/rekordbox_pdb.ksy` already describes `playlist_tree_row`, `playlist_entry_row`, and `track_row` (around lines 489-573); it is a parsing lead only, and BiteDJ was not modified. Cue fidelity needs ANLZ and exportExt inspection on a real copied fixture; a PDB-only converter should not claim to preserve them. A host-only library view could be a diagnostic fallback, but it would not satisfy native prepared-playlist support.

Producing `exportLibrary.db` requires a legitimate OneLibrary fixture, schema and version checks, mount-property/encryption behavior, exact path conventions, playlist/cue linkage, and an isolated copied-USB acceptance probe before claiming native compatibility. The filesystem gate shows where a generated candidate could enter native loading, but this trace has not established that arbitrary SQLite is accepted or that a host-generated database would preserve prepared cues/playlists. The first shippable design must leave the user's original export untouched and keep the converter output independently reviewable and removable.

## Verification limits and next static target

`string_xrefs.py` scans only direct ADRP+ADD pairs within eight instructions and can produce stale-register false positives. The address pairs above were spot-checked with `llvm-objdump`; `string-xrefs.json` contains all raw pairs for reproduction. No firmware was executed, no Pi contacted, and no proprietary bytes were copied into this report. The next bounded trace should identify the caller that supplies `w5` to the creator method and the precise paths passed to the SQLite mount's filesystem helpers. The method's return/fallback behavior is now confirmed; the selector's upstream source and the displayed-warning call chain remain open.
