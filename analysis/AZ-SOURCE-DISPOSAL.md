# Last source reference can defer destruction through TrashBox

2026-09-13. PC-only original-code analysis and eight controlled QEMU cases.

The helper reached at PositionWithSourceInfo's last source reference, `0x22043f0`,
is `meow::TrashBox::push(meow::TrashBox::Trash*)`, identified by diagnostic
string `0x2e67468`. Its first argument is the TrashBox stored at source+0x18;
the second is the source object. Earlier notes called the first argument an
allocator provisionally; the stronger identity is a deferred-deletion queue.

The first helper, `0x218d5e0`, reads global pointer `0x3bd5d70`. If null, it
returns an inactive guard. Otherwise it examines the signed counter at the
pointed object+0x28. A negative counter prevents acquisition; a nonnegative
counter is incremented with acquire/release exclusive operations. TrashBox
push releases that acquisition before returning on the inspected normal paths.
This establishes a lifetime gate, not its complete shutdown/registration protocol.

With an acquired guard and valid TrashBox instance token, a nonnull source is
appended to a tagged linked queue. TrashBox+0x10 is the head, +0x50 the tail,
and +0x90 the spare-node head. Empty spare storage causes a 64-byte allocation.
The enqueue path calls `0x22040e0` afterward; that routine increments +0xa4,
checks its threshold and may call listener slot+0x10. It is a notification path,
not proof that a garbage-collection thread has already destroyed the object.
The deferred consumer and listener binding remain untraced in this pass.

With the global lifetime guard absent or closing, a nonnull source goes directly
to its deleting virtual slot+8. The helper also contains an optimized concrete
40-byte base-object deletion path when that slot matches `0x818b68`; the oracle
uses another virtual target and does not execute that specialized deletion.
Invalid TrashBox token diagnostics can also lead to synchronous deletion if their
helpers return, but this is not a tested valid-instance path.

Therefore a source count reaching zero is not generally a destruction-completion
barrier. In the active branch it means disposal has been queued. In the inactive
branch it invokes the concrete object's deleting destructor synchronously, whose
source-specific behavior still must be identified before making PCM claims.
This does not introduce a return of the separate raw completion page to the PCM
free pool; see AZ-DISCARDED-COMPLETION-OWNERSHIP.md. Indirect effects of concrete
source destruction remain open.

## Verification

`probe-source-disposal.py` runs original TrashBox push and original lifetime-gate
acquisition with initialized valid tokens and sequential fixtures. It substitutes
only allocation, notification and the source's deleting virtual target. Eight
cases pass: absent gate, negative -1 and -2 gates, active gate with spare node,
active gate needing allocation, active zero count, and null source with absent
or active gate. Full 32 KiB fixtures and 8 KiB globals match. Observers show the
gate acquisition held during enqueue notification; the original release restores
its counter. Inactive cases invoke immediate deletion; active cases queue the
source without invoking its deleting target.

The test does not execute source-specific deletion, real notification consumers,
allocator failure, diagnostics, exceptions, or concurrent gate closure. It does
not establish a full shutdown drain or safe concurrent PCM reclamation.

Evidence: pcm-pool-live/source-disposal-oracle.json and
source-disposal-disassembly.txt. Reproduce the oracle with
`python3 analysis/probe-source-disposal.py`. No Pi access or runtime patch.
