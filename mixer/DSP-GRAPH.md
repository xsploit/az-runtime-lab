# Opt-in AZ software DSP graph

The graph contains all six reconstructed RX3 Sound Color FX algorithms, an opt-in native EQ/isolator stage, optional reconstructed Echo/BeatFX lifecycle, and optional headphone DSP. These algorithms are compared with private original RX3 ARM execution; this does not establish equivalence to the AZ hardware mixer. Native AZ controls and stream commands are separate integration work.

## Runtime contract

- Only 44,100 Hz, 64-frame blocks, finite input and disjoint input/output buffers.
- Ten input channels contain four logical deck stereo pairs followed by an unused fifth pair. Four output channels are master L/R and headphones L/R.
- One caller-owned graph contains four independent CFX and EQ instances. Current host size without the headphone compile option is **3,763,992 bytes**. Keep it on the heap or other persistent storage, not a constrained thread stack. Echo/headphone objects and immutable EQ tables have separate caller-owned lifetimes.
- Processing/setters are owned by the audio thread and called at block boundaries. No callback allocation, filesystem/device I/O, locks or logging.
- There is no built-in limiter. Trim, microphone mixing and thirteen other native BeatFX algorithms are not implemented. Cue/crossfader/fader routing remains the documented lab policy.
- EOF policy belongs to the stream: pad a partial terminal block to 64, write only actual frames, reset on reconnect.

## Existing graph and CFX API

`lab_dsp_graph_init(graph, 44100, mix)` returns 1 accepted or -1 invalid. `lab_dsp_graph_set_mix(graph, mix, ramp_frames)` retains the existing LabMixRamp policy. `lab_dsp_graph_process(graph, input10, output4, 64)` rejects invalid input without changing state/output.

`lab_dsp_graph_set_cfx(graph, channel, type, color, parameter)` accepts logical channel 0..3 and normalized finite controls. Types: 0 Off, 1 Filter, 2 Noise, 3 Sweep, 4 Dub Echo, 5 Space, 6 Crush. It returns 1 accepted, 0 transition busy, -1 invalid. Busy/invalid snapshots leave all state unchanged. Native independent parameter setters can operate during a type transition; the host F1 snapshot deliberately rejects atomically. Requests before processing starts a transition may supersede each other.

All six algorithms preserve verified native state, parameter curves, histories and type-transition behavior. Dub Echo/Space have post-fader insertion and surviving tails. Space has six 32,768-float delay buffers per instance; warm-up does not erase rings. No generic replacement effects are described as native ports.

## EQ/isolator attachment

Compile the additional source `channel_eq.c`; no new preprocessor define is required. Without attachment, the existing graph follows the previous path. The module includes no private instruction or coefficient-table blobs.

`lab_dsp_graph_attach_eq(graph, tables)` is startup-only and accepts one borrowed immutable `LabEqTables`. It returns 1 or -1. The fixture must remain alive and immutable until graph destruction, outside graph storage. Its exact 16,464-byte layout is:

```c
float coefficients[3][256][5];
float isolator_gain[256];
float isolator_coefficients[4][5];
```

Native table addresses and private extraction recipe are documented in `../analysis/dsp-oracle/EQ-ISOLATOR.md`. Attachment checks finite table values; the loader must verify the original fixture provenance. Table I/O must happen outside the audio callback.

`lab_dsp_graph_set_eq(graph, channel, mode, high, mid, low)` accepts mode 0 EQ / 1 isolator and three normalized finite controls, in **HIGH, MID, LOW** order. The entire snapshot is validated before mutation and returns 1 or -1. Native retargeting remains available during mode changes. Both processors receive every accepted knob snapshot, including the inactive processor.

Initialization preserves native cached-index/ramp state. The channel starts muted and pending; its first processed block resets the selected EQ and begins fade-up. Mode switching uses a 2.9 ms ramp (127 samples at 44.1 kHz). Isolator knob smoothing uses 3.3 ms. Initial knob snapshots should be delivered explicitly; graph attachment does not silently replace native initial histories with settled neutral ones.

The initial CFX insertion point is captured before each block:

1. Position 0: Noise/Sweep, before EQ.
2. EQ or isolator, followed by its native mode-change mute/fade.
3. Position 1: Filter/Crush, after EQ and before fader/cue.
4. Channel fader.
5. Position 2: Dub Echo/Space, followed by the existing channel Echo stage and crossfader routing.

A type change completed inside CFX processing takes its new position on the next block. A Filter→Sweep reset clears only the EQ processor selected at the event point. Consuming the event immediately after the CFX manager returns matches the actual native callback, including when EQ mode selection changed earlier in the block. Current Echo insertion remains the existing verified host path; this is not a claim that other BeatFX positions are complete.

`lab_dsp_graph_reset` retains the immutable attachment and only the EQ control snapshots actually accepted, recreates native EQ histories/startup transitions, retains last accepted CFX/mix controls, and preserves the existing optional Echo/headphone reset policy.

## Verification

- `analysis/dsp-oracle/run_eq_shared.py`: landed module replayed against original channel + CFX manager + actual EQ/isolator DSP; 8,000 blocks / 195,389 frames, 78 CFX-triggered selected-history resets, complete output/state match on ARM, x86 and sanitizers. CFX algorithm callbacks are identity in this ordering-specific oracle; actual algorithms have separate full native tests.
- `mixer/test_eq_graph.py`: 153,600 frames through four independently controlled EQ/CFX channels, 132 CFX changes, 21 Filter→Sweep resets; exact output and complete state match against the isolated verified EQ model plus actual CFX processors. Also checks invalid attachment/control atomicity and reconnect persistence.
- The EQ graph test separately exercises Dub Echo and Space after EQ/fader: cue and independent EQ state are unchanged by post-fader FX, while nonzero tails survive a closed fader. Both host and ASAN/UBSAN pass.
- `analysis/dsp-oracle/check_graph.py`: existing dry/Filter/all-CFX graph tests and native Filter composite replay pass after EQ landing. No EQ attachment is enabled in this regression suite.
- CFX detail: `CFX-FILTER.md`, `CRUSH.md`, `NOISE.md`, `SWEEP.md`, `DUB-ECHO.md`, `SPACE.md` under the oracle directory. EQ details, constructors and composition: `EQ-ISOLATOR.md`.

The EQ source and graph are ready for parent-owned stream wiring and real Pi tests. A successful PC graph test does not establish native AZ knob synchronization, hardware audio quality, controller mapping or Pi real-time performance.

## EQ stream delivery

The FIFO bridge now accepts `EQ1 channel mode HIGH MID LOW`. Channels are0..3,
mode0 is EQ and1 is isolator; all three band values are finite normalized0..1.
The snapshot is validated before mutation, delivered at a64-frame boundary,
and logged with `eq_frame`, channel, mode and result. Native band order is
HIGH/MID/LOW; UI controls arranged LOW/MID/HIGH must reorder explicitly.

Enable by providing `LAB_EQ_TABLES` at process startup. The stream reads exactly
16,464 bytes into an immutable heap object before opening the audio FIFO and
validates the coefficient values before attaching. The launcher additionally
pins the private fixture SHA256; the raw stream expects its caller to establish
provenance. No table data is embedded in public source and no EQ allocation or
file reads occur in the processing callback. Missing attachment causes EQ1 to
return-1; the established no-EQ graph remains the default. Initial knob values
must be submitted explicitly, preserving native muted startup behavior.

`test_eq_command.c` covers malformed/overflow/nonfinite/trailing/NUL input and
unchanged output on rejection. `test_eq_stream.py` covers real command sockets
and FIFO audio for an active isolator, full channel cut, independent cue,
malformed command rejection, unattached rejection and invalid startup fixtures.
Each audio case processes20,480 frames. Full-cut master energy was0, while the
other channel's cue remained bit-identical. `analysis/eq-stream-results.json`
records the numerical result. Existing no-EQ Space FIFO regression still passes.
Pi execution, native AZ knob synchronization and physical FLX6 control of this
new EQ path remain pending.

### Native EQ bridge (private lab)

Set NATIVE_EQ=1 together with RX_FEEDBACK=1, MIXER_TX_CAPTURE=1 and the verified LAB_EQ_TABLES fixture. The RX owner follows newly appended TX records for global EQ/isolator mode, combines them with successfully forwarded RX knob packets, and sends changed EQ1 channel snapshots. It waits for both inputs and never initializes knobs from the synthetic launch baseline. Unknown mode suspends output. The launcher ends the service with the player; create a new owner for every player/mixer session. This currently uses a diagnostic TX capture file, not a low-overhead production transport. Live mode0 delivery and native knob state are verified on the PC; GUI mode switching and physical FLX6 are pending.

With NATIVE_NAVIGATION=1 and NATIVE_EQ=1 on the PC launcher, the native MIDI service also maps the24 saved FLX6 EQ CC bindings into the shared RX frame. HIGH/MID/LOW use the BiteDJ EqualizerRack parameter3/2/1 bindings. Both14-bit halves must arrive before the first update; subsequent changes use the last-known opposite half. Values retain the upper10bits for AZ. This preserves addresses and physical travel endpoints; it does not promise identical BiteDJ/native DSP curves. The direct service option is --eq-controls. Physical controller/pickup/reconnect behavior remains to test.
