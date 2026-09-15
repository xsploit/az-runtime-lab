# C674x execute-packet semantics for AZ listing

[`group_packets.py`](group_packets.py) converts TI `dis6x` instruction lines into execute packets, recording packet start, instruction sites, predicates, mnemonics, operands, and whether each site has the disassembler's `||` continuation marker. It strips opcode encodings from output and ignores `.fphead` fetch-packet header words as non-instructions. Use, for example:

```sh
python runtime-lab/analysis/dsp-reversal-20260915/group_packets.py --listing /path/to/private/dis6x-listing.asm --start 0x1181a3c0 --end 0x1181a3d8
python runtime-lab/analysis/dsp-reversal-20260915/group_packets.py --listing /path/to/private/dis6x-listing.asm --start 0x1181ae78 --end 0x1181ae94 --json
```

TI's [C6000 assembler guide, SPRU186X §4.6.2](https://www.ti.com/lit/ug/spru186x/spru186x.pdf) says `||` marks an instruction parallel with the preceding instruction. The [C674x CPU guide, SPRUFE8B §§3.4–3.5](https://www.ti.com/lit/ug/sprufe8b/sprufe8b.pdf) distinguishes fetch packets from execute packets: compact opcodes use the fetch header's p-bits, and an execute packet may cross a fetch boundary. The listing itself shows `11805038 B.S1` and `11805040 MV.L1` in one packet across `.fphead` at `1180503c`; the helper preserves this grouping. The public helper groups the whole supplied listing before selecting the requested range, retaining earlier and later peers of every intersecting packet. A listing that is itself truncated can still omit peers.

At AZ `0x1181a3c0`, `SUB.L1 A0,A1,A4`, `0x1181a3c2 MVK.S2 22,B0`, and `0x1181a3c4 ADD.L2X B0,A3,B4` form **one execute packet**. The `ADD` reads the incoming B0; it cannot consume 22 just written by parallel `MVK`. The next packet at `0x1181a3c6` does `ADD.L2 B0,-1,B0`; the packet at `0x1181a3c8`–`0x1181a3d0` then includes `MVC.S2 B0,ILC`. For single-cycle results, the CPU guide says a result issued in cycle *i* can be read in *i+1*. This supports the packet-local ordering but does not by itself solve all register values entering the sequence. A second local example is `0x1181a3c8 ADD.L1 A4,4,A4` parallel with `0x1181a3ca MV.L2X A4,B5`: the move reads pre-packet A4, an easy source-pointer trap.

The toolchain check is reproducible from [`packet_probe.asm`](packet_probe.asm): compile with the installed TI `cl6x -mv6740 -c`, then disassemble with `dis6x`. TI accepts `MVK.S2 22,B0 || ADD.L2 B0,-1,B1` and emits `MVK.S2` followed by `|| SUB.L2 B0,0x1,B1` in one packet. This validates marker direction and normalization, not AZ register values. The probe's `BNOP.S2 B3,5` starts a separate packet.

The [C674x CPU guide's CALLP instruction description](https://www.ti.com/lit/ug/sprufe8b/sprufe8b.pdf) states that `CALLP.S2 target,B3` writes the address of the **next execute packet** to B3 in E1 and inserts an implied five-cycle NOP occupying E2–E6. In AZ, `0x1181ae78 CALLP.S2 0x118101e8,B3`, `0x1181ae80 LDW.D1T1`, and `0x1181ae84 STW.D2T2` are one packet; the next packet starts `0x1181ae88`. Treating the call site as a plain sequential instruction, or treating the parallel loads/stores as post-call steps, misstates the control flow. Top-level `CALLP` targets are direct edges; they do not prove each callee's runtime condition or acoustic role.

`SPLOOPD` at `0x1181a3d4` begins a software-pipelined loop-buffer region and the following scheduled instructions must be read with ILC, prologue/epilogue, masking, and kernel/drain behavior. SPRUFE8B Chapter 7 describes those boundaries and restrictions; the grouping helper marks instruction packets only and does not reconstruct loop iterations. Floating-point instructions and loads have result delays and functional-unit latencies (SPRUFE8B §3.4), so adjacency of source and destination registers across packets is not enough to infer a formula. This is a packet decoder ledger, **not** a cycle-accurate simulator, loop schedule, or audio implementation.

## Predicated BNOP timing must include its inserted NOPs

SPRUFE8B's BNOP displacement description (printed pages165–166) specifies that the predicate controls branch selection, **not insertion of NOP cycles**. A predicated BNOP with a count of3 inserts those three NOPs even on the untaken path. Counts greater than5 have additional taken-branch termination behavior; do not generalize a simple elapsed-time rule beyond the reviewed count/path.

The shared Beat11/12 body's LDHU0x80010500 is also protected by its fetch header (PROT bit20). Four automatic NOP cycles follow it, so CMPGT0x80010504 reads the newly loaded halfword514. The earlier old-register conclusion was wrong because it ignored PROT. BNOP0x80010508 still inserts its own three NOP cycles. Both explicit instruction delays and header-implied delays must be included.

`group_packets.py` groups packets only. Its output is not a timing schedule and does not imply that BNOP, CALLP, NOP or software-pipelined loop packets each consume one cycle.

The companion [packet_stalls.py](packet_stalls.py) reports local explicit stall costs for selected packets: ordinary issue span1, NOP N spanN, BNOP N span1+N, CALLP span6 excluding its callee. It does not accumulate a fictional execution timeline across branches. Unsupported BNOP counts above5 and software-pipelined loop markers are rejected. [Synthetic tests](test_packet_stalls.py) check unconditional predicated BNOP stalls, parallel costs, omitted callee time and rejected path-dependent cases. Applied to0x80010500–10510, it reports spans5,1,4,1,1; hence the later comparison cannot be assigned consecutive-packet timing. Fetch/memory stalls and arithmetic-result latencies remain outside this helper.


## Protected loads: correction to prior timing analysis

SPRUFE8B table3-14 specifies PROT at compact-header bit20. When set, every LD instruction in that fetch packet, including32-bit loads, inserts four NOP cycles. The grouping helper now retains this as `protected_load`; `packet_stalls.py` includes its five-cycle local issue span. Ignoring `.fphead` as an executable instruction is correct; discarding its execution properties is not. Prior timing conclusions built without PROT require re-audit, including private filter and software-loop schedules. Pure address, byte-match and MCU-domain findings are not changed by this issue.


### Scoped impact inventory

Grouping the full corrected listing and then scanning load sites finds:

| Reviewed range | Protected load sites | Implication |
|---|---|---|
| Filter0x11814300–11814564 | None | Its local schedule is unaffected by missing PROT handling. |
| Gain0x1180ff58–11810058 | 0x11810004 | Second region setup has an automatic load stall; first buffered kernel is unaffected by this issue. |
| Beat0x80010120–80010c08 | 0x80010500,10584,10654,10710,107b4,107b6,109e8,109ea | Includes the inner gain kernels, so their proposed sample timing must include protected-load behavior. |

This is a static property inventory, not a count of runtime stalls: parallel protected loads and loop-buffer operation need their actual packet/control rules. In particular, two protected load opcodes in one packet must not blindly be counted as two sequential four-cycle stalls. Source-code byte matches and MCU Thumb decoding do not depend on this C674x header property.
