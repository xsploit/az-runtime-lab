# Native RX3 Crush: algorithm and CFX lifecycle

Status: reconstructed and verified in isolation, ready for coordinated AZ graph integration. It is not yet exposed by live F1 or the AZ UI. No shared graph/stream changes were made in this pass.

## Identification and native code

The unstripped constructor map at0xbb970 identifies the actual manager storage order: Off(+4), Filter(+8), Noise(+12), Sweep(+16), DubEcho(+20), Space(+24), Crush(+28). The tested manager selection is **native enum6 Crush**, not relabeled Filter. Constructor calls at0xbbae4/0xbbaf8/0xbbb0c/0xbbb20/0xbbb34/0xbbb48 identify those implementations. Crush object size is152bytes, position1, default color/parameter0.5.

`crush.asm` maps color callback0xcbd38, parameter0xcbd6c, On/Off0xcbe38/0xcbe40, constructor0xcbe68, coefficient generation0xcbedc, initialize0xcc144, custom feedback IIR0xcc234 and execute0xcc30c. The tiny On/Off functions statically return1 without modifying state. The runtime manager composition follows its actual Off/Crush path; unrelated Sweep detector is a fixture tick, not a reconstructed Sweep effect.

## Tests

`run_crush.py` executes original ARM routines against the independent C reconstruction, then replays on x86 and ASAN/UBSAN. Each reports2400calls,125152stereo frames,341504 full-state/audio words and zero bit differences. Persistent color and parameter changes cover center/both sides, boundaries and finite out-of-range clamp cases; blocks0,1,64, repeated initialization, independent L/R and silence.

`run_crush_composite.py` executes the **original outer CFX manager** with actual native Crush DSP/control callbacks, using selection0↔6. Each ARM/x86/sanitized run reports12000calls,249274frames,1266548 compared state/audio words, zero differences. Blocks0,1,2,3,7,16,31,63,64; repeated/busy requests, control changes during fades, inherited Off controls, initialization counts, process counts, wet/dry ramps and complete Crush state are checked. Reports carry firmware hash, ranges, commands and source hashes. Native code bytes/executables/records are ignored private artifacts.

## Signal behavior and state

Color converts by float255.9 to integer0..255. Parameter converts similarly and drives a piecewise hold interval. A persistent integer counter and fractional phase control sample holding. At high parameter/hold settings, input IEEE float mantissa bits are masked; this is not a generic integer bit-depth quantizer.

The left mode uses held/bit-masked audio directly. The right mode adds the actual custom eight-coefficient feedback IIR and a squared dry blend. Color131 is the neutral filter case. A side crossing sets a deferred flip: the old mode finishes the block, then histories, held sample, hold phase and count reset. Its mode transition behavior is therefore block-dependent by design. Feedback and dry blend follow the original arithmetic order. NEON operations preserve the verified flush-to-zero behavior.

Coefficient generation includes two different powf curves, a fixed coefficient region for color116..123 and identity region124..131. Initialization clears all four stereo histories, feedback and dirty flag while preserving the exact reconstructed initial hold/side/blend state.

Native `m2_input_tmp` is static512-byte scratch at0x114bf78. The port uses a local64-stereo scratch array, so instances do not share scratch. The kernel contains no allocation, lock, device access or I/O.

## Prepared module and integration boundaries

`crush.h/.c`: complete algorithm. `cfx_crush.h/.c`: actual tested manager composition, normalized internal Off/Crush states, public setter accepting native0/6. Public atomic snapshot rejects invalid/busy without changing accepted controls. Native separate setters remain available to the harness; the atomic wrapper is host policy.

The low-level process precondition is at most64 frames, finite input/control and44100Hz. Native uses64-frame static scratch; do not advertise larger blocks. Recommended AZ integration is a channel CFX wrapper dispatching Filter and Crush through their verified lifecycle. **Filter↔Crush direct transitions have not been tested**; do not infer that testing each against Off proves every inter-effect transition. Initial integration can require/queue a verified Off transition between them, or add the direct native-composition oracle first.

Remaining CFX algorithms: Noise, Sweep, DubEcho, Space. Filter is separately integrated; Crush now verified but not integrated. BeatFX integrated subset remains Echo/Off. Roll, Delay, Helix, Pitch, Trans, Filter, Phaser, Reverb, Spiral, Flanger, PingPong, SlipRoll and VinylBrake remain unported. No native AZ UI association, Pi benchmark or controller claim is made here.

## Direct transitions and AZ integration completed

The subsequent `run_cfx_direct.py` oracle now runs actual native Off0, Filter1 and Crush6 together against the **shared AZ CFX sources**, including real native Filter/IIR/Crush callbacks. ARM/x86/sanitized:18000calls,374000stereo frames,2152000 numeric comparisons plus full manager snapshots, zero differences. Explicit completion counters prove90 direct Filter→Crush and53 direct Crush→Filter switches;1856 busy requests were exercised. Native fade-out, inherited controls, selected-effect initialization and fade-in are preserved directly. No synthetic Off intermediate was inserted.

`mixer/cfx_crush.*` is now dispatched by `mixer/cfx_manager.*`; F1 type6 enables Crush. Supported CFX IDs are0,1,6. `mixer/test_crush_stream.py` passes14080frames with Filter→Crush→Filter, busy rejection, Crush master difference RMS0.013967160451745864, cue error3.714e-9. Existing Filter native replay and headphone graph/stream tests pass. This supersedes the earlier pending-integration/direct-transition limitations above. Native AZ UI→F1 mapping and the other four CFX remain pending.
