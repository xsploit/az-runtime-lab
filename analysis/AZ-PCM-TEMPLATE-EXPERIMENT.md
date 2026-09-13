# PCM storage sharing experiment

2026-09-13. Standalone synthetic test on the Pi's 16KiB-page kernel. **Not
integrated into EP147; no AZ RAM reduction or audio-performance claim.**

## Why try a shared template

The verified PCM pool constructor allocates 33,850 payloads of 14,128 bytes.
The payload wrapper constructor at 0x76ca30 stores its pointer/count. The
initialization loop then writes AF guards at 0x777b40 and EF guards at
0x777b44, touching backing memory even before a track is loaded. Retaining
all logical pages while deferring their private physical backing could avoid
reducing the pool's interface limits.

A sealed memfd contains one 16KiB template: AF eight-byte prefix, zeroed
14,112-byte synthetic stereo payload, EF eight-byte suffix. Multiple writable
MAP_PRIVATE views of the same file offset share this page until a write.
Writes copy the affected page privately. MADV_DONTNEED reverts an explicitly
unused private view to the original guarded template. No page sharing occurs
between independent payload writes.

## Verified experiment

Source: test-pcm-template.c. Built on Pi with cc -O2 -Wall -Wextra -Werror.
512 views occupy 8MiB of address space; 128 views receive distinct synthetic
payloads. All 1764 eight-byte payload elements and both guards in every view
are checked at each stage. The backing file is sealed against all modification.
The test unmaps its entire arena, closes the fd, and exits.

Measured process smaps_rollup deltas from baseline (KiB):

| Stage | RSS delta | PSS delta |
| --- | ---: | ---: |
| Read all template views | 8256 | 18 |
| Write independent payloads to 128 views | 8256 | 2066 |
| Recycle private views and recheck template | 8256 | 18 |
| Rewrite identical guards in all 512 views | 8256 | 8194 |
| Recycle and recheck again | 8256 | 18 |

PSS captures proportional physical backing; RSS counts each mapped alias
and would be misleading for this approach. Whole-process deltas include
small unrelated runtime effects and do not include kernel VMA/page-table
memory. Timings are synthetic operations, not an audio-latency benchmark.

The guard-rewrite control is essential: writing the same guard bytes still
forces private copies. Merely replacing malloc with these mappings would
NOT save RAM with the current constructor. A coordinated experimental path
would need already-initialized guards and omission of those redundant writes,
with explicit fallback guard initialization and unchanged guard validation.

## Integration work still required

- Verify full-capacity mapping count, VMA limit and kernel/page-table overhead.
- Intercept only the verified PCM allocation site and verify every release
  path before substituting a different memory owner. Never hand mapped arena
  addresses to the existing allocator's free/realloc functions.
- Keep pool size, all96 range licenses, per-page1764 samples and guard values.
- Coordinate guard-store handling with the storage implementation; fail closed
  on mismatched executable, size, missing template or incomplete setup.
- Trace which thread first writes pages. COW page faults must be evaluated
  against loader scheduling and actual audible playback/seek/cue performance.
- Recycle only pages conclusively returned to the free pool, with the required
  synchronization. A merely unreferenced-looking page is insufficient.
- Measure native two/four-deck cases, long tracks, cue loads, loops and seeks,
  using PSS/private physical memory as well as CPU and audible underruns.
- A dedicated16KiB view has greater fully-written storage than the current
  14KiB jemalloc class: worst-case all33,850 views use528.90625MiB versus
  462.79297MiB allocator-rounded payload storage. Include this tradeoff.

Evidence: pcm-pool-live/az-pcm-template-test.jsonl. Player24479 and its
rendering/UI selection were not changed by this experiment.


## Full-capacity standalone test

Revalidated Pi EP14724479 running before test; MemAvailable1634832KiB and
vm.max_map_count1048576. Built with PCM_TEST_COUNT33850 and
PCM_TEST_DIRTY9519, ran as a separate nice19 process. Test passed all payload,
isolation, guard and recycle checks, including the full guard-rewrite control.
Evidence: pcm-pool-live/az-pcm-template-full.jsonl.

33850 private views mapped in0.079592seconds. Total VMAs33866 versus17baseline,
below this Pi's current limit. Reading all template views adds18KiB PSS;
VmPTE rises96→352KiB (256KiB additional page tables). Kernel VMA slab memory
is not captured here and still needs accounting. Writing9519views adds
152322KiB PSS, then recycling returns to18KiB. Identical guard rewrites across
allviews add541602KiB PSS; recycling again returns to18KiB. RSS remains
inflated by aliases, as expected. Per-stage times include validation and are
not first-write fault latency or real-time audio timing measurements.

This verifies full mapping capacity in a standalone process on this Pi.
It does not validate AZ integration, allocator release ownership, threading,
actual playback under COW faults, or total kernel overhead. No AZ memory
implementation was changed or activated.
