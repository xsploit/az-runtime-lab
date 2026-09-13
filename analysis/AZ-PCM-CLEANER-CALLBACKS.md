# AZ cleaner ownership: callback registration and synchronous triggers

2026-09-13. Static original EP147 inspection; no Pi access or runtime change.
The previous 14 writer tests establish read/retire behavior, not competing-writer
serialization. This investigation follows the outer retirement routes.

## Direct route into retirement

`freePartsOfTrack` at `0x7748d0` contains call `0x774d1c` to cluster retirement
`0x7745f8`. Its only direct B/BL caller is `0x775bd4`, inside `freeSomeClusters`
at `0x7750f8`. The latter also contains the other direct retirement call,
`0x77597c`. Both retirement call sites first acquire-load a block lock and skip
nonzero values, as recorded in `AZ-PCM-CLUSTER-WRITER.md`.

No direct B/BL or literal 64-bit pointer reference to `0x7750f8` appears in this
scan. That does **not** mean the cleaner is unused: the constructor materializes
the address with ADRP+ADD at `0x7769cc` / `0x7769d4`.

## Two registered callbacks, one cleaner object

In scheduler constructor `0x7760e0`, x28 is the scheduler. At `0x7768a8`, x19
becomes scheduler+0x378, the embedded cleaner. That value survives to the callback
binding stores. At `0x7769d8..dc`, the constructor builds this 24-byte member-call
binding on the stack:

| Binding offset | Value |
| --- | --- |
| +0 | function `0x7750f8` |
| +8 | zero adjustment / nonvirtual tag |
| +16 | cleaner receiver = scheduler+0x378 |

Builder `0x76fba0` copies it into an allocated 24-byte binding and creates a
32-byte function wrapper with manager `0x767240` at +16 and invoker `0x7660c0`
at +24. Setter `0x770f50` copies/swaps that wrapper into the destination. Its
manager operation 2 copies the binding; operation 3 destroys the old binding.
Those manager calls are not calls to the cleaner itself.

The constructor registers separate wrappers with the same function/receiver:

| Destination | Registration call | Role from field/layout tracing |
| --- | --- | --- |
| PageBuffer+0x120 | `0x7769f0` | cluster pool callback (pool at +0xb8, callback +0x68) |
| PageBuffer+0x98 | `0x776a2c` | page pool callback (pool at +0x30, callback +0x68) |

The second binding is rebuilt at stack+0x188 by `0x776a14..18`, before x19 is
reassigned to PageBuffer. It retains the same cleaner receiver, not PageBuffer.

## Allocation paths invoke cleanup synchronously

Commander method `0x785b10` receives PageBuffer from commander+0x10. It looks up
the track, then tries to take a Page from the free deque. Empty deque or an
unusable/null candidate reaches `0x785d38`. It checks wrapper manager presence
at PageBuffer+0xa8 and calls the invoker at +0xb0 with wrapper address +0x98.
After that call returns, it rechecks the free deque and retries taking a Page.

The same method calls track reservation `0x77c778` at `0x785b88`. When a block
has no cluster, the reservation tries the cluster pool at track+0x10. Empty or
unusable pool entry reaches `0x77cac4`: check pool+0x78, call pool+0x80 with
wrapper pool+0x68, then retry the cluster deque after the call returns.

Invoker `0x7660c0` loads the 24-byte binding, applies its member-pointer receiver
adjustment, and branches to the target. For the registered binding (adjustment
zero), this enters `0x7750f8` with the embedded cleaner receiver. There is no
queue submission, thread switch, or separate lock in this invoker. Cleanup runs
synchronously on the allocation caller's thread. This is an instruction-level
control-flow observation, not a live thread trace.

## What remains unproven

Commander method `0x785b10` is in primary commander vtable `0x25f9f88` at slot
+0x10. The scan finds its literal entry at `0x25f9f98`, no direct calls, and no
short ADRP+ADD materialization candidate. The next task is resolving callers of
that virtual slot and showing whether allocation requests are serialized onto
the scheduler, including exceptional and shutdown paths.

The constructor's ownership of the cleaner does not imply exclusive execution
on its thread. These callbacks can execute wherever their allocation paths run.
The previously traced onPageFilled completion dispatch is a different path and
cannot, by itself, prove allocation/cleaner serialization. No reclaim hook is
authorized by this evidence alone, and no new memory saving is claimed.

Reproduce bounded evidence with `python3 analysis/collect-pcm-cleaner-ownership.py`.
It verifies the full EP147 hash, records direct/pointer references and short
address-materialization candidates, and saves reviewed instruction ranges in
`pcm-pool-live/cleaner-ownership-disassembly.txt`. The JSON records scan scope;
absence of scan hits is not absence of all indirect/inlined routes.
