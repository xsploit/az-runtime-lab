# AZ detachFiles: the discarded worker future is not a completion barrier

2026-09-13. Static inspection of original EP147, checked against its imported
symbol names and RTTI. No Pi access or runtime experiment this turn.

## Finding and scope

On the inspected normal queued path, `detachFiles` submits reader-cache clearing
to a worker and releases its local future reference without joining that worker
task. The queue itself can have its own submission behavior; this finding does
not claim a latency bound for detachFiles or rule out a barrier elsewhere.

It resolves the local promise-lifetime uncertainty in
`AZ-READER-CACHE-DETACH.md`: creating a `future<bool>` here is not evidence that
the caller waits for its true result. Neither successful scheduling nor return
from this task proves all workers, decoder callbacks and PCM readers are drained.

## State and ownership evidence

`0x77efc8` constructs a 48-byte shared control/state allocation. Its control
table is `0x25fa008`, with RTTI
`_Sp_counted_ptr_inplace<__future_base::_State_baseV2,...>`; the embedded state
uses table `0x25f9a70`. The separately allocated result uses `0x25f8da8`, RTTI
`__future_base::_Result<bool>`. This is a plain promise state, not an identified
`std::async` thread-owning state.

The caller retains the control block in x19 and increments its strong count
while obtaining the result reference. On the queued branch it transfers promise
fields into the pending worker task at `0x77f1cc..0x77f208`, clearing the moved
stack fields. The task table is `0x25f8e30`, previously identified as the
PageFiller clearReaderCache operation wrapped in doAsyncToPromise.

After submission returns, the normal path destroys local predicate/promise
wrappers at `0x77f2ac..0x77f2ec`. At `0x77f2f0..0x77f318`, it decrements the
retained shared strong count (atomically in the threaded branch); unless it was
the last reference, it advances to the next unit at `0x77f31c`. This path does
not load the result-ready state, extract a bool or execute a future wait.
The queued task can still own its promise reference when the caller drops this
reference. Its pending/unfulfilled state is therefore compatible with the caller
continuing through the unit loop.

On final reference disposal, the identified control block's disposal slot
`0x7661f0` calls the embedded state's destructor; state destructor `0x766170`
destroys its result if present. Control destroy `0x766910` branches to operator
delete. These identified disposal methods do not join a worker thread. The
state's other two table methods are a bare return and return-false stub at
`0x765fc8` / `0x765fd0`.

## Notify is not wait

Promise cleanup helper `0x77e6a8` is not a future wait. If it still owns a result
with other references to the state, its inspected path constructs future error
code 4, places an exception into the result, exchanges the state's ready word
to one with release ordering and may notify waiters. Empty/moved promise fields
take the short cleanup path. Code 4 is treated here as the broken-promise path
from the construction/abandonment flow; the raw value is retained in evidence.

Successful promise completion `0x77ee90` uses `pthread_once`, writes ready state
and likewise may notify waiters. Import resolution distinguishes the operations:

| PLT address | Imported operation |
| --- | --- |
| `0x4240c0` | `__atomic_futex_unsigned_base::_M_futex_notify_all` |
| `0x426f40` | `__atomic_futex_unsigned_base::_M_futex_wait_until` |
| `0x425cf0` | `pthread_once` |
| `0x425670` | `__throw_future_error` |

The cleanup's call at `0x77e8d4` is notify-all, not wait-until. No direct call to
wait-until appears in the collected detach-task or promise-cleanup ranges.
That negative scan alone is not the proof: it is combined with the transferred
ownership, normal release path, identified plain-state disposal and absence of
ready/result consumption on that path. Indirect queue helpers or diagnostics
are not claimed to be universally nonblocking.

## Consequence for our runtime work

Do not trigger PCM memory reclamation merely because detachFiles has returned.
This call clears selected reader-cache entries, may retain entries under policy,
and does not supply the complete drain guarantee needed for payload reclamation.
The remaining audit must identify explicit worker barriers/cancellation ordering,
the decoder completion queue, initial buffering requests and all page-return
ownership paths. The normal completion-driven refill chain is separately mapped
in `AZ-PCM-REFILL-DISPATCH.md`.

Evidence is in the expanded `pcm-pool-live/reader-cache-detach.json` (RTTI,
direct-call maps and resolved futex symbols) and bounded disassembly. Reproduce
with `python3 analysis/collect-reader-cache-detach.py`. This is static evidence;
no worker scheduling or wall-clock behavior was measured in this pass.
