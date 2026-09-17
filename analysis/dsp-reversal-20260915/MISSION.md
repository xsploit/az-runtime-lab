# Full AZ DSP mapping goal

User priority: complete DSP understanding before new features or controller mapping. The active goal remains open across research checkpoints. Legacy library adaptation is separately assigned to Claude; it does not replace this DSP goal. Subagents for this work are explicitly Sol (`gpt-5.6-sol`); the coordinator reviews evidence and owns publication.

## Completion requirements

1. Enumerate processing entry points, reachable code, indirect dispatch and unresolved code/data regions. A count of direct branch targets is not function coverage.
2. Map audio inputs/outputs, sample formats, buffers, timing, routing, cue/master paths, gain, EQ and isolator stages.
3. Map command fields to persistent state and all consumers, including reset, selection, smoothing, bypass, transitions and tails.
4. Identify every Sound Color FX and Beat FX implementation, parameter transforms, coefficient generation, delay memory, feedback, tempo/quantize dependencies and placement.
5. Recover exact arithmetic where possible and verify it through reproducible instruction/numeric probes. Static mapping, an executable oracle, matched audio and live-device proof are separate evidence levels.
6. Record unknowns explicitly and retain reproducible tools and hashes. Do not claim complete coverage, audible parity or a shippable replacement while required stages are unresolved.

## Current work ownership

| Owner | Bounded work | Output |
|---|---|---|
| Sol / az_crc | IRQ8 coverage inventory and instruction/address semantics | Processing coverage ledger |
| Sol / dsp_contract | Sample-filter recurrence and packet/latency provenance | Input arithmetic report and justified numeric probes |
| Sol / legacy_library | Beat selector parameter/state consumers; library work separate | DSP control/state ledger |
| Coordinator | Host/MCU semantic links, RX3 comparison, independent review and publication | Cross-layer map and reviewed reports |

## Cross-layer constraints

The player-to-mixer-controller protocol and the mixer-controller-to-DSP protocol are different. Prior `az-beatfx-routing-mappings.json` maps host TX bytes 16/17/18 to microphone selection, Quantize and channel selection. The DSP SPI frame has separate headers, halfword fields and checksum spans. No equality of those offsets is assumed. A named effect/control needs a traced link through the MCU before its DSP field can inherit that name.

RX3 already supplies named algorithms and prior instruction-oracle comparisons; consult `../DSP-PORT-PLAN.md` and `../dsp-oracle/`. Those are comparison evidence, not proof that AZ uses identical algorithms, states or effects. Preserve this distinction in coverage and reuse claims.

No Pi operation, firmware deployment or new feature is part of this static mapping phase. Checkpoints are progress, not goal completion.
