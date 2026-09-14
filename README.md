# AZ runtime lab — native Pi experimental setup

XDJ-AZ v1.30 and CDJ-3000X v1.40 runtime research, compatibility shims,
software mixer work, rendering experiments, and verification tools for a
Raspberry Pi 5 setup. This is a working research repository, not a finished
firmware port or installer. Original CDJ-3000 player code is not available here.

## Start here

- **[Native Pi setup](PI-SETUP.md)**: configurable paths, build, launch, stop and troubleshooting.
- **[2026-09-14 performance results](analysis/native-performance-20260914/RESULTS.md)**:
  grid CPU reduction, semaphore repair, fresh-load tests and packaging checks.


- [TRACKER.md](TRACKER.md): accumulated findings, unfinished work, and test history.
- [STATUS.md](STATUS.md): earlier runtime/control integration checkpoint; newer
  dated research below and in the tracker supersedes it where they differ.
- [PROVENANCE.md](PROVENANCE.md): origin of the supplied firmware inputs.
- [analysis/HARDWARE-MIXER.md](analysis/HARDWARE-MIXER.md): native interfaces,
  controls, and hardware/software mixer investigation.
- `mixer/`: software mixer, DSP implementations, control integration and tests.
- `shims/`: display, timing, input, allocator and other compatibility experiments.
- `analysis/`: reproducible probes, disassembly excerpts, structured results and notes.

## Latest verified memory/rendering work

- [Rendering comparison](analysis/cdj-render-compare/REPORT.md): CDJ-3000X and AZ
  have different source-update/display scheduling; static evidence, not original
  CDJ-3000 or physical-CDJ measurements.
- [Template memory integration](analysis/AZ-PCM-TEMPLATE-INTEGRATION.md): guarded
  shared-template PCM allocation, isolated native startup checks.
- [Two-track memory comparison](analysis/AZ-PCM-LOADED-PLAYBACK.md): 334–363 MiB
  lower PSS during sampled playback phases, with essentially unchanged CPU.
- [Digital audio comparison](analysis/AZ-PCM-TEMPLATE-AUDIO.md): both decks had
  bit-identical 30-second decoded output versus baseline in the isolated test.
- [Page return tests](analysis/AZ-PCM-RETURN-ORACLE.md),
  [scheduler dispatch](analysis/AZ-PCM-SCHEDULER-DISPATCH.md), and
  [reader lifetime](analysis/AZ-PCM-READER-LIFETIME.md): original-instruction
  checks and current ownership research. Long-session page reclaim is unfinished.

The memory experiment has not been applied to the user's visible player.
Headless paced-null/file audio tests do not prove FLX6 hardware output or
long-session realtime stability. The dated native-Pi results linked above supersede older device-availability notes.
Do not treat this document as a live device-status service.

## What this backup contains

The repository preserves source, tests, research notes and bounded text/JSON
evidence. `SNAPSHOT-MANIFEST.json` records the included files' SHA256 and sizes at
the initial snapshot. The working directory also contains local inputs and large
captures which are intentionally outside Git:

- Firmware binaries, original ISO/CPIO archives and extracted root filesystems.
- Cabinet contents, keys, credentials and runtime settings/state.
- Captured music, screen videos, process/core dumps and large raw DSP records.
- Downloaded toolchains/libraries and generated executable files.

Consequently this Git repository alone cannot recreate a runnable proprietary
player. The local original inputs remain necessary. The public repository contains research code and documentation, not those
private inputs. Repository visibility does not grant permission to redistribute
third-party firmware or other extracted material. No blanket license is granted over
third-party research inputs or disassembly excerpts.

## Reproduction prerequisites

Many scripts retain experiment-specific paths and addresses. Read the script's
docstring and linked findings before running it. Some launchers/probes contact
the Pi and can change the UI; others only execute isolated local fixtures.
The supported native entry point is now `pi/session.py`; see PI-SETUP.md.
The historical probes have not all been converted into portable commands.

The newest offline instruction tests require Python 3, Clang, LLD,
`qemu-aarch64-static`, and the matching locally supplied firmware at
`xdjaz/rootfs/home/root/pdj/EP147`. They validate its full hash before extracting
temporary instruction ranges:

```sh
python3 analysis/probe-pcm-return.py
python3 analysis/probe-pcm-thread-predicate.py
python3 analysis/probe-pcm-block-reader.py
```

These suites passed 14, 6, and 15 cases respectively before this snapshot.
Their scope is synthetic local instruction execution; it does not replace full
application, device, concurrency or listening tests. Refer to each result JSON
and its documented harness substitutions.
