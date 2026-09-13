# Beat Echo: verified control callbacks

This is a bounded next stage toward the complete BeatFX pipeline, **not an Echo audio port**. The Filter graph remains the only implemented effect in the software mixer. All files here are isolated; no shared mixer changes are made for Echo yet.

`python3 run_echo_control.py` extracts the local RX3 instruction span `0xb6d40..0xb6ef8` after checking the full firmware SHA256, without instruction relocation or replacement. Native code runs under ARM QEMU. Original virtual dispatch from On calls the original depth callback through a harness object/vtable; no callback is mocked. The independently reconstructed scalar C runs against native state on ARM, and replays those native records on x86 with and without ASan/UBSan. Extracted instruction bytes, linked oracle executables and native state records are ignored private generated artifacts.

## Results

76,800 callback calls per architecture, 140 represented state bytes per call, **zero differing calls** on ARM, x86 and sanitized x86. There are 1,200 independently initialized scenarios, each continuing through 64 control operations. The corpus covers threshold values and their adjacent floating-point values, normalized random depth, independently unequal stereo ramp state, repeated On/Off/depth actions, and subnormal/signed-zero ramp inputs. These are control-state tests; no audio block or delay buffer is exercised.

## Reconstructed behavior and address evidence

| Callback | Address | Effect |
|---|---|---|
| initialize | `0xb6d40` | Counter at +128 becomes 0; maximum sample count +124 becomes sample rate +4 multiplied by 8. No delay-buffer clear occurs in this callback. |
| keepEffectInit | `0xb6d58` | Counter becomes 1, selecting the retained/tail state for later execute logic. |
| changeTimeValue | `0xb6d64` | Byte at +140 becomes 1; time-to-delay conversion occurs later in execute. |
| changeEffectStatusToOn | `0xb6d70` | Input gate ramp +144 restarts at zero toward one; it does not chase from the previous gate current. Then original virtual slot +56 invokes depth update. |
| changeEffectStatusToOff | `0xb6dc4` | Input gate retargets toward zero from `current + oldStep`; delay memory is untouched. This is not an immediate wet-output mute. |
| changeLevelDepthValue | `0xb6e04` | Recomputes dry and wet targets and retargets independent stereo ramps at +148 and +152. |

Depth curve (literal constants from `0xb6ee4..0xb6ef4`):

- Below 0.009765625: dry 1, wet 0.
- From 0.009765625 to below 0.75: dry 1, wet `(depth - 0.009765625) * 1.3509235382080078`.
- From 0.75 to below 0.990234375: wet 1, dry `(0.990234375 - depth) * 4.162601470947266`.
- At or above 0.990234375: wet 1, dry 0.

This is not an equal-power crossfade or a single linear wet/dry knob. Control retarget uses `(target - (current + oldStep)) * inverse`, clears count/done and preserves ramp length/current. The slope calculation uses scalar VFP semantics; the ramp retarget instructions use NEON flush-to-zero arithmetic. Their arithmetic order is preserved in the C reconstruction.

The modeled ramp is 40 bytes: stereo step, target, current; count; length; reciprocal length; done byte and padding. The oracle does not establish constructor smoothing lengths, valid public control clamping, outer manager transitions, or actual delay-buffer behavior. It compares the represented fields; unrelated object storage is not claimed reconstructed.

## Next integration gates

1. Reconstruct and execute-test the delay/ring sample loop at `0xb6f68..0xb7530`, including startup suppression, feedback, On/Off tails and delay-time crossfade.
2. Verify constructor defaults and smoothing lengths; trace actual time setters, BPM/beat and quantize callbacks (`0x98fa0`, `0x989dc`). The execute code calls these after processing; dropping them would lose state behavior.
3. Verify the BeatFX manager's enable, target/channel, beat-time, reset, microphone and master insertion states. Packet target collisions require native semantic settings supplied by the parent adapter.
4. Only then propose a separate BeatFX processing stage in the mixer graph. Do not expose this control-only implementation as a functioning Echo effect.

Remaining broad inventory: Beat Echo, Roll, Delay, Helix, Pitch, Trans, Filter, Phaser, Reverb, Spiral, Flanger, PingPong, SlipRoll, VinylBrake; CFX Crush, Noise, Space, Sweep, Dubecho. Verified CFX Filter and Off/Filter manager composition do not validate those effects or the remaining full manager special paths.

## Constructor leads (static, not part of callback execution comparison)

Constructor `0xb75a8` initializes depth to 0, time to 500, time bounds 1/4000, On byte to 0, current and previous delay to 1, and ring pointer/length to zero. A separately allocated stereo feedback value receives `0x3f333333` in each channel: approximately 0.7 (`0xb76ac`, literal `0xb7928`).

Delay crossfade (+136) and dry/wet ramps (+148/+152) use `max(1, trunc(float(sampleRate * 3.3333332538604736) / 1000))` samples; input gate (+144) uses the same calculation with 4.351473808288574 milliseconds. At 44.1 kHz these yield 147 and 191 frames respectively with the constructor's float32 intermediate operations. Initial gate and crossfade targets/current are 0; dry is 1; wet is 0; step and count are 0; done is 1. Evidence: `0xb76cc..0xb7734`, `0xb7758..0xb77c0`, `0xb77e4..0xb783c`, `0xb7860..0xb78b4`. These defaults still need inclusion in the eventual native composite Echo audio oracle.

Subsequent stage: the isolated sample loop has now passed a native composite comparison; see [ECHO-AUDIO.md](ECHO-AUDIO.md). The controls-only scope above remains the scope of this particular callback test. Actual quantize and outer BeatFX integration are still pending.
