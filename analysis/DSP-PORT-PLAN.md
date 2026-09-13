# RX3 DSP into the AZ software mixer: first evidence pass

Current verified CFX coverage: all six named RX3 algorithms plus Off are integrated in the AZ software mixer, with native state/manager comparisons. EQ/isolator, 13 other BeatFX algorithms and complete native AZ control synchronization remain unfinished. See `dsp-oracle/SPACE.md` for the latest evidence.

2026-09-12. Local research; no firmware or secrets published. No mixer or launcher edits in this pass. This is an implementation plan, not a claim that effects have been ported.

## What is available

The preserved `rx3-research/pi-runtime/rbp` is an unstripped ARM32 executable. It contains real floating-point sample-processing implementations, not only UI or hardware messages. `rx3-dsp-implementation-inventory.json` records addresses, sizes and binary hash; `rx3-dsp-entrypoints.txt` records the relevant managers/setters. The inventory includes 14 named non-Off Beat Effects and six non-Off Sound Color FX: Echo, Roll, Delay, Helix, Pitch, Trans, Filter, Phaser, Reverb, Spiral, Flanger, PingPong, SlipRoll, VinylBrake; CFX Crush, Noise, Space, Sweep, Filter, Dubecho. This is an inventory of named implementations, not equivalence to every AZ effect.

Two sample paths were inspected:

- RX3 CFX Filter `0xce720`, 628 bytes: runs two filter objects on stereo input, blends outputs, adds the dry signal and advances per-sample transitions. Constructor `0xce080` allocates two `dsp::secondOrder_IIRFilter` objects at fields +36/+40 (`0xce108`, `0xce11c`). Its filter method calls ultimately reach the standalone NEON stereo IIR kernel `0xb5788` through `0x9af60`.
- RX3 Beat Echo `0xb6f68`, 1480 bytes: actual sample DSP with delay resources and smoothing. Named delay accessors are `0xb7960`/`0xb7984`; state-transition methods are `0xb6d40` init, `0xb6d58` keepEffectInit, `0xb6d64` time change, `0xb6d70` on, `0xb6dc4` off, `0xb6e04` depth change. The off method schedules a ramp; it does not simply zero all delay storage.

AZ's mapped `device_adapter::mixer::BeatFx` methods `0x2134458/0x2134448/0x2134450` only store control bytes; mixer TX serializes them. They are not replaceable DSP routines. Existing captured AZ PCM and native fader notifications support external mixing. Absence of a named AZ algorithm is not proof there is no DSP elsewhere in its stripped binary.

## Signal order evidence: RX3 is not one fixed insert chain

`MixerChannel::update` at `0x9e890` obtains player stereo data, applies three gain/ramp terms to buffer +28, then enters `updateFilter` at `0x9e3fc`. Digital trim belongs to channel +40, proven by `MixerEngine::setDigitalTrim` at `0x56e44` calling `Trim::setValue`; its current coefficient is read at channel +64 in the sample loop (`0x9e93c`). Other pre-filter gains still need semantic mapping.

`updateFilter` selects effect placement:

| Placement value | CFX call | Beat effect call, if channel matches | Position evidence |
|---|---|---|---|
| 0 | `0x9e764`, buffer +28 | `0x9e7c0`, buffer +28 | Before EQ/isolator |
| 1 | `0x9e84c`, buffer +28 | `0x9e838`, buffer +28 | After EQ/isolator, before channel fader |
| 2 | `0x9e7d4`, buffer +32 | `0x9e80c`, buffer +32 | After channel-fader multiplication |

EQ/isolator uses channel +428 virtual +8 at `0x9e454`. Constructor `0x9e23c/0x9e250` constructs EQ/Isolator and `0x9e260` assigns the EQ as active. Channel fader object +96 is established by `0x56f04` -> `ChannelFader::setFader`. Its current coefficient +112 multiplies buffer +28 into +32 at `0x9e4d8`.

In each of those placement branches, CFX is processed before the matching BeatFX stage. Channel fields +528/+532 hold distinct BeatFX selection identities. A second selection path copies/processes buffer +32 at `0x9e860/0x9e678`; its meaning must be recovered before representing everything as one deck target.

RX3 also invokes BeatFX from `MasterOutChannel::update`, at `0x59664`, with copyMusicData at `0x5963c`. Thus an implementation attached only to individual deck buffers would miss master/bus processing. HeadphoneChannel has separate source-pointer selection and summation (`0x59078`, `0x591b8`); the complete cue tap rules are not yet reconstructed. Do not infer them from our current lab pre-fader cue policy.

Filter constructor stores placement 1 at +24 (`0xce0b4`). SoundColorFxManager returns the active effect's +24 at `0xbc780`. BeatEffectManager placement comes from active effect +64 (`0x8991c`). Per-effect placement needs inventory; never hardcode all effects before the fader.

## First implementable integration boundary

Start with **RX3 Sound Color Filter**, preceded by an independently verified IIR primitive. Keep the new code in separate mixer modules until reviewed; preserve the current dry mixing path.

1. Reconstruct/test the self-contained stereo IIR kernel at `0xb5788` against its original ARM instructions. It uses five stereo coefficients (b0,b1,b2,a1,a2), two frames of input history, and two frames of output history. State arrays are ordered older/newer. The mathematical recurrence is `b0*x[n] + b1*x[n-1] + b2*x[n-2] - a1*y[n-1] - a2*y[n-2]`.
2. Preserve floating-point operation order in the oracle. The first two samples subtract feedback products separately; the main loop sums feedback products before subtraction. Bit-exact output may therefore depend on block partition. Native `0xb5884` performs a one-frame lookahead load, including the last loop iteration: the oracle should supply padded input, and the portable implementation should not retain the unnecessary overread. Input/output aliasing is not safe to assume (native code rereads input after output stores).
3. Reconstruct `SoundColorFxFilter::calcParameter` (`0xce154`) and initialization (`0xce680`), including coefficient helpers and native color/parameter limits. Numeric constants are saved in `rx3-dsp-filter-echo-constants.json`. HPF endpoints 20/8200, LPF 100/21000, resonance limits approx 1.299829/1.4 and center/dead-zone constants are evidence, not enough to invent a generic filter and call it faithful.
4. Implement the Filter wrapper's state update and its two-filter blend (`0xce720`). The active filter blend at +52 advances by +/-0.002267573727... per sample, clamped to 0..1. Another dry contribution +60 chases target +56 using increment +64. Filter gain +48 advances toward +44 with a per-block delta multiplied by 1/64. These separate smoothers must not be collapsed into one wet/dry knob. Sample-rate and block-size assumptions need explicit tests; do not rescale constants speculatively.
5. Add four preallocated per-channel CFX states and scratch buffers to a separate processing layer. For verified Filter placement 1, process after eventual EQ and before fader gain/cue branching. Until cue taps are fully traced, expose the lab routing as an explicit provisional policy. Feed transformed deck stereo pairs into existing `lab_mix_ramped`; this works for Filter but is not sufficient for effects needing post-fader inserts or master sends.
6. Upgrade the routing graph before Beat Echo integration: explicit pre-EQ, post-EQ, post-fader, master sum, microphone and cue taps. Existing eight collapsed routing coefficients cannot faithfully represent shared effect buses, tails or post-fader processing. Keep `LabMixRamp` for final gain transitions, not as the whole DSP graph.

Use bounded preallocated blocks and audio-thread-owned state. Control snapshots/events carry sample timestamps and sequence numbers. UI/native HUI callbacks must enqueue validated state rather than modifying filter memory from arbitrary threads. No allocation, file I/O, logging or locking in DSP sample loops.

## Full-state recovery checklist

| Area | Evidence now | Still needed |
|---|---|---|
| CFX type/color/parameter | Manager setters `0xbc708`, `0xbc71c`, `0xbc758`; color/parameter use IDs 7/8 | Type transition state machine, clamp/range, per-effect position, noise seed/resources |
| BeatFX type/target | RX3 current/next target getters `0x89904/0x8990c`, setter writes next at +4; type getter/setter | AZ effect enum correspondence, target changes with live tails, channel vs bus selection |
| Wet/dry | Echo depth update `0xb6e04` drives separate dry/wet smoothers +148/+152 | Exact delay feedback/time change and other effects' laws |
| Tempo/beat/time | RX3 setters for time, percent, beat button, XPad; manager `0x8a52c` | BPM source selection, phase/timing units, quantize boundary and discontinuities |
| Quantize | AZ setting 0/1 -> TX17 2/3 | Actual DSP phase behavior; a UI byte is not implementation |
| Microphone | AZ setting 0 MIC1 -> TX16=1; 1 MIC2 ->2; 2 MIC1+2 ->0, per parent evidence | Live mic acquisition, gating/talkover, target placement and cue/master routing |
| Bypass/on/off | Echo off ramps state; Filter has separate transition flags/ramps | Tail continuation duration, reset conditions, load/stop/bypass/type-change semantics |
| Master/cue/booth/record | RX3 separate MasterOutChannel/HeadphoneChannel paths exist | Full ordering and tap points, clipping/limiter and output gain laws |
| Execution resources | RX3 ARM32 NEON; AZ ARM64; lab host C mixer | Portable C implementation, original-code oracle, four-channel worst-case CPU/memory |

Do not directly transplant ARM32 objects into AZ ARM64: pointer layout, ABI, vtables and runtime dependencies differ. A private ARM32 process can be an experimental reference oracle; production should use independently reconstructed portable processors and explicit data contracts.

## Acceptance before claiming a port

For each processor: impulse response, silence/tail, swept/stepped controls, independent L/R inputs, invalid input rejection, all sample/block sizes supported, zero/one/two-frame cases, bypass/re-enable, reset and type/target switch mid-tail. Compare PCM and relevant state to the native reference; distinguish numeric tolerance from semantic mismatch. Run multiple independent instances to detect accidentally shared static scratch (the RX3 Crush inventory names static scratch, so this is a real lead).

For integrated graph: four distinct deck tones plus mic fixtures, fader down with cue alive, crossfader assignment, effect target changes, master cue blend, no repeated processing of a shared BeatFX bus. Test host FIFO path first. **Pi/controller are not needed for this static/oracle/software work.** They are required later for physical controls, FLX6 audio channels/cue, buffer underruns, actual latency and sustained Pi thermal/CPU/memory performance.

## Supporting local artifacts

- `rx3-dsp-implementation-inventory.json`, `rx3-dsp-entrypoints.txt`
- `rx3-dsp-channel-order.asm`, `rx3-dsp-channel-constructor.asm`, `rx3-dsp-gain-setters.asm`
- `rx3-dsp-filter.asm`, `rx3-dsp-echo.asm`, `rx3-dsp-filter-echo-constants.json`
- `rx3-dsp-iir.asm`, `rx3-dsp-iir-kernel.asm`
- `rx3-dsp-manager.asm`, `rx3-dsp-cfx-manager.asm`, `rx3-dsp-master-headphones.asm`, `rx3-dsp-engine-update.asm`
- Parent's `az-beatfx-routing-mappings.json`, `az-mic-label-binding.json`.

All conclusions in this pass are static inspection unless explicitly referring to earlier parent runtime measurements. No new DSP audio equivalence test was run, and no full-effect completion claim is justified.

## Subsequent implementation status (2026-09-12)

The original static-only scope above describes the initial inventory pass. Since then, local native instruction oracles have verified the stereo IIR kernel, complete CFX Filter processor, and Off/Filter manager composition. The new opt-in `mixer/cfx_filter.*`, `cfx_manager.*` and `dsp_graph.*` implement that verified subset with four independent channel states at 44.1 kHz / 64 frames. `mixer/DSP-GRAPH.md` documents host policy and remaining gaps; parent owns stream/launcher wiring and native settings synchronization. Full BeatFX and other CFX remain unfinished.

Beat Echo's initialize/keep/time-change/On/Off/depth callbacks now pass 76,800 state comparisons on ARM, x86 and sanitized x86 with zero differing calls. `dsp-oracle/ECHO-CONTROL.md` and `echo-control-results.json` contain scope and evidence. This is control-state reconstruction, **not an Echo audio processor**: delay memory, timing/quantize and outer BeatFX manager integration remain the next gates.

Echo's sample loop now also passes a native composite comparison: 5,632 calls, 614,606 stereo frames and 47,067,036 compared words of PCM/full represented state/full ring, zero differences on ARM/x86/sanitized x86. See `dsp-oracle/ECHO-AUDIO.md`. Native control callbacks are real; external quantize/time callbacks remain scripted test boundaries. Actual quantize, outer BeatFX manager, target routing and shared Echo integration remain unfinished. A concrete new-module proposal is included in that document for parent review.

Real Echo quantize eligibility/time-update/set-time and native parameter dispatch now pass an additional composite oracle: 1,920 calls,107,520 stereo frames,34,425,600 compared words,zero differences ARM/x86/sanitized. `dsp-oracle/ECHO-QUANTIZE.md` maps player-state dependencies and the separate BPM-source selection. This verifies delay-duration synchronization, not the remaining quantized On scheduler or full BeatFX manager. Live player getters, lifetime/invalidation, full target routing and shared Echo integration remain pending.

Further lifecycle evidence corrects the earlier “quantized On scheduler” label: Echo manager On/Off is immediate, verified in a 1,920-call native composite oracle. Generic phase timing/countdown (used by Trans/Beat Filter/Vinyl Brake/Phaser/Flanger) is separately reconstructed and passes 7,200 state/return comparisons with zero differences. See `dsp-oracle/QUANTIZE-PHASE.md`; these tests do not yet compose the full outer manager or other processors.

### Additional verified CFX: Crush

Actual native CFX enum6 Crush is now reconstructed with full algorithm and Off↔Crush manager composition. `dsp-oracle/CRUSH.md` records mappings/limits; `crush-composite-results.json` shows12000calls/249274frames/1266548 state+audio words, zero ARM/x86/sanitizer differences. Isolated `cfx_crush.*` is prepared; AZ graph integration and direct Filter↔Crush transition verification remain pending. Noise/Sweep/DubEcho/Space are still unported.

### Crush integrated, direct transitions verified

Crush has now moved into `mixer/cfx_crush.*` and F1 native type6. Direct native Filter↔Crush composite matches the shared manager/DSP implementation in18000calls/374000frames with zero differences ARM/x86/sanitized (90 Filter→Crush and53 reverse completed transitions). FIFO F1 tests pass with busy-rejection preservation and cue isolation. Remaining CFX algorithms are Noise, Sweep, DubEcho and Space; native AZ UI synchronization remains separate.

### Noise integrated, direct transitions verified

Noise2 now runs through shared `mixer/cfx_noise.*` and F1. Full native algorithm and Off/Filter/Crush/Noise composition match ARM/x86/sanitized references:18000calls/374000frames,2998000 numeric comparisons plus full manager state, zero differences. Native generator/feedback/filter/half-block control updates and Noise-specific fade-in are preserved. Remaining CFX are Sweep3,DubEcho4,Space5; native AZ UI synchronization and future pre-EQ Noise placement remain separate.


### Sweep3 integrated

Original Sweep init/detect/execute and full CFX transitions are now native-verified and integrated (F1 type3). See `dsp-oracle/SWEEP.md`, `cfx-sweep-results.json`, and `mixer/test_sweep_stream.py`. Full manager composition:18,000blocks/1,152,000frames,zero ARM/host/sanitizer differences. Continuous detector now runs per channel even with other CFX selected. Filter↔Sweep outside-center transitions use native muted phases2/4; `eq_reset_requests` records the actual EQ reset event for a future EQ stage. Current graph has no EQ, so pre/post-EQ placement and EQ reset audio remain pending. Remaining CFX Dub Echo4 and Space5; BeatFX13 others pending.

## Dub Echo integration, 2026-09-12

Native Dub Echo4 now runs through `mixer/cfx_dubecho.*` and F1 after the channel fader, before channel BeatFX/crossfader. Full processor and actual manager composition pass native ARM/x86/sanitizer comparisons:6,000blocks/384,000frames/216,780,000values with zero differences. Manager preserves tail sentinel7/previous4 and same-effect resume; no generic through-Off substitute. FIFO test confirms retained tail with fader closed and isolated cue. See `dsp-oracle/DUB-ECHO.md` and reports. Space5 remains unported; EQ/isolator and13 other BeatFX remain absent. Native AZ UI synchronization is separate.

## Space integration, 2026-09-12

Space5 completes all six named RX3 CFX algorithms in the shared graph. Native processor/state/ring and actual all-CFX manager composition pass:8,000blocks/512,000frames/1,866,688,000values, zero ARM/host/sanitizer differences. Native repeated-Off behavior requires explicit active-object identity separate from current/previous; that is now represented. Space and Dub Echo use postfader insertion. Four simultaneous Space channels match independent instances, and FIFO tests preserve tails with a closed fader and independent cue. See `dsp-oracle/SPACE.md`. EQ/isolator,13 non-Echo BeatFX and native UI synchronization remain unfinished.

## Delay composition, 2026-09-12

Delay audio, controls, constructor/selection and now actual quantization/status composition are native-tested. See dsp-oracle/DELAY-QUANTIZE.md and delay-status-results.json:3840blocks/215040frames, zero ARM/host/sanitizer differences. Full manager type selection/routing and live mixer integration remain pending; Delay is not enabled live yet.
