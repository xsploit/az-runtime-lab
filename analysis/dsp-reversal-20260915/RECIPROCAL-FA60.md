# `0x1181fa60`: C674x reciprocal estimate and two refinements

The corrected TI `dis6x` listing shows a compact scalar helper from `0x1181fa60` to `0x1181fa98`. It receives single-precision denominator **d in A4**, seeds **r0 in A5** with `RCPSP.S1 A4,A5`, and returns a refined reciprocal **r2 in A4**. `0x1181fa68 MVK 0,A3` followed by `0x1181fa6a SET A3,30,30,A3` forms the single-precision bit pattern `0x40000000`, or **2.0f**. The exact instruction order is:

| Site | Scalar operation | Value after instruction |
| --- | --- | --- |
| `0x1181fa60` | `RCPSP(d)` | `r0 = approximate_seed(d)` |
| `0x1181fa64` | `MPYSP A5,A4,A6` | `t0 = round_sp(r0 × d)` |
| `0x1181fa70` | `SUBSP A3,A6,A6` | `e0 = round_sp(2.0f − t0)` |
| `0x1181fa78` | `MPYSP A5,A6,A5` | `r1 = round_sp(r0 × e0)` |
| `0x1181fa84` | `MPYSP A5,A4,A4` | `t1 = round_sp(r1 × d)` |
| `0x1181fa8c` | `SUBSP A3,A4,A3` | `e1 = round_sp(2.0f − t1)` |
| `0x1181fa94` | `MPYSP A5,A3,A4` | `r2 = round_sp(r1 × e1)` |

The `BNOP.S2 B3,1` at `0x1181fa92` is an unconditional return; the final `MPYSP` at `0x1181fa94` lies in its branch-delay instruction stream. NOPs throughout space the single-precision result latencies. There is **no explicit zero, negative, NaN, infinity, or range branch** in this helper. [TI SPRUFE8B, RCPSP instruction](https://www.ti.com/lit/ug/sprufe8b/sprufe8b.pdf) specifies a correct exponent with mantissa accurate only through roughly eight binary positions, then gives `r[n+1]=r[n](2−d×r[n])` as the refinement formula. It specifies special outputs/flags for NaN, signed denormal, signed zero, infinity, underflow and overflow. Those hardware results and subsequent arithmetic propagation are part of the behavior; replacing the helper with exact `1.0f/d` is **not** native numeric parity.

Two coefficient routines that call this helper, `0x11813a68` and `0x11813af0`, synthesize the same denominator shape. Both load single-precision constant `c` from `0x37be37c6` (`2.2675736545352265e−5f`) and form `4.0f` from the bit pattern `0x40800000`. For entry arguments **u=A4** and **v=B4**, the instruction-level scalar graph is:

```text
s = round_sp(c * u)
q = round_sp(s * v)
p = round_sp(s * s)
twice_q = round_sp(q + q)
t = round_sp(twice_q + p)
d = round_sp(t + 4.0f)
r = reciprocal_fa60(d)  # RCPSP seed, then two ordered refinements above
```

In `0x11813a68`, `s` is A3 at `0x11813a74`, `q` A4 at `0x11813a84`, `p` A10 at `0x11813a88`, `twice_q` A11 at `0x11813a90`, `t` A3 at `0x11813a98`, and `d` A4 at `0x11813aa4`; call follows at `0x11813aac`. In `0x11813af0`, `s` is A4 at `0x11813b00`, `q` A3 at `0x11813b10`, `p` A12 at `0x11813b14`, `twice_q` A10 at `0x11813b20`, `t` A3 at `0x11813b28`, and `d` A4 at `0x11813b30`; call follows at `0x11813b38`. The next operations use returned A4 to scale/store coefficients. This is recoverable denominator construction, not a recovered effect name.

Mathematically before rounding, `d = 4 + s² + 2sv = (s+v)² + 4 − v²`. If finite `|v|<2`, that expression is strictly positive, but **the listing does not prove a bound on v or u** at all caller sites. Accordingly the expected algorithmic domain is finite, nonzero d for normal reciprocal refinement, while zero/NaN/infinity handling relies on `RCPSP` and floating-point rules rather than explicit guards. This note does not claim the denominator is positive for every reachable controller input.

Each `MPYSP`, `ADDSP`, and `SUBSP` is a separate single-precision operation; there is no fused multiply-add in this helper. Exact bit parity additionally depends on the C674x `RCPSP` seed mapping and the live floating-point control/rounding modes. The helper's ordered equations can be reproduced with an **explicit approximate-seed API**, but a host language's `1/d` seed or double-precision intermediate would erase the native estimate and rounding sequence. No cycle-accurate simulator, DSP execution, or rendered-audio validation is asserted here.
