# AZ detachFiles and worker-local reader-cache clearing

2026-09-13. Offline static tracing plus 12 original-instruction QEMU cases.
No Pi contact, runtime patch, music deletion, or new memory-saving measurement.

## Identification corrects the next ownership lead

Scheduler method `0x77aa80` is identified by its constructed task RTTI as
`BufferingScheduler::detachFiles`, rather than an initial buffering request.
It constructs an AsyncTaskBox task with table `0x25f8cb8` and submits it through
scheduler+0x20's submission slot. Its task execution entry is `0x77efc8`.
Initial allocation request serialization therefore remains a separate open lead.

This task walks the parallel units at scheduler+0x360/+0x370. Per unit, it retains
unit+0x20 as the PageFiller task receiver, builds a predicate-bearing operation,
and checks receiver slot+0x28. The inline branch calls `0x77e260` with
*(receiver+0x2b8). The other branch creates a task with table `0x25f8e30` and
submits via receiver slot+0x30. That table's RTTI explicitly identifies
`PageFiller::clearReaderCache` inside `doAsyncToPromise<bool>`.

Its execute entry `0x77f610`, at the normal block `0x77f6d0`, loads the captured
receiver, obtains its +0x2b8 cache pointer, calls `0x77e260` with the captured
predicate, then passes a true result to promise-completion helper `0x77ee90`.
The inline branch also supplies a true result after calling clear. This true
value is not a count of removed entries and does not prove all matching readers
were destroyed: the clear routine has a policy-dependent retention path.

The promise/future machinery and submission alone are **not a verified barrier**.
A subsequent ownership trace in `AZ-DETACH-PROMISE-LIFETIME.md` establishes that
the normal queued path drops its local future reference without joining the
worker. This pass has not proved that another path waits for every worker, cancels pending
decodes, drains completion tasks, or excludes every further payload access.
Do not use returning from detachFiles as safe PCM reclamation evidence yet.

## Cache clear semantics

`0x77e260` is named by its diagnostic string as
`ResamplingReaderCache<AudioReaderFactory>::clear(const std::function<bool(const TrackID&)>&)`.

Cache+0x40 stores a thread identity. If zero, the routine calls the pthread_self
wrapper and stores that identity. If nonzero, it compares against pthread_self;
an unequal result enters the `singleThreadedChecker.isOK()` diagnostic path.
The code falls through into clearing if the diagnostic helpers return. This
is not a mutex and must not be described as blocking competing callers. Whether
the diagnostic helper aborts/throws in a particular configuration is untested.

The routine visits cache entries backwards using pointer array cache+0x10 and
count cache+0x20. It applies the supplied predicate to entry+8. Unmatched entries
are retained. With no policy object or policy reference configured, matched
entries are removed: remaining pointer slots shift left, the entry's string
member at +0x28 is destroyed, a nonnull shared-reference control block at +0x20
is released, the entry's first 32-bit field is cleared, and the 48-byte entry is
deallocated. This is reader-cache entry ownership, not free PCM-page ownership.

When a policy object exists, it calls policy slot+0x40 and compares floating
result d0 to exactly 1.0. The equal case takes a different path through the
underlying reader, optional type identification and another helper, then keeps
the entry in the inspected control flow. The policy's exact meaning and that
special helper remain unresolved; do not assume every matched entry is removed.

## Original-instruction oracle

`probe-reader-cache-clear.py` runs original `0x77e260` and the original empty
policy-reference getter path `0x765af8`. It uses a 32 KiB fixture with three
synthetic 48-byte entries, an explicit selection predicate and high-bit thread
identity. All 12 cases pass:

- All eight selection masks for three entries, including none and all.
- First-use thread binding with entries and with an empty cache.
- Empty cache with an existing matching owner.
- Matched entries with null shared-reference control blocks.

Each case compares every fixture byte, remaining entry count, predicate visit
order, shifted pointer array, entry flags and ordered destructor/deallocation
observations. Unused trailing pointer-array slots are deliberately not expected
to be zeroed: the original routine leaves stale values beyond the active count.

Substitutions are pthread_self, the caller-supplied selection predicate,
left-shifting memmove, and destructor/deallocator observers. No actual decoder,
string storage or shared object is destroyed. The tests do not execute the
policy-retention branch, thread mismatch diagnostics, asynchronous task queues,
promise waits, or concurrent threads. Source instructions are SHA-pinned and
extracted only into temporary directories; core dumps are disabled.

## Next work

Resolve initial allocation request dispatch and task cancellation independently
of detachFiles. Trace whether a worker completion barrier exists, and audit the
policy-retention branch before treating reader-cache removal as a drain. Keep
the other PCM return paths and decoder reservations in the ownership audit.

Evidence: `pcm-pool-live/reader-cache-clear-oracle.json`,
`reader-cache-detach.json` and `reader-cache-detach-disassembly.txt`.
Reproduce with `python3 analysis/probe-reader-cache-clear.py` and
`python3 analysis/collect-reader-cache-detach.py` from `runtime-lab`.
