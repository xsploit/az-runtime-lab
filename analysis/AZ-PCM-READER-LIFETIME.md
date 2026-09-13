# AZ PCM reader lifetime and cluster detachment

2026-09-13. Offline original-instruction tests and static tracing establish a
shared-reader/exclusive-writer protocol for the inspected TrackBlock read path.
No Pi access or runtime patch was performed.

## Verified read path

`Track::readFromBlocks` starts at `0x781d60`, identified by its diagnostic string
at `0x25f4768` and the manually checked reference at `0x781fb4..0x781fbc`.
The track has 24-byte blocks at track+0x38. Each block stores a cluster pointer
at +8 and an EasyRWLock state at +16.

The reader first checks the cluster pointer, then reads the lock with acquire
ordering. A negative value returns the frames already copied without attempting
the cluster. Otherwise it atomically increments the nonnegative reader count
using LDAXR/STLXR (`0x781de8..0x781e08`). It then **reloads** the cluster pointer
at `0x781e0c`. If that pointer became null before acquisition, it releases the
reader count at `0x781f50` and returns without touching the detached cluster.

With a nonnull cluster, the function walks 16-byte entries, gets each Page
wrapper's data/count, and copies stereo frames to the caller's output. Scalar
copies use 8-byte loads/stores; aligned even-frame spans can use 16-byte vectors.
The reader count stays held across the copy and page transitions within that
cluster. The normal completion, missing-page, and partial-copy paths call
`0x684480` before moving to another block or returning.

`0x684480` requires a positive count and atomically decrements it. Invalid-count
diagnostics are not exercised in these tests. No payload pointer escapes through
this function's return: its result is a copied-frame count, and the output is
the caller-supplied buffer. This does not exclude other firmware APIs returning
references or pointers.

## Writer side observed statically

The cluster release routine starts at `0x7745f8`. For a populated block it tries
to change the same block+16 lock from 0 to -1. A positive reader count prevents
that transition. On success it clears block+8, then calls EasyRWLock::exitWrite
at `0x670488` to change -1 to 0, before draining the detached cluster into its
page pool.

The contention branch `0x774828..0x774864` calls wait helper `0x232cad0` with 1,
retries the exclusive transition up to ten times, and exits the release routine
without reaching the detach/drain path when those attempts remain unsuccessful.
The reader suite does not execute the writer. A subsequent dedicated writer
suite now verifies these effects in 14 controlled cases; see
`AZ-PCM-CLUSTER-WRITER.md`. Wait duration and scheduling behavior remain unmeasured.

Taken together, the inspected protocol prevents a new reader from obtaining the
detached cluster: readers either hold a positive count before the writer can
detach, fail while -1 is present, or reload a null pointer after detachment.
This reasoning still depends on all relevant readers using this protocol and
the scheduler enforcing writer-side ownership; it is not a global concurrency
proof for every page-return path.

## Original-instruction test results

`probe-pcm-block-reader.py` executes the original reader and positive-count
exitRead instructions locally with QEMU. Synthetic geometry is two blocks,
two pages per cluster, and the real 1764 stereo frames per page. Source samples
are distinct across all four pages; guards use AF/EF. Every case checks returned
frame count and the complete 256 KiB fixture, including output sentinels,
unchanged inputs/guards, and final lock counts.

All 15 cases pass:

- Scalar, aligned-vector and odd-length copies.
- Page and cluster boundary crossing.
- A pre-existing shared reader count of two, restored to two after the read.
- Exclusive writer on the first or second block, yielding no/partial output.
- Missing first cluster/page, second page, or second cluster.
- Partial read at the end of available blocks and a start beyond block count.
- One controlled detachment between the first pointer check and lock acquisition.

The controlled interleaving replaces instruction `0x781de4` with a temporary
branch which clears block+8, executes the displaced address calculation, then
returns at `0x781de8`. It models a writer having completed detachment before
the reader acquires the lock. The reader then returns zero and restores count
zero. No live threads or simultaneous hardware memory accesses are involved.
All other cases execute the reader without instruction substitutions.

Harness correction: the first extraction omitted the out-of-range return block
at `0x782044`; the beyond-block-count case faulted in the synthetic ELF. Extended
the extraction through `0x782058`, reran all 15 successfully, and removed that
test's generated core file. The runner now executes in its temporary directory
with core dumps disabled. This was a harness boundary error, not an AZ crash.

## Next work

Writer contention/detachment tests are now complete within the isolated scope
documented separately. Review the other return callers, asynchronous cancellation, and remaining
reader entry points. Only after that should an opt-in reclaim operation be
integrated and tested for audio identity, long-session memory use and latency.
No MADV_DONTNEED or other reclaim was added by this work.

Evidence: `pcm-pool-live/block-reader-oracle.json` and the updated
`return-dispatch-disassembly.txt`. Run `python3 analysis/probe-pcm-block-reader.py`
from `runtime-lab` to reproduce the local tests. Full firmware hash is checked
before extraction, and proprietary instruction copies are temporary.
