# Route-1 bounded ramp generator

Source: corrected TI listing `local/dsp-review-20260915/dsp.private.asm`; packet grouping by [group_packets.py](group_packets.py). This document specifies a stateful bounded ramp generator in the route-1 loop at `0x11806d10-0x11806d32`. The helper does not reconstruct C674x SPLOOP prologue/drain latency, so the formula is an instruction-level recurrence candidate for the 22 scheduled iterations, not a cycle-accurate or audible proof.

## Inputs and exact typed state

Persistent B14 base is `0x11803000` (`0x1181f76c-0x1181f770`). `LDW/STW *+B14[n]` means byte offset `4n`; therefore words 217, 194, and 195 are at `0x11803364`, `0x11803308`, and `0x1180330c`. None of these is a halfword. The output pointer A3 is formed by `MVK 0xffffbd68` at `0x11806cec` then `MVKH 0x11830000` at `0x11806d00`: **`0x1183bd68`** (upper-half replacement, not signed low-word addition). A4 copies it at `0x11806d0c`, and the loop kernel has `STW A3,*A4++[1]` at `0x11806d32`, a 4-byte stride.

The lower bound comes from stack slot B15[25]: `0x11806cc4` sets A3=0, `0x11806cc6` stores A3 to B15[25], and `0x11806cfa` loads it into A7. Thus A7 is the single-precision bit pattern `0x00000000` (`+0.0`). The upper bound B12 comes from B15[23] at `0x11806cc8`, then `MV.L1X B12,A6` at `0x11806d04`. B15[23] is set to `127 << 23 = 0x3f800000` (`1.0f`) at `0x1180696c-0x11806980`. On the alternate path, `0x118069a4` stores B16, which was formed by `127 << 23` at `0x11806940-0x11806954`; the `0x118069a4` store shares a packet with `MV.L2 B20,B16` at `0x118069a8`, so it reads **incoming B16=1.0f**, not B20. This establishes bounds `[+0.0f, +1.0f]` on both observed entry paths.

The step comes from state word 217. `0x11806cc0` loads it, `0x11806cce` compares with 3, and the paths assemble the float bit patterns `0x3bf83e10` (approximately `+0.0075757578015f`) or `0xbbf83e10` (approximately `-0.0075757578015f`) at `0x11806cd0-0x11806ce8`. The `==3` path reaches the negative `MVKH` at `0x11806ce8`; the other path retains the positive `MVKH` from `0x11806ce4`. `0x11806cf0` stores that selected bit pattern into B14 word 194. Crucially, `MVK 22,B1` at `0x11806cf4` and `MV.L1X B1,A5` at `0x11806cf6` are **one execute packet**. The move reads pre-packet B1, so **A5 receives the float step**, while B1 becomes loop count 22. Reading printed lines serially would falsely put integer bit pattern `0x16` into A5 and destroy the formula. `0x11806cf8` decrements the new count to ILC 21, `0x11806d06` loads ILC, and `0x11806d10` enters `SPLOOPD 8`.

The initial accumulator A3 is copied from B0 at `0x11806d0e`. On one initialization path, `0x11806968` loads B14 word 195 into B0 in the branch packet heading to `0x11806cc0`; on the other observed path, `0x11806c68` can set B0 to zero and `0x11806cb8` latches that into word 218. Exact path predicates and all possible initial bit patterns are not yet closed. The loop takes no audio-sample operand in this inner recurrence; it advances a persistent ramp accumulator. Its mathematical boundary holds independently for any finite starting value.

## Bounded ramp recurrence

For a finite starting accumulator `x_0` represented by A3/B0, float step `d` in A5, and a nominal 22 scheduled iterations (ILC=21), the instruction sequence implements the following **ordered operations**:

```text
t_i = f32(x_(i-1) + d)         ADDSP at 0x11806d14
u_i = (t_i > 1.0f) ? 1.0f : t_i  CMPGTSP/MV at 0x11806d20/24
x_i = (u_i < 0.0f) ? 0.0f : u_i  CMPLTSP/MV at 0x11806d28/2c
scheduled store x_i through pointer 0x1183bd68, advanced by 4 bytes  SPKERNEL/STW at 0x11806d30/32
```

The bound tests use `>` and `<`, so equality keeps the computed value. For NaN inputs, TI floating-point comparison behavior and any special-value handling outside this loop require a separate check; the finite-input rule above does not claim NaN/Inf behavior. After the software-pipelined region, `0x11806d68 MVK 0x6e40,A3` and `0x11806d6c MV A3,B0` share an execute packet. B0 reads **pre-packet A3**, the ramp accumulator, while A3 becomes a pointer seed. `0x11806db8 STW B0,*+B14[195]` writes the final accumulator to persistent word 195 (`0x1180330c`). This closes the stateful writeback. The loop has NOP scheduling gaps after the add and at kernel exit; SPLOOP prologue/drain and iteration-to-store alignment need cycle-accurate reconstruction before asserting an exact count or placement of physical output samples. The output pointer's four-byte stride is explicit.

## Scoped PC numeric probe

[`ramp_numeric_probe.py`](ramp_numeric_probe.py) tests only the derived finite float32 recurrence with two illustrative starts: `x0=0,d=+0x3bf83e10` and `x0=1,d=-0x3bf83e10`, 22 steps. It passed with first/last values `0.007575757802 / 0.166666626930` upward and `0.992424249649 / 0.833333492279` downward; all outputs stayed in `[0,1]` and moved monotonically. This verifies the proposed pure arithmetic boundary under standard PC float32 rounding. It does **not** run the DSP, reproduce its rounding mode, prove the branch selects those illustrative starts, or test sound quality.

## Route-2 relation and hard limit

Route 2's loop `0x11805950-0x11805984` uses the same add, upper/lower compare, clamp, and store pattern on A and B lanes. Its ILC is likewise 21 from `MVK 0x16,B1` at `0x11805928` followed by `ADD -1` at `0x11805944`. Here A3 and B3 are loaded from B14 words 195 and 174 at `0x118058b4` and `0x1180589c`; A5/B5 and bound stack slots 40/41 change through predicate-qualified paths around `0x118058e4-0x11805940`. The two kernel stores at `0x11805980-0x11805984` share an execute packet and their pointer/lane schedule remains unresolved. Route 2 therefore supports a related **bounded ramp/limit primitive**, but a complete two-lane recurrence with exact bounds and destination layout would overstate this bounded trace. No Pi or firmware execution was used.
