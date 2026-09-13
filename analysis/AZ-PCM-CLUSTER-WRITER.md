# AZ cluster retirement: original-instruction writer tests

2026-09-13. All 14 offline QEMU cases pass. No Pi contact, firmware deployment,
payload reclamation, or live-thread benchmark was performed.

## What is established

The original routine at `0x7745f8` loads the selected block's cluster pointer,
then tries to change block+16 from zero to -1 with LDAXR/STLXR. With any reader
remaining, it cannot acquire exclusive ownership. After the initial unsuccessful
attempt it requests wait helper `0x232cad0(1)` and retries, at most ten times.
Exhaustion leaves the cluster attached and its pages out of the free pool.
The argument 1 is observed; the test does not establish a wall-clock duration.

Once exclusive acquisition succeeds, it clears block+8 at `0x774660`, releases
the write lock through `0x670488`, then drains pages. Each entry's page pointer
is cleared before `Pool<Page>::push` at `0x7746a0`. It clears entry reservation
flags, resets the cluster's count, returns the cluster to the cluster pool, then
calls range/occupancy publication helpers. The successful fixture observes
block+8 zero and lock -1 at write unlock; every page enqueue observes block+8
zero and lock zero. PCM payloads and guards remain unchanged throughout the
tested routine's final effects.

Together with the original reader tests, this supports the detachment protocol
for this read/retire pair. It does not establish safety for all pool callers.
In particular, the writer caches its cluster pointer *before* acquiring the
exclusive lock and does not reload it afterwards. Concurrent retiring writers
would require outer serialization; the block lock alone must not be presented
as a complete ownership proof. Outstanding decoder reservations and other
payload readers also remain to be audited.

## Coverage and substitutions

`probe-pcm-cluster-writer.py` hash-pins EP147 to
`736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`, extracts
temporary original code, and runs it with synthetic track, cluster and pool
objects. The complete 128 KiB fixture is compared to expected bytes, including
two 14,112-byte nonzero PCM payloads and AF/EF guards.

Cases cover uncontended retirement; one/two held readers; a held writer;
reader release on wait 1, 5 and 10; two readers releasing separately; only one
of two readers releasing; an existing writer releasing; an empty cluster; and
an absent cluster with zero, positive and negative lock state. All still-held
cases retain the cluster. The partial-reader case ends at reader count one,
with no retirement or publication. Absent clusters return without waiting.

Waits use a deterministic substitute invoking original exitRead/exitWrite at
selected calls. Two observation branches record state at write unlock and page
enqueue; the pool observer executes the displaced original prologue. The three
post-retirement metadata helpers record their arguments rather than mutate real
range/index structures. This tests the writer's calls, not the implementation
of those helpers. Pool fixtures use the ordinary append path; rollover and
growth of the page pool are tested separately in `AZ-PCM-RETURN-ORACLE.md`.
Cluster-pool growth, invalid-index diagnostics, true concurrent execution,
cancellation, and application shutdown are outside this suite.

The initial harness build failed because linker symbol assignments lacked
spaces. Correcting the linker script allowed all 14 cases to execute and pass;
that build failure was not a firmware execution failure.

## Caller leads and next work

The direct B/BL scan finds two calls to this routine: `0x774d1c` and `0x77597c`.
Both call `0x771228`, acquire-load the returned object's +16 lock field, and skip
the candidate if it is nonzero before invoking retirement. That preliminary
check is not an exclusive lock and does not prove caller serialization. The
writer's own atomic acquisition remains necessary when a reader starts between
the caller check and retirement.

Next establish outer ownership for these callers, the other page-return paths,
and asynchronous cancellation. Only then integrate a bounded reclaim experiment
and measure audio identity, repeated loading/seeking, memory use and latency.

Reproduce with `python3 analysis/probe-pcm-cluster-writer.py` from `runtime-lab`.
Evidence: `pcm-pool-live/cluster-writer-oracle.json`,
`return-dispatch-xrefs.json` and `return-dispatch-disassembly.txt`. Firmware
instruction copies remain temporary and are not committed.
