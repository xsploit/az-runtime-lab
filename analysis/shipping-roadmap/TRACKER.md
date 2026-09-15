# AZ reverse engineering and image release tracker

The product target is a bootable Raspberry Pi environment with the AZ runtime, our software mixer and user-added features. This is a Pi image, not a flashable update for original Pioneer hardware. Controller expansion is deferred until runtime interfaces are understood. Private vendor inputs are locally supplied; the public build must not embed keys, cabinet contents or extracted executables.

## Current evidence

- AZ 1.30 executable is hash-guarded by the existing launcher.
- Embedded DSP AIS: all 11 checksums pass the correct C6747-generation algorithm.
- TI dis6x correctly decodes compact instructions; old Capstone listings are unsuitable for complete DSP control-flow tracing.
- Current setup still requires a configured desktop, dependencies, external rootfs/cabinet/allocator, and built shims. It is not yet a reproducible fresh-SD-card image.
- Existing launch configuration hardcodes manual FX BPM default 140. Automatic tempo integration remains a separate implementation gate.
- Real USB folder playback works in prior device evidence; old export.pdb library browsing has not been established.
- DSP DMA endpoints and both checksum spans are statically linked: 256-byte command reception and 128-byte response transmission. The remaining response clocks and semantic field names are unresolved; see [SPI and interrupts](../dsp-reversal-20260915/SPI-AND-INTERRUPTS.md).
- Native SQLite initialization can fall back to NoDB after directory, database-file or effective-write-access checks fail. The upstream selector and database acceptance requirements remain open; see [library trace](../legacy-library-20260915/REPORT.md).

## Work packages and acceptance

| Work | State | Required evidence before claiming completion |
|---|---|---|
| DSP payload integrity | Verified | 11/11 CRC comparisons; preserve hashes and exact algorithm |
| DSP SPI contract | Active static trace | DSP and MCU sides agree on frame boundaries, checksum, fields and state transitions |
| Audio startup / processing graph | Active research | Call paths from startup/interrupts into buffer processing; code/data and parallel execution distinguished |
| Individual EQ/CFX/Beat FX | Unfinished | Routine/state maps, matched-input oracle renders, listening and numeric comparison |
| Native application interfaces | Partial prior evidence | Typed action, queue ownership, object lifetime and observed state changes for each interface |
| Legacy export.pdb | Active static trace | Format-selection gate, parser availability, cues/playlists/path semantics, actual imported-library verification |
| Analysis cache | Partial device evidence | Cold load, cached reload, removal/reinsert and power-cycle persistence without corrupting original USB |
| Fresh Pi image | Not built | Reproducible OS build, dependency manifest, input import, first-boot setup, rollback and recovery |
| Full controller profiles | Deferred | Separate semantic actions from MIDI profiles; per-control physical QA later |

## Library feature decision

Do not equate folder browsing with old Rekordbox library support. First trace the existing rejection/loader decision. If no usable legacy loader exists, evaluate a host-side reader and adapter using documented or already-supported parsers. Preserve playlists, cue types/times, beat grids, artwork, file paths and missing-file behavior; conversion must be staged without overwriting source exports. Do not assume arbitrary SQL generation produces a valid OneLibrary database. A new adapter requires schema/version checks and end-to-end loading evidence.

Reuse investigation comes before another parser implementation: inspect BiteDJ's existing PDB/ANLZ code and RX3 adapters, record their actual supported fields and interfaces, then identify what an AZ-native output adapter still needs. A host-only browser is useful for diagnostics but is not completion of native prepared-library compatibility.

The [reuse assessment](../legacy-library-20260915/REUSE.md) now identifies concrete BiteDJ readers and the RX3 staging pattern. The [native acceptance trace](../legacy-library-20260915/ACCEPTANCE.md) reaches read-write SQLite open, key application and preparation of a `property` query. The [table-reader trace](../legacy-library-20260915/TABLE-READERS.md) separates local USB `content`/`playlist_content` references from CloudSqlite `djmd*` tables. Next: recover dynamic local entity selectors and ordering, obtain a controlled existing OneLibrary fixture, then validate a staged candidate. No compatible output database exists from this research pass.

For audio, [linked buffers and their consumer](../dsp-reversal-20260915/BUFFER-CONSUMERS.md) establish alternating 704-byte McASP receive blocks and a normalized buffer selector reaching integer-to-float processing. Next: prove channel identities, sample-clock/interrupt routing and subsequent processing states before implementing the hardware replacement. The [RX3 comparison](../dsp-reversal-20260915/RX3-COMPARISON.md) identifies two payloads and their updater transports, but does not establish a common DSP contract.

## Release gate

The distributable image should contain our installation/runtime integration and permitted dependencies, with a guided local import of the user's compatible vendor inputs. Require hash/version validation, configurable mount/state locations, scoped privileges, first-boot audio/display setup, clean shutdown, persistent cache and an accessible failure log. Publish the image only after fresh-install and sustained playback/analysis tests on hardware. Existing scripts passing on an established checkout do not satisfy this gate.

## Active research locations

- `local/dsp-contract-sol/`: DSP-side SPI and state tracing.
- `analysis/legacy-library-20260915/REPORT.md`: public loader-selection evidence; private working files remain in the parent workspace local directory.
- `local/dsp-review-20260915/`: verified toolchain, private section wrapper and packet-aware disassembly.

These local paths are ignored research outputs, not prerequisites for users of the released project. No firmware image or hardware deployment is claimed by this tracker.

## Reviewed coefficient and control-ramp checkpoint

The [shared coefficient helpers](../dsp-reversal-20260915/FILTER-COEFFICIENTS.md) now have ordered binary32 equations, including the corrected 4.0 constant and same-packet register reads. The [reciprocal helper](../dsp-reversal-20260915/RECIPROCAL-FA60.md) uses RCPSP followed by two separately rounded Newton refinements. Exact seed mapping and live floating-point control remain unresolved. The [bounded ramp](../dsp-reversal-20260915/BOUNDED-RAMP.md) has a traced persistent scalar writeback; it is not an audio clipping function. Included PC probes demonstrate arithmetic structure only, not DSP execution or audio parity. Full sample recurrence, named effect coverage, routing and reset/tail behavior remain open.
