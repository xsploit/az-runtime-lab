# EP147 already speaks half the Device Library: the ANLZ half

Private EP147 SHA-256 `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.
Addresses are ELF virtual; `.rodata` file offset = VA − `0x400000`. Reproduce string
locations with `library/az_schema_xrefs.py` style scans or `llvm-objdump`.
Static evidence only: no EP147 execution, no Pi, no device test.

This changes the shape of the problem, so it is stated separately from
[ONELIBRARY-SCHEMA.md](ONELIBRARY-SCHEMA.md).

## Result

The old Device Library is two halves: `export.pdb`/`exportExt.pdb` (track identity,
paths, playlists) and the ANLZ tree under `PIONEER/USBANLZ` (cues, loops, colours,
beat grids, waveforms, phrases).

**EP147 contains a complete native reader *and writer* for the ANLZ half, in the old
on-disk format. It contains no reader at all for the `export.pdb` half.**

So the conversion problem is much narrower than "translate the whole old library":
the analysis data does not need translating, only locating.

## Evidence: the ANLZ half is native

`analyze_file` is a full atom parser. RTTI names present:

`AnalyzeFile`, `AnalyzeAtom`, `BeatGridAtom`, `BeatGridExpantionAtom` [sic],
`TrackPhraseAtom`, `DetailedWaveformRGBAtom`, `DetailedWaveformBlueAtom`,
`DetailedWaveform3BandAtom`, `OverviewWaveform100PtAtom`, `OverviewWaveform400PtAtom`,
`OverviewWaveform1200PtAtom`, `OverviewWaveform3BandAtom`.

The atom-id table at VA `0x2938cd0`–`0x2938d30` lists the old fourcc tags exactly as
the format defines them, next to `(invalid AtomId)` / `(unsupported AtomId)` messages:

`PMNG PTBL PVBR PWVC PCOB PCPT PCO2 PCP2 PKEY PSUM PIMG PDPR PDLS`,
plus `PMAI` and `PPTH` at `0x2794d88`/`0x2794d90` and `PQTZ` at `0x2793c68`.
`PMAI` is the ANLZ file magic and `PQTZ` the beat grid, with dedicated diagnostics
(`BeatGridAtom : invalid atom`, `: unsuportted version` [sic], `: headerSize is invalid`,
`AnalyzeFile::parse : exception - `).

`track_info_repository` is the surrounding read/write service. Its source paths are
compiled in under `../../Source/Domain/TrackInfoRepository/`:

| Area | Files |
| --- | --- |
| Cues | `Client/EventTicket/MemoryHot_Cue{Request,Register,Delete}Ticket.cpp` |
| Beat grid | `Client/EventTicket/Quantize_{Request,Register}Ticket.cpp`, `QuantizeOffset_{Request,Register}Ticket.cpp` |
| Waveforms | `DetailedWaveform_{RGB,Blue,3Band}{Request,Register}Ticket.cpp`, `OverviewWaveform_{100_400Pt,1200Pt,3Band}{Request,Register}Ticket.cpp` |
| Other | `SeekTable_{Request,Register}Ticket.cpp`, `TrackPhraseRequestTicket.cpp`, `AnalyzeDataRemoveTicket.cpp` |
| Service | `Client/TrackInfoRepositoryRequestFacade.cpp`, `Mount/trackInfoRepository_MountEventHandler.cpp`, `Server/PersistentStorage/PersistentStorageServer.cpp`, `Server/PersistentStorage/AnalyzedFileRemover/AnalyzedFileRemover.cpp`, `Server/TemporaryStorage/TemporaryStorageServer.cpp` |

Matching interfaces exist for both directions: `ICueProvider`/`ICueRegistrar`,
`IBeatGridProvider`/`IBeatGridRegistrar`, `IDetailedWaveformProvider`/`...Registrar`,
`IOverviewWaveformProvider`/`...Registrar`, `ISeekTableProvider`/`...Registrar`,
`ITrackPhraseProvider`, with atom payload classes `CueManagementAtomData`,
`PcptAtomData`, `Pcp2AtomData`, `PathManagementAtomData`, `FileHeaderAtomData`,
`ParentAtomData`, `OrdinaryAtomData` and a `CuePoint` type.

`MemoryHot_Cue*` is the old format's own vocabulary: PCOB/PCO2 hold exactly a memory-cue
list and a hot-cue list, and PCPT/PCP2 are their entries.

## Evidence: paths are the old USBANLZ layout

`FileManager` builds and validates analysis paths with the legacy naming:

- `ANLZ%04d.%s` (VA `0x2939128`), `ANLZ%04u.%4c` (`0x2939138`), and a directory glob
  `ANLZ*.` (`0x2938fd0`, referenced at `0x17f03cc`).
- `[ERR][DB][SRV][caller BUG][FM][configAnalyzingFilePath]invalid absolute directory
  path format` (`0x2938f28`, referenced at `0x17ef954`).
- `[ERR][DB][SRV]cannot build an analyzing file carrying directory path from the music
  content path` with `content path: [%s]` and `DB recoded path: [%s]` [sic] (`0x2939148`).
- `[WARN][DB][SRV][FM][search][cloud]unexpected analyzing file is there:` with
  `content path` / `formal analyzing file path` (`0x2939050`).
- `AnalyzedFileRemover.cpp` validates a DB-recorded path and rejects it with
  `no path delimiter found; expected path is a file path under the USBANLZ directory`
  (`0x2939286`) and `expected file name format is /ANLZ[0-9]{4}.[0-9A-Z]{1,4}/`
  (`0x2939326`).

That is byte-for-byte the layout our extractor reads from the genuine export, e.g.
`/PIONEER/USBANLZ/P065/0001E86B/ANLZ0000.DAT`, and all 602/602 `analyze_path` values in
the fixture match `ANLZ[0-9]{4}.[0-9A-Z]{1,4}` under `USBANLZ`.

EP147 also creates the tree when absent: `cannot create the so-called PIONEER directory`
(`0x2938ed8`).

## Evidence: there is no export.pdb reader

The literal `rekordbox/export.pdb` occurs **once** in the binary (VA `0x26fcc30`). All 19
code references materialise it inside constant string-table blocks together with
`rbm`, `embdev`, `sharedev`, `mangapp`, `trakmak`, `usb`, `sd`, `PIONEER`,
`MYSETTING.DAT`, `MYSETTING2.DAT`, `/Beatport/LocalMedia01`, `vfat` -- device and mount
constant pools, not a parse site. Reference addresses: `0x469de8`, `0x46ac20`, `0x46c024`,
`0x46c894`, `0x46d104`, `0x46d974`, `0x46e1e8`, `0x46ea54`, `0x46f2c4`, `0x46fb38`,
`0x4703a8`, `0x470c18`, `0x471480`, `0x471e80`, `0x472490`, `0x48c79c`, `0x4f8598`,
`0x53e888`, `0x548f14`.

Absent from the whole binary: `exportExt`, `PdbMountPoint`, `PdbDataBase`, `DeviceSQL`,
`devicesql`. There is no page/row/heap vocabulary for the PDB format anywhere, while the
SQLite mount family is extensive. The constant is a *known filename*, most plausibly for
recognising or cleaning a rekordbox-prepared volume, not for reading one.

## What this means for the target

Preserving cues, loops, colours and beat grids **does not require translating them into
database rows**. They are already in a format EP147 parses natively; they need to be
found. The adaptation therefore reduces to supplying the database half so that the
native browser has tracks and playlists, with each track's analysis path pointing at the
**original, unmodified** ANLZ files.

This also means the staged library can leave `PIONEER/USBANLZ` completely untouched,
which keeps the original export intact and the output small and removable.

## Explicitly not proven

- **Which cue store wins.** The SQLite family also has a `cue` table with
  `inUsec`/`colorTableIndex`/`beatLoop*` (see ONELIBRARY-SCHEMA.md), so two cue stores
  exist. Whether a mounted track's cues come from ANLZ, from `cue` rows, or from a merge
  is not established here, and cannot be without a runtime test.
- **Whether a legacy USB already shows cues/grids in Folder mode today.** Measured on the
  genuine export, rekordbox's analysis directory is **allocated, not derived**: the
  `USBANLZ/Pxxx/xxxxxxxx/` component is unique per track (599/599 distinct, spread
  `0x17d`-`0x30cd7` across 125 `Pxxx` directories holding 1-12 tracks each), and it
  matches none of crc32/adler32/md5/sha1 of the content path, nor the track id. So EP147
  **cannot compute** a legacy ANLZ location from a music file path; it can only reach one
  via a recorded path or by *searching* the tree and matching each file's `PPTH` content
  path -- which is what the `ANLZ*.` glob and the `[FM][search]` diagnostics suggest is
  possible, but which this trace does not confirm happens during Folder browsing.

  This is why the database half is not optional: `analysisDataFilePath` is the reliable
  link from a track to its existing analysis. **Running a legacy USB and observing
  whether cues/grids appear in Folder mode remains the highest-value runtime
  experiment**, and needs someone authorised to run EP147 or the hardware; it was not run
  here.

  Note also that real exports are not all `ANLZ0000`: three tracks in the fixture use
  `ANLZ0001.DAT`. EP147's own validation pattern is `ANLZ[0-9]{4}`, and the tools here
  carry the recorded path rather than assuming a fixed name.
- No claim that any generated database is accepted; see STATUS.md for that blocker.
