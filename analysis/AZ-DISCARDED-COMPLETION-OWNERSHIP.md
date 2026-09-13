# AZ discarded completion: source reference versus PCM page ownership

2026-09-13. Original EP147 static trace and eight original-instruction QEMU
cases. No Pi access, runtime modification or memory-reclamation deployment.

## The captured destructor has a precise identity

The onPageFilled task destructor `0x76ebf0` invokes `0x759260` on task+0x20.
The latter is `pcmbuf::PositionWithSourceInfo::~PositionWithSourceInfo()`,
confirmed by its diagnostic string at `0x25eb520` and RTTI referenced by the
vtable installed at `0x25eb320`. It is not the PCM page wrapper destructor.

The task builder `0x7826e0` constructs this layout:

| Task offset | Field or subobject |
| --- | --- |
| +0x18 | Closure, beginning with commander pointer |
| +0x20 | PositionWithSourceInfo |
| +0x40 | Position subobject's existence/type-check token |
| +0x48 | Atomic source-reference pointer |
| +0x50 | Completion status and secondary status word |
| +0x60 | Raw PCM page-wrapper pointer |
| +0x68 | Captured reservation fields |

Builder `0x7827c4` calls source-reference copy helper `0x76bda8` for task+0x48.
That helper validates its referenced object, then increments its count at +0xc.
By contrast, `0x7827d8..0x7827dc` copies the page pointer to task+0x60 with a
plain load/store. These are distinct ownership mechanisms, not two names for
the same reference count.

## What task destruction actually does

On the initialized valid-type path, `0x76ebf0` decrements its task-type live
counter, destroys PositionWithSourceInfo, then zeros the task token at +8.
Position destruction validates/clears its own token and loads its source pointer
at subobject+0x28 = task+0x48. A nonnull source goes through `0x6b0db8`:

- Check source+0x10 magic `0x52434f58`.
- Require a positive count at source+0xc, atomically decrement it.
- Return true only when the resulting count is zero.

On true, position destruction calls `0x22043f0` with source+0x18 as the first
argument and the source object as the second. This last-reference disposal
helper can invoke further destruction; its full type-specific effects remain
unresolved here. On a retained reference or null source, that call is absent.

The inspected task/position destruction instructions neither load task+0x60
nor invoke PCM free-pool push `0x7734d0`. The raw page-pointer field is left
unchanged. This is a direct-path statement, not a claim that every possible
last-source destructor has no indirect effects.

## Execution and disposal are materially different

Executing closure `0x77d3e8` reads the page pointer from closure+0x48, which
is task+0x60. Success offers it to the captured reservation. Error and missing
track paths return it with pool push calls `0x77d550` / `0x77d590`.
The destructor performs none of these completion operations.

This matters at two inspected disposal sites:

- Shutdown's queue destructor pops pending tasks and calls task cleanup, as
  traced in AZ-PCM-WORKER-EXIT.md.
- Submit helper `0x2211620` calls task cleanup `0x2211550` when its virtual
  enqueue operation returns zero (`0x22116b0..0x22116b8`). The onPageFilled
  caller's zero-return branch then destroys its local position copy and returns;
  it has no explicit page-return fallback on that normal branch.

The actual conditions for enqueue returning zero and whether they occur during
normal playback still need tracing. Do not call this an observed pool leak or
attribute waveform jitter to it. In particular, shutdown is already tearing
down the owning PageBuffer and need not replenish the playback free list.

## Independent owner array retains the allocation

PageBuffer construction records each page wrapper in its owning array at +0x80
(`0x777b5c`, `0x777bac`) before appending it to the initial free deque.
Previously verified PageBuffer destructors iterate that owner array and free
payloads and wrappers, independent of free-deque membership; see
AZ-PCM-BUFFER-LIFETIME.md and its 18 original-instruction cleanup cases.

Therefore failure to return a page to the reusable free deque is not, by itself,
loss of its allocation owner. Potential loss of reusable capacity during a live
session and failure to release memory at teardown are different questions.
This pass does not establish that the owner array is unchanged across every
possible runtime path or prove safe teardown with outstanding readers.

## Eight destructor cases pass

`probe-discarded-completion.py` executes original task destruction, position
destruction and valid source-count decrement instructions. It supplies initialized
type guards, positive source counts and complete patterned fixtures. Only
last-source disposal is replaced by an observer; real allocator frees are absent.

Cases cover retained counts of 2 and 9, last count of 1, null source, null page,
and error completions. Each compares the entire 32 KiB fixture and 8 KiB globals.
The source count and object tokens change as expected, while raw page pointers,
PCM samples, guards and a separate pool guard region remain unchanged. Last
reference cases verify the disposal helper's arguments and zero count, not its
actual implementation. Invalid tags/counts, diagnostic aborts, queue execution,
thread races and source-specific deletion are outside these tests.

## Next steps

Resolve the queue implementation's rejection conditions and the source object's
last-reference disposal. Complete the remaining initial allocation/return audit
before introducing page-backing reclamation. A raw completion pointer is not a
sufficient ownership or synchronization signal for reclaiming PCM data.

Evidence: `pcm-pool-live/discarded-completion-evidence.json`,
`discarded-completion-disassembly.txt`, `discarded-completion-oracle.json`.
Reproduce with `python3 analysis/collect-discarded-completion.py` and
`python3 analysis/probe-discarded-completion.py` from runtime-lab.
