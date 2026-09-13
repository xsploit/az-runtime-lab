# PCM completion is dispatched to the buffering scheduler

2026-09-13. Offline inspection of SHA-pinned original AZ EP147 plus six local
QEMU predicate tests resolves the receiver left open in `AZ-PCM-RETURN-ORACLE.md`.
No Pi contact or runtime modification.

## Constructor chain

In scheduler constructor `0x7760e0`, x28 retains the scheduler object. Instruction
`0x776134` computes scheduler+0x20 and `0x77614c` preserves that address in
stack+0x80. The completed scheduler installs primary vtable `0x25f9c70`, and
at `0x7763a4` installs secondary table `0x25f9d70` at scheduler+0x20.

The parallel buffering unit construction at `0x7766a4..0x7766e4` installs
BufferingCommander primary/secondary tables `0x25f9f88` / `0x25f9fc0` at
unit+0x300 / unit+0x308. It places the PageBuffer pointer at commander+0x10 and
then reloads stack+0x80 and stores it at unit+0x320, i.e. commander+0x20.
Thus the callback's receiver is scheduler+0x20 on this normal construction path.
This is not an assumption that the independent HUI manager owns PCM tasks.

## Dispatch predicate and tests

Scheduler task-interface table `0x25f9d70` has predicate slot+0x28 = `0x68f0e8`.
The predicate:

1. Calls `0x232dc50`, the previously identified pthread_self wrapper.
2. Calls `0x231cbe0` with receiver+0x38. That helper adds 0x18 and loads a
   64-bit value with acquire ordering.
3. Returns whether the two 64-bit values differ.

The stored handle therefore resides at receiver+0x50 = scheduler+0x70. Equal
identity takes onPageFilled's inline closure path; unequal identity selects task
allocation/submission. The thread-object getter is at scheduler+0x58, matching
the constructed secondary thread vtable `0x25f9e08`.

`probe-pcm-thread-predicate.py` executes the unchanged predicate and getter, with
only pthread_self replaced by a supplied value. All six cases pass: equal and
unequal ordinary handles, zero stored/current values, handles differing only in
their high 32 bits, and matching high-bit handles. The surrounding fixture is
filled with 0xa5 bytes to expose wrong offsets and remains byte-identical.
Zero-handle cases test the comparison, not successful initialization or valid
OS thread identities. No threads or queue operations run in this harness.

## Submission and execution

Task-interface slot+0x30 = `0x22093b0`. It passes receiver+0x1c0 (scheduler+0x1e0)
and the supplied task to `0x2211620`, then stores one with release ordering to
receiver+0x294 (scheduler+0x2b4). The helper invokes the queue object's slot+0x30;
if it returns zero, it calls task cleanup `0x2211550`. The pending-byte store
still happens after that helper returns; it is not proof that submission succeeded.
Do not treat the pending byte as a new task count or completion acknowledgement.

The thread vtable's run slot contains `0x2210a40`: subtract 0x38 and branch to
`0x22107b0`. Starting from scheduler+0x58, this recovers receiver=scheduler+0x20.
The run routine binds the embedded queue through `0x220a9d0` using the stored
thread handle, checks initialization, then loops over exit checks, a pending
byte/wait path, and queue consumption.

At `0x22108fc..0x2210900` it calls `0x2210050` on receiver+0x1c0. This is the same
generic consumer already traced in `HARDWARE-MIXER.md`: pop queued task, execute
task virtual slot+0x10, clean it up, then continue the drain loop. The PCM task's
slot is `0x77d5f0`, which adjusts to the captured closure and enters `0x77d3e8`.
Shared consumer code does not mean a shared HUI/PCM queue instance or thread.

The outer run loop seeds a value of 5 at `0x2210894`, adjusts it using clock
differences, and passes the resulting value to wait helper `0x232c3d0`. On its
false-return path it calls virtual slot+0x50 and adopts that result for later
waits. This is static scheduling structure, not a measured 5 ms service bound.
The exact wait helper, periodic callback, and exceptional/cancellation behavior
need further work before making latency guarantees.

## Consequences and limits

The normal constructor and dispatch chain explains how decoder completion can
move onto the buffering scheduler before changing track/cluster state. It does
not establish exclusivity against audio readers. Cluster detach/reference logic,
task cancellation, shutdown, and all other pool-return callers still need review.
No reclaim operation was added. Reclaim before queue publication remains a
candidate only after proving page ownership and measuring its realtime cost.

Evidence: `pcm-pool-live/thread-predicate-oracle.json`, expanded
`return-dispatch-xrefs.json` and `return-dispatch-disassembly.txt`. Collect with
`collect-pcm-return-dispatch.py`; execute predicate tests with
`probe-pcm-thread-predicate.py`. All firmware extracts used by tests are temporary.
