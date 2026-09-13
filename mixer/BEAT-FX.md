# AZ software mixer: reconstructed Echo

The opt-in AZ DSP stream now contains verified RX3 Echo and its Off/Echo outer manager. It processes actual AZ decoded PCM. Native AZ UI-to-Echo control binding is **not yet implemented**; E1/P1 are explicit local lab commands. Other effects remain unsupported.

## Commands and native linkage boundary

`E1 <type> <target> <beat> <depth>`: type 0 Off / 5 Echo; logical channel targets 0..3, Master 4; beat enum 0..11; finite depth 0..1. First valid E1 attaches the shared effect. Unsupported type or microphone targets are rejected. Selecting Off preserves the native Echo tail; requested type can differ from the active processing type. Source selection is independent.

`P1 <source> <bpm100> <playing_time> <tempo> <loaded> <quantize>`: selected player 0..3, BPM scaled100 or UINT32_MAX unavailable, native time input, fractional tempo (-1,4], booleans. The explicit snapshot does not infer a beat grid from BPM. Quantized grid timing only works after an actual prepared grid is bound through `lab_beat_fx_grid`; UDP grid transfer/native extraction remains pending. Unavailable grid uses native ineligible quantize behavior and the independent BPM range selection.

F1 and M1 remain unchanged. H1 is reserved for the separate verified headphone module; no approximate receiver was added here.

## Graph and state

Each of four channel buffers runs CFX before its host fader. Echo targets the selected post-fader buffer, then host crossfader routing sums master; Master Echo runs on that sum before master gain. Cue sums the CFX-processed pre-fader channels. Master and cue then use the existing host headphone mix, **not the native headphone DSP**. This is explicit host graph integration; it does not establish native AZ mixer equivalence, EQ or microphone processing.

One shared Echo instance is offered targets in logical channel order0..3, then Master4, preserving the native consumed-round guard during target transitions. Existing tails keep advancing on zero input. Closed faders do not clear history. No per-channel duplicate Echo instances are created.

`LabDspGraph.master_bus[64]` exposes the post-master-gain stereo bus, `cue_bus[64]` the pre-fader cue sum before headphone gain/blend on the Echo-enabled path. These fields are not populated by the original no-Echo fast path; future native headphone integration must deliberately select the explicit bus path. Host routing coefficients are decomposed and smoothed individually on the enabled path. The original default coefficient-matrix path remains intact until E1 enables Echo.

`LabBeatFx` includes its 352800-stereo-frame ring, about2.8MB. `mix_stream` allocates it once at startup, outside processing. Graph and effect processing allocate nothing. FIFO reconnect resets history and restarts requested controls, retaining player/grid bindings. A caller supplying immutable dynamic grids must follow `beat_grid.h`: prepare outside callback, transfer at block boundary, reclaim returned retired pointer off callback. A BPM source change cannot use a grid bound to a different source.

## Validation

- `analysis/dsp-oracle/run_beat_shared.py`: actual shared manager/Echo/quantize/control sources against original native ARM composite, x86 and sanitized replay; zero bit differences. 180 persistent64-frame blocks,11520frames,127051920 state/audio/ring words (+459 ARM guard checks). Includes range/force/tempo/target/tail/bypass changes.
- `test_beat_graph.c`: sanitizer pass for delayed audio, dry pre-fader cue, post-fader history, source/target independence, one-block transition processing, Master targeting and reconnect reset.
- `test_beat_stream.py`:14080-frame FIFO/P1/E1 run; delayed master energy0.12234945596506909, cue error0. Also checks accepted command events.
- Existing graph/Filter native replay and14080-frame F1 stream test still pass.

These are PC tests. Native AZ UI mapping, real mic/cue hardware, physical FLX6 behavior and Pi performance remain unverified. Sound Color FX remaining: Crush, Noise, Space, Sweep, DubEcho. BeatFX remaining: Roll, Delay, Helix, Pitch, Trans, Filter, Phaser, Reverb, Spiral, Flanger, PingPong, SlipRoll, VinylBrake.
