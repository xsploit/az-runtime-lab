# Shared route-3 coefficient helpers at `0x11813a68` and `0x11813af0`

Evidence is the corrected C674x listing `local/dsp-review-20260915/dsp.private.asm`. The routines have no sample-buffer load; they operate on binary32 scalar argument registers and store compact coefficient groups. Equations here retain floating32 operation order (`fl(...)` for each `MPYSP`, `ADDSP`, `SUBSP`); they are dataflow forms, not mathematical real-number equivalences or DSP-native bit predictions.

## Shared input/control transform

Both helpers receive scalar `A4`, scalar `B4`, and pointer `A6`, pointer `B6` at entry. Their prologue `CALLP 0x1181fb00` saves registers. They construct bit pattern `0x37be37c6` (`0x11813a6c/70`, `0x11813af4/f8`) in `A3`, and binary32 **4.0** from `MVK 0x81` plus `SHL 23` (`0x11813a78/7c`, `0x11813b04/08`): `0x81 << 23 = 0x40800000`. Python `struct.unpack('<f',struct.pack('<I',bits))` independently decodes `0x37be37c6` as `2.2675736545352265e-05`, `0x40800000` as `4.0`, and `0xc1000000` as `-8.0`. Let `k=f32bits(0x37be37c6)`, `x=entry A4`, `q=entry B4`.

At `0x11813a74/84/88/90/98/a4`, `0x11813af0`'s corresponding sites `0x11813b00/10/14/20/28/30`, both calculate in this order:

```
t = fl(k*x)
u = fl(t*q)
v = fl(t*t)
w = fl(u+u)
d = fl(fl(v+w)+4.0)
r = helper_1181fa60(d)
```

The [reciprocal trace](RECIPROCAL-FA60.md) shows that `0x1181fa60` begins `RCPSP A4,A5`, then Newton-style `MPYSP/SUBSP` updates (`0x1181fa64`–`0x1181fa94`) and returns `A4`; it is a reciprocal approximation/refinement, not an exact binary32 division claim. Both helpers call it with `A4=d` at `0x11813aac` and `0x11813b38`. C674x call delay packets must be honored before consuming returned `A4`.

## `0x11813a68` post-reciprocal stores

After return, the listing computes `z=fl(v-w)` (`0x11813ab0`), `m=fl(v-4.0)` (`0x11813ab4`), `h=fl(v+v)` (`0x11813ab8`), `p=fl(m+m)` (`0x11813ac4`), `n=fl(4.0+z)` (`0x11813ac8`). `A4` still contains returned reciprocal `r` when moved to `B4` and `A6` at `0x11813abc/c0`. The visible multiplied outputs are:

```
B0 = fl(r*v)          0x11813ad0
B1 = fl(h*r)          0x11813ad4
A0 = fl(r*p)          0x11813ad8
A1 = fl(r*n)          0x11813adc
```

The routine moves entry `A6` to `A4` at `0x11813ae0`, writes `B0` to its word index 2 at `0x11813ae2`, then writes `B1:B0` as a nonaligned doubleword at index 0 at `0x11813ae4`. It moves entry `B6` to `B4` at `0x11813ae6` and writes `A1:A0` as a nonaligned doubleword at index 0 at `0x11813ae8`. The index-2 `B0` and pair store are separate observed writes; their layout and possible duplication should be confirmed from `STNDW` addressing semantics before assigning conventional filter coefficients.

## `0x11813af0` divergent store pattern

This routine shares `t,u,v,w,d,r` and uses `r` in every visible product. After its reciprocal call, it computes `m=fl(v-w)` (`0x11813b44`), `p=fl(v-4.0)` (`0x11813b40`), `p2=fl(p+p)` (`0x11813b54`), and `n=fl(4.0+m)` (`0x11813b58`). It builds `-8.0` in `B5` from `0xc1000000` at `0x11813b4a/4c`. Crucially, `SUBSP A12,A10,A4` at `0x11813b44` and `MV.L1 A4,A5` at `0x11813b48` are one `||` packet: `A5` reads the packet's pre-write `A4=r`, while the `SUBSP` writes `A4=m` for later work. The visible products are:

```
B0 = fl(4.0*r)        0x11813b3c
B1 = fl(-8.0*r)       0x11813b50
A0 = fl(r*p2)         0x11813b68
A1 = fl(r*n)          0x11813b6c
```

The first three stored values have the high-pass-like `4r,-8r,4r` pattern; the earlier helper has the low-pass-like `vr,2vr,vr` pattern. Both share feedback-like `2(v-4)r` and `(4+v-w)r`. These are algebraic coefficient signatures, not a proven runtime filter topology or effect identity. It writes `B0` to `A6` word index2 (`0x11813b62`), `B1:B0` to `A6` nonaligned pair at index0 (`0x11813b64`), and `A1:A0` to `B6` nonaligned pair at index0 (`0x11813b76`). The corresponding call sites in route3 are `0x11808e00` and `0x11808e08`, while `0x11813a68` is called at `0x11808dc8` and `0x11808dd4`; route3 later calls a separate helper `0x118147f4` four times (a separately traced 96-byte state clear).

The diagnostic [coefficient relation probe](probe_coeff_relations.py) rounds each visible scalar step to binary32, substitutes an **ideal** `float32(1/d)` for the DSP reciprocal helper, and prints LP/HP signatures plus shared feedback for chosen finite arguments. At `x=1000`, `q=0.7`, it yields `d=4.032260417938232`, `r=0.2479998618364334`; LP `[0.000127518811,0.000255037623,0.000127518811]`, HP `[0.991999447,-1.98399889,0.991999447]`, feedback `[-1.98374379,0.984253943]`. The probe checks structural relationships only; neither RCPSP approximation nor DSP floating-control state is modeled.

## B14 addressing audit and limits

Route3 halfword `LDHU *+B14[516]` (`0x11808bc8`, `0x11808eac`) addresses byte offset **1032** (`2*516`), and its `STH/LDH *+B14[362]` (`0x11808be0`, `0x11808eb8`) addresses byte offset **724** (`2*362`). Word `LDW/STW *+B14[218]` is byte offset **872** (`4*218`); word `[180]` is **720**, word `[160]` is **640**. Earlier map descriptions using bracket indices as bytes, or scaling halfwords by four, must not be carried forward.

**High confidence:** instruction and store addresses, bit constants, packet-old-value `A5=r`, dataflow equations through `MPYSP`/`ADDSP`/`SUBSP`, reciprocal helper edge. **Medium:** `r` as reciprocal refinement (verified opcode sequence but no bit-accurate RCPSP model). **Open:** precise `STNDW` pair memory ordering, call-site pointer provenance into common state, floating control/rounding mode, exact reciprocal and output bits, and runtime topology/effect identity.
