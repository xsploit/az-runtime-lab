# Filter 0x118142f8: persistent state layout

Static evidence from the corrected compact-aware TI C674x listing. This map complements [block scheduling](FILTER-BLOCK-SCHEDULE.md) and [pointer provenance](FILTER-CALL-ALIASES.md). It does not establish native floating-point parity or every caller's memory separation.

The state pointer passed in entry A4 is copied to B10 at0x11814314. It addresses twelve doubleword slots:96 bytes total. The input/output lanes are entry A6→A8 (pA→pC) and entry B4→B6 (pB→pD). These entry names differ from registers reused later in the prologue.

| Slots | Meaning on the reviewed path | Evidence |
|---|---|---|
| S0,S1 | Cached initial accumulator pair for pB→pD when mode is zero | Loads14348/14328; new nodes produced14508/1450c, stored14548/14530 |
| S2,S3 | Cached initial accumulator pair for pA→pC when mode is zero | Loads14354/14330; new nodes produced14510/14514, stored1454c/14534 |
| S4,S5 | Last two pB input values, captured before processing overwrites buffers | Input loads14418/1442c; stores14440/14450 |
| S6,S7 | Last two pA input values, captured before processing overwrites buffers | Input loads1440e/14428; stores14434/14448 |
| S8,S9 | Last two pD output-memory values, reloaded after block stores | Loads1452c/14540; stores14558/14554 |
| S10,S11 | Last two pC output-memory values, reloaded after block stores | Loads14544/14528; stores14560/14550 |

Addresses in this table omit the common0x11800000 prefix. Each slot i is at state_base+8*i. The history indexes are20 and21 within the22-doubleword block. ADDAD index0x14 at14400/1451c/14524 means160 bytes, not20 bytes.

## Why both accumulators and raw history exist

Mode zero loads S0..S3 directly. The alternate initialization path recomputes initial accumulators using old input/output histories S4..S11 and the current widened coefficients. This statically supports reinitialization from retained history; the caller conditions that request it must be traced separately before naming it a coefficient-change or bypass policy.

The epilogue preserves calculated next-block terms, not simply the final emitted sample. S0 receives ADDDP14508's A31:A30; S1 receives SUBDP1450c's A29:A28; S2 receives ADDDP14510's B3:B2 through the half-register copies14538/1453a into A7:A6; S3 receives SUBDP14514's B31:B30. The ADDDP/SUBDP instruction tree and its rounding order must be preserved in any later numerical implementation.

## Ordering and alias limits

Input histories are loaded before the core's output stores. Output histories are explicitly reloaded from memory after the final stores14518/14520. They equal the corresponding emitted output values if no cross-lane, state, or external write replaces that address before reload. Input/output same-base alias alone does not invalidate the result. Arbitrary overlapping output ranges are not established safe.

A private packet-phase provenance model currently derives both mode branches,22 stores per lane and all twelve state writebacks from reviewed inventories. Its nine instruction-mutation guards reject changed operands, predicates, memory bases, setup count and prologue/core/writeback instructions. Two additional injected-provenance checks reject an uncertain ancestor and an incorrect initialization tree. The final ancestry gate now fails for uncertainty in either half of any emitted sample or any of the twelve state slots. Both mode branches pass this gate; this is a structural provenance check, not numerical execution. That is an internal cross-check, not a public reproduction tool or independent arithmetic oracle; the full model still requires review before publication. Mixed-half intermediate reads are recorded and require explicit ancestry review. No live/audio validation follows from this state map.
