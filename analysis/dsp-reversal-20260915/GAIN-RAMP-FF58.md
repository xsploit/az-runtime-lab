# 0x1180ff58: two paired-buffer gain-ramp regions

Source: corrected TI C674x listing. This local trace establishes arithmetic and state roles, not a named master, channel fader, EQ, or crossfader stage. Its saved-return branch is documented in [INDIRECT-PROVENANCE.md](INDIRECT-PROVENANCE.md).

## Scalar ramp setup

`MVK 0x2e8c,A8` at `0x1180ff94` and `MVKH 0x3d3a0000,A8` at `0x1180ffa4` form binary32 bits `0x3d3a2e8c`, numerically **0.04545454680919647** (approximately 1/22). The first prior scalar is B14 word77 (`0x11803134`), loaded into A7 at `0x1180ff80`. A table-derived target is loaded into B7 at `0x1180ff8a`. `SUBSP B7,A7,A3` at `0x1180ffa0`, then `MPYSP A8,A3,A6` at `0x1180ffb4`, form a rounded difference and step:

```text
step = round_sp(0.04545454680919647 * round_sp(target - previous))
```

The second region loads prior word78 (`0x11803138`) into A7 at `0x11810004`. B8 holds its separately loaded target from `0x1180ffc8`; subtraction at `0x11810008` and multiplication at `0x11810020` construct the same ordered step. These target values are raw words interpreted by SP arithmetic; their upstream table semantics and valid ranges remain unproven.

## Buffer operands and visible arithmetic

The first region constructs source/destination pointers `0x11839cb0` and `0x11839d60` at `0x1180ff8c/ffa8` and `0x1180ffb0/ffc0`. The second uses `0x11839e10` and `0x11839ec0` at `0x11810010–24`. MVKH replaces the upper halfword; it does not add a signed low halfword.

Each loop reads a doubleword through each advancing pointer, updates the scalar with ADDSP, widens/multiplies with MPYSPDP, and stores a doubleword back through the corresponding base stream. First-loop sites are `0x1180ffd0/ffd2` (loads), `0x1180ffd4` (ramp add), `0x1180ffe0/ffe8` (mixed-precision products), and `0x1180ffee/fff2` (stores). Second-loop sites are `0x1181002e/10034`, `0x11810030`, `0x11810038/10044`, and `0x1181004a/1004e`.

The pointers therefore identify **two in-place streams per region**, not a simple copy from one listed address to the other. Exact iteration-to-load/product/store alignment requires SPLOOP scheduling analysis; the visible add and multiply opcodes alone do not prove which ramp sample multiplies each input sample. Both regions load ILC from 22 minus 1 and enter SPLOOPD 4, but an exact physical store count is not asserted here.

## Persistent target writeback

After the first kernel, `STW B7,*+B14[77]` at `0x1180fff4` writes the target to the persistent prior-value slot. After the second, `STW B8,*+B14[78]` at `0x11810050` does the same. These writebacks preserve the target rather than the repeatedly accumulated A7. That distinction matters: repeated rounded adds need not end at exactly the target's bits.

This establishes target-difference smoothing followed by mixed-precision gain-like multiplication on the reviewed path. It does not establish upstream parameter units, table identity, signal/channel placement, bypass behavior, exact loop phase, live rounding mode, or audible parity.

## Table address arithmetic and curve selector

The [host control bridge](GAIN-CONTROL-BRIDGE.md) identifies command45 as the CrossFaderCurve setting path. Let `s = command45 & 3`, `p = unsigned_halfword(0x1180340a)` (B14 halfword517), and `base = 0x80004000`. EXTU at `0x1180ff78/ff90` forms `s << 12`. TI SUBAW/ADDAW syntax is **src2, src1, dst**: it shifts the second printed operand by two, not the first. Thus the two target-word addresses are:

```text
first_target_address  = base + 4096*s + 4*(1023-p)
second_target_address = base + 4096*s + 4*p
```

Evidence: SUBAW at `0x1180ff7c`; base addition at `0x1180ff88`; LDW word index1023 at `0x1180ff8a`; ADDAW at `0x1180ff98`; base addition at `0x1180ffac`; LDW index0 at `0x1180ffc8`. The last load shares an execute packet with a B4 overwrite, so it reads the prior table pointer. Arithmetic is register-width arithmetic; these expressions do not establish bounds on p.

**If p is within0..1023**, each selected bank contains1024 word positions and the two reads traverse it in opposite directions. That condition still needs a producer/clamp trace. Four possible banks follow from the two-bit selector; this does not prove four user-selectable curves or initialization of every bank. Table coefficient values and audible response are not yet established.

Instruction semantics reference: TI C674x CPU and Instruction Set Reference, SPRUFE8B, ADDAW printed page122 and SUBAW printed page537. No native/audio parity is claimed.

### Position writers and current bounds

Three explicit B14-halfword517 stores appear in the corrected listing:

| Store | Value source | Bound established at this store |
|---|---|---|
| `0x80014038` | command halfword3 at `0x11800a06`, loaded at `0x80014028` | unsigned16; upstream restrictions unresolved |
| `0x11819e18` | `EXTU B20,20,22` at `0x11819e08` | source bits2..11, hence0..1023 |
| `0x80014648` | zero from `MVK 0,A1` at `0x800145da` | zero |

These are explicit addressing matches, not a proof against aliased pointer writes. The raw command writer prevents claiming a global10-bit invariant from the compute writer alone. Next steps are the command3 producer/domain, the compute-path input provenance, and table initialization/content. The1023 constant in the gain reader is an index offset, not a clamp instruction.

## Recovered static table shapes

The AIS section loaded at `0x80000000` spans0xf3c0 bytes, including the three banks selected by the reviewed application-setting mapping. The target words are consumed by SUBSP, supporting binary32 interpretation. Direct little-endian binary32 inventory gives:

| Encoded selector | Address | Distinct levels | Reaches1 at index | Observed shape |
|---|---|---:|---:|---|
| 0 | `0x80004000` | 1024 | 1023 | Strictly increasing from0 to1 |
| 1 | `0x80005000` | 411 | 410 | Nondecreasing, then stays1 |
| 2 | `0x80006000` | 2 | 1 | Index0 is0; all remaining entries are1 |

All1024 values in each bank are finite and within0..1. These are initial firmware-section contents, not proof that no runtime writer changes them. Selector3's address region is not established as a fourth user curve. The three recovered shapes do not by themselves supply UI labels, a mathematical generating formula, or audible parity.

Reproduce the aggregate check with your own extracted section; no table payload is included in this repository:

```sh
python analysis/dsp-reversal-20260915/summarize_gain_tables.py \
  /path/to/sec_80000000.bin --section-address 0x80000000
```

The tool reports aggregate properties only and exits unsuccessfully for incomplete banks or invalid gain-data properties. Reviewed private-section results match the table above; bounded mutation checks reject a truncated third bank and a nonfinite first-bank entry. This probe does not verify firmware identity/CRC, position range, active runtime selection, or exact ramp sample alignment.

## MCU position transport and bounded compute writer

The MCU filler reads position RAM halfword `0x20026f1c` at0x18dfa and writes it directly to transmit-frame byte6 at0x18dfc, i.e. command halfword3. The byte0x200031a5 gate must equal1. No mask is applied at that fill site. A separate MCU validator0x18496 participates in a status/history path through caller0x18544; no evidence makes it a gate on this transmission.

The later DSP compute path masks command3 to ten bits at0x118198a8 before buffering. The exact freshness/routing of every downstream buffer entry remains unresolved. The position reduction initializes B20=0 and B2=4 (0x11819a64/19a54), reads consecutive halfwords via A20 starting at0x1183d3c8, and performs:

```text
accumulator = 0
for each of four loaded entries x:
    accumulator = (accumulator + x) & 0xffff
position = (accumulator >> 2) & 0x3ff
```

Key sites: LDHU0x11819c34; ADD0x11819c68; EXTU0x11819c88; pointer increment/counter decrement0x11819ce0/19ce4; conditional loop branch0x11819da0; final extraction/store0x11819e08/19e18. The MV A26,B4 at0x11819c80 shares a packet with EXTU B4 at0x11819c88, so the latter reads the prior sum, not the buffer pointer A26.

For four entries each within0..1023, there is no16-bit wrap, and the result is the floor of their arithmetic mean. For arbitrary entries it is the masked reduction above, not a saturating average. The final extraction always bounds this writer's result to0..1023. It still does not constrain the earlier direct command3→state517 writer. Initialization ordering and upstream RAM-writer bounds remain open before claiming every gain-table access is in range.

## Normal source bound recovered

MCU routine0x614 reconstructs five packed10-bit values from an eight-byte receive buffer at0x20261ce4. Its fifth store, STRH at0x656 to0x20026f1c, is exactly:

```text
position = (unsigned_byte5 << 2) | (unsigned_byte6 >> 6)
```

The direct Thumb decode at0x64c–656 proves the two byte loads, right shift, shifted OR and halfword store. All65536 possible byte pairs produce values0..1023, including1023. The first four decoded values occupy the preceding four halfwords; no physical sensor identity is assigned solely from this layout.

This closes the normal decoded-source→MCU RAM→command3 bound. The raw DSP writer is at0x80014020 (store0x80014038), reached by thunk0x1181fbc0 and direct call0x1181ebd8 in an initialization sequence. It must not be confused with thunk0x80014000, which targets numeric helper0x1181f460. The bounded compute routine0x11819880 is a direct IRQ8 target at0x1181ae8c, earlier in that sequence than the gain routine call0x1181af5c.

Consequently the identified source path is safe with respect to the1024-entry index domain even though startup copies the halfword without masking. This is a conditional source-path proof, **not a global firmware invariant**: other indirect RAM writes, startup/frame initialization and false transmit-gate contents remain unresolved. The historical raw-width concern above remains applicable only to inputs outside the established normal source constraints.
