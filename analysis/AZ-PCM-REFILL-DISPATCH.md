# AZ refill tasks connect completion back to allocation

2026-09-13. Static EP147 tracing connects the previously isolated cleaner
callbacks to specific buffering tasks and the scheduler's completion listener.
This is a stronger normal-path ownership chain, not an exhaustive concurrency
proof. No live runtime, Pi access, reclaim implementation or benchmark this turn.

## Which tasks request pages

The firmware RTTI resolves three relevant tables:

| Type | Table | Relevant slot |
| --- | --- | --- |
| `RangeBufferingTask<DefaultPageStaticConfig>` | `0x25f8b98` | +0x18 → `0x77bf28` |
| `AroundBufferingTask<DefaultPageStaticConfig>` | `0x25f8b68` | +0x18 → `0x770df8` |
| `DefaultArroundBufferingStrategy` (firmware spelling) | `0x25f9b58` | +0x18 → `0x778d90` |

These are buffering-task tables, **not** the AsyncTaskBox completion-task table.
Their +0x10 slot returns a task property; it is not the execution slot. Confusing
the two task interfaces would trace the wrong method.

Range task construction at `0x769d78..0x769db8` chooses a parallel unit, constructs
a 32-byte task, and stores unit+0x300 (its commander) at task+0x10. Range execution
at `0x77c058..0x77c070` loads that commander and calls its slot+0x10, which is
`0x785b10` in the installed commander table. Arguments include the source/range
object's +0x18 and +0x28 addresses and the selected page index. Thus this reaches
the Page/Cluster allocation and synchronous cleaner path already documented.

Around task construction at `0x779cd0..0x779d48` installs task table `0x25f8b68`,
constructs the default strategy, and stores the selected unit+0x300 commander at
task+0x18. Around execution verifies its source/track state and then tail-calls
strategy slot+0x18, passing that commander as x2. The strategy saves x2 at
stack+0x98 (`0x778dd4`), reloads it at `0x77925c`, and invokes commander slot+0x10
at `0x779278`. Both task types therefore reach the same allocation method.

## Completion listener is scheduler+0x10

Constructor instructions `0x776364..0x7763bc` install table `0x25f9d18` at
scheduler+0x10. Later, `0x776a54..0x776aa8` walks parallel units and installs this
listener at commander+0x28, either directly through the recognized setter or
through its virtual setter. The listener table contains:

- +0x10 → `0x7817e8`, the secondary-interface completion implementation.
- +0x18 → `0x77a3f0`, subtracts 0x10 and branches to failure handler `0x77a050`.

The already traced onPageFilled closure calls listener+0x10 at `0x77d47c` after
its page publication or missing-track return path. On an error it first returns
the page to the pool, then calls listener+0x18 at `0x77d574` with error values.
Listener identity is constructor-derived; this is not merely a matching slot
number in an unrelated interface.

## Listener immediately refills through buffering tasks

Secondary completion implementation `0x7817e8` retains the supplied
scheduler+0x10 receiver. Its list access at receiver+0x350/+0x360 corresponds to
the scheduler's unit list at +0x360/+0x370. It finds the matching unit by comparing
unit+0x300 with the supplied commander, observes unit+0x2e0, then visits the unit's
task pointers and calls each task's +0x18 slot (`0x7818b0..0x7818c8`).

Primary completion implementation `0x7816c0` contains the corresponding loop at
`0x781784..0x78179c`; failure handler `0x77a050` also executes task slot+0x18 at
`0x77a208`. These loops accumulate task return counts against their calculated
budget. This inspection does not establish the full policy/meaning of every
count, fairness across tasks, or a measured latency bound.

Combined with `AZ-PCM-SCHEDULER-DISPATCH.md`, the constructor-selected normal
onPageFilled path now has a closed trace:

```text
decoder completion
  → same-scheduler-thread inline closure OR queued scheduler closure
  → page publication/return
  → scheduler listener on that same execution path
  → Range/Around buffering task
  → commander allocation
  → synchronous cleaner if a free pool is exhausted/unusable
  → cluster retirement
```

The notification/refill portion contains synchronous calls, not another worker
submission before allocation. Consequently this traced completion-driven refill
executes cleanup on the buffering scheduler thread, assuming the previously
verified normal constructor/dispatch chain. That conclusion is narrower than
"every cleaner invocation is serialized."

## Remaining ownership audit

Other ways to start/refill tasks, alternate listeners, cancellation and shutdown
remain to be checked. Primary scheduler table methods are externally callable;
their existence does not establish which threads reach them. Also audit the
remaining pool-return callers and outstanding decoder reservations independently
of this allocation chain. The writer caches its cluster pointer before exclusive
acquisition, so competing writer exclusion is still required before reclaim.

Reproduce the updated hash-pinned evidence with
`python3 analysis/collect-pcm-cleaner-ownership.py`. Its JSON now includes the
three RTTI names/tables, listener table, direct references and short materialized
address candidates. Bounded disassembly retains the field stores and call sites
above. No original proprietary executable bytes are added to the repository.
