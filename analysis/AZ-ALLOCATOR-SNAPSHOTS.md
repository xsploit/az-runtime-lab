# Native AZ allocator investigation

2026-09-12. Prior turn was progress: verified staged image upload, same-cue recordings and CPU reduction. This pass adds allocator evidence to distinguish memory-policy ideas from actual opportunities.

## Safe opt-in observation

`shims/allocator-snapshot.c`, enabled with `LAB_ALLOCATOR_SNAPSHOT=1`, forwards XPutImage unchanged and services an explicit snapshot request afterward on a normal running thread. It calls the allocator's statistics printer, saving bounded JSON in an exported buffer. It does not purge, flush thread caches, change allocator settings or call code while other threads are debugger-stopped. The debugger changes only a request counter; after detaching, the next drawing call collects the data.

`analysis/pi-allocator-snapshot.py` validates the current AZ overlay SHA, process start identity, shim mapping and SHA. It reads a stable completed sequence, checks bounds/error, and adds process smaps. An idle library page did not redraw within the ten-second observation window: the request remained pending, and the next ordinary selection click serviced it. This was an observation timeout, not a crashed player; no restart was needed. Collection takes about 3 ms in this run and can perturb that frame, so do not request samples during an FPS benchmark.

Build on Pi, retaining the firmware's older libc ABI:

```sh
cc -nostdlib -shared -fPIC -O2 -mno-outline-atomics -fno-stack-protector -Wall -Wextra -Werror shims/allocator-snapshot.c -o shims/allocator-snapshot.so
```

Host and Pi controlled allocation tests each detected a 64 MiB allocation and release; missing allocator symbols are reported explicitly. Host drawing-forwarding verification compared 18,172,784 pixels in 320 cases, all equal, no extra events. Pi test uses the exact unversioned telemetry build and same 5.2.1 allocator as the player. Host allocator is 5.3.1. No version requirements in the Pi telemetry ELF.

The official [jemalloc manual](https://jemalloc.net/jemalloc.3.html) defines allocated bytes, active pages, dirty pages and retained address space separately. Its resident counter is an upper bound that includes potentially untouched pages; use smaps for actual RSS. Thread caching can delay accounting updates. Thus these counters do not identify every currently live application object or measure the exact requested allocation sizes.

## Findings

| State | Actual RSS MiB | Allocator allocated MiB |
|---|---:|---:|
| First drawing snapshot | 922.4 | 1489.4 |
| Library, before tracks | 932.3 | 1497.3 |
| Two tracks loaded, transport started | 962.6 | 1508.8 |
| Later sample | 949.6 | 1509.6 |

The snapshot and smaps are consecutive observations, not one atomic whole-system instant. Source movement is checked separately in transport.json; a started transport button alone is not proof it remains moving.

- Five allocations in the 112 MiB class already exist at startup, totaling 560 MiB of allocated extent capacity. Five 16 MiB objects total 80 MiB; seven 8 MiB objects total 56 MiB; five 10 MiB objects total 50 MiB. These counts persist after loading tracks. Purpose and physical residency of individual objects are not yet attributed. Do not label them deck buffers without tracing callers.
- The reported small-object allocation total is also substantial, around 636 MiB. This allocator calls sizes through 224 KiB small; that term does not mean tiny application objects.
- At library idle, dirty unused pages total only 2.56 MiB and thread caches approximately 20 MiB. Shortly after loading, dirty pages rise to 31.5 MiB and RSS subsequently falls again. There is no evidence of hundreds of MiB of simple dirty-cache purge savings.
- The replacement Debian jemalloc 5.2.1 uses an internal 65,536-byte page, verified from its own statistics; the kernel reports 16,384-byte pages. The replacement solved the original firmware allocator's startup page-size rejection. This difference is an allocator-build experiment lead, not proof of incorrect behavior or guaranteed savings.
- Virtual/allocated bytes exceeding RSS is consistent with partially untouched allocations. A size-class count cannot prove how much RAM would return if a buffer shrank.

`az-allocator-size-summary.json` reconciles large-size-class totals exactly against the allocator's aggregate large allocation counter. `az-large-allocation-immediates.json` is only a coarse MOVZ-immediate candidate scan: several values are subsequently modified with MOVK or are unrelated configuration data. No call site has yet been attributed from that scan; do not treat candidates as allocation sites.

## Current state and next work

Previous EP14718499 was deliberately terminated and its launcher/display verified stopped before the single diagnostic restart. Current kept-open launcher session47961 runs EP14719797 and Xwayland19790, retaining staged uploads, fractional grid, original waveform contrast and 59 Hz timing. Both Dead Wrong tracks are loaded. No changes to original firmware, allocator configuration or audio buffer sizes. Paced null audio remains in use; this is not an audible-output test.

Next: trace callers for startup large allocations and obtain per-small-size-class attribution; build/test a 16 KiB allocator separately before any live substitution; compare memory, loading latency and sustained playback under controlled identical workloads. No memory reduction has yet been claimed. Broader DSP, controls, physical-display and firmware work remains open.
