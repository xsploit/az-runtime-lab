# Register-target branch provenance

This extends the [bounded coverage inventory](PROCESSING-COVERAGE.md). A branch through a register is not automatically dynamic effect dispatch. The entries below are independently reviewed from the private corrected TI C674x listing; full program control-flow closure remains open.

## 0x11810058: saved incoming return register

`MV.L1X B3,A9` at `0x1180ff6c` preserves the incoming B3 value. The contiguous region through `0x11810058` contains no subsequent A9 definition and no CALL/CALLP. B3 is then reused: integer pointer construction at `0x1180ff70/74` and paired audio loads inside the two software-pipelined loops overwrite it. `BNOP.S2X A9,5` at `0x11810058` branches through the preserved incoming B3.

This establishes a saved-return-register pattern along the reviewed entry path. It is not an indexed effect selector, and should not be counted as an unresolved jump-table dispatch merely because the branch register is A9. Proving all external entry points and all callers' B3 values is outside this local trace; no runtime target address is asserted.

The same body contains two gain-like processing loops with `ADDSP` ramp updates and `MPYSPDP` multiplication of double-precision operands. Their gain/control identities and full sample schedule are not established here. The branch classification does not confer those semantics.

## 0x1180ff54: saved-return candidate with a callee boundary

`MV.L1X B3,A18` at `0x1180ff4c` saves incoming B3 before `CALLP 0x1180fba0,B3` at `0x1180ff50`. `BNOP.S2X A18,5` at `0x1180ff54` subsequently uses A18. This is another saved-return idiom, but the intervening callee's preservation of A18 must be checked before claiming end-to-end register provenance. It is recorded as a candidate, not a resolved runtime return.

No new effect identity, sample equation, or numeric parity follows from these branch checks.
