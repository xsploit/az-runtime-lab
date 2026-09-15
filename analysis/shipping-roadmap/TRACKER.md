# AZ reverse engineering and image release tracker

The product target is a bootable Raspberry Pi environment with the AZ runtime, our software mixer and user-added features. This is a Pi image, not a flashable update for original Pioneer hardware. Controller expansion is deferred until runtime interfaces are understood. Private vendor inputs are locally supplied; the public build must not embed keys, cabinet contents or extracted executables.

## Current evidence

- AZ 1.30 executable is hash-guarded by the existing launcher.
- Embedded DSP AIS: all 11 checksums pass the correct C6747-generation algorithm.
- TI dis6x correctly decodes compact instructions; old Capstone listings are unsuitable for complete DSP control-flow tracing.
- Current setup still requires a configured desktop, dependencies, external rootfs/cabinet/allocator, and built shims. It is not yet a reproducible fresh-SD-card image.
- Existing launch configuration hardcodes manual FX BPM default 140. Automatic tempo integration remains a separate implementation gate.
- Real USB folder playback works in prior device evidence; old export.pdb library browsing has not been established.

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

## Release gate

The distributable image should contain our installation/runtime integration and permitted dependencies, with a guided local import of the user's compatible vendor inputs. Require hash/version validation, configurable mount/state locations, scoped privileges, first-boot audio/display setup, clean shutdown, persistent cache and an accessible failure log. Publish the image only after fresh-install and sustained playback/analysis tests on hardware. Existing scripts passing on an established checkout do not satisfy this gate.

## Active research locations

- `local/dsp-contract-sol/`: DSP-side SPI and state tracing.
- `analysis/legacy-library-20260915/REPORT.md`: public loader-selection evidence; private working files remain in the parent workspace local directory.
- `local/dsp-review-20260915/`: verified toolchain, private section wrapper and packet-aware disassembly.

These local paths are ignored research outputs, not prerequisites for users of the released project. No firmware image or hardware deployment is claimed by this tracker.
