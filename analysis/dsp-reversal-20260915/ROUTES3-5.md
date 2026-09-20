# Route selectors 3 and 5: bounded static map

Source: corrected TI disassembly `../dsp-review-20260915/dsp.private.asm`. Addresses below are instruction addresses. Compact `||` packet members read pre-packet register values; branch delay and software-loop scheduling are not flattened into sequential pseudocode.

## Dispatch and guards

The caller at `0x11819050` loads `B14[160]` into `B10` after its preceding processing loop. `CMPEQ 5,B10` at `0x1181908c` gates `CALLP 0x11807e00` at `0x11819094`; `CMPEQ 3,B10` at `0x118190a4` gates `CALLP 0x11808bc0` at `0x118190ac`. A preceding `B14[160]=1` routes to `0x11806900`, `=2` to `0x11805000`, and following `=4/6` to tiny targets `0x1181fcf0/0x1181fce0`. This proves selector routing, not acoustic feature identity. The caller then invokes `0x1180f428` at `0x11819110` for the common continuation when its `B12` flag is set (`0x118190f0`–`0x11819118`).

Both route targets enter through `CALLP 0x1181fb00` (`0x11807e00`, `0x11808bc0`), read `B14[218]` (`0x11807e04`, `0x11808bc4`), and compare it to 1. Route 5 branches past its initialization to `0x11807ff4` on failed comparison (`0x11807e10`). Route 3 branches to `0x11808eb8` (`0x11808bd8`). The common `B14[218]` word is thus a one-time or readiness guard candidate, but its lifecycle and name are not yet proved.

## Selector 3 target `0x11808bc0`

This target additionally reads unsigned halfword `B14[516]` at `0x11808bc8`, stores it to `B14[362]` at `0x11808be0` on the enabled path, and branches on a comparison to `0x200` (`0x11808bd6`–`0x11808c00`). `INTSPU`/`INTSP` and `MPYSP` at `0x11808bec`–`0x11808c44` derive a floating control value; because predicated branches overlap their delay packets, a single path arithmetic formula is not yet established. The value is placed in stack local `[7]` at `0x11808c80`. A parallel `CALLP 0x1181b0a0` at `0x11808c48` is visible in setup.

The setup constructs numerous state addresses under `0x1183....` and writes constants and zeros (`0x11808c4c`–`0x11808d70`), including one floating value at `B14[180]` (`0x11808d44`). It calls `0x1181fa60` at `0x11808d74`. Subsequent scalar operations combine values loaded from stack and `B14[180]`: `MPYSP` at `0x11808da0`, `0x11808da4`, `0x11808dac`, `0x11808db0`, `ADDSP` at `0x11808db8`. The target calls `0x11813a68` twice (`0x11808dc8`, `0x11808dd4`), `0x11813af0` twice (`0x11808e00`, `0x11808e08`), then `0x118147f4` four times (`0x11808e14`, `0x11808e20`, `0x11808e28`, `0x11808e30`). The branch at `0x11808e84` repeats this helper block from `0x11808d68` while `A0` remains nonzero; the listing does not yet establish the starting count. These are verified processing edges; their internal semantics and data-flow to the shared output remain to trace. At `0x11808eb4` it stores zero to `B14[218]` on the visible completion path, then continues at `0x11808eb8` through a second halfword-conditioned stage; the failed initial guard also lands there. Thus this is not a simple init-only routine.

## Selector 5 target `0x11807e00`

The enabled path constructs many state addresses `0x1183....` at `0x11807e14`–`0x11807ed8`. It reads a halfword from `0x1183d2e0` at `0x11807ed8`, compares against constants `0x1fc` and `0x204` (`0x11807ee0`–`0x11807efc`), and takes branches to initialize a floating state word at `0x1183d0a0` (`0x11807f4e`/`0x11807f54`). One path converts the difference via `INTSP` and `MPYSP` (`0x11807f08`–`0x11807f44`). This shows range-conditioned control initialization, not a proven audio parameter unit.

It zeroes multiple state words at `0x11807f58`–`0x11807f86`. A short `SPLOOPD 1`/`SPKERNEL` at `0x11807fa0`–`0x11807fa4` contains `STDW B1:B0,*B4++[1]` at `0x11807fa2`; exact repeated byte coverage cannot be obtained from the one-line listing alone. The outer setup loop tests `A0` and branches back to `0x11807ed8` at `0x11807fb8`; pointer increments appear in its delay sequence `0x11807fc0`–`0x11807ff0`. On completion it stores zero to `B14[218]` at `0x11807ff0`, then continues at `0x11807ff4` rather than returning. This continuation includes further calls `0x1181fa60` (`0x118081e0`), `0x1181f8e0` four times (`0x11808458`, `0x11808534`, `0x118086a0`, `0x11808784`), `0x1181c960` (`0x118088d4`), and `0x1181caac` (`0x118089f4`). Later software loops occur at `0x118088c0`, `0x118088ec`, `0x11808a32`, and `0x11808b20`; a final `CALLP 0x1181fae0` at `0x11808b98` precedes return.

### Selector-5 selected-output ownership

The route materializes the common paired output bases directly at `0x11808294-0x118082ba`: stack slots 25 and 26 receive `0x11838f70` and `0x118390d0`, respectively. Its channel offset in stack slot 17 begins at zero at `0x1180806c` and advances by `0x58` bytes at `0x11808b60-0x11808b8a`; the outer index advances from zero by four until 16, establishing four output slices.

On the selected processing path, `0x1180884c` reloads base `0x118390d0` and `0x11808868` reloads base `0x11838f70`. The route then continues through helper `0x1181caac` at `0x118089f4`. The final weighted paired-output loop at `0x11808a18-0x11808a84` computes destination pointers from those bases plus the current channel offset and stores its two single-precision results directly into:

```text
0x11838f70 + channel_offset
0x118390d0 + channel_offset
```

After the route returns, selector caller `0x118190f0-0x11819118` passes those exact paired slices to common converter `0x1180f428`, whose first software loop reads both and converts them from single to double precision. The bit-reduction/sample-hold/post-filter path therefore owns selected audio consumed by the common output path rather than only side state.

## Confidence and next trace boundary

**High:** selector comparisons and targets, guard reads, state address construction, direct helper edges, floating arithmetic opcodes, and selector-5 pointer provenance into common selected output. **Medium:** guard as initialization/readiness (shared word and clearing support it, lifecycle not yet proved). **Unknown:** semantic control name, complete equations after compact delay scheduling, and audible quality. Selector order or constants alone do not license effect names.
