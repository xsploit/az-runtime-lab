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
