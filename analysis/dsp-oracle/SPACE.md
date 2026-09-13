# RX3 Space → AZ software mixer

Space is native Sound Color FX type **5**, placement **2** (after the channel fader). Its actual processor, state and manager composition are now reconstructed in `mixer/cfx_space.*`, integrated through F1, and tested against original ARM instructions.

This completes the six named non-Off RX3 CFX algorithms: Filter, Noise, Sweep, Dub Echo, Space and Crush. It does **not** complete EQ/isolator, all Beat FX, native AZ control synchronization, or establish equivalence to the AZ hardware mixer.

## Evidence and processing

Source: local unstripped RX3 `rbp`, SHA256 `60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09`.

| Native address | Recovered behavior |
|---|---|
| `bd4d8..bd6c0` | Initialize, color-side selection, delays, filter coefficients/history, warm-up state |
| `bd6c8`, `bd6dc` | On/Off input-gate direction; both return true |
| `bd7d0..bea28` | Full Space processor |
| `bea28..beb7c` | Constructor and six allocated 32768-float rings |
| `beb7c`, `bebec` | Delay block helpers; same wrap behavior is inlined in execute |
| `9af98..9b17c` | Native scalar mono second-order IIR |
| `42d200`, `42d218`, `42d230`, `42d248` | Four fixed coefficient tables |
| `9e7d4` | Post-channel-fader CFX insertion |

The wet network first derives mono input from the stereo pair, applies the input gate and chased gain, then a side-dependent LPF/HPF pair. Four delay/allpass stages feed separate damped left/right feedback delays. The final wet channels are doubled and added to the original stereo input. Scalar arithmetic order, coefficient updates, history resets, delay wrap and warm-up thresholds are preserved.

The 176-byte native object tracks the active color side, chased integer color, pending side switch, six delay positions, shared write index, progressive warm-up counters, feedback gains, damping history, input gain and gate/smoothing ramps. Crossing the center region switches sides and clears filter history at the original block boundary; delay changes use the original smoothing behavior. Color/parameter callbacks themselves are no-ops: execute reads their stored values. The native parameter calculation multiplies the stored parameter by the same scale twice before integer clamping; the oracle includes small parameter values as well as ordinary normalized values instead of silently replacing that behavior with a preferred curve.

Initialize resets histories/counters/write position but does not erase all rings. Native global temporary arrays at `114b538..114bd38` become private per-channel scratch arrays. Every graph instance owns bounded ring and scratch storage, with no allocation in the audio callback. The native oracle retains the original global scratch arrangement and compares its full contents to the port.

## Manager and tails

Space's Off always returns true, including a repeated Off while already in the tail state. Native manager current/next become sentinel7; active remains Space5. The first Off remembers previous5; another Off can overwrite previous with7. A later Space selection therefore either resumes without initialize or takes the normal transition/initialize path, according to that original state.

The host manager now represents **active** separately from current and previous, matching the native active-object pointer. Inferring active solely from previous would fail this repeated-Off case. Controls, audio dispatch and insertion use actual active identity; F1 never accepts sentinel7. Direct transitions among all six effects use native behavior, including Space↔Dub Echo and Filter↔Sweep's existing EQ-reset event.

## Verification

- `run_space.py`: 1,600 blocks / 102,400 stereo frames, zero native ARM, host and ASAN/UBSAN differences. Compares the complete object, coefficients, mono-IIR histories, global/private scratch mapping, six complete delay rings and audio. Covers multiple ring wraps, changing controls, side changes, On/Off and reinitialize.
- `run_cfx_space.py`: shared all-CFX composition, 8,000 blocks / 512,000 stereo frames / 1,866,688,000 numeric comparisons, zero bit differences on ARM, host and sanitized host. Includes 177 busy requests, 11 Space tail entries, 9 returns from sentinel7, 8 Space→Dub Echo and 2 reverse transitions. Both single and repeated Off paths run.
- `mixer/test_space_stream.py`: 70,400 frames through actual FIFO/F1. Closed-fader tail RMS 0.0730710744, resumed effect RMS difference 0.0225010220, independent cue maximum error 3.7144e-9. Tests repeated Off, resume and Space↔Dub Echo changes.
- Graph tests now also compare four simultaneous Space channels against four independent graph instances for 640 blocks, including full Space state/rings and summed output. Host and sanitizer pass.
- Original Filter composite replay, Dub Echo FIFO, Sweep FIFO, headphone graph, F1 parser and parent BeatFX Q1 telemetry regressions pass.

The expanded graph occupies **3,744,288 bytes** on the tested 64-bit host, excluding separately allocated Echo/headphones. A multi-instance test originally put five graphs on its stack and overflowed; ASAN identified `four_independent_channels`. Those test instances now have static storage, preserving all independence assertions. The parent moved the production graph to startup heap allocation and verified the Echo FIFO under a 256KiB stack limit; main uses 8096 stack bytes including the headphone build. Space FIFO also passes after relocation (`analysis/mix-stream-heap-graph.json`). This was a test allocation failure, not an emulated AZ player failure.

## Remaining limits

The processing contract is 44.1kHz / 64 frames. PC tests are not evidence of Pi/FLX6 performance. Space and Dub Echo run after the channel fader and before matching channel BeatFX/crossfader. Cue remains the explicit lab prefader policy; full native tap selection is separate. EQ/isolator is absent, so pre-EQ Noise/Sweep and post-EQ Filter/Crush cannot yet be distinguished acoustically. Echo is still the only non-Off BeatFX integrated; 13 others remain.
