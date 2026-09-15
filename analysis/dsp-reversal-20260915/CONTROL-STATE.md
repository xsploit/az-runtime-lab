# TI DSP control/state trace, bounded

Evidence is the corrected private TI listing `runtime-lab/local/dsp-review-20260915/dsp.private.asm`; addresses are DSP program addresses. This is static tracing only. The B14 persistent-state base is explicitly set to `0x11803000` at `0x1181f76c-0x1181f770`. TI typed indexed accesses scale index by operand width: `LDHU/STH *+B14[n]` means base + 2n, and `LDW/STW *+B14[n]` means base + 4n. Command base `0x11800a00` is materialized at `0x1180e644-0x1180e650`; the halfword indices below use this base. Neither control words nor fields are assigned effect names here.

## IRQ8 staged call chain

The IRQ8 body at `0x1181ae88-0x1181ae9c` directly calls `0x1181d5ac`, `0x11819880`, `0x1180e644`, `0x11819420`, `0x1181a8a4`, and `0x1181de24` in order. The direct edge `0x1181ae90 -> 0x1180e644` is confirmed by the listing; temporal sequencing is lexical and does not alone prove every callee's full effect under every interrupt condition.

## Reader `0x1180e644`

| Command read | Address/evidence | State relation |
| --- | --- | --- |
| halfword 89 | `0x11800ab2`, `LDHU *+B5[B4]` at `0x1180e654` with B4=89 | compared with state halfword 503 (`0x118033ee`) loaded at `0x1180e648`; on change, records command 89 to state 503 at `0x1180e838` |
| halfword 90 | `0x11800ab4`, `LDHU *B4[B5]` at `0x1180e6f8` | compared with state halfword 502 (`0x118033ec`) loaded at `0x1180e6f4`; conditional state 502 write at `0x1180e868` |
| halfword 91 | `0x11800ab6`, `LDHU` at `0x1180e82c` after `182 + command base` | written to state halfword 18 (`0x11803024`) at `0x1180e84c` |
| halfword 93 | `0x11800aba`, conditional `LDHU` at `0x1180e6d4` after `186 + command base` | nonzero value can clear state word 14 (`0x11803038`) at `0x1180e6ec` |
| halfwords 112, 113, 114 | `0x11800ae0/e2/e4`, `LDHU` at `0x1180e8a4`, `0x1180e8ac`, `0x1180e8a0`, under gated A0 path | written (with bit extraction for 112) to state halfwords 510 (`0x118033fc`), 512 (`0x11803400`), 506 (`0x118033f4`), 508 (`0x118033f8`) at `0x1180e8b0-0x1180e8c8` |

Mode/selector transitions use explicit comparisons, not a known FX label. At `0x1180e6b4-0x1180e6d4`, command/state values 11 and 12 trigger a conditional command halfword load at command base + 186 bytes; word 14 is first set to one at `0x1180e6e8`, then can be cleared. At `0x1180e700-0x1180e770`, change in command 90 enters another path: state word 14 is set at `0x1180e720`; for mode values above four, the code uses `ADDAH` based on the mode halfword at `0x1180e728-0x1180e748` and conditionally updates state word 13. Because this is indexed from the mode value, a single fixed command halfword for that load cannot be asserted. The mode path sets state word 12 to one at `0x1180e754` and can set/clear word 13 at `0x1180e764-0x1180e7d8` depending on comparison and single-precision numeric threshold tests. Later branches compare state words 11/15/16 at `0x1180e774-0x1180e7e0`; numeric constants are floating-point bit patterns and are not interpreted as named effect parameters here.

At `0x1180e830-0x1180e870`, command 89/90 and a command halfword at `0x11800ab6` are copied/latched into state halfwords 526/503/18, with state 504 and words 210/211/213 used as transition flags. Writes include state halfword 526 (`0x1180341c`) at `0x1180e830`, 504 (`0x118033f0`) at `0x1180e840`, word 211 (`0x1180334c`) at `0x1180e848`, word 213 (`0x11803354`) at `0x1180e854`, word 210 (`0x11803348`) at `0x1180e864`, and word 12 (`0x11803030`) at `0x1180e870/0x1180e88c`. Existing state 525 is read at `0x1180e7f4`, while halfword 501 is conditionally changed at `0x1180e810/0x1180e824`. This is a multi-field transition; no single command-to-state one-to-one mapping captures it.

Reset initialization at `0x1180e2d0-0x1180e354` clears state halfwords 502/503, words 13/14/210/211/213/12, and other fields; `0x1180e4c8-0x1180e4f4` initializes halfwords 504/526/525/510/512/506/508. These addresses are separate from the live reader and constrain what can persist across a reset. The exact reset trigger must be traced in its caller before assigning a user-facing mode change.

Numeric consumer evidence: downstream code loads state word 12 (`0x11803030`) at `0x1180d014` and `0x1180d720`, word 13 (`0x11803034`) at `0x1180d6f4`, and word 14 (`0x11803038`) at `0x1180d73c/0x1180d944`; these loads enter branch/numeric paths rather than being inert latches. State halfwords 502/503 are repeatedly loaded by the `0x1180d...` and `0x1180dd...` paths (for example `0x1180d144`, `0x1180dd60`). `0x1181fdf8-0x1181fe24` reads 503, 512, 510, and 525, with word 211 read at `0x1181fe48`. This identifies consumers but not mathematical transfer functions, which are handled in the separate arithmetic trace.

## Adjacent readers

`0x11819420` loads command halfword at absolute `0x11800aa6` (command index 83) at `0x1181942c` and compares it with persistent state word 160 (`0x11803280`) loaded at `0x11819424`; the branch at `0x11819434` selects buffer resets/rewrites, including loops writing global `0x1183cf50` and `0x1183cf70` around `0x11819444-0x11819532`. These buffers are outside the B14 state struct; their meaning is unresolved.

`0x1181a8a4` starts a six-iteration control loop. It loads command halfword 77 at `0x11800a9a` (`0x1181a8ac-0x1181a8c0`) and increments the command pointer by two bytes at `0x1181a968`, ending after six iterations at `0x1181a970`; thus indices 77-82 are read, subject to loop control. It compares each to a corresponding halfword in a global region starting at `0x1183d408` (`0x1181a8a8-0x1181a8f4`) and conditionally stores values/flags at `0x1181a934-0x1181a950`. This establishes a six-slot command reader but not named controls.

`0x1181de24` loads command halfword 60 at `0x11800a78` (`0x1181de24-0x1181de30`), compares it with persistent state halfword 338 (`0x118032a4`) at `0x1181de2c`, and uses state word 170 (`0x118032a8`) in a numeric threshold comparison at `0x1181de38-0x1181de54`. It conditionally writes state halfwords 338 and 342 (`0x118032ac`) at `0x1181de64-0x1181de70`. The subsequent arithmetic beginning `0x1181de80` is beyond this control-state checkpoint.

## Limits

The TI listing establishes typed address calculations and direct call sites, not host feature names, command provenance, a complete DSP program, or live effect behavior. Some writes are predicate-qualified; branch delay slots and parallel issue matter. Numeric consumers above are citations for state use, not formulas. State map completeness requires examining remaining IRQ8 readers and the separately owned arithmetic trace. No Pi, firmware execution, or feature implementation was performed.
