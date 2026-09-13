# RX3 Dub Echo → AZ software mixer

Native Sound Color FX type **4**, position **2** (post-channel-fader), now implemented in `mixer/cfx_dubecho.*`, the CFX manager, and the staged graph. F1 accepts type4. This is reconstructed RX3 DSP in the experimental AZ mixer, not a claim of identical hardware AZ effects or complete mixer fidelity.

## Native evidence

Source: local unstripped `rx3-research/pi-runtime/rbp`, SHA256 `60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09`.

| Native range | Behavior |
|---|---|
| `cc7d8..cc838` | Color integer mapping, On and Off state |
| `cc980..cccfc` | Color chase, delay targets, injection and feedback curves |
| `cccfc..ccdc4` | Initialize, four IIR histories, startup state |
| `ccdc4..cda4c` | Full stereo sample processing |
| `cda4c..cdd3c` | Constructor, buffers, fixed filters and delay lengths |
| `cdd3c..cdf68` | Guarded calculation and independent parameter/feedback update |
| `9c1d0..9c2cc` | Actual native DelayUnit block save, block read and one-sample read |
| `bbd38..bbd68` | Successful Off enters manager tail sentinel7 and phase5 |
| `bc26c..bc2dc` | Reselect retained effect; On without initialize |
| `9e7d4` | Position2 CFX call after channel-fader multiplication |

Four fixed five-coefficient IIR fixtures originate at `42d8e0`, `42d8f8`, `42d910`, `42d928`. Native byte extraction/records stay private and ignored. Native executable functions are copied into oracle assembly with external calls and constant pointers relocated to explicit fixtures. The oracle runs the original IIR and DelayUnit instructions, not the reconstructed kernel on both sides.

## Processor and state

The 176-byte native object controls two stereo delay rings (8448 and6720 frames), four IIR filters and six temporary stereo blocks. The left path filters input through LPF→HPF; the right uses HPF before its delay and LPF on delayed output. Output sums dry input,0.7×left delayed output, and right filtered delayed output. Both feedback paths retain original arithmetic order and NEON denormal flushing.

Delay changes interpolate fractional sample positions, then crossfade old/new taps. Color moves through the native integer chase and center region; pending delay changes defer full coefficient recalculation while a separate parameter callback can update feedback immediately. Injection gain ramps begin at a half-step. Feedback steps, output startup ramp overshoot and all current/target flags are retained.

Initialize clears IIR histories and resets the131-block warm-up counter; it does not erase rings. Native first execute reallocates/clears six temporary blocks. The host preallocates bounded storage and clears those blocks at the same logical point, without allocation or I/O in the audio callback. Constructor allocation itself is represented by an explicit fixture, not replayed as a general allocator implementation.

On/Off state distinguishes startup0, warming1, running2 and tail3. Off from running2 enters tail3 and returns true. The manager then keeps Dub Echo active while setting current=next7, previous4, phase5. Reselecting4 calls native-equivalent On, preserves the rings and restores phase0. Switching elsewhere uses actual native fades and copies controls from the active effect. A second explicit Off can complete a normal transition to Off0; sentinel7 is internal and is never accepted as an F1 effect type.

## Verification

- Control oracle:32,000 persistent calls /1,408,000 words, zero native ARM/x86/ASAN mismatches.
- Full processor oracle:1,600 blocks /102,400 stereo frames, zero bit differences across output, complete object, four IIR histories, six scratch blocks, both complete rings and write indices. Includes initialization, warm-up, parameter/color changes, Off/On and reinitialization.
- Actual manager plus all implemented CFX:6,000 blocks /384,000 stereo frames /216,780,000 numeric comparisons, zero differences ARM/x86/ASAN. Includes166 busy requests,9 tail entries,8 same-effect resumes, and direct Filter/Noise/Sweep/Crush transitions. `run_cfx_dubecho.py` tests the shared modules.
- `mixer/test_dubecho_stream.py`:35,840 frames through FIFO/F1, finite output, closed-fader retained tail RMS0.0178539030, independent cue maximum error3.7144e-9, accepted/busy policy and same-ring resume.
- Graph, original Filter composite replay, headphone graph and parent telemetry regressions are checked separately.

The public processing contract remains **44.1kHz and64 frames**. Terminal short blocks are zero-padded by the stream, followed by reset on reconnect. This is not evidence of Pi performance or physical FLX6 behavior.

## Placement and remaining scope

`dsp_graph.c` takes active placement before each block; a completed manager type transition changes placement on the following block, matching the original call structure. Dub Echo and its retained tail run after channel gain, before matching channel BeatFX and crossfader. Prefader cue remains the current explicit lab policy; full native cue tap selection is not inferred from this test. Legacy and staged routing ramps both advance so entering/leaving postfader CFX cannot revive stale fader state.

**EQ/isolator is still absent.** Thus Noise/Sweep pre-EQ versus Filter/Crush post-EQ distinction is not yet audible, and the recorded Filter→Sweep EQ reset event awaits that stage. Space5 is the remaining CFX algorithm. Echo is the only integrated non-Off BeatFX;13 other native BeatFX algorithms remain. Native AZ UI/F1 synchronization is parent-owned and separate from DSP verification.
