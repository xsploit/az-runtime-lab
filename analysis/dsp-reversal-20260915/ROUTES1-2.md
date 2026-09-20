# Anonymous DSP selector routes 1 and 2

Source: corrected TI disassembly `runtime-lab/local/dsp-review-20260915/dsp.private.asm`. Program addresses below are DSP addresses. This bounded trace groups selected execution packets using `runtime-lab/local/dsp-crc-sol/group_packets.py`; that helper explicitly does **not** decode instruction latency, delayed writes, branch behavior, or SPLOOP scheduling. Claims about a packet's arithmetic use pre-packet register values for parallel reads, rather than assuming source-order mutation. No effect names are inferred from selector number or RX3 enums.

Address calculation: TI `MVKH` **replaces** the upper 16 bits. For example `MVK 0xffffbd68; MVKH 0x11830000` yields `0x1183bd68`, not a signed addition yielding `0x1182bd68`. All global `0x1183...` addresses in this note use replacement semantics.

At `0x11819050-0x11819080`, persistent state word 160 (base B14=`0x11803000`, absolute `0x11803280`) routes value 1 to `0x11806900` and value 2 to `0x11805000`. The next apparent entries are `0x11807e00` and `0x11806900` respectively, giving bounded code regions `0x11806900..0x11807dfc` for route 1 and `0x11805000..0x118068fc` for route 2. Each begins with `CALLP 0x1181fb00`, reads B14 word 218 (`0x11803368`), and ends near a `CALLP 0x1181fae0`; route 2 has an internal branch at `0x118068f0` back to `0x11805aa0`, so these are **code regions**, not proof of a single linear function body or fixed processing duration.

## Shared and distinguishing state

| Evidence | Route 1 (`0x11806900`) | Route 2 (`0x11805000`) |
| --- | --- | --- |
| Transition state | reads word 218 at `0x11806904`; a branch on `218==1` at `0x11806928-0x1180692c` enters a different initialization path; writes 218 at `0x11806cb8` | reads word 218 at `0x11805004`; branch on `218==1` at `0x11805022-0x11805024` diverts to `0x11805840`; writes 218 at `0x1180580c` |
| Common mode/parameter state | reads word 217 at `0x11806cc0`, compares it with 3 at `0x11806cce`, then writes word 194 (`0x11803308`) at `0x11806cf0`; reads halfword 516 (`0x11803408`) at `0x11806d50` | reads word 217 at `0x118058f8`, compares it with 3 at `0x11805902`, then writes word 194 at `0x11805930`; reads halfword 516 at `0x11805010` and `0x11805800` |
| Other B14 working words | reads/writes word 195 (`0x1180330c`) at `0x11806968`/`0x11806db8` | reads/writes 174 (`0x118032b8`), 175 (`0x118032bc`), and 195 (`0x1180330c`) at `0x1180589c-0x118059b8` |
| Packet-grouped bounded ramp loop | `0x11806cf4` sets 22, `0x11806cf8` decrements to ILC 21, `SPLOOPD 8` at `0x11806d10`; `ADDSP`, upper/lower `CMP*SP`, and `STW` kernel at `0x11806d14-0x11806d32` target a global pointer built from `MVK 0xffffbd68; MVKH 0x11830000` = `0x1183bd68` | `0x11805928` sets `0x16` (22), `0x11805944` decrements to ILC 21, `SPLOOPD 8` at `0x11805950`; parallel A/B `ADDSP`, upper/lower compares, and kernel stores at `0x11805954-0x11805984` use a pointer built from `MVK 0xffffc1e0; MVKH 0x11830000` = `0x1183c1e0` |

The word-217 branch selects positive/negative floating-point bit patterns near `0x11806ce0-0x11806cf0` and `0x11805908-0x11805924`. Those values feed clipping/transition calculations, but a named parameter, sign convention, and exact effect transfer function are not established. `SPLOOPD` and ILC strongly support a 22-iteration scheduled loop; packet grouping alone does not prove exact memory-write order within the software pipeline.

## Numeric signatures and buffers

Route 1 constructs many working pointers in `0x1183cxxx` and `0x1183dxxx` global regions at `0x118069a0-0x11806aa0`. It contains two direct call sites to `0x118140a4` at `0x11806b84/0x11806b88`, then runs an early SPLOOP at `0x11806bd4`. Its later code has repeated single-precision multiply/add/subtract operations (`MPYSP` begins at `0x11806f6c`, `ADDSP` at `0x11806f88`, `SUBSP` at `0x11806ff0`), mixed with vector/doubleword loads and stores. In four later regions, it calls `0x11810060` and `0x11818f20` (for example `0x11807408/0x11807420`, `0x11807588/0x118075a0`, `0x118076d8/0x118076f0`, and `0x1180790c`/`0x11807848` on separate paths). The listing contains 17 `SPLOOPD` sites in the route-1 region, including `0x11806bd4`, `0x11806d10`, `0x11807192`, `0x11807468`, `0x118075e6`, and `0x11807c8e`. These are evidence of staged sample/buffer math, not of a particular named filter topology or channel count.

Route 2 starts with state halfword 516 and a boundary conversion: `0x11805030-0x118050e8` compares it with a threshold, converts it to floating point, and multiplies/adds constants using `MPYSP`/`ADDSP`. It materializes pointers in `0x1183ce..`, `0x1183cf..`, and `0x1183d..` regions (`0x118050ec-0x11805178`). There are four direct call sites to `0x118142d4` at `0x1180570c-0x11805720`, then the state reset/ramp work noted above. Later math has repeated `MPYSP` at `0x11805ab8` onward, `ADDSP`, `SUBSP`, nine `SPLOOPD` sites (`0x11805950`, `0x118060da`, `0x118062b6`, `0x11806348`, `0x11806404`, `0x11806470`, `0x11806520`, `0x118065e8`, `0x118066d4`), and helper calls `0x1181f860`, `0x11813c0c`, `0x11815ecc`, `0x118140c0`, and `0x118161ec` at cited sites such as `0x118060b0-0x118062f4`. This route has a different working-buffer layout and helper pattern from route 1; an exact delay/filter/feedback equation would require additional packet and pipeline scheduling analysis.

The packet helper separates the early route-2 `LDHU state[516]` at `0x11805800` from `STW state[218]` at `0x1180580c` and `STW state[175]` at `0x11805810`; it also separates route-1 `STW state[218]` at `0x11806cb8` from the subsequent `LDW state[217]` at `0x11806cc0`. At `0x11805980`, route 2's `SPKERNEL` and two typed stores are in **one execute packet**; the listing does not establish a serial A-store then B-store. Likewise loop arithmetic and compares in parallel packets use their incoming operand values. Any reconstruction that simulates packet instructions in printed line order risks wrong feedback and ramp-limit behavior.

## Route-1 selected-output ownership

The route-1 tail explicitly joins its processed samples to the paired buffers consumed after selector dispatch. Setup at `0x118071d4-0x118071f0` stores absolute bases `0x118390d0` and `0x11838f70` in stack pointer slots 50 and 49. The channel offset in slot 37 starts at zero at `0x11806d78-0x11806d80` and advances by `0x58` bytes at `0x11807dc4-0x11807dcc` across the four outer iterations.

The final software-pipelined copy/mix at `0x11807c6c-0x11807ca8` loads those two bases and the current offset, reads route-owned final work buffers rooted at `0x1183be70` and `0x1183bec8`, doubles each single-precision result, and stores the pair into:

```text
0x11838f70 + channel_offset
0x118390d0 + channel_offset
```

After the selected route returns, the caller at `0x118190f0-0x11819118` indexes those same two bases in `0x58`-byte strides and passes them to common converter `0x1180f428`. Its first software loop loads one word from each route buffer and converts both from single to double precision. Route 1 therefore owns selected audio delivered to the common output path; its internal delay/all-pass/feedback structure is not merely adjacent state or an unconsumed tail.

## Limits and next evidence needed

These code regions demonstrate two substantial, different single-precision DSP processing routes with stateful initialization and bounded sample/buffer loops. Both routes now have explicit pointer provenance into the common selected-output conversion path. The mapped B14 fields and global buffer addresses are hard static evidence; exact semantic parameter names, every conditional path, complete mathematical equations, and audible quality remain unresolved. The anonymous MCU selector provenance and host control names belong to the separate traces. No DSP code was executed, no Pi used, and no feature or output firmware was built.
