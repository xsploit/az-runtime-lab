# AZ template-backed PCM: integrated startup result

2026-09-13. **Real native AZ startup verified in an isolated headless session.
The visible player was not switched. Loaded playback and audible audio have
not been tested with this storage change.**

## Result

Same Pi, extracted AZ1.30, eight smooth-scroll patches, fractional grid,
staged XImage upload, original raw-file-cache sizes, and paced-null audio
fixture. Baseline and template runs used the same isolated launch directory,
copied settings and disk-backed scratch files. Both reached the unloaded SOURCE
screen; saved screenshots were visually checked. Both launchers completed
their24-second bounded runs with player still running before termination.

Last memory samples, approximately18seconds into each launch:

| Metric | Baseline | Template |
|---|---:|---:|
| Process PSS | 921.37 MiB | 461.48 MiB |
| Process swap | 0 | 0 |
| Template-owned logical buffers | 0 | 33850 |

Difference: **459.89 MiB less process PSS,49.91%**. The template hook reported
33850 allocations, capacity33850, live33850, initialization error0, and no
mapped-pointer reallocations. Both guard stores were verified as NOPs in
the running test process. All96range licenses and per-page1764samples are
unchanged by this implementation; pool capacity is not reduced.

These are sequential startup samples, not a sustained workload benchmark.
Kernel VMA/page-table costs are not included in process PSS. RSS can inflate
when shared aliases are read, so PSS is the relevant process metric. Private
pages grow as PCM is written; no playback-time reclamation is installed.
Worst-case fully written storage remains528.91MiB versus the original
462.79MiB payload size class. Actual loaded/mixing memory and fault latency
still require measurement.

Evidence under `analysis/pcm-pool-live/`: baseline-metrics.json,
template-metrics.json, startup-pss-comparison.json, baseline-startup.png,
template-startup.png, corresponding launcher logs, and
template-integration-manifest.json.

## Coupled allocation and installation

`pcm-template-allocation.c` recognizes only malloc return site0x777b00.
Exact14128-byte allocations can use shared storage. Exhausted, disabled or
unavailable storage uses normal malloc with both guards initialized. Other
valid native sample sizes use the same guarded normal fallback. Unrelated
malloc calls are forwarded untouched. Invalid sizes at the identified PCM
site are rejected; allocation failure remains NULL with its errno.

`pcm-template-hook.c` is an explicit preload experiment. Before main it
validates the mapped executable/import slots and original instruction bytes,
resolves normal malloc/free/realloc, creates the store, installs three main
import hooks, omits the redundant constructor guard writes, flushes instruction
cache and restores page permissions. Setup mismatch terminates the experimental
player rather than continuing with a partially installed policy. Storage setup
failure itself falls back to guarded ordinary allocations.

The launcher verifies the full original firmware hash through its required
smooth-scroll overlay. Both native launchers accept `LAB_AZ_PCM_TEMPLATE=1`,
requiring smooth-scroll AZ plus paced offline fixture and the compiled DSO.
Combining it with the main C allocation tracer is rejected because both replace
the same imports. Other existing launch arguments remain necessary.

The preload is inert in shell/helper executables that inherit the environment;
only an executable named EP147 is considered for the pinned-address validation.
No firmware source file is modified. Existing live ownership must remain
installed until process exit; there is no hot-disable/reclaim switch.

Mapped raw free calls retire their slots; external pointers go to original
free. A mapped realloc uses normal allocation, copies min(old requested bytes,
new size), and retires the old slot only after success. Size0 retires it.
Invalid interior or retired pointers terminate the experimental process rather
than being sent to libc. This fallback was tested separately; it was not used
in the successful AZ startup run.

Native build, from lab root:

```sh
cc -nostdlib -shared -fPIC -O2 -mno-outline-atomics \
  -fno-stack-protector -Wall -Wextra -Werror \
  shims/pcm-template-store.c shims/pcm-template-allocation.c \
  shims/pcm-template-hook.c -o shims/pcm-template-hook.so
```

## Native instruction tests

`run-pcm-native-allocation.py` runs10cases through original allocation-size
arithmetic, malloc call, wrapper constructor, and guard block, followed by the
original owner-array cleanup. It stops before native owner-vector insertion
and supplies that vector in the harness. Cases cover shared storage, exhausted
storage, disabled storage, variable native sample sizes, and malloc failure,
with original guard stores and with their replacement.

Original guard stores make all tested mapped pages anonymous/private. With
the replacement, all remain file-backed after construction, checked using
pagemap's present/file flags. Guards and every payload byte are checked for
both mapped and ordinary allocations. Failure cases intercept the original
error path to exit43; original logger behavior is not simulated. This is not
full pool construction or C++ exception unwind.

Host allocation tests pass under ASan/UBSan. Native allocation tests and
mapped-realloc tests pass, including failed-growth retention, size0, external
forwarding and interior-pointer rejection. Previous21native destructor tests
remain separately documented in AZ-PCM-STORE-OWNERSHIP.md.

## Test setup corrections and remaining work

The first staged run used absolute shim symlinks that were inaccessible inside
the sandbox; it is invalid as a memory comparison. After copying actual shim
files, a second run hit tmpfs ENOSPC while creating the firmware's large scratch
cache. That also exposed inherited-hook rejection in helper processes. Both
issues were corrected before the successful disk-backed template/baseline
runs. No early/failed run is counted in the headline result.

Next: run real tracks, seek/cue/loop and multi-deck workloads, inspect first-write
faults and sustained PSS/CPU, then test the visible session and actual audio.
Full scheduler shutdown/exception-unwind coverage and synchronized free-page
recycling remain separate work. The public/native mixer/controls/firmware
research objective remains unfinished.
