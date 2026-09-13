# Applied effect feedback

The private `mix_stream` control socket accepts the exact datagram `Q1` when
built with `LAB_DSP_GRAPH`. Bind a local Unix datagram client path before sending;
the response goes only to that sender. Unbound clients receive no reply.

The version-1 JSON response reports `audio_frame`, `attached`, scheduled and
active effect/target/beat state, transition phase, effect on state, milliseconds,
current and previous Echo delay samples, pending delay change, source ID and
source BPM, and requested quantize/grid presence flags.

The snapshot is taken between blocks, before processing the next block. It
describes state at the reported frame. Scheduled values may already have been
range-adjusted by the native manager; they are not the original command history.
`time_ms` may lead the actual delay taps during a transition. Source BPM is the
manager input, not necessarily the effective quantized grid tempo. When
`attached` is zero, the prepared effect is not processing graph audio.

Replies use a nonblocking send, with no allocation or retry. A full or vanished
receiver drops the response. Request processing retains the existing maximum of
16 control datagrams per block. A client should poll modestly and treat missing
replies as missing observations, not confirmation of an applied command.
This is a private lab transport, not a claim of hard realtime performance.

`test_beat_telemetry.py` fills the receiver queue while PCM continues, drains it,
then verifies a fresh reply with the applied 40-BPM Echo regression result:
3000 ms, 132300 samples, effect beat index 6. The audio stream regression also
passes. The transport does not yet write AZ receive feedback automatically.

## One-shot native AZ feedback

`python runtime-lab/analysis/sync_echo_feedback.py PACKET MIXER_SOCKET RX_FIFO --mode tap` queries one fresh Q1 reply, translates settled Echo state, writes one CRC-valid RX packet, then updates the baseline file. Paths are explicit. The baseline and FIFO must be exclusively owned during this call; this helper is not a multi-writer merger. It preserves unrelated packet fields, rejects a baseline changed during query, and uses a newly bound reply socket for each call. Unattached, transitioning, unknown-tempo and quantized-grid states are not yet translated.

Live PID421403 verified two successive updates in AZ's own UI:40.0BPM/2beats/3000ms then120.0BPM/1/2beat/250ms. Evidence: analysis/az-live-echo-feedback{,-second}.json and xdjaz/live-echo-feedback{,-second}.png. This was a paused tone fixture with the software audio graph processing; it proves control/state/display propagation, not physical output or Pi performance. Persistent feedback and native control ownership remain unfinished.

## RX ownership core

`analysis/az_rx_owner.py` merges complete native input packets with applied effect feedback. Every accepted control packet produces a CRC-valid packet in order; it does not collapse press/release events. The effect masks preserve only verified fields (RX84 bits2/3/6, RX85high, RX86, RX88..92); X-PAD, browse, load and other fields remain controlled by input packets.

The owner requires an explicit mixer epoch and increasing audio frames. Unsupported newer states still advance the ordering watermark, preventing late older replies from rolling the display back. Expired/unsupported feedback retains the last displayed value but is reported degraded; it is not evidence the audio still has that state. A process restart requires a new owner/epoch. This core has no I/O and must be called from one thread. The persistent socket/FIFO service is still to be connected.

`test_az_rx_owner.py` covers interleaved browse press/Echo/release, old epoch, expiry, frame ordering across transitions, stale status, and CRC rejection without mutation.

## Continuous private service

`python runtime-lab/analysis/run_rx_feedback.py BASELINE MIXER_SOCKET INPUT_SOCKET RX_FIFO --mode tap --seconds 120` runs one RX writer. Send complete CRC-valid native control packets to INPUT_SOCKET. Do not use another direct RX FIFO writer concurrently. Q1 is polled every100ms by default using a fresh reply address; stale/unsupported feedback is reported. The mixer socket inode is pinned for the session. A replaced mixer socket or RX backpressure ends the service explicitly. On exit it closes its descriptors and removes its owned input socket.

The real service socket/FIFO test preserves browse press/release and changing feedback. Native AZ PID429970 then browsed/loaded through this same service and automatically displayed40BPM/2beats/3000ms followed by123BPM/halfbeat/244ms. See analysis/continuous-rx-live.json and screenshots. Launcher integration and quantized-grid tempo remain pending.


## Launcher-managed feedback

Enable `RX_FEEDBACK=1` with explicit `LAB_RX_FEEDBACK_MODE=tap` or `auto`:

```sh
NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 \
MIXER_FIXTURE=1 MIX_STREAM=1 DSP_GRAPH=1 RX_FEEDBACK=1 \
LAB_RX_FEEDBACK_MODE=tap LAB_DURATION_SECONDS=25 \
python runtime-lab/run-az-probe.py
```

The launcher waits for the mixer control socket and a reader on the AZ RX FIFO,
then starts the service with a fresh CRC-valid neutral baseline. Its
`rx_feedback` JSON event supplies the private `input_socket` and baseline path.
Send all native full-frame control packets to that socket; direct FIFO writers
must not run concurrently. Browse and load CLI helpers accept this socket as described below. TAP/AUTO is explicit session configuration, not detected from Q1.

Startup is bounded; a service or mixer exit aborts the run. Shutdown stops the
feedback service before the player, then cleans up the mixer and private paths.
`xdjaz/rx-feedback.log` records service state and is overwritten each run.
The 25-second native integration run accepted a press/release pair and reached
current Echo feedback, emitting three packets with zero invalid packets. Both
service and mixer exited zero. A second run deliberately terminated the service:
the launcher failed explicitly and cleaned up all three processes and sockets.
Evidence: `analysis/launcher-rx-feedback{,-failure}.log`.

This supersedes the earlier launcher-pending notes above. Quantized effective
tempo, other BeatFX feedback and complete controller integration remain open.


## Native input CLI routing

Both `analysis/send-browser-counter.py` and `analysis/send-mixer-load.py` accept
`--input-socket INPUT_SOCKET --baseline BASELINE`, using the paths from the
launcher event. The baseline is a control template, not a live snapshot of the
owner. Preserve your current browse counter and other controls explicitly.

```sh
python runtime-lab/analysis/send-browser-counter.py 2 --flag --input-socket "$RX_INPUT" --baseline "$RX_BASELINE"
python runtime-lab/analysis/send-browser-counter.py 2 --input-socket "$RX_INPUT" --baseline "$RX_BASELINE"
python runtime-lab/analysis/send-mixer-load.py --deck 1 --counter 2 --input-socket "$RX_INPUT" --baseline "$RX_BASELINE"
```

These encode native packets, not pointer events. Socket sends are nonblocking;
backpressure/failure raises rather than silently losing edges. A successful send
means queued for the service, not acknowledged by firmware. Without the socket
option the original exclusive FIFO mode remains (or select `--fifo PATH`). Do
not combine direct writers with the owner service. The raw BeatFX differential
probe remains direct/exclusive: its owned FX fields would intentionally be
ignored by the service.

`analysis/test_rx_input_cli.py` executes both actual CLI programs through the
real owner service and a controlled Q1 responder. Six emitted packets preserve
browse/load edges, counter, unrelated baseline bytes and settled Echo feedback.
