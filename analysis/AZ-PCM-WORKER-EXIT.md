# AZ normal worker exit and pending-task disposal

2026-09-13. Hash-pinned EP147 static trace plus seven original-instruction
QEMU cases. PC only; no Pi access, runtime change or live cancellation test.

## Handle publication follows run return, with a startup exception

The thread creation helper `0x232d740` supplies `0x23474d0` to pthread_create
and detaches the created thread. That trampoline calls `0x2347340` and returns
null. The entry routine acquires an owner for its thread-local registry, obtains
a registry slot, writes the thread object there, optionally sets its name, and
waits on thread+0x50 with argument 10000.

If that wait succeeds, optional affinity setup precedes virtual run slot+0x10.
For both the scheduler and PageFiller thread tables this leads through
`0x2210a40` to generic run `0x22107b0`, adjusting the receiver by -0x38.
After run returns, the entry routine releases its registry node's thread identity
and release-stores zero to thread+0x18, then thread+0x10 at
`0x23473d4` / `0x23473dc`.

If the startup wait returns false, run is skipped entirely, but the same normal
cleanup and handle clearing occurs. Thus zero does not by itself prove the
worker successfully initialized or processed any requests, even without forced
cancellation. On the successful-start normal path it does occur after run returns.

Handle clearing also precedes optional self-deletion (thread+0x134 flag), the
registry-owner reference decrement/possible destruction, and return from the
pthread trampoline. The generic thread constructor `0x232c180` initializes the
self-deletion flag to zero; other setters or specialized users must be considered
before applying that default to arbitrary thread instances. These threads are
detached, so the normal mechanism is a firmware completion indicator rather
than a pthread_join barrier. C++ exception and cancellation unwinding paths are
not established by this normal-path trace.

## The worker run method can leave pending tasks

Scheduler task vtable `0x25f9d70` and PageFiller task vtable `0x25f9ec8` both
install run `0x22107b0` in +0x58. Their final callback in +0x48 is `0x70e4f8`,
a bare return. Their initialization callbacks differ: `0x769310` / `0x76a070`.

Run checks exit at `0x221087c` and, when requested, goes directly to the final
callback at `0x2210938`, then returns. It also checks exit immediately before
queue consumption (`0x22108f0..0x2210900`). That path loops to the outer exit
check instead of consuming tasks when exit is set. No final drain is hidden in
the installed empty callback. An already executing task may finish before the
next exit check, but this does not guarantee execution of every queued task.

## Queue destruction disposes remaining tasks without executing them

Base worker destruction `0x220d350` calls stop again, then destroys the queue at
receiver+0x1c0 through `0x220d170`. Its normal cleanup loop
`0x220d258..0x220d280` pops entries with `0x2212460` and passes each to
`0x2211550`. The latter invokes task vtable slot+0, then returns its allocation
through the queue allocator. It does not invoke execute slot+0x10.

For the queued reader-cache clear task, table `0x25f8e30` distinguishes these:

| Slot | Address | Operation |
| --- | --- | --- |
| +0 | 0x77ecc8 | Destructor; releases predicate and promise |
| +8 | 0x77eda8 | Deleting destructor |
| +0x10 | 0x77f610 | Executes clear and fulfills promise |

The destructor calls promise cleanup `0x77e6a8` at `0x77ed34`, tying this path
to the abandoned-promise behavior documented in AZ-DETACH-PROMISE-LIFETIME.md.
Disposing a pending clear task therefore does not imply its clear operation ran
or its promise was fulfilled with true. Whether any particular task was pending
in an observed run remains a runtime question.

The onPageFilled task similarly has distinct destruction `0x76ebf0` and
execution `0x77d5f0` slots. Its captured-object destructor `0x759260` still needs
tracing to establish the fate of every PCM pointer on discarded completion.
Do not infer either a leak or safe payload reuse from task disposal alone.

## Seven controlled normal-entry cases

`probe-thread-exit.py` executes original entry/trampoline and existing-node TLS
lookup instructions. It substitutes owner acquisition, startup wait, naming,
affinity, run and destructor observers. It compares a full 16 KiB fixture plus
callback-time snapshots of both handle fields. All seven cases pass:

- Ordinary run with a retained registry owner, and with its last reference.
- Self-delete enabled with a retained owner, and with its last reference.
- Failed startup wait, showing run skipped while handles still clear.
- Optional name and affinity callbacks before run.
- Failed startup wait with self-deletion and last owner reference.

Run observes live handles; destructor observers see zeros. The original TLS
lookup uses a pre-existing matching node; allocation, contention, exceptions,
actual destruction and OS-thread termination are outside these tests. The owner
acquisition substitute supplies a controlled reference count, rather than
claiming to reproduce the real registry owner's acquisition implementation.

## What this changes

A shutdown barrier must distinguish normal initialized exit, startup failure,
and forced cancellation. Even normal initialized exit is not a promise that all
queued work executed. Memory reclamation must also account for discarded
completion tasks and their captured ownership. The next concrete lead is
`0x759260`, reached by onPageFilled task destruction, followed by the remaining
initial allocation/return paths. No PCM reclamation has been enabled.

Evidence: expanded `pcm-pool-live/shutdown-disassembly.txt`,
`shutdown-evidence.json` and `thread-exit-oracle.json`. Reproduce with
`python3 analysis/collect-pcm-shutdown.py` and
`python3 analysis/probe-thread-exit.py` from runtime-lab.
