# AZ task queue grows beyond its reserve and returns task IDs

2026-09-13. Static constructor/enqueue trace and nine original-instruction QEMU
cases. No Pi contact, runtime patch or live-load performance measurement.

## Resolving the previously suspected rejection path

The normal scheduler/PageFiller queue is constructed by `0x220c9d0`, reached
from base worker constructor `0x220d750`. It installs vtable `0x2e67ac8`.
Enqueue slot+0x30 contains `0x220c820`; its inner push is `0x22122d0`.

The queue is not capped at the initial reserve. Inner push attempts to take a
node from the tagged spare list at inner-queue+0x80. If that pointer is empty,
`0x2212444..0x2212458` calls operator new for 64 bytes and proceeds to append
that node. The normal allocation-success path contains no queue-full rejection.
Allocator exceptions or nonstandard allocation failure are separate, untested
paths; do not model them as a normal false return or silently dropped task.

This corrects the hypothesis left open in AZ-DISCARDED-COMPLETION-OWNERSHIP.md:
the generic zero-return cleanup branch exists, but exhausting the preallocated
nodes does not normally take it. No evidence here establishes frequent lost
completion tasks or a resulting playback memory leak.

## Return value is an ID, not a boolean

For a nonnull task, wrapper `0x220c820` saves task+0x10 before enqueue. After
inner push succeeds it returns that saved 64-bit task ID. A null task returns
zero without pushing. The onPageFilled builder creates IDs by atomically
incrementing its task-box counter (`0x782754..0x782784`). The return is therefore
not a count of queued items, remaining capacity or a boolean produced by push.

A controlled synthetic task with ID zero is successfully appended by the
original wrapper but returns zero. The outer helper `0x2211620` interprets zero
as failure and selects cleanup. This is an ID-contract edge case, not evidence
that valid application traffic commonly uses zero IDs. Do not assign zero IDs
in injected tasks. Counter initialization, reset protocols and integer wrap
would need checking before claiming an application defect.

There is a second static cleanup overlap: on an inner false return, wrapper
`0x220c820` itself calls task cleanup at `0x220c8fc` before returning zero, while
the outer helper has its own zero-result cleanup. This pass does not reproduce
that branch with a valid node structure and successful allocation. No patch or
runtime double-destruction claim is justified from the dormant branch alone.

## Queue structure and allocation implications

Relative to the enclosing task queue:

| Offset | Structure |
| --- | --- |
| +0x38 | Inner linked queue / tagged head |
| +0x78 | Tagged tail |
| +0xb8 | Tagged spare-node list head |

Pointer words use their low 48 bits for addresses and high 16 bits as tags.
Push claims a spare node with an exclusive/CAS loop, writes the task pointer to
node+8, clears its next pointer while incrementing its tag, links it after the
tail, and attempts to advance the tail. If the observed tail already has a next
node, it helps move the tail forward and retries. This is an algorithmic trace,
not proof of fairness, bounded realtime latency or behavior on other architectures.

Both the scheduler (`0x776344`) and each PageFiller construction (`0x7764c4`)
supply a reserve argument of 1024. The queue constructor's loop allocates 1025
64-byte nodes, consuming one as the initial sentinel. That is 65,600 bytes of
raw node allocations per queue, excluding allocator overhead, task storage,
other queue members and optional secondary structures. The reserve itself is
far smaller than the approximately 464 MiB startup PCM allocation previously
measured. Reducing it is not a promising large-memory optimization and could
bring dynamic allocations closer to the normal workload.

Exhausting the reserve can add allocation latency and retained node memory.
Whether this happens on the Pi, and its contribution to jitter, requires actual
queue-depth/allocation observations. No such measurement was made this pass.

## Nine original-code cases pass

`probe-task-enqueue.py` executes the unmodified enqueue wrapper and inner push,
substituting only operator new with a fixed writable node and size observer.
All cases compare the complete 32 KiB fixture, including tags, node payloads,
head/tail/spare links, allocation request and returned ID:

- Spare node, and spare list containing another node.
- Empty spare list causing a 64-byte allocation.
- Lagging tail with an existing successor, with and without a spare node.
- Tag increment wrapping at 16 bits.
- A task ID with nonzero upper 32 bits.
- Synthetic zero ID: queued, but return zero.
- Null task: no queue change, return zero.

These are sequential fixtures, including a prearranged lagging-tail state; they
are not concurrent producer/consumer stress tests. Diagnostics, allocation
exceptions, real allocation costs, reclamation and queue destruction are outside
this oracle. The full outer helper is not executed in the synthetic zero-ID case.

## Next work

The ordinary queue-full-loss hypothesis is now deprioritized. Continue the PCM
ownership audit through last-source disposal and remaining initial allocation
paths. For eventual Pi profiling, count extra node allocations and observe queue
latency before changing reserve sizes or scheduler behavior.

Evidence: `pcm-pool-live/task-enqueue-evidence.json`,
`task-enqueue-disassembly.txt`, `task-enqueue-oracle.json`.
Reproduce with `python3 analysis/collect-task-enqueue.py` and
`python3 analysis/probe-task-enqueue.py` from runtime-lab.
