# CFX manager lifecycle and mixer integration proposal

2026-09-12. Initial lifecycle pass left shared files untouched. Follow-up composition validation passed and new `mixer/cfx_filter.*`, `cfx_manager.*`, and `dsp_graph.*` now exist; stream/launcher wiring is owned by the parent task. See `mixer/DSP-GRAPH.md` for the implemented contract.

## Verified Off/Filter transition subset

The independently written `cfx_manager_filter.c` matches original `SoundColorFxManager::operate` instructions at `0xbbc68..0xbc4d4` for **13,200 block calls**. Output, current/requested types, phase, wet/dry ramp state, carried parameters, and processor initialize/process counters match exactly. ARM32, x86 and sanitized x86 replay report zero differences. **1,896 type requests accepted and 1,230 busy requests ignored**, matching original setter `0xbc708`.

This is lifecycle validation with explicit effect mocks: Off copies input; the fake Filter multiplies it by 0.25. It is not yet the previously verified real Filter DSP joined to this manager. The original manager and setter instructions run unchanged; absolute jump-table entries and two constant pointers are relocated to their corresponding private addresses. `manager-results.json` records them. Calls through effect vtables and the per-block Sweep hook use instrumented test doubles. No constructor, device, graphics or mixer-channel object is run.

Reproduce:

```sh
python runtime-lab/analysis/dsp-oracle/run_manager.py
```

Corpus uses transition lengths 1,2,7,64,191,256 and blocks 0,1,2,3,7,16,63,64,65,128,256. It carries state across calls, changes parameters during transitions, repeatedly reverses requests and includes busy requests. Zero-length blocks still invoke processor/hooks but do not advance sample ramps. No arbitrary NaN/Inf, denormal-effect-output or all-effect lifecycle claim.

## Type identities and native layout

Constructor evidence is `cfx-manager-constructor.asm`. The manager holds current processor at +0 and concrete processor pointers at +4 through +28:

| Type | Pointer offset | Constructed processor |
|---|---|---|
| 0 | +4 | Off |
| 1 | +8 | Filter (`0xbbae4` -> `0xce080`) |
| 2 | +12 | Noise |
| 3 | +16 | Sweep |
| 4 | +20 | Dubecho |
| 5 | +24 | Space |
| 6 | +28 | Crush |
| 7 | No dedicated constructor | Special retained/tail state; do not present as an eighth processor |

Current/requested/previous type fields are +32/+36/+40, scratch output pointer +44, wet transition ramp +48, additive dry ramp +88, phase +128, owning mixer channel +132. Each native ramp is 40 bytes: stereo increment +0, target +8, current +16, count +24, length +28, inverse length +32, completion byte +36.

`setType` at `0xbc708` writes requested type only when phase is 0 or 5. It does not queue requests arriving in intermediate phases. A future host UI that queues the latest request would intentionally change that behavior; it must not be introduced silently as a faithful port.

## Exact Filter/Off lifecycle

For the ordinary Off/Filter paths, starting settled in phase 0:

1. If requested differs from current, enter phase 1. Schedule wet gain toward zero. The retarget calculation is `(target - (current + previous_increment)) * inverse_length`, resets count to zero and clears completion. This is why a generic ramp utility is not a drop-in replacement.
2. Execute the **old** processor into scratch. In phase 1, each sample becomes `wet*processed + (1-wet)*original`; update wet after using its current sample value. Thus old effect moves toward the dry signal.
3. Once the ramp completion byte is set, at the end of this block, copy old color and parameter into the selected processor through parameter IDs 7 and 8, then call initialize. Only then replace the active pointer/current type, schedule wet toward one and enter phase 3. The newly initialized processor does not run until the next block.
4. Phase 3 processes the new effect and crossfades dry toward it using the same loop. At block completion with the ramp done, phase becomes 0.
5. The final output is scratch plus `original * additiveDry`. The additive-dry ramp is independent. It remains zero in ordinary constructor-initialized Off/Filter switching and is not a redundant representation of `1-wet`.

Ramp update adds increment, compares the **pre-increment sample counter** with length, clamps/marks completion when counter >= length, then increments the counter. It keeps ticking for the remaining samples in that transition block even after completion. All these details are retained in the tested subset.

The constructor begins with wet current/target 1, increment 0, completion true; additive dry all zero, completion true. Its stock duration constant is float `4.35` (`0x408b3333`) and computes unsigned length by truncating `defaultSampleRate * 4.35 / 1000`, minimum one. With the preserved default 44100, that is 191 frames; completion timing includes the counter behavior above. Do not label it exactly a 192-sample or generic five-ms crossfade.

## Additional paths mapped statically, not yet ported/tested

- Phase 2 multiplies processor scratch by the wet ramp without a dry crossfade. Phase 4 similarly ramps processed output up. There are special Filter(1)↔Sweep(3) transitions when the color is outside the interval encoded by `0x3ed60000` and `0x3f140000` (0.41796875..0.578125). Filter→Sweep also calls the owning channel's active EQ/isolator reset-like virtual +20 at `0xbc3f4`; exact reset method identity still needs confirmation.
- Current type Noise(2) has a distinct phase-3 local per-block fade, beginning at `0xbc404`, not the ordinary stored ramp. It must not use the Filter model unchanged.
- When a requested Off transition sees current processor placement 2, it calls virtual +36 (`0xbbd40`). A true result records previous type, sets current/requested to 7 and phase to 5 while keeping an existing processor object. A matching re-enable can call virtual +32 (`0xbc2c4`) and resume without the ordinary reinitialize path. This is a real preserved-state/tail mechanism lead, not yet proven tail duration or audio equivalence.
- Every non-null-scratch call invokes Sweep object's virtual +20 at `0xbbc94` before transition processing, even if Filter/Off is active. The mock counts it. Its full effect on real Sweep state remains to trace.
- Null scratch makes operate return immediately, bypassing all processing/state updates.

These differences prevent advertising this bounded Filter subset as the complete CFX manager.

## Concrete graph changes proposed for coordination

### First shared integration: real Filter with its verified lifecycle

The new separate `mixer/cfx_filter.*`, `mixer/cfx_manager.*`, and `mixer/dsp_graph.*` modules implement real Filter plus Off. The composition and shared-module replay have passed native comparison; controls and graph tests also pass. Enabling this in stream/launcher remains a separate parent-owned step.

Implemented graph API is declared in `mixer/dsp_graph.h`:

```c
int lab_dsp_graph_init(LabDspGraph *, unsigned sample_rate, const LabMix *);
int lab_dsp_graph_set_mix(LabDspGraph *, const LabMix *, size_t ramp_frames);
int lab_dsp_graph_set_cfx(LabDspGraph *, unsigned channel, unsigned type,
                         float color, float parameter);
int lab_dsp_graph_process(LabDspGraph *, const float *az_10ch,
                         float *master_cue_4ch, size_t frames);
int lab_dsp_graph_reset(LabDspGraph *);
```

Initial sample rate accepted: 44100. Process accepts **exactly 64 frames**. Parent's terminal EOF policy zero-pads a partial block to 64, writes only actual frames, and resets the graph on reconnect. Partial calls are rejected without changing state/output. Graph storage is fixed and caller-owned; no added resampling or live allocation. Unsupported rates/types and nonfinite/out-of-range controls are rejected.

CFX snapshots return 1 accepted, 0 busy, -1 invalid. Busy/invalid rejection is atomic: all accepted control and DSP state remains untouched, including color/parameter. This is a deliberate **host F1 snapshot policy**, distinct from the native manager's separately callable parameter setters. Native independent-setter behavior remains represented by the lower-level validated composition, not exposed as partial F1 acceptance.

Reset retains accepted CFX/mix targets, clears histories, snaps routing ramps and restarts enabled Filter through Off->Filter transition. Existing M1/default dry stream behavior is preserved by the parent's opt-in build/wiring design. The graph feeds processed 10-channel PCM into existing LabMixRamp.

Each deck owns a Filter state, two IIR histories, manager ramps and two scratch buffers. Stage processing uses a bounded block size selected explicitly; 64 is the native Filter gain-chase reference. Adapt arbitrary transport chunks outside this stage rather than changing gain/chase semantics. Four instances must be tested for independence and no shared scratch before routing captured AZ audio through them.

The verified Filter placement is 1: **post-EQ, pre-channel-fader**. Initial graph:

`AZ deck pair -> trim -> EQ slot -> Filter manager -> cue tap / fader -> crossfader -> master sum -> master gain`

Trim/EQ slots initially pass through unless a separately verified implementation is supplied. Do not claim those slots implement native RX3 EQ. Existing `lab_mix_ramped` can temporarily receive processed deck pairs and provide the same lab pre-fader cue/master routing. This is a precise provisional integration boundary; the original RX3 headphone source/tap policy is still not fully mapped.

Add a versioned control message alongside M1, containing per-channel CFX enabled/type/color/parameter and an explicit reset/event sequence. Validate finite input and supported type before delivery. Audio thread owns all processor and ramp state. The host F1 queue uses atomic busy rejection. Once accepted, color/parameter apply to the active processor and transfer at the actual switch boundary.

### Graph required for the full requested DSP scope

The current final eight routing coefficients cannot represent all inserts. Add explicit stereo buffers/taps per channel: pre-EQ, post-EQ/pre-fader, post-fader; plus master bus, microphone inputs and cue sum. Select native effect placement rather than placing every effect in Filter's location. Process shared BeatFX once for its selected target/bus and route its result/tail explicitly; do not duplicate one shared delay state across four decks.

Parent's latest AZ findings reinforce the need for semantic target state: TX18=0 represents both Ch1 and several microphone settings, so TX bytes alone cannot reconstruct the target. Use the native ChannelSelect setting together with MicSelect and Quantize state. The host graph must distinguish deck, microphone and master targets even when packet encodings collide.

Recover and test other manager phases, output/tail rules, BeatFX selection/timing, EQ/isolator and headphone taps separately. The original lifecycle pass made no shared edits; the subsequent approved composition pass added the new graph modules described above.
