# Shared Beat target parameter bounds

Source: corrected private C674x disassembly; addresses are DSP virtual addresses. This bounded review follows the established [selector dispatch](BEAT-DISPATCH.md). No parameter units or named effects are inferred.

## Cases 11 and 12

At `0x80010134`, state halfword503 is compared with 12. Predicate-qualified pointer construction at `0x80010138–148` selects command halfword110 (`0x11800adc`) for 12 and halfword109 (`0x11800ada`) otherwise. `LDHU` at `0x8001014c` reads the selected unsigned 16-bit value into B3.

`MVK 125` and `SHL 5` at `0x8001012e/130` form integer 4000 in A0. `CMPLT A0,B3,A0` at `0x80010156` tests whether B3 exceeds 4000; conditional `MVK 0x0fa0,B3` caps it. `CMPGT 10,B3,B1` at `0x80010160` tests whether B3 is below 10; the next conditional move floors it at 10. The exact integer transformation for all possible LDHU inputs is:

```text
selected = command[110] if state503 == 12 else command[109]
clamped = min(4000, max(10, selected))
state_halfword96 = clamped
```

The final copy and store are `0x8001016c` and `0x80010170`. With B14=`0x11803000`, halfword96 is byte address `0x118030c0`. These are signed comparisons, but all reachable operands at this point are nonnegative 16-bit values or small positive constants, so signedness does not change this clamp.

## Cases 8 and 9: bounded setup path

The setup path is conditional on word211 equaling 1. At `0x800120c4`, the branch reads the old B0 gate value while the parallel `CMPEQ 9,B18,B0` writes the selector comparison for subsequent pointer construction. The selected command is halfword107 (`0x11800ad6`) for state503=9 and halfword106 (`0x11800ad4`) otherwise; `LDHU` occurs at `0x800120e0`.

State halfword510 was loaded into A4 at `0x800120b8`. When it equals 1, the conditional `EXTU B0,16,16,B4` at `0x800120f0` replaces the selected value with state halfword508 loaded at `0x800120e4`. `125 << 8` forms 32000. The unsigned comparisons and conditional moves at `0x800120f6–0x80012104` clamp B4 to [10,32000]:

```text
selected = command[107] if state503 == 9 else command[106]
value = state_halfword508 if state_halfword510 == 1 else selected
B4 = min(32000, max(10, value))
```

The clamped B4 is copied to B5 at `0x80012134`. B4 is then repurposed as a clear-buffer pointer at `0x8001214a`, while B5 remains unchanged through the intervening instructions. `STH B5,*+B14[505]` at `0x80012290`, in the branch-delay stream following `BNOP` at `0x80012288`, stores the clamped value to halfword505 (`0x118033f2`). This closes the initial setup parameter destination, not all later consumers. In contrast, `MV A4,A3` at `0x80012118` followed by `STH A3,*+B14[511]` at `0x80012120` copies the earlier state510 value, not B4. Halfwords508,510,511 have addresses `0x118033f8`, `0x118033fc`, `0x118033fe`. The gate-skipping path and later processing require separate traces.

## Verification boundary

The constants, register provenance, predicate direction, selected addresses and destination for case11/12 were checked directly against the listing. This is a static integer/control trace, not execution of the firmware or evidence of effect identity, timing units, frequency units, or audio equivalence. The complete shared bodies and their state/reset behavior remain unfinished.

The shared11/12 target now has a reviewed [processing-phase map](BEAT-11-12-PHASES.md), covering its two gain phases, final mixer and observed return. Exact sample equations and software-loop store timing remain separate open work.
