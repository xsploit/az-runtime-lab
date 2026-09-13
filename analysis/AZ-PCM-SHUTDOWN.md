# AZ scheduler shutdown and forced-stop limits

2026-09-13. Static shutdown tracing and eight original-instruction QEMU cases.
No Pi access, real thread cancellation, runtime patch or new RAM measurement.

## Shutdown order found

The installed BufferingScheduler destructor starts at `0x771878`. It signals
the scheduler thread at scheduler+0x58 via `0x231cbf0`, then walks all parallel
units and signals each unit+0x58 through the same helper. That helper performs
a release store of one to thread+0x138 and wakes thread+0x140.

The destructor then calls `0x23383f0` for the scheduler thread, supplying 3000.
After that returns it starts member cleanup and reverse unit destruction. Each
unit's PageFiller destructor `0x771528`, called with unit+0x20, invokes the same
stop helper on its +0x38 thread (unit+0x58), supplying 8000. Only afterwards does
its normal path release cached reader entries, their shared references and the
reader-cache object. Unit buffering tasks are destroyed after the PageFiller.

The wait helper's clock routine uses clock_gettime, seconds*1000 and nanoseconds
converted to milliseconds. The supplied values correspond to 3-second scheduler
and 8-second worker wait limits. These are requested limits, not measurements
of actual shutdown duration. Both false-return branches enter diagnostics and
then fall through to member destruction if the diagnostic helpers return.
Their configured abort/throw behavior is not established here.

## Stop helper distinguishes cooperative exit from forced cancellation

`0x23383f0` locks thread+0x20 and acquire-loads the live handle at +0x10. If
already zero it returns true after unlocking. Otherwise it requests exit, wakes
the thread and, for nonzero timeout, calls `0x231ecb0`. That helper polls +0x10
with acquire loads and nanosleep requests of 2,000,000 ns; negative timeout has
an unbounded polling branch. The caller checks the handle again, rather than
using the wait helper's return value as the final result.

If the handle has become zero, stop returns true. If it remains nonzero, stop
emits diagnostics and calls cancellation helper `0x232d830`, whose nonempty path
tails to imported `pthread_cancel` at `0x425830`. Stop then release-stores zero
to both thread+0x10 and +0x18 and returns **false**. It neither checks the cancel
return code nor calls pthread_join in this inspected forced path.

Thus handle zero has two different origins: a worker can report completion, or
the stopper can overwrite it after a cancellation request. A monitoring/reclaim
tool must not treat either zero unconditionally as proven OS-thread quiescence.
The helper's false result and whether the forced path ran are material evidence.
The cooperative exit publication point still needs tracing to establish how
it relates to final callbacks and destruction on the worker itself.

## Eight original-code stop cases pass

`probe-thread-stop.py` executes original stop and cancellation-helper instructions
with deterministic mutex, signal/wake, wait, logger and pthread_cancel substitutes.
It compares the complete 16 KiB fixture, output bool and ordered call records.

| Case | Observed result |
| --- | --- |
| Already stopped | true; no exit request, wait or cancellation |
| Worker clears handles during wait | true; cancellation absent |
| Wait expires with live handle | false; cancellation requested; both handles zeroed |
| Zero timeout | skips wait; false and cancellation if still live |
| Negative timeout, simulated worker exit | forwards -1; true after handles clear |
| Cancellation reports error 22 | false; both handles are still zeroed |
| Wait reports success but handle stays live | false; cancellation still requested |
| Wait reports false but worker cleared handle | true; no cancellation |

No OS threads are created, slept on, or cancelled by these tests. They establish
the firmware helper's decision/state semantics, not whether pthread_cancel
terminates a real decoder or how quickly it does so. The negative-timeout case
checks argument forwarding and subsequent state handling, not an indefinite wait.
Original instruction copies are temporary, SHA-pinned and run with cores disabled.

## Consequence and next work

There is a dedicated exit/wait sequence in shutdown, separate from detachFiles'
discarded worker future. It is not a universal drain proof because of the forced
fallback, diagnostic continuation and still-unmapped worker exit publication.
Trace the normal worker exit and pending-task cleanup before using this mechanism
as a payload-lifetime boundary. Initial buffering request ownership and remaining
PCM return paths also stay on the audit list.

Evidence: `pcm-pool-live/thread-stop-oracle.json`, `shutdown-evidence.json` and
`shutdown-disassembly.txt`. Reproduce with `python3 analysis/probe-thread-stop.py`
and `python3 analysis/collect-pcm-shutdown.py` from `runtime-lab`.
