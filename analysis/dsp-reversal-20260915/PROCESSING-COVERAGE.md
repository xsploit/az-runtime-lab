# AZ DSP IRQ8 processing coverage checkpoint

The TI C674x `dis6x` listing has a continuous IRQ8 wrapper at `0x1181ada4`. Its direct sequence from `0x1181ae78` to `0x1181afd4` contains **53 `CALLP` sites to 45 distinct absolute targets**. The wrapper returns through `IRP` at `0x1181b084`. [Machine-readable ledger](processing-coverage.json) preserves every call site in address order and one entry per distinct target; [builder](build_processing_coverage.py) reconstructs those edges **directly from the TI listing**, without reading the old direct-edge index. Run it with explicit paths:

```sh
python analysis/dsp-reversal-20260915/build_processing_coverage.py \
  --listing /path/to/corrected-dis6x-listing.asm \
  --output /path/to/processing-coverage.json
```

The reconstructed site/target sequence matches the old index exactly as a separate check. The caller site order is a static packet order, not measured execution frequency or a promise that every target runs on each interrupt.

Three direct targets have stronger established cross-file semantics:

| Target | Static role | Evidence limit |
| --- | --- | --- |
| `0x1181d5ac` | SPI/staged-message transport and checksum path | `SPI-AND-INTERRUPTS.md` traces this edge and its transfer calls; full packet-store schedule still pending. |
| `0x1180e644` | staged control reader | `BUFFER-MAP.md` identifies writes to B14 indices 11–14; exact effect meaning unresolved. |
| `0x1181a310` | McASP RX integer-to-floating-point reader | `BUFFER-CONSUMERS.md` derives a normalized 0/1 selector for the 704-byte DMA buffers and documents `SHR`/`INTSP`; exact channel/lane formula unresolved. |

The other 42 target entries are **coverage candidates**, classified from a bounded first-120-**decoded-instruction** window. The builder excludes `.fphead` fetch headers, section headings and labels from its counts. `numeric_processing` means that window contains C674x floating-point arithmetic such as `MPYSP`, `ADDSP`, `INTSP`, `ADDDP`, or `SPINT`; it does not identify an EQ, filter, or Beat FX. Outside the three established targets, `control_state` uses a predefined candidate-address list; it is not inferred automatically from store counts. `wrapper` means the sampled window has direct subcalls and no recognized floating-point opcodes. Both labels are low-confidence leads, not recovered semantics. The ledger records opcode counts, sample span, direct subcalls and register-target branches seen in the span. A span can cross a routine boundary, and these counts are *not* complete per-function counts. The 45 windows contain 57 register-target branch **observations** (overlapping windows can repeat a site), covering 42 unique branch sites, with likely returns flagged separately from other indirect dispatch candidates; none is resolved as a new function merely from the operand. Only the wrapper's explicit `CALLP` operands create the top-level target inventory.

The most important remaining gaps are exact function extents, compact execution-packet/delay-slot control flow, any indirect/register-target calls inside those 45 targets, deeper transitive descendants, state/coefficient ownership, and actual numeric formulas/output stores. The top-level wrapper's 53 immediate calls are enumerated; the *full processing graph* is not yet closed. The wrapper uses EDMA completion low-six-bit acknowledgment and the PaRAM link selector before this sequence, as described in `IRQ8-TRIGGER.md` and `BUFFER-CONSUMERS.md`. No live device observation or audio-quality claim follows from this static coverage.

## Next indirect-edge checks

Eleven unique sampled sites use registers outside A3/B3/IRP/NRP: `0x1180e0a4`, `0x1180f070`, `0x1180f170`, `0x1180f210`, `0x1180ff54`, `0x11810058`, `0x11810cac`, `0x1181a48c`, `0x1181d08c`, `0x1181e4f4`, and `0x1181f158`. These are provenance-review targets, not eleven proven dynamic dispatches: a nonstandard register can hold a saved return address or a constant branch destination. Trace its definitions and packet-old values before adding graph edges.
