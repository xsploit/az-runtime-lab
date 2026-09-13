# Echo sample loop: native composite comparison

The independently reconstructed `echo_audio.c` now matches the actual native RX3 Echo sample loop, together with the previously verified native control callbacks, for the corpus below. This is an isolated processor verification, **not the complete BeatFX pipeline or AZ effect integration**. No shared mixer source changed in this pass.

## Reproduce and results

Run `python3 runtime-lab/analysis/dsp-oracle/run_echo_audio.py` from the workspace. It verifies the private local RX3 firmware hash before extracting instructions, builds ARM and x86 comparators, runs the ARM native reference through QEMU, and replays the recorded full state, ring buffer and audio on x86 with and without ASan/UBSan. See `echo-audio-results.json` for compiler commands and source hashes. Native extracted instructions, executable comparators and state/audio corpus are private ignored files.

All three builds pass with **zero differing words**:

- 5,632 calls, 614,606 stereo frames.
- 47,067,036 compared 32-bit words, covering PCM, the entire represented object state, and every stereo sample in the ring after every call.
- Block sizes 0, 1, 2, 3, 63, 64, 65, 127, 256 and 511; native and reconstructed instances persist across each scenario's block sequence.
- 84 scenarios cover initial, retained/odd, mature and first-delay-boundary counters; independent stereo inputs, impulses, silence, subnormal inputs, repeated controls and time changes, end-of-ring wrap, On/Off transitions and retained-tail paths.
- 80 scenarios use a 2,048-frame ring with legal delay times 1–40 ms. Four additional scenarios use an actual eight-second/352,800-frame ring and time values 1, 499, 500 and 4,000 ms. The large-ring cases are brief state-boundary fixtures, not long-duration feedback-decay measurements.
- Sixteen scenarios reduce control churn and exercise Off/retained state across mostly silent intervals, with occasional explicit impulse probes. These are state/audio equivalence checks, not acoustic tail-length acceptance thresholds.
- Exact-size input/output allocations let sanitizers detect reconstructed PCM overreads/writes. Every ring sample is compared rather than merely checking a checksum.

These results establish correspondence for each tested block sequence. They do **not** establish block-partition invariance: the native code performs depth and quantize updates at block boundaries, so changing partitioning can legitimately change output.

## Oracle boundary and substitutions

Original control instructions: `0xb6d40..0xb6ef8`, unchanged. Original sample-loop instructions: `0xb6f68..0xb7530`.

Six external branch instructions are relinked because the extracted code no longer resides inside its original executable:

| Native call site | Destination used by harness | Scope |
|---|---|---|
| `0xb6fe4`, `0xb7428` | libc `ceil` | Original math operation |
| `0xb7460`, `0xb74ac` | libc `floor` | Original math operation |
| `0xb7354` | `oracle_quantize` | **Scripted external hook**, counts calls and returns selected true/false |
| `0xb7364` | `oracle_time` | **Scripted external hook**, counts calls and optionally injects a new time/dirty flag |

The depth callback invoked through native vtable slot +56 is the **actual original depth callback**, including when execute itself requests it. Native quantize internals are **not** executed or reconstructed here. Scripted hooks verify that checks occur after sample processing, that the time callback is conditional, and that callback-injected state affects a later block. They do not verify BPM source, beat phase, quantize policy or clock discontinuities. The production module must not inherit these scripted hooks as if they were the actual feature.

## Verified execution behavior

- Time conversion is hardcoded around **44.1 samples per millisecond**: `(uint32(floor(uint32(ms << 1) * 44.1)) + 1) >> 1` for valid positive time values. The processor is therefore constrained to 44.1 kHz in the proposed port, despite storing a sample-rate field elsewhere.
- Startup resets write index, restarts the input gate, sets current/previous delays, and zeros crossfade values. It does not clear the ring; early delay reads are explicitly suppressed using the startup counter. Reset/tail behavior must preserve that distinction.
- The low counter bit differentiates retained state. The counter advances by two per sample during the startup/retention window and can stop advancing after the maximum-sample threshold, determined at block entry.
- During startup, dry/wet are forced to dry-only until enough delay history exists. Near the first-delay boundary the native processor calls depth update based on the current block length. Odd/retained state can retarget dry toward one.
- Delay taps use `write - currentDelay` and `write - previousDelay`, wrapping each negative index by adding the ring length once. Valid delay and ring-size preconditions are necessary.
- Active delay-time crossfade interpolates `oldTap + (newTap - oldTap) * crossfadeCurrent`. A new time change starts only when the crossfade is finished and startup suppression allows it. The triggering sample still uses the old tap; current/previous delay state changes for subsequent samples.
- Ring write is `input * gateCurrent + delayTap * feedback`. Default feedback is the constructor's stereo float approximately 0.7.
- Ordinary On/even-state output is `input * dryCurrent + delayTap * wetCurrent`. Off or retained/odd output additionally multiplies the dry input by the gate current; the delayed wet contribution continues.
- Gate, dry, wet and crossfade use the current value for the sample, then advance. Completion compares the **pre-increment** count to length before snapping to target; this timing is preserved.
- NEON flush-to-zero and arithmetic order are retained. No fused multiply-add or fast-math is allowed for this comparison contract.

## Proposed shared-module boundary

After parent review, a new `mixer/beat_echo.h/.c` could package this verified processor without altering existing stream or graph defaults:

- `LabBeatEcho`: one processor's fixed control/history metadata, with caller-supplied stereo ring storage. Full native eight-second ring at 44.1 kHz costs **2,822,400 bytes** (about 2.69 MiB). Number of concurrently retained instances must be decided by the actual BeatFX manager, not guessed from deck count.
- Initialization validates 44,100 Hz and ring capacity before attaching storage; no allocation, logging or locking in processing.
- Separate validated time (1–4,000 ms), normalized depth, On/Off, initialize and keep/retained operations. Preserve the distinction between manager state changes and individual virtual callbacks.
- Process 64 frames for the current host graph contract, with explicit post-block timing hooks or queued events. Until native timing is reconstructed, expose only a clearly identified manual-time test mode; do not claim quantized native Echo.
- Manager/target integration must own routing, bypass versus retained tails, dry contribution, reset conditions and target changes. Do not simply add the returned mixed signal on top of dry: the native processor already computes its dry contribution.

The current isolated `EchoAudio` includes test-hook counters and injected-time fields solely for the oracle. Those fields belong in a test adapter, not the production DSP state. A faithful full-pipeline integration remains blocked on the next mapping work below, not on a missing Pi.

## Required next stages

1. Reconstruct actual `QuantizedBeatEffect::checkQuantizeSetting` (`0x98fa0`) and `BpmQuantizeEffect::checkTimeUpdate` (`0x989dc`), plus their parameter setters and clocks. Compare timing/state with the real native callbacks.
2. Trace BeatFX outer manager initialize/keep/type/target transitions, sample-loop placement and microphone/master paths. Apply parent's native ChannelSelect semantics; TX18 alone collides Ch1 and microphone targets.
3. Validate constructor/runtime buffer setup and full lifecycle composition, including startup, stop/load, reset, bypass, target/type changes mid-tail and sustained feedback decay.
4. Integrate into the software graph only after signal ordering is resolved; test channel versus bus targeting, master/cue routes, explicit microphone bypass and retained tails without processing a shared bus twice.
5. Continue the remaining BeatFX and CFX inventory. One verified Echo processor does not fulfill the request for all DSP and effects.

Subsequent timing pass: [ECHO-QUANTIZE.md](ECHO-QUANTIZE.md) now verifies the real native eligibility/time-update/set-time callbacks in a second composite oracle. Player getters remain controlled fixtures, and quantized On scheduling plus outer routing/lifecycle are still pending. The scripted callbacks above remain the deliberate boundary of this earlier audio-only test.
