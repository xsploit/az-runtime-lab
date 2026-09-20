# AZ Sound Color implementation readiness — 2026-09-19

## Decision boundary

The six native XDJ-AZ Sound Color selectors remain anonymous values `1..6`. The topology descriptions in this document are native AZ DSP classifications, not recovered printed effect names:

```text
selector 1 -> Space-like topology
selector 2 -> Dub-Echo-like topology
selector 3 -> Filter-like topology
selector 4 -> Noise-like topology
selector 5 -> Crush-like topology
selector 6 -> Sweep-like topology
```

The `-like topology` qualification is mandatory. A named reconstructed RX3 processor appears below only as comparative DSP evidence. It is **not** an AZ selector identity, does not establish identical code or control laws, and cannot be used to install a selector map.

The bounded native label search is complete. It found no independent firmware association between the direct mixer-selector path and the six printed Sound Color names. Therefore:

- no default selector-to-F1 map is installed;
- selectors are not named by expected order, elimination, HUI suffix order or RX3 enum order;
- runtime translation remains disabled unless an operator supplies an explicit complete lab policy;
- the unresolved identity task is closed at this evidence boundary rather than kept open for more name chasing.

## Evidence classes

The following remain separate:

1. panel-MCU static input and feedback behavior;
2. mixer-MCU static selector, feedback and command behavior;
3. EP147 HUI behavior and operation/MIDI metadata;
4. native AZ C66x static DSP behavior;
5. reconstructed RX3 processor behavior;
6. host software execution;
7. native-Pi service/transport execution;
8. physical controller and audio/listening behavior.

Only class 4 supports the anonymous topology descriptions. Class 5 supplies comparative algorithms and executable reference oracles. It does not name class-4 selectors. No physical listening result exists.

## Completed panel-label boundary

The six button contacts are debounced from GPIO module `0x401bc000`, using pins 31 and 29 over three scan phases:

| Phase | Pin 31 | Pin 29 |
|---:|---|---|
| 0 | selector 1, `0x20008e89` | selector 3, `0x20008e8e` |
| 1 | selector 2, `0x20008eb1` | selector 4, `0x20008eb6` |
| 2 | selector 5, `0x20008ed9` | selector 6, `0x20008ede` |

The returned selected-value indication follows a separate output path:

```text
mixer selected-value table
-> panel staged entries 0..5
-> panel active entries 0..5
-> output builder 0x38e8, second transfer byte bits 6..1
-> transfer buffer 0x200002cc
-> sender 0xc56a
-> peripheral 0x4039c000, descriptor 0x20000100
```

A companion sender at `0xc766` uses peripheral `0x403a0000` and descriptor `0x200001a4` for the other output pair/table path. No panel-MCU table, shared GPIO path or firmware cross-reference pairs these serialized outputs electrically with the scanned contacts. The only software association is the already proved selected-value return map. Even a later PCB-level electrical pairing would identify only a contact/load relationship, not a printed effect name.

The native image-resource search also reached its bounded end:

- all 3,865 PNG files under the native player image were inventoried;
- 940 likely text/label images were OCRed separately;
- all 3,865 images were then OCRed after preprocessing;
- no complete six-name Sound Color family was found;
- the only contiguous six-label resource remains the EP147TestMode HUI table, which direct references tie to HUI suffixes `...f600..f605`, not selector values `1..6`.

This closes the native label-association search negatively.

## Shared native selector and transition state

The direct selector command path is:

```text
mixer command +0xa6
-> SPI receive 0x118008a6
-> staged selector 0x11800aa6
-> accepted persistent selector B14 word 160 at 0x11803280
-> six-case dispatch
```

There is no mixer-side renumbering or SPI permutation. Selector-change handling also writes or consults shared transition fields:

- word 217 at `0x11803364` selects transition/ramp direction on reviewed paths;
- word 218 at `0x11803368` gates per-route initialization/readiness work;
- words 161/162 at `0x11803284/0x11803288` participate in surrounding transition gates;
- halfword 516 at `0x11803408` is the common raw control consumed by the reviewed route families.

The static trace does not yet prove the semantic unit, normalization or complete transfer law of halfword 516, nor whether another native field contributes to any route. It also does not close the global Off/bypass equation: selector value zero causes none of the six dispatch calls, but dry-path ownership, retained tails and all state changes outside the dispatch require separate proof.

## Route readiness matrix

### Selector 1 — target `0x11806900`

**Native AZ topology and output**

- Six ring transfers are present: four early all-pass-like stages followed by two longer damped-feedback stages.
- The route writes final paired single-precision results into `0x11838f70 + channel_offset` and `0x118390d0 + channel_offset` for offsets `0`, `0x58`, `0xb0` and `0x108`.
- Common converter `0x1180f428` consumes both route-owned buffers after dispatch.
- Classification: **Space-like topology**.

**Native control and persistent state**

- Reads initialization/transition word 218 at entry and writes it on the reviewed initialization path.
- Reads word 217 and halfword 516; word 217 selects a signed approximately `1/132` ramp step in a 22-iteration scheduled state update.
- Reads/writes word 195 and owns numerous route-local ring, filter and feedback buffers.

**Reset, bypass, wet/dry and transitions**

- A distinct `word218 == 1` path performs initialization work.
- Static evidence does not yet establish which histories or rings are cleared versus retained.
- Exact dry contribution, input gate, feedback/damping law, Off behavior, tail behavior and reselect behavior remain unproved for AZ.
- The shared selector transition fields and route-local ramp are proved; their complete block/sample timing is not.

**Comparative RX3 reference — not an identity**

The reconstructed RX3 Space processor has six 32,768-float rings per instance, mono input, a chased input gain, side-dependent LPF/HPF, four delay/all-pass stages, two damped feedback delays, dry stereo plus doubled wet output, center-side switching and retained rings across initialization. Its manager has special retained-state/repeated-Off behavior.

**Executable coverage**

- RX3 full processor/ring reference: `analysis/dsp-oracle/run_space.py`.
- RX3 manager composition and repeated Off/resume: `analysis/dsp-oracle/run_cfx_space.py`.
- Current software stream coverage: `mixer/test_space_stream.py` and graph tests.
- Missing: executable AZ route, exact AZ ring lengths, AZ control law, AZ reset retention, AZ wet/dry equation, AZ tail/resume and bit/sample parity.

### Selector 2 — target `0x11805000`

**Native AZ topology and output**

- Four fractional delay-tap paths use integer/fractional interpolation and old/new tap crossfades.
- Four filter roles and a stereo feedback path are present.
- The route's paired delay/feedback result reaches route-owned buffers consumed by common converter `0x1180f428`.
- Classification: **Dub-Echo-like topology**.

**Native control and persistent state**

- Reads word 218 at entry and writes it on the reviewed initialization path.
- Reads halfword 516 both before and after the initialization branch.
- Reads word 217, writes the signed transition step to word 194, and reads/writes words 174, 175 and 195.
- Owns delay positions, old/new tap state, interpolation/crossfade state, filter histories and stereo feedback state.

**Reset, bypass, wet/dry and transitions**

- A distinct `word218 == 1` route enters initialization work.
- The exact native delay lengths, tap conversion, ring-clear/retention policy and warm-up behavior remain unresolved.
- The selected result is proved to reach common output, but exact dry gain, wet gains, fader placement, Off tail, same-effect resume and transition timing remain unresolved for AZ.

**Comparative RX3 reference — not an identity**

The reconstructed RX3 Dub Echo uses 8,448- and 6,720-frame stereo rings, four IIR filters, fractional old/new tap crossfade, asymmetric left/right filter placement, dry plus delayed output, and startup/warming/running/tail states. Its placement-2 Off path can retain the active processor under sentinel type 7 and resume without initialization.

**Executable coverage**

- RX3 control/tap reference: `analysis/dsp-oracle/run_dubecho_control.py`.
- RX3 complete rings/audio/state: `analysis/dsp-oracle/run_dubecho_audio.py`.
- RX3 manager tail/resume composition: `analysis/dsp-oracle/run_cfx_dubecho.py`.
- Current software stream coverage: `mixer/test_dubecho_stream.py` and graph tests.
- Missing: executable AZ route, exact AZ delay lengths/control conversion, AZ ring lifecycle, AZ wet/dry/feedback equation, AZ tail placement and transition parity.

### Selector 3 — target `0x11808bc0`

**Native AZ topology and output**

- No delay-ring or PRNG topology is present.
- Shared helpers `0x11813a68` and `0x11813af0` generate low-pass-like and high-pass-like biquad coefficient groups through a nonlinear frequency transform and reciprocal refinement.
- The route chases a control target and processes paired persistent filter state.
- Its filtered samples are written into the common output arrays.
- Classification: **Filter-like topology**.

**Native control and persistent state**

- Reads halfword 516, conditionally stores it to halfword 362 and compares it with `0x200` around the center boundary.
- Derives a floating control and stores additional state through word 180.
- Owns paired coefficient groups and four 96-byte filter-history regions; helper `0x118147f4` clears 96-byte state blocks.
- The reviewed second-order filter helper retains accumulator, two input-history and two output-history pairs in twelve doubleword slots.

**Reset, bypass, wet/dry and transitions**

- The `word218 == 1` path constructs coefficients/state and later clears word 218.
- Center-side handling and coefficient target chasing are statically supported.
- Exact AZ dry contribution, resonance/gain law, coefficient smoothing schedule, bypass history policy and cross-route transition behavior remain unresolved.

**Comparative RX3 reference — not an identity**

The reconstructed RX3 Filter has stereo LP and HP second-order filters, a 0..255 color step, one/two-step chasing, separate smoothers for gain/blend/dry contribution, a neutral center region and output `dry*input + gain*(blend*LP + (1-blend)*HP)*(1-dry)`. The manager owns bypass and transitions.

**Executable coverage**

- RX3 complete processor reference: `analysis/dsp-oracle/run_cfx.py`.
- AZ static fragment checks: `probe_coeff_relations.py`, `check_filter_alias_schedule.py`, `probe_fixfu.py`/`test_fixfu.py`, and packet-scheduling checks. These are not a full route oracle.
- Current software graph coverage: `mixer/test_dsp_graph.c` and stream/control suites.
- Missing: executable AZ route, exact reciprocal/output bits, exact native control-to-coefficient law, AZ history reset/bypass policy, wet/dry law and transition parity.

### Selector 4 — target `0x1181fcf0 -> 0x80017c60`

**Native AZ topology and output**

- Helper `0x1181f358` initializes PRNG state and helper `0x1181f2e0` advances it.
- The generator uses persistent additive/Fibonacci-like 32-bit state, extracts a signed high word, recenters it and scales it by approximately `1/32768`.
- Recursive filtering passes through `0x1181c72c`; generated/filtered samples are written directly into common output arrays.
- Classification: **Noise-like topology**.

**Native control and persistent state**

- Reads word 218 and halfword 516.
- Owns persistent generator words, recursive filter state and moving gain/modulation state.
- A packet-aware loop contains a nonlinear moving-scalar gain applied to paired double-precision lanes.

**Reset, bypass, wet/dry and transitions**

- Static helper edges prove a PRNG initialization path, but the exact condition for reseeding versus retaining seeds is not closed.
- Exact source-audio addition, generated-noise level law, center crossing reset, filter-history clearing, Off behavior and fade-in law remain unresolved for AZ.

**Comparative RX3 reference — not an identity**

The reconstructed RX3 Noise starts from two fixed 32-bit seeds, emits the old signed second seed scaled by `2^-31`, then uses XOR and wrapping addition. It adds filtered/chased generated noise to source PCM, preserves seeds across initialize, clears IIR history at center crossing, processes two `floor(n/2)` halves and uses a manager-specific fade-in.

**Executable coverage**

- RX3 processor/PRNG reference: `analysis/dsp-oracle/run_noise.py`.
- RX3 manager composition: `analysis/dsp-oracle/run_cfx_noise.py`.
- Current software stream coverage: `mixer/test_noise_stream.py` and graph tests.
- Missing: executable AZ PRNG and full route, exact AZ seed/reset recurrence, noise/source mix law, block-tail behavior, center reset and transition parity.

### Selector 5 — target `0x11807e00`

**Native AZ topology and output**

- The route constructs a bit mask equivalent to `~((1u << shift) - 1u)` and applies paired masking.
- It contains persistent sample-hold counters and held samples, side/mode transition state and a recursive post-filter.
- The final weighted paired-output loop writes directly to `0x11838f70 + channel_offset` and `0x118390d0 + channel_offset`; converter `0x1180f428` consumes those slices.
- Classification: **Crush-like topology**.

**Native control and persistent state**

- Reads word 218 and range-conditions a control around values `0x1fc..0x204` near the center.
- Owns mask/shift state, counters, held samples, fractional or phase-like state, post-filter histories and four channel slices.

**Reset, bypass, wet/dry and transitions**

- The `word218 == 1` path zeroes multiple state words and state spans before clearing word 218.
- Exact native hold-interval law, mask threshold, side-switch boundary, state retention, dry contribution and Off transition remain unresolved.

**Comparative RX3 reference — not an identity**

The reconstructed RX3 Crush converts color/parameter with approximately `value*255.9`, uses a piecewise sample-hold interval, persistent integer/fractional phase, and masks IEEE-754 mantissa bits at high settings. One side uses held/masked audio; the other adds an eight-coefficient feedback IIR with squared dry blend. Side changes are deferred to the block boundary and reset histories/hold state.

**Executable coverage**

- RX3 processor reference: `analysis/dsp-oracle/run_crush.py`.
- RX3 manager composition: `analysis/dsp-oracle/run_crush_composite.py`.
- Direct Filter/Crush transitions: `analysis/dsp-oracle/run_cfx_direct.py`.
- Current software stream coverage: `mixer/test_crush_stream.py` and graph tests.
- Missing: executable AZ route, exact AZ hold/mask/control laws, native post-filter equation, side-switch reset, wet/dry and transition parity.

### Selector 6 — target `0x1181fce0 -> 0x800169e0`

**Native AZ topology and output**

- The route maintains moving low/high filter bounds, persistent coefficient arrays, bounded ramps with direction reversal and multiple filter passes.
- Its moving-filter result is written directly into common output arrays.
- Classification: **Sweep-like topology**.

**Native control and persistent state**

- Reads word 218 and halfword 516 at entry.
- Reads/writes halfword 358 and word 178 on route branches.
- Owns coefficient/filter-history arrays and ramp/bound/direction state.
- Helper `0x118147f4` clears two proved 96-byte spans: `0x11838840..0x1183889f` and `0x118386c0..0x1183871f`.
- A multi-lane loop applies changing ramp scalars to four double-precision lanes.

**Reset, bypass, wet/dry and transitions**

- The 96-byte clears prove native state reset work, but their exact route-entry/retarget conditions and all retained detector/filter state are not closed.
- Exact detector behavior, bound update rates, gate/mix law, dry contribution, Off behavior and cross-route transition phases remain unresolved for AZ.

**Comparative RX3 reference — not an identity**

The reconstructed RX3 Sweep has nine second-order IIR instances: four detector split-band filters, one gate recombination filter and four variable sweep filters. Its detector runs continuously, rolls 1,471-frame peak windows, preserves detector histories on initialize, cascades LPF/LPF/HPF/HPF, and uses special Filter/Sweep manager phases plus an EQ-history reset request.

**Executable coverage**

- RX3 gate, coefficient and detector references: `run_sweep_gate.py`, `run_sweep_coeff.py`, `run_sweep_detect.py`.
- RX3 full composition and manager: `run_sweep_composite.py`, `run_cfx_sweep.py`.
- Current software stream coverage: `mixer/test_sweep_stream.py` and graph tests.
- Missing: executable AZ route, exact AZ detector ownership, bounds/ramp law, filter equations, reset retention, wet/dry and transition parity.

## Executable reference inventory

### Full named RX3 oracle coverage

All six reconstructed named RX3 processors have executable comparisons against original RX3 ARM execution, including processor state. Manager tests cover ordinary 191-frame transitions and the known special cases:

- Filter: `run_cfx.py`;
- Crush: `run_crush.py`, `run_crush_composite.py`, `run_cfx_direct.py`;
- Noise: `run_noise.py`, `run_cfx_noise.py`;
- Sweep: `run_sweep_gate.py`, `run_sweep_coeff.py`, `run_sweep_detect.py`, `run_sweep_composite.py`, `run_cfx_sweep.py`;
- Dub Echo: `run_dubecho_control.py`, `run_dubecho_audio.py`, `run_cfx_dubecho.py`;
- Space: `run_space.py`, `run_cfx_space.py`;
- manager lifecycle: `run_manager.py`.

These validate reconstructed RX3 behavior only.

### Current software-mixer execution coverage

The software graph has focused native C tests and Python stream tests for all six reconstructed processors, control rejection/acceptance and graph integration. Relevant files include:

```text
mixer/test_dsp_graph.c
mixer/test_crush_stream.py
mixer/test_noise_stream.py
mixer/test_sweep_stream.py
mixer/test_dubecho_stream.py
mixer/test_space_stream.py
analysis/dsp-oracle/check_graph.py
```

`mixer/native_cfx.py`, `mixer/test_native_cfx.py`, `analysis/test_cfx_feedback_service.py` and `analysis/test_az_mixer_packet.py` test the anonymous selector observation and explicit-policy transport boundary. They do not execute native AZ DSP.

### Native Pi coverage

`NATIVE-CFX-CHECK-20260916.md` records bounded AArch64 execution of the packet decoder/state synchronizer and configured F1 transport on the Pi. It used synthetic CRC-valid packets. It did not execute EP147, the AZ C66x routes, a physical selector, the controller audio path or a listening test.

### Native AZ coverage still absent

No complete native AZ C66x route has an executable oracle. Current AZ checks are static packet/dataflow analyses and bounded arithmetic/scheduling probes. Still needed for native parity are:

- a lawful executable C66x harness or matched native capture for each complete route;
- exact command/control snapshots and block size/rate;
- reset, Off, same-effect reselect and cross-effect transition sequences;
- full persistent-state comparisons, including rings, PRNG, filters and ramps;
- selected-output comparisons at the common converter boundary;
- only after those pass, separately authorized physical audio and listening tests.

## Current software mixer versus AZ readiness

### Implemented in the software mixer

- All six **named reconstructed RX3** CFX processors plus Off.
- The reconstructed RX3 CFX manager, including ordinary transitions, Noise fade-in, Filter/Sweep special phases, Dub Echo/Space retained-tail handling and busy-request rejection.
- Four independent channel instances.
- Fixed 44,100 Hz, exactly 64 frames, finite input and disjoint input/output buffer validation.
- Reconstructed placement policy:
  - Noise/Sweep before EQ;
  - Filter/Crush after EQ and before fader/cue;
  - Dub Echo/Space after channel fader.
- Optional reconstructed EQ/isolator attachment.
- Optional Echo/BeatFX lifecycle and optional headphone DSP.
- Anonymous AZ selector observation and same-selector Off toggle.
- Fail-closed translation: F1 output requires an explicit complete six-entry policy and explicit parameter.

### Partial or policy-defined behavior

- The graph reset preserves accepted host controls but reconstructs processor state; equivalence to AZ reset is unknown.
- Cue, crossfader, fader and post-fader routing are explicit lab policies, not complete native AZ tap-fidelity proof.
- Host `lab_dsp_graph_set_cfx()` snapshots type/color/parameter atomically and rejects while busy. Native AZ setters and transition timing may differ.
- The optional EQ/isolator is reconstructed and requires a verified private coefficient fixture; it does not prove AZ selector/EQ interaction.
- Bounded resend handles possible host mixer busy rejection but is transport policy, not native selector behavior.

### Missing for an AZ-faithful mixer

1. A semantic selector map supported by independent native label evidence for all six routes. No such map is currently authorized.
2. Exact AZ control-field meanings, scaling, center thresholds, smoothing and per-route parameter laws.
3. Exact AZ initialization, reset, state-retention and ring/seed/history clear policies.
4. Exact AZ Off/bypass, dry/wet mix, feedback, input-gate, tail and same-effect resume behavior.
5. Exact AZ transition phases, durations, retarget rules and requests accepted/ignored while transitioning.
6. AZ sample rate, block size, numeric mode and bit/sample parity for complete routes.
7. A complete executable AZ C66x or matched-capture oracle.
8. Native tap fidelity for fader, crossfader, cue, EQ and post-fader effects.
9. Trim and microphone mixing.
10. A built-in limiter.
11. The thirteen non-Echo Beat FX not presently implemented.
12. Complete physical control synchronization and selector/knob semantics.
13. Real Pi/FLX6 performance qualification for the complete graph.
14. Separately authorized physical audio and listening validation.

## Checkpoint verification

Focused host validation on 2026-09-19 passed:

- `analysis/test_az_mixer_packet.py`: 21 tests;
- `mixer/test_native_cfx.py`: 11 tests;
- `analysis/test_cfx_feedback_service.py`: 2 service-process tests;
- `analysis/dsp-oracle/check_graph.py`: optimized graph test, ASAN/UBSAN graph test and shared manager replay; the replay compared 978,548 numeric values with zero mismatches across 12,000 calls and 249,274 stereo frames;
- Crush, Noise, Sweep, Dub Echo and Space FIFO stream regressions all reported `status: pass`, including busy-request behavior and retained post-fader tails where applicable.

These are host/reconstructed-RX3 and transport results. They do not increase the evidence level of the anonymous native AZ routes.

## Implementation decision

The current software graph is ready for reconstructed RX3 laboratory use under its documented host contract. It is not yet an AZ-faithful implementation of the six anonymous native routes.

The safe integration policy remains:

```text
native observation: selectors 1..6 only
native topology: qualified "-like topology" descriptions only
host F1 types: named reconstructed RX3 processors
translation: explicit complete operator policy only
implicit/default mapping: forbidden
```
