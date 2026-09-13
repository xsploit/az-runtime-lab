# AZ software mixer groundwork

This is original host-side mixer code, not extracted Pioneer DSP. It consumes the AZ format verified in this lab:44100Hz, ten interleaved float32 channels. Decks1–4 occupy stereo pairs1/2 through7/8;9/10 are ignored. CDJ-3000X uses a different arrangement and must not be passed directly to this interface.

`deck_mix.c` produces four output channels: master L/R then headphones L/R. Cue taps deck audio before the channel fader and crossfader. Master and headphones have independent gains; headphones can blend the cue sum with master. Crossfader assignment supports left, bypass and right with an equal-power law. These choices are ours; no hardware curve equivalence is established.

The processing function allocates no memory, performs no I/O and leaves sums unclipped. Callers must validate settings with `lab_mix_valid`, use separate input/output buffers, and provide appropriate output headroom. The stateful API smooths control changes; EQ/trim/effects, resampling, audio devices and live transport remain unimplemented. Its four output channels are a logical layout, not a verified FLX6 device mapping.

Build the routing checks:

```sh
cc -Wall -Wextra -Werror -O2 deck_mix.c test_deck_mix.c -lm -o /tmp/az-deck-mix-test
/tmp/az-deck-mix-test
```

Render an archived private capture from the workspace root:

```sh
python runtime-lab/mixer/render_capture.py runtime-lab/xdjaz/first-four-deck-output.f32le.gz runtime-lab/xdjaz/mixed-master-cue.wav
```

This fixed demo routes all decks to master at0.25 gain and deck1 to headphones at0.5 gain. Its WAV uses four16-bit channels; a neighboring JSON records pre-quantization levels, clipping count and comparison against a separate scalar routing calculation. The Python renderer is offline tooling, not a real-time implementation.

Next: live audio transport, preferred FLX6 controls, an authoritative shared mixer-state packet, native cue indication, EQ/effects research, and native Pi/physical audio verification. Native ON AIR notifications are independently mapped in analysis/HARDWARE-MIXER.md; their audibility policy must follow the actual mixer state, not merely an always-on bit.


## Smoothed controls

Initialize `LabMixRamp` with `lab_mix_ramp_init`, submit validated snapshots through `lab_mix_ramp_target`, and process with `lab_mix_ramped`. Submit snapshots from the audio thread; this API does not provide cross-thread messaging. A441-frame ramp is10ms at the verified AZ rate; the caller chooses the duration. Zero requests an immediate update.

Ramps interpolate final master/headphone routing coefficients per sample, including cue and assignment switches. Retargeting starts from the current coefficients. The final frame snaps to the exact target to avoid residual drift. Processing results are invariant to block segmentation for the same timeline of updates. The equal-power law applies at target positions; the intermediate coefficient ramp is linear and is not claimed to reproduce a hardware crossfader trajectory.

`test_ramp.c` verifies stereo alignment, cue ramps, sample values,17/47/36 versus100-frame segmentation, halfway retargeting, rejected settings leaving state untouched, immediate updates and64 settled configurations against the original routing. These checks establish numerical smoothing, not a universal absence of audible clicks or real-time scheduling performance.

```sh
cc -Wall -Wextra -Werror -O2 deck_mix.c test_ramp.c -lm -o /tmp/az-mix-ramp-test
/tmp/az-mix-ramp-test
```

## Live private FIFO experiment

`MIX_STREAM=1` in the AZ launcher selects a private FIFO sink and starts the host `mix_stream.c` bridge. It uses the fixed demo gains described above and writes float32LE masterL/R/headphonesL/R to `xdjaz/state/tmp/mixed-output.raw`. It is mutually exclusive with `AUDIO_CAPTURE`; the bridge intentionally does not open physical audio hardware.

The first attempt reached EOF and the firmware crashed during startup; their causal order is unresolved. Do not treat that EOF as proof of normal ALSA reinitialization. The revised bridge supports successive writers while retaining the mixed output, verified with a synthetic reconnect test. Fragmented byte reads, partial final blocks, reconnect and clean signal shutdown are checked. A restart is not a seamless sample timeline: no timestamp, xrun or discontinuity accounting exists yet. Blocking FIFO/file I/O is diagnostic transport, not a low-latency device implementation.


Live run command (workspace root):

```sh
NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 ERP_FIXTURE=1 MIX_STREAM=1 LAB_DURATION_SECONDS=100 python runtime-lab/run-az-probe.py
```

Use the existing native browser/load/play procedure. `analysis/check-live-mix.py` checks a deck1-only tone run. A verified run captured9.999977sec active audio at439.999985Hz; headphone samples equal exactly twice master samples with the fixed gains. This establishes a running-player-to-separate-process mixer path, not measured real-time latency or physical audio output.

## Live control snapshots

`MIX_STREAM=1` now reports a `mixer_control` JSON event containing a private Unix datagram socket. While audio flows, use:

```sh
python runtime-lab/mixer/send_controls.py /tmp/az-live-mixer-EXAMPLE/control.sock --gains 0 1 1 1 --cue-mask 1 --ramp 441
```

Replace the socket with the reported path. Every command is a **complete snapshot**: unspecified values return to the sender's demo defaults. It is not a partial update. The example fades deck1 out of master while retaining its pre-fader headphone cue. This controls our host mixer, not the firmware's UI or a physical FLX6. Native cue/ON AIR state synchronization remains future work.

Protocol: `M1 ramp_frames gain1 gain2 gain3 gain4 assign1 assign2 assign3 assign4 cue_mask cross master phones blend`. Assignments are -1/0/1, cue mask is 0..15, gains/positions finite 0..1, ramp 0..441000 frames. At most16 datagrams are examined before each processed block, including a partial EOF block. No audio means no applied control yet. Multiple queued snapshots apply at the same boundary; the last accepted target wins there. Accepted snapshots log `control_frame` and `ramp_frames`; sending alone is not acknowledgment. The private socket is removed on normal shutdown and its temporary directory is cleaned by the launcher.

`python runtime-lab/mixer/test_live_controls.py` verifies a live64-frame fade, pre-fader cue retention, switching cue to deck2, and rejection of NaN, extra-field and oversized datagrams without changing routing. Applied offsets64 and320 are checked against captured samples. Existing fragmentation/reconnect tests still pass. Firmware-driven live-control playback, physical audio latency and listening tests remain unverified. This diagnostic bridge performs file writes and logging, so it is not a production real-time audio callback.

## Saved FLX6 mixer bindings

`flx6_state.py` reads the chosen BiteDJ XML mapping and maintains one complete host mixer snapshot across incoming MIDI messages. It handles four14-bit channel faders, crossfader position, headphone cue/master blend and four cue toggles. Cue presses toggle once until release; note-off messages release correctly. Before an analog pair has both bytes, it emits no fabricated value; later MSB/LSB updates use the most recently received counterpart. Hardware ordering and the resulting intermediate steps remain to verify.

`flx6_replay.py --mapping rx3-research/bitedj-mapping/Pioneer-DDJ-FLX6.midi.xml messages.txt` prints snapshots for three-byte hex messages, one per line. Add `--socket PATH` to send them to the live diagnostic mixer. This replay has no timing preservation and opens no physical MIDI device. State persists for that process only; separate invocations start at demo defaults. Crossfader assignments default to bypass, so position alone does not attenuate decks. Master/headphone gains remain demo defaults because their physical knob mappings have not been established here.

`python runtime-lab/mixer/test_flx6_state.py` checks all four faders, paired-byte arrival, cue edges/releases, blend, crossfader position, and unrelated controls preserving state. This validates the saved XML-based translation, not full BiteDJ gain-curve equivalence or device integration. Source digest/binding inventory: `analysis/flx6-mixer-binding-inventory.json`.

Browse/Back/View remain distinct in the saved mapping and deliberately do not alter host mixer state. Their native AZ navigation, controller LED output, raw MIDI byte parsing, reconnect/pickup behavior and native UI synchronization are unfinished.


### Optional reconstructed DSP stream

Set `DSP_GRAPH=1 MIX_STREAM=1` alongside the paced AZ launch options above to
compile and run the reconstructed four-channel Off/Filter graph. Other Sound
Color FX, EQ and BeatFX remain unfinished. Omitting DSP_GRAPH uses the dry mixer.
The graph and complete FIFO/control path pass synthetic audio tests; this alone
does not prove native AZ state integration or Pi performance.

The adapter accepts F1 snapshots through the same bounded datagram loop as M1.
F1 contains channel (0..3), type (0 Off /1 Filter), color and parameter (finite
0..1). A graph result is logged as accepted1, busy0 or invalid-1. This atomic
snapshot policy is a host interface choice; native independent parameter setters
have separate semantics. `send_filter.py` sends a command but does not claim it
was applied; inspect the result log.

Graph calls use64 frames. A terminal FIFO fragment is zero-padded for processing,
only real frames are written, then the graph resets before reconnect. This is an
explicit lab reconnect policy, not a recovered Pioneer stream-disconnect policy.
No physical audio device is opened by this bridge.

Requests received before processing starts may supersede a pending type change.
Busy rejection applies once the effect transition is processing. The stream test
checks this distinction with commands on successive audio blocks.

### Native routing merge

`MixerState.native_routing(inspect_tx(frame))` merges a valid AZ TX assignment
snapshot into the same state object used for FLX6 MIDI. A maps to left (-1),
B to right (+1), THRU to bypass (0). It preserves faders, cue, crossfader position,
headphone/master gain and blend. Unknown assignments reject the entire update;
invalid checksums do not change state. Repeated values produce no new snapshot.
The caller must serialize native packets and MIDI on one state owner, then send
`snapshot()` only when changed. The opt-in live capture follower is described below.
Headphone mode and Link Volume remain decoded observations; this method does not
pretend they are implemented audio stages. The current crossfade law remains the
original lab equal-power law, not a verified reconstruction of AZ curves.

`python runtime-lab/mixer/test_native_routing.py` checks all81 known assignment
combinations, corrupted packets and unknown lanes, preservation of MIDI state,
and native A/B/THRU endpoint isolation through the compiled C mixer.

`NATIVE_ROUTING=1 MIXER_TX_CAPTURE=1 MIX_STREAM=1` now enables the live single-owner
bridge in the paced AZ launcher (add `DSP_GRAPH=1` for reconstructed Filter).
It follows fresh 128-byte TX records, validates CRC and merges channel assignment
into `MixerState`. The launcher reports a private `midi_socket`; send complete
three-byte MIDI messages there to share the same state. This accepts diagnostic
messages only; physical USB MIDI enumeration/reconnect and controller LEDs remain
unfinished. Do not run a second M1 writer against the mixer concurrently.
F1 effect messages have independent state and may still use the mixer socket.

The bridge rejects capture truncation/replacement instead of combining sessions,
keeps partial TX records until complete, and is terminated with the lab run.
It does not synthesize touches. `test_live_routing.py` exercises the actual file
follower/socket path, fragmented capture, interleaved MIDI and native updates,
corrupt packets and capture-session changes. File-following mode has a bounded recording limit; use the continuous transport
described below for operation beyond that limit.

### Continuous native routing transport

Add `NATIVE_ROUTING=1 NATIVE_ROUTING_STREAM=1 MIX_STREAM=1` to the paced AZ
options to use Unix datagrams instead of a capped capture file. `MIXER_FIXTURE`
is required. `MIXER_TX_CAPTURE` is optional for separate diagnostics. The shim
sends only the128-byte mixer TX snapshots to the private `/tmp/mixer-tx.sock`;
ERP and firmware/key material are not part of this transport. Sends never wait
for a reader or retry a full queue. Lost snapshots can therefore occur; the next
complete snapshot refreshes state. This is suitable for the mapped routing
settings, not an event-lossless transport for future button edges.

`test_datagram_routing.py` verifies40,002 valid packets beyond the old capture
limit, malformed/oversized/corrupt packet rejection, MIDI preservation and socket
cleanup. `shims/test-mixer-tx-datagram.c` tests absent/full/recovered receivers.
The bridge has a30-second deadline margin beyond the launcher so normal
screenshot/teardown timing does not look like an unexpected bridge failure.
