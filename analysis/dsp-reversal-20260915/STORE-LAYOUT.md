# C674x coefficient store/load layout

[TI SPRUFE8B, `LDNDW` and `STNDW` descriptions; STNDW examples on printed page 518](https://www.ti.com/lit/ug/sprufe8b/sprufe8b.pdf) establish the pair convention. In `odd:even` register notation such as `B1:B0`, the **even register contains the low 32 bits** and the odd register the high 32 bits. The `STNDW A3:A2` example lays A2's four little-endian bytes at the lower memory addresses and A3's four bytes above them. `LDNDW` reverses that mapping: lower memory word enters the even register. Scaled bracket offsets `[n]` for doubleword accesses mean `8n` bytes; parentheses `(n)` mean unscaled bytes. Word accesses such as `STW *A4[2]` use `4n` bytes. Unaligned doubleword operations still transfer eight adjacent bytes; they do not reverse pair order.

The AZ AIS commands parse as little-endian 32-bit words (`0x41504954` magic and TI opcodes), and the corrected TI `dis6x` listing labels all extracted sections `Little Endian`. The `dsp.private.elf` used for disassembly is a locally wrapped artifact, so its ELF header alone is not independent chip evidence. The original AIS word order plus successful C674x disassembly under little-endian decoding support this layout; no live DSP memory read has been taken.

At coefficient writer `0x11813a68`, the A4 output pointer comes from entry A6 (saved as A12), and B4 from entry B6 (saved as B11). The stores are:

| Site | Store | Memory words |
| --- | --- | --- |
| `0x11813ae2` | `STW B0,*A4[2]` | `A4+8 = B0` |
| `0x11813ae4` | `STNDW B1:B0,*A4(0)` | `A4+0 = B0`, `A4+4 = B1` |
| `0x11813ae8` | `STNDW A1:A0,*B4(0)` | `B4+0 = A0`, `B4+4 = A1` |

Writer `0x11813af0` repeats the same **three-word plus two-word** layout at `0x11813b62`, `0x11813b64`, and `0x11813b76`. Its A4 and B4 output pointers likewise come from entry A6 and B6 (saved as A11 and B11). `B0` is generated before the three-word stores and `B1` before the pair store. These first three words have the structural form **`[B0, B1, B0]`** in little-endian memory; the two-word region is **`[A0, A1]`**. This is a symmetric coefficient shape consistent with a second-order filter, but an effect identity and exact transfer function require the separate recurrence proof.

Sampling routine `0x118142f8` receives a three-word pointer in **B8** and a two-word pointer in **A10**. Its entry packet moves B8 to B4 and A10 to A5. At `0x1181430e`, `LDNDW *B4(0),A3:A2` reads words 0–1 of the three-word region; `0x11814316 LDW *B4[2],A7` reads word 2. At `0x11814320`, `LDNDW *A5[0],B5:B4` reads the two-word region. Later `SPDP` sites widen these single-precision coefficients into double-precision working registers before the `MPYDP`/`ADDDP` recurrence operations. Therefore the writer/store shape and reader/load shape match **three feedforward-like words plus two feedback-like words** at the static interface. Full call-argument provenance and recurrence semantics remain under review.

One route-6 handoff reaches `0x118142f8` through `0x800187c0` at `0x800176ac`/`0x800176c4`. Before the first call, B8 is loaded from B15[8] and A10 from B15[7]; before the second, B8 comes from B15[10], while A10 is loaded from B15[9] in the call's execute packet. `CALLP` inserts an implied NOP5, and normal load results have four delay slots (SPRUFE8B), so the parallel load has time to reach the callee, but a full caller-to-writer pointer equality map should still be checked across the route's stack stores. This report confirms **layout compatibility**, not a runtime coefficient snapshot or bit-perfect audio result.
