# Beat selector dispatch, static checkpoint

Source: `local/dsp-review-20260915/dsp.private.asm` (TI C674x listing). Addresses below are **virtual addresses**, not file offsets. B14 is `0x11803000` (`0x1181f76c-770`); `LDHU/STH *+B14[n]` addresses `base+2n`, and `LDW/STW` addresses `base+4n`. This report keeps command-89/90 dispatch separate from the six-route command-83 selector.

## Input and initialization

`0x1180e644-0x1180e658` reads command halfword 89 from `0x11800a00+178 = 0x11800ab2` and persistent halfword 503 at `0x118033ee`. `0x1180e6f0-0x1180e700` analogously reads command halfword 90 at `0x11800ab4` and persistent halfword 502 at `0x118033ec`. The same reader updates state 503 at `0x1180e838` and state 502 at `0x1180e868`; neither is solely a raw command copy because intervening comparison and mode logic branches exist. Initialization `0x1180e2cc-0x1180e2d8` zeros state 502, state 503, and word 10. This is a startup/reset writer, not yet proof of a per-selection tail reset.

## Primary state-503 direct chain

`0x1180d2b0-0x1180d2bc` reloads state 503 and writes word 10=0 and word 196=0. The branch at `0x1180d2c4` skips a call at `0x1180d2d4` when state 503 is nonzero; the zero path calls `0x1181fdb0`, a jump stub to `0x80013a00` (`0x1181fdb0-bc`). This makes case 0 a real route, but it is outside the 1..13 conditional chain. Cases 1..13 are each an explicit equality test followed by a conditional direct call (machine-readable sites in `beat-dispatch-cases.json`). The listing also shows state503=98 comparison at `0x1180d4aa-ac` and conditional writes to words 198/197 at `0x1180d4b0-b4`; that is **post-dispatch state handling**, not an algorithm case in the 1..13 chain. Since `B0` is reloaded at `0x1180d498`, the 98 comparison applies to state 503 on the case-13 path and to the most recently loaded state 503 otherwise.

Some cases share a direct target: 8/9 both call `0x1181fd60`, and 11/12 both call `0x1181fd40`. Cases 1, 2, 6..12 call 16-byte jump stubs in `.text3` at `0x1181fd40-0x1181fdbc`: `MVK B31; MVKH B31; B B31; NOP`. Their next target is in the bundled `.text7/.text8` region at `0x8000...`. `MVKH` replaces the upper halfword; e.g. case 2 stub `MVK 0xfffff3c0; MVKH 0x80000000` resolves to `0x8000f3c0`. Cases 3, 4, 5, 13 call actual `.text4` functions at `0x11823240`, `0x11822240`, `0x1181fdc0`, `0x11824160`; each begins with a call to `0x1181fb00` and has further bodies, so the direct target is not the complete numeric algorithm.

The chain is a sequence of compares, not one jump table. Each match calls its target and then reloads state503 before the next comparison; evidence does not yet show whether a callee can alter state503 during this pass. Cases 1..5, 11, 12 set word10 and/or stack flags on their matched paths (`0x1180d30c`, `0x1180d330`, `0x1180d354`, `0x1180d368-382`, `0x1180d3b4-cc`, `0x1180d460-482`); case13 writes word10 at `0x1180d4a4`. Case5 additionally derives word196 from halfword514 at `0x1180d394-cc`. The stack flags select subsequent calls at `0x1180d570-0x1180d5a0`. This is selector-conditioned state logic; the meaning of those calls requires a separate numeric trace.

Before this chain, `0x1180d170-0x1180d1ac` bypasses `0x1180e9e4` for selector 4, 11, 12, 13, and calls it for others. `0x1180d5a4-0x1180d5d0` branches between `0x1180bd54` and `0x1180bde4` with the same selector set. These are selector-conditioned auxiliary branches, not replacement dispatch targets.

## State-502 nested paths

State 502 is separately consumed by four small routines in the main chain: `0x1180dd60-0x1180de08` checks case 9, `0x1180de08-0x1180dea8` checks case 10, `0x1180deb4-0x1180df60` checks case 4, and `0x1180df6c-0x1180dfd0` checks case 7. The first two wrap conversions and `0x1180cfe0`; case 7 calls `0x1180e9e4`, `0x1180cfe0`, then `0x1180e9e4` again (`0x1180dfa8-0x1180dfc8`). IRQ8 sequence `0x1181af2c`, `0x1181af40`, `0x1181af70` calls these routines after `0x1180e644`. The same `0x800101d4-0x800101e8` body reads state502 and gates work by command90 equality inside a larger numeric target. These are auxiliary/nested mode branches, not a proven complete enumeration of 502 values.

## State and tail boundaries

`0x1180d4b8-0x1180d4d8` advances state word224 using words222/223 and a 0xb0 increment. `0x1180d4e0-0x1180d56c` clamps/updates words196, 197, 200 and calls `0x11824d74` and `0x11824d20`. `0x1180d5d4-0x1180d6ce` reads words205/198, calls `0x1180bd54` or `0x1180bde4`, and enters a two-output double-precision SPLOOP. Its buffers are static absolute addresses in the `0x1183...` region, but the exact field semantics and sample count require packet/ILC work. No effect names are assigned.

This completes the **primary selector-to-first-target gate** (0, 1..13, plus special 98 state handling). It does not prove all nested branches inside each target, numeric behavior, or physical hardware behavior. Particularly, no named Beat FX mapping follows from case order alone.

## Direct-edge verification

`verify_beat_edges.py --listing /path/to/corrected-dis6x-listing` checks all 14 recorded CALLP sites and the simple B31 jump stubs against a user-supplied listing. It does not verify compare predicates, state semantics, complete control flow or effect identity. All 14 direct calls and 10 case-associated stub destinations passed against the private corrected listing.
