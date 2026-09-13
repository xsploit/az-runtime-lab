# Isolated BeatFX production candidates

Verified algorithms presently cover Echo plus outer Off/Echo lifecycle. These files are not connected to the live mixer. They currently use oracle type names/headers; namespace and API stabilization remain before copying to `mixer/`.

`run_beat_port.py` builds the real native manager/Echo oracle against this candidate and checks ARM, x86 and sanitized replay. It clears global player/quantize fixtures during candidate processing to prove the explicit passed context is used. `test_grid.c` checks dynamic ownership independently.

## Thread and allocation contract

Prepare immutable grids with `beat_grid_prepare` on a worker/control thread. Preparation validates nondecreasing beat time and at most 262144 entries, allocates/copies the grid and one end sentinel. Empty grids are valid and become unavailable to quantize. Do not mutate a prepared grid.

The host must transfer the prepared pointer through a synchronized bounded control queue. The **audio owner**, only between blocks, calls `beat_grid_bind`. It neither allocates nor frees nor locks. It returns the retired pointer; send that pointer back through a reclamation queue and free with `beat_grid_destroy` outside the callback. Never free a submitted/current snapshot until the audio owner returns it. If queues are full, keep the existing snapshot and retain the pending allocation on the producer; do not overwrite pointers. This module does not implement cross-thread publication itself.

Changing grid or BPM source resets cached beat index/phase eligibility; retaining the same grid/source preserves the iterator. Per-block time/tempo/transport fields are copied into the audio-owned player snapshot independently. Effect target does not change the BPM source. Ring storage (352800 stereo float frames = 2822400 bytes) must also be allocated before starting audio. Processing contract is 44100 Hz and 64 frames; current low-level model assumes these validated inputs.

## Proposed graph insertion API

Use one manager/Echo instance, not one per destination. Typed target must preserve Ch1/2/3/4, Master, Mic1, Mic2 and BothMic; TX bytes alone cannot encode every target. Retain independent requested and active targets during fades.

Suggested host layer:

- `begin_round(round_id, source_snapshot)`: called once for each 64-frame block; clears native consumed flag and tracks that round's processed insertion.
- `offer(stage, typed_target, stereo_buffer, bypass)`: process only the currently active target/stage; a transition completed here may select a later stage, but consumed prevents that later stage from running in the same round. Reject a duplicate offer for the same manager in a round. Stage selection uses native effect placement, not packet target order.
- `end_round()`: report a missing required target as a host routing/configuration error; do not silently process a different buffer. A selected silent channel still needs a zero buffer so Echo tails advance.

This layer remains a proposal. It must be reconciled with the native pre/post-fader placement map and mic/master/cue taps before implementation. BothMic requires a defined shared mic bus or independently verified routing semantics, not processing the same Echo twice. No actual mic DSP route has been verified here.

## Remaining effects

Sound Color FX: Filter is verified and integrated separately. Crush, Noise, Space, Sweep and DubEcho are not ported.

Beat FX: Echo audio/control/quantize and the Off/Echo manager subset are verified. Roll, Delay, Helix, Pitch, Trans, Filter, Phaser, Reverb, Spiral, Flanger, PingPong, SlipRoll and VinylBrake still need their actual algorithms and full composition. Generic quantize phase logic is verified separately but must only be used by effects that actually call it. This is not a complete DSP port or a claim that all AZ effects match RX3.
