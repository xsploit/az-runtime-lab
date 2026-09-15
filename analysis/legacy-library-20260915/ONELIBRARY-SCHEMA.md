# Native AZ OneLibrary (`exportLibrary.db`) static schema evidence

Private EP147 SHA-256 `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.
Addresses are ELF virtual; `.rodata` file offset = VA − `0x400000`. Reproduce with
`llvm-objdump -d --triple=aarch64 --start-address=<VA> --stop-address=<VA> EP147`, or
regenerate the column map with `library/az_schema_xrefs.py --ep147 <EP147> --out FILE`.

This extends [ACCEPTANCE.md](ACCEPTANCE.md) and [TABLE-READERS.md](TABLE-READERS.md).
It is **local-family** (USB OneLibrary) evidence: the `music_library::Sqlite*` readers,
NOT the `CloudSqlite*`/`djmd*` cloud family. No generated database and no device
acceptance are claimed here. No genuine `exportLibrary.db` fixture exists locally, so
the exact `CREATE TABLE`/`PRAGMA user_version`/index set is **not** proven.

## Open, key and first-probe gate (confirmed)

`SqliteDataBase` ctor `0x1179e60`:
1. `sqlite3_open_v2(path, &db, SQLITE_OPEN_READWRITE(2), NULL)` at `0x117a000`. A read-only
   source cannot mount this route; the output must be a writable copy/overlay.
2. `sqlite3_key(db, key, len)` at `0x117a02c` — the DB is **SQLCipher-encrypted**.
3. `sqlite3_prepare_v2("SELECT * FROM property", -1, …)` at `0x117a06c`, finalized
   immediately (no `step`). Failure → `sqlite3_prepare_v2() error (encrypt key is not
   correct)`. So a `property` relation must exist and compile under the applied key.
4. `PRAGMA main.journal_mode=delete` at `0x117a2b4`.
5. Metadata enumeration: `SELECT name from sqlite_master WHERE TYPE='table'` (`0x1179720`),
   then `PRAGMA table_info(<name>)` per table. Readers resolve columns by name from this
   metadata, so a missing optional column returns 0 rather than failing the mount.

## SQLCipher key derivation (confirmed mechanism; key value never emitted)

In `SqliteMountPoint::init` (`0x1297ac0`) before the ctor call at `0x1297ce8`:
- Cabinet file `/home/root/settings/cabinet/encryption/lsdk.dat` (member `x19+0x68`,
  literal VA `0x285dd20`) supplies a **64-char** material (length check `cmp w0,#0x40`
  at `0x1297c90`; the local copy is 64 bytes).
- One embedded **96-char** candidate string (member `x19+0x60`, VA `0x285dcb8`) is
  transformed by the JUCE BlowFish routines at `0x237f080`/`0x237f180`/`0xe4b*`:
  base64/hex decode → **Blowfish-ECB** block decrypt (big-endian word order, feistel
  table at `0x313f4b0`/`0x313f600`) → PKCS-style unpad → the resulting string is passed
  to `sqlite3_key`. Reproduction needs the user's own EP147 + `lsdk.dat`; **no key bytes
  are printed or committed** by any tool here.

## Local OneLibrary table set (22, from the entity initializer near `0x4b5900`)

`history`, `history_content`, `hotCueBankList`, `hotCueBankList_cue`, `cue`, `key`,
`label`, `color`, `recommendedLike`, `menuItem`, `myTag`, `myTag_content`, `playlist`,
`playlist_content`, `property`, `category`, `sort`, `content`, `artist`, `image`,
`genre`, `album`. (Cross-checked against the `PRAGMA table_info` loop's own name list at
`0x284c6f0`–`0x284c7b0`.) This is the tables EP147 *names*; it is not proof each is
required to mount, nor a column-complete schema.

## Column/type map (from getter/writer xrefs — `az_schema_xrefs.py`)

Integer columns read via `sqlite3_column_int64`; text via `sqlite3_column_text16`
(UTF-16). Selected, evidence-backed:

- **content** (track): `content_id`(PK, int), `title`/`subtitle`/`fileName`/`isrc`/
  `djComment`/`analysisDataFilePath`/`path`/`kuvoDeliveryComment`/`dateAdded`(text16),
  `artist_id`, `artist_id_artist/composer/remixer/lyricist/originalArtist`, `album_id`,
  `genre_id`, `key_id`, `label_id`, `color_id`, `image_id`, `bpmx100`, `bitrate`,
  `length`, `rating`, `releaseYear`, `djPlayCount`, `fileType`, `masterDbId`,
  `masterContentId`, `isHotCueAutoLoadOn`, `isKuvoDeliverStatusOn`, `hasModified`,
  `masterContentId` (int). Track membership join literal:
  `content.content_id = playlist_content.content_id`.
- **playlist**: `playlist_id`(PK), `playlist_id_parent`, `sequenceNo`, `name`(text16),
  `image_id`, `attribute`, `numberOfContents`. Folder vs playlist via `attribute`.
- **playlist_content**: `playlist_id`, `content_id`, `sequenceNo`. Membership/order query
  literal: `( playlist_id = %u AND sequenceNo <= %u )`; ordering carried by `sequenceNo`.
- **cue**: `cue_id`(PK), `content_id`, `kind`, `colorTableIndex`, `cueComment`,
  `beatLoopNumerator`, `beatLoopDenominator`, `isActiveLoop`, and paired timing:
  `inUsec`/`outUsec`, `in150FramePerSec`/`out150FramePerSec`,
  `inMpegFrameNumber`/`outMpegFrameNumber`, `inMpegAbs`/`outMpegAbs`,
  `in/outDecodingStartFramePosition`, `in/outFileOffsetInBlock`,
  `in/outNumberOfSampleInBlock`.
- **hotCueBankList** / **hotCueBankList_cue**: `hotCueBankList_id`(PK),
  `hotCueBankList_id_parent`, `sequenceNo`, `attribute`, `image_id`, plus join
  `hotCueBankList_cue.cue_id = cue.cue_id` and `sub.hotCueBankList_id = %u`.
- **property**: `dbVersion`, `deviceName`, `createdDate`, `backGroundColorType` (the
  mount-time `SELECT * FROM property` probe).
- **artist/album/genre/key/label/color/history/...**: `*_id` PK + `name`/scalar fields.

### Cue `kind` semantics (confirmed, `0x11b1de8` reader / jump table `0x284f690`)

DB `cue.kind` values `0..16` map 1:1 to internal cue-type enum `0..16`; `inUsec`/`outUsec`
give cue in/out, `beatLoopNumerator`/`Denominator` + `isActiveLoop` describe saved loops,
`colorTableIndex` selects hot-cue color. This is the target for translating ANLZ memory
cues / hot cues / loops (BiteDJ `readAnalyze`) into `cue` rows.

## The library mount never creates or versions its schema

The complete SQL vocabulary of the `music_library` SQLite family (rodata
`0x284b3a0`-`0x284c830`) is: `SELECT `, `DISTINCT `, ` INNER JOIN `, ` ON `, ` WHERE `,
` AND `, ` OR `, ` SET `, `UPDATE `, `INSERT INTO `, `VALUES (`, `DELETE FROM `,
`BEGIN/COMMIT/ROLLBACK TRANSACTION`, plus `SELECT * FROM property`,
`SELECT name from sqlite_master WHERE TYPE='table'`, `PRAGMA table_info(` and
`PRAGMA main.journal_mode=delete`.

There is **no `CREATE TABLE`, no `CREATE INDEX`, no `ALTER TABLE`, no `DROP TABLE` and
no `PRAGMA user_version`** in this family. The binary does contain those literals, but
all of them belong to the **Beatport streaming SDK** instead -- `CREATE TABLE IF NOT
EXISTS {} (...)` at `0x33fd0a8`, `CREATE TABLE {} (id PRIMARY KEY,name VARCHAR(200),
artists VARCHAR(255),num_plays INTEGER,...)` at `0x347f1f0`, `ALTER TABLE {} ADD size
INTEGER` at `0x347f3f8`, `PRAGMA user_version` / `PRAGMA user_version = {}` at
`0x33fd3e8`/`0x33fd470` -- sitting among `beatport::PlaylistManager`, `track_cache`,
`track_locker`, `stream_quality` and `Migrating database from schema {} to {}`. They use
`{}` fmt placeholders, unlike the music_library literals.

Two consequences:

1. **The library database is never created or migrated by the firmware.** A mounted
   database must already carry every table and column the readers touch, which is why
   the generator supplies all 22 entity tables and all 75 read columns.
2. **`PRAGMA user_version` is not a gate for this database.** It is not read by the
   music_library family at all, so no schema-version value has to be guessed.

No index creation or index requirement is visible either; the readers resolve columns by
name through `PRAGMA table_info`, so column *order* is not significant.

## What remains unproven

NOT NULL/default constraints, which columns are load-critical versus optional, how
`dbVersion`/`property` values gate a browse, and the meaning of two enums that the
generator therefore does not invent:

- `playlist.attribute` -- folder versus playlist. Assumed 0/1 from rekordbox convention;
  the getter is virtual so no direct caller could be traced statically.
- `menuItem.kind` -- which browse categories exist and in what order. EP147 renders the
  category *labels* from its own GUI string table (`gui::browse` at `0x2b7b958`: Folder,
  Album, Label, Related Key, Bitrate, Decade, Original Artist, Remixer, Hot Cue Bank
  List, Date Added, Comments, DJ Play Count, Track Name, ...), so these rows most likely
  select and order categories rather than name them.

All of these need a genuine local sample, which is not available here; the generator has
a `--categories-from` hook so the real rows can be copied verbatim once one exists. See
[STATUS.md](STATUS.md) and [HANDOFF.md](HANDOFF.md).
