# RX3 Sound Color FX Sweep (native ID 3)

Sweep is reconstructed and integrated into the AZ software CFX manager as F1 type3. This is the original DSP behavior under the verified44.1kHz/64-frame contract, not a generic filter substitute. Physical Pi/FLX6 performance and AZ UI synchronization are separate work.

## Signal and state

The268-byte original object owns nine second-order IIR instances: four split-band detector filters, one gate recombination filter, and four variable sweep filters. State includes two band buffers, per-sample peak levels, two60-entry peak memories, current/target thresholds, gate gains, sample counters, color chasing and smoothstep fades. All production state and scratch are per-instance with bounded stack storage and no audio callback allocations.

Color maps by truncate(color*1023) followed by arithmetic shift2. Color chases one integer step per execute block. Processing chooses gate versus sweep using the previous color step, while coefficients are updated using the new step. Parameter updates set the native dirty byte.

The detector runs every manager block, including Off and other selected CFX. Its two-band extrema deliberately share the running minimum/maximum across bands. Peak windows roll after1471 accumulated frames; short and long rolling maxima and a60-window hold control threshold decay. Reinitializing the selected Sweep effect preserves detector histories and rolling memories. Gate filtering processes each sample through the recombination IIR; the sweep branch cascades LPF/LPF/HPF/HPF. Its coefficient scheduler alternates low/high updates across calls and retains unfinished updates in the original state flag.

## Address evidence

- Constructor layout/fixed detector coefficients:0xbee58..0xbf0e8. The allocator/constructor itself is statically mapped; the execution oracle uses an explicit preallocated fixture.
- Gate processing:0xbf0e8..0xbf2a4.
- Sweep processing:0xbf2a4..0xbf3dc.
- Stereo maximum/absolute level helper:0xbf3dc..0xbf43c.
- Continuous peak detector:0xbf43c..0xbf750.
- Gate parameter curves:0xbf750..0xbf8dc.
- Variable sweep coefficients:0xbf8dc..0xbff1c.
- Initialize:0xbff88..0xc0210; execute:0xc0210..0xc0458.
- Gain-chase preparation:0xc0458..0xc04e8.

## Native comparisons

`run_sweep_gate.py`:18,000 persistent calls comparing full object state plus two gated band buffers, including gate coefficients, gain preparation, block lengths0..64. ARM/native, host and ASAN/UBSAN all match.

`run_sweep_coeff.py`:16,000 coefficient-update calls, all256 color steps plus parameter changes. Full state, four coefficient arrays and callback counts match exactly on all three builds.

`run_sweep_detect.py`:18,000 detector calls with fixed band-output fixtures; full state, levels and rolling memories match. This isolates detector logic from filtering.

`run_sweep_composite.py`:6,000 blocks/384,000 stereo frames with actual native IIR, initialize, detector and execute composed together. Original endpoint/detector coefficient fixtures are read privately from firmware. Full state, all nine histories, rolling memories, scratch and output match on ARM, host and sanitizer builds.

`run_cfx_sweep.py`:18,000 manager blocks/1,152,000 stereo frames,25,596,000 numeric comparisons plus full manager snapshots. Actual native Filter, Noise, Sweep, Crush, IIR and manager callbacks versus shared production code: zero differences on all three builds. Direct completed transitions include Filter→Sweep80, Sweep→Filter31, Noise→Sweep97, Sweep→Noise35, Crush→Sweep28, Sweep→Crush90. Busy requests1263. Native EQ reset callbacks are counted explicitly; EQ audio is a fixture, not a claimed port.

## Manager transitions and EQ constraint

Filter↔Sweep transitions outside color[0.41796875,0.578125] use native phases2/4: fade processed audio down/up without blending dry into that buffer. Other supported transitions retain their own verified phase1/3 behavior. At phase2 completion for Filter→Sweep, native0xbc3e4..0xbc3f4 resets the selected channel equalizer through MixerChannel+428. The shared manager records this as `eq_reset_requests`; a future native EQ stage must consume that event to clear its history. Current graph has no EQ stage, so no EQ audio fidelity is claimed.

Sweep and Noise have native insertion position0 (pre-EQ); Filter and Crush position1 (post-EQ/pre-fader). The existing graph puts these at its common pre-fader stage because EQ is not implemented yet. Adding EQ requires separate insertion points and the recorded reset event.

## Runtime validation and remaining work

`mixer/test_sweep_stream.py` passes23,040frames through Filter→Crush→Noise→Sweep→Filter→Sweep using real FIFO/F1 dispatch. Sweep master difference RMS0.01750449, unaffected cue maximum error3.714e-9; accepted/busy results match. Graph tests, old Filter native replay, headphone stream and control parser regressions pass. These PC checks do not establish Pi performance.

Shared supported CFX IDs are0 Off,1 Filter,2 Noise,3 Sweep,6 Crush. Remaining CFX:4 Dub Echo and5 Space. BeatFX Echo/Off is integrated;13 other BeatFX remain. No firmware image or extracted executable bytes are published by these tools.
