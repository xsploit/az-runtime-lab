# Register-target branch provenance

This extends the [bounded coverage inventory](PROCESSING-COVERAGE.md). A branch through a register is not automatically dynamic effect dispatch. The entries below are independently reviewed from the private corrected TI C674x listing; full program control-flow closure remains open.

## 0x11810058: saved incoming return register

`MV.L1X B3,A9` at `0x1180ff6c` preserves the incoming B3 value. The contiguous region through `0x11810058` contains no subsequent A9 definition and no CALL/CALLP. B3 is then reused: integer pointer construction at `0x1180ff70/74` and paired audio loads inside the two software-pipelined loops overwrite it. `BNOP.S2X A9,5` at `0x11810058` branches through the preserved incoming B3.

This establishes a saved-return-register pattern along the reviewed entry path. It is not an indexed effect selector, and should not be counted as an unresolved jump-table dispatch merely because the branch register is A9. Proving all external entry points and all callers' B3 values is outside this local trace; no runtime target address is asserted.

The same body contains two gain-like processing loops with `ADDSP` ramp updates and `MPYSPDP` multiplication of double-precision operands. Their gain/control identities and full sample schedule are not established here. The branch classification does not confer those semantics.

## 0x1180ff54: saved-return candidate with a callee boundary

`MV.L1X B3,A18` at `0x1180ff4c` saves incoming B3 before `CALLP 0x1180fba0,B3` at `0x1180ff50`. `BNOP.S2X A18,5` at `0x1180ff54` subsequently uses A18. This is another saved-return idiom, but the intervening callee's preservation of A18 must be checked before claiming end-to-end register provenance. It is recorded as a candidate, not a resolved runtime return.

No new effect identity, sample equation, or numeric parity follows from these branch checks.

## Four further saved-link paths

The following save and branch sites were checked against the listing. The local trace records no subsequent write to the saved register before its branch; software-pipelined numeric registers must not be confused with the saved link.

| Branch | Saved register definition | Incoming edge evidence |
|---|---|---|
| `0x1180f070` via A19 | B3 copied at `0x1180efb0` | IRQ8 call `0x1181af68` targets entry `0x1180ef88` |
| `0x1180f170` via A8 | B3 copied at `0x1180f124` | IRQ8 call `0x1181afc0` targets entry `0x1180f0e8` |
| `0x1180f210` via A16 | B3 copied at `0x1180f18c` | Local incoming B3 established; caller to the segment remains under review |
| `0x1180e0a4` via A1 | B3 copied at `0x1180e000` | Six calls through stub `0x80013f60`, resolved below |

At `0x1180f188/18c`, MVK of `0xffffffff` into B3 and MV of B3 into A16 are parallel. A16 receives the incoming B3, not the newly constructed numeric constant. This is why line-by-line substitution gives an incorrect branch target.

### Resolved incoming stub for 0x1180dfe0

Stub `0x80013f60` constructs B31 using low bits `0xdfe0` and replacement upper bits `0x11800000`, then branches through B31 at `0x80013f68` with NOP5. Its destination is **0x1180dfe0**. It does not overwrite B3.

Six explicit CALLP sites target this stub, each using B3 as link register: `0x80011aa0`, `0x80011afc`, `0x80012548`, `0x800125a8`, `0x80012d2c`, and `0x80012d8c`. Their logical next processing target is therefore `0x1180dfe0`. The calls at `0x80012548/125a8` lie in the shared cases8/9 body. This closes those concrete incoming edges, rather than inferring that absence of a direct CALLP to the final address means its caller is unknown. It does not establish that these are every possible caller.

## Reproducible simple-stub inventory

[map_simple_stubs.py](map_simple_stubs.py) requires explicit `--listing` and `--output` paths. It accepts only serial, unpredicated MVK/MVKH/B B31 sequences at four-byte offsets followed by NOP5. MVKH is evaluated as upper-half replacement. The [generated ledger](simple-stub-edges.json) records 89 accepted stubs and direct CALL/CALLP sites naming each stub. It emits addresses and call edges, not firmware bytes.

A synthetic low-half-sign-extension example resolves to `0x1180dfe0`; changing MVKH to a parallel instruction or replacing NOP5 with NOP4 makes that example fail recognition. The real corrected listing still yields 89 accepted stubs with these stricter checks. This is not a general control-flow decoder: compact, predicated, differently scheduled, chained or dynamically loaded targets require separate analysis. Listed callers are static operand matches, not evidence that every branch is reached at runtime.
