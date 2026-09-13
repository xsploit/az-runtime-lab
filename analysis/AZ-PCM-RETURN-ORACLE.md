# AZ page retention and return: original-instruction tests

2026-09-13. Fourteen local AArch64/QEMU cases pass against original AZ v1.30
instructions. Tests distinguish pages attached to valid reservations from pages
returned to the free pool and cover two deque slow paths. The Pi was not contacted.

## What was executed

`probe-pcm-return.py` verifies the full EP147 SHA256, copies two small original
instruction regions into a temporary test ELF, executes it, and compares the
entire 128 KiB synthetic fixture against expected bytes. Payloads contain
nonzero patterns and their AF/EF guards. Every case leaves all payload and guard
bytes unchanged. Temporary ELF and instruction extracts are deleted on exit.

| Cases | Verified behavior |
|---|---|
| Pool push | Appends wrapper pointer and advances finish iterator |
| Push at 512-byte node boundary | Allocates next node, stores pointer in old node's last slot, updates finish iterator |
| Push with exhausted one-entry map | Expands map to four entries, moves existing node pointer, records old map delete, allocates next node |
| Cluster accepts reserved empty entry | Installs supplied page, clears reservation flag/pointer, increments resident count, returns true |
| Cluster unreserved / already occupied / boundary rejection | Returns supplied page to pool, clears reservation pointer, returns false; existing occupied page is preserved |
| Track accepts current reservation | Installs page through cluster setter and calls the intercepted range-publication helper |
| Track identity mismatch / generation mismatch | Does not attach or enqueue supplied page in this isolated call; fixture stays unchanged |
| Track rejects unreserved entry | Returns supplied page through cluster rejection path |
| Cluster trim tail / all / empty | Returns only present pages at/after cutoff, clears affected entries and reservation flags, updates count |

The normal pool and reservation instructions were not rewritten. Allocator and
publication interfaces are deliberate harness substitutions:

- `new` at `0x424d40` returns fixed writable fixture blocks and records sizes.
- `delete` at `0x424e50` records its argument without freeing fixture storage.
- `memmove` at `0x424000` is a local overlap-aware implementation.
- Range publication at `0x7701f0` records invocation without executing its
  thread-sensitive range structure updates.

Diagnostics, exceptions, allocator failure, deque map recentering without growth,
full track teardown and concurrent readers are not covered. Tests do not prove
that stale reservation behavior is a leak: the outer ownership protocol remains
to be reconstructed.

## Async completion path now identified

RTTI at `0x25f8520` identifies the task type as
`meow::AsyncTaskBoxBase::AsyncTask<BufferingCommander::onPageFilled(...)::lambda>`.
Its vtable address point is `0x25f8d78`; execute slot `+0x10` contains `0x77d5f0`.
That thunk adds `0x18` to the task object and branches to closure `0x77d3e8`.

`BufferingCommander` RTTI is `0x25f96a0`. Its virtual callback `0x782978` copies
completion data to a stack closure. It reads commander+0x20, calls that object's
virtual slot+0x28, then takes one of two routes:

- True: calls task builder `0x7826e0`, then virtual slot+0x30 with the returned
  task. The builder requests 160 bytes aligned to eight, installs `0x25f8d78`,
  and copies the closure—including its raw page pointer—into task+0x18.
- False: executes closure `0x77d3e8` immediately at call `0x782aa8`.

This establishes an asynchronous task route alongside an inline route. The
predicate's meaning, concrete receiver type, execution thread, queue locking,
and cancellation behavior are still unproven. Do not label the predicate as
"is audio thread" or assume a lock merely from the task's name.

Follow-up: `AZ-PCM-SCHEDULER-DISPATCH.md` now resolves the normal constructor's
receiver to scheduler+0x20, verifies its thread-identity predicate, and connects
the queue to the scheduler's run routine. Queue cancellation and reader safety
remain open; the predicate is not an audio-thread test.

## Implication for memory reclaim

Reclaiming every page at `onPageFilled` or `setPage` would discard successfully
decoded pages that are about to become readable. Pool return remains the more
precise candidate boundary, but it needs both the full ownership argument and
realtime cost measurements. The pool queue itself does not clear payloads, and
the current template hook does not reclaim them.

Next inspect the async task receiver, dispatch/cancellation and reader ownership
around cluster detachment, then design a reclaim test. Once the Pi is available,
repeat loads/seeks and digital comparisons with any new change before deployment.

Evidence: `pcm-pool-live/return-oracle.json`,
`return-dispatch-xrefs.json`, `return-dispatch-disassembly.txt`.
Reproduce locally with `python3 analysis/probe-pcm-return.py` and
`python3 analysis/collect-pcm-return-dispatch.py` from `runtime-lab`.
