# Shared Beat cases11/12: processing phases

Target0x80010120, selected through thunk0x1181fd40. This map extends [parameter bounds](BEAT-PARAMETER-BOUNDS.md). It describes static control and buffer roles, not a named audible effect or a completed DSP implementation.

| Region | Established role | Open behavior |
|---|---|---|
| 0x80010500–105ac | Path-dependent floating controls written to words197/198 | Complete entry predicates and piecewise formula |
| 0x800105b4–10620 | Difference/scale state, transfer calls and progress updates | Exact transfer completion and wrap policy |
| 0x800106e4–108d4 | First two-pass, two-stream SP gain phase | Software-loop sample/ramp alignment and state gates |
| 0x80010910–10ad4 | Second two-pass SP gain phase using separate state and buffers | Same scheduling limits; distinct state means no assumed identical effect |
| 0x80010b20–10bb8 | SP mixer with ramp/clamp state and two output stores in its kernel | Complete scalar equation and physical store schedule |
| 0x80010bc4–10c08 | Post-processing state update and epilogue call | Full condition tree for word204 |

## Buffer/control inventory

The first gain phase starts with bases0x1183bbb0 and0x1183bc08; its advancing load/store pairs share their respective bases. The second starts with0x1183ba50 and0x1183baa8. Each pair is separated by88 bytes. Both phases advance bases44 bytes per outer pass. Their gain-step/current-state inputs are respectively B14 words41/42 and39/40. Loads and arithmetic are single precision. These are buffer identities, not physical channel labels.

Each outer counter starts at2, decrements to1 then0, and controls its backward branch. At0x800108ca and0x80010aca, a pointer ADD shares a packet with a counter SUB. The SUB reads the saved old counter in B1; it does not subtract from the pointer written by the parallel ADD. The first counter is initialized at0x800106bc/106e0; the second fallthrough sets its count before0x80010908. Branches0x800108d4 and0x80010ad4 close the two-pass loops.

Both inner phases set ILC10 and use SPLOOPD4. The final mixer sets ILC21 and uses SPLOOPD8. Under the applicable minimum-loop-count rule these program11 and22 logical iterations respectively. Logical iteration counts must not be presented as independently verified physical store counts: compact SPKERNEL prologue, stage masking and drain alignment remain under review.

## Timing-sensitive control distinctions

At0x80010500 a protected load of halfword514 is issued into B3. Fetch-header PROT inserts four NOP cycles, so comparison0x80010504 reads the loaded value. BNOP0x80010508 inserts three NOP cycles regardless of predicate, allowing later comparison0x80010510 to read the new value. Both comparisons can use halfword514; the remaining branch paths still require tracing before deriving the full formula.

At0x800105b4 the subtraction reads the old B5 while a parallel load replaces B5 from stack slot3. The later multiplication0x800105c4 consumes the newly loaded factor. Register reuse does not imply multiplication by the same value used in the subtraction.

Transfer thunks0x80013fa0/13fb0 lead to0x11816060/11816180; wait/ack thunk0x80013fd0 leads to0x11815ecc. Those calls establish dependencies on transfer machinery, not a standalone software-only signal path. The final mixer reads words203/186/187/204/43, updates an accumulator, clamps it and uses four incrementing input load pointers to produce two outputs. Runtime aliasing of those pointers is unresolved. Its MVD delays and reused product registers still prevent a verified sample equation.

At0x80010c04 the routine writes word204. CALLP0x80010c08 targets the epilogue thunk0x80013fc0→0x1181fae0; the latter restores saved registers and returns. The setup at0x80010c20 belongs to the next routine. This closes the observed body boundary while leaving branch/state semantics and exact arithmetic coverage explicitly incomplete. No RX3 symbol match or live/audio parity is asserted.

## Conversion/address subpath

The helper called at0x80010674 and0x80010698 is now an [exact match to TI unsigned conversion](RUNTIME-FIXFU.md). For the values actually consumed by each INTSPU, the ordered local calculation is:

```text
u = INTSPU(source_word)
t = MPYSP(binary32_bits_0x42306667, u)
v = ADDSP(t, t)
index = matched_fixfu(v)
address = A10 + 4*index - 1056       # 32-bit address arithmetic
```

The first path's INTSPU/MPYSP/ADDSP are0x80010658/10664/1066c; its address calculation/store is0x8001067c–10684 (word35). The second is0x80010678/10688/10690 with address calculation0x800106b0/106c4 and word37 store0x800106d8. A10 here is the pre-loop address base, not the later two-pass counter using the same register.

The first INTSPU consumes halfword505: LDHU0x80010654 is protected by fetch-header PROT, inserting four NOP cycles before INTSPU0x80010658. This ordered arithmetic includes doubling before conversion and truncation semantics; it is not simply44.1 times a guessed parameter rounded to nearest. The byte-address result does not establish the parameter's units.
