# Native phase timing and the Echo On/Off correction

## Important distinction

Echo's native On/Off switch is **immediate at the control call**, including when mixer quantize is enabled. `BeatEffectManager::setBeatEffectOnOff` (`0x89940`) checks the current On byte and calls vtable +28 only when the requested value differs. Echo's slot +28 is `QuantizedBeatEffect::changeEffectStatus` (`0x98d14`), which directly invokes Echo's On or Off callback and writes the new On byte. The On path additionally resets the quantize flags/counter and captures the global setting. A repeated request for the already-current state does nothing and must not restart the input-gate ramp.

This path is now part of a real native manager/status/Echo/timing composite oracle: `run_echo_status.py`, **1,920 calls / 107,520 stereo frames / 34,425,600 compared words, zero differences on ARM, x86 and sanitized x86**. It exercises repeated requested values amid tempo, beat-grid availability and transport changes. See `echo-status-results.json`.

Earlier planning notes called the next task a “quantized On scheduler.” That framing was too broad. The generic countdown routines below synchronize effect-cycle timing; they do not postpone Echo's On switch. The Echo audio loop invokes beat-duration synchronization, not the generic `checkQuantizeBeat` loop. Adding the latter to Echo simply because it has an inherited vtable entry would be wrong.

Actual virtual slot +72 calls were verified in the execute methods of **Trans, Beat Filter, Vinyl Brake, Phaser and Flanger**, at `0x91250`, `0x94504`, `0x967fc`, `0x97960`, `0xb86d4`. See `echo-scheduler-virtual-calls.asm`. Roll and SlipRoll have additional specialized quantize methods. The raw candidate list also contains unrelated +72 object loads and must not be treated as a list of verified calls.

## Generic phase scheduler verification

`python3 runtime-lab/analysis/dsp-oracle/run_quantize_phase.py`

**7,200 persistent fixture calls, 511,200 compared state/return words; zero differences on ARM, x86 and ASan/UBSan x86.** Sources are `quantize_phase.c/.h`, `quantize_phase_compare.c`, generated assembly and `quantize-phase-results.json`.

The oracle executes actual native:

| Routine | Address |
|---|---|
| calcPlayingTime(bufferFrames) | `0x990a4` |
| calcPlayingTime zero-buffer clone | `0x98c58` |
| searchNearestBeat | `0x99168` |
| calcQuantizedTime specialized clone | `0x98d70` |
| checkQuantizeBeat | `0x996a8` |
| Native parameter ID 3 dispatch and Echo time-dirty callback | As in the previous timing oracle |

Player-engine getters remain controlled fixtures. Native phase logic, beat search, duration arithmetic, countdown mutation and parameter dispatch are not mocked. Using Echo's native parameter setter/time-dirty callback here provides an observable time destination; it does **not** claim Echo normally calls this generic phase loop. No Trans/Phaser/etc. sample processing is part of this phase test.

The 72 scenarios retain state across 100 operations each, mixing direct primitive calls and full phase checks. They cover twelve beat enums; changing tempo and beat BPM; exact/adjacent beat, quarter and half positions; before/after grid positions; multi-beat clock jumps; negative sample positions for the clock primitive; reverse/scratch/spin/scan; invalid source and absent beat object. State comparison includes normalized phase and BPM iterator indices, counters/flags, effect time/dirty state and player beat-search mutation. Full malformed/empty grids are outside the valid fixture domain.

## Reconstructed decisions

- **Clock conversion:** obtain player sample position and unadjusted tempo getter. Subtract `trunc(bufferFrames * (1 + tempo))` only when position is greater than that correction. Multiply the remaining signed position by the native double constant approximately `1/44.1`; round positive values upward and negative values downward. The zero-buffer clone uses the same conversion without buffer compensation. Do not replace this with ordinary round-to-nearest milliseconds.
- **Nearest beat:** lower-bound lookup first identifies the upcoming/equal beat. Between adjacent beats, select the nearest previous beat, half-beat, or upcoming beat using quarter-interval comparisons. Ties favor the previous/half choices as represented in the code. Fields +95, +96 and +93 carry half-selection state; +92 records boundary/carry cases. An initial search copies its half flag into additional phase flags, while later searches can leave them unchanged.
- **Duration:** numerator and denominator parity choose how many beat entries to advance, whether the target is the beat itself or its midpoint/next beat, and the subdivision divisor at +104. Speed is `1 + tempo`; if effective beat BPM falls below 40.00, the phase-duration routine floors effective speed to `4000 / originalBpm100` instead of rejecting outright. This differs from Echo's ordinary BPM-duration synchronization, which returns without updating below that threshold. Missing required next-beat entries or a target already reached returns zero.
- **Integer order matters:** after truncating the tempo-adjusted remaining time, native code divides by the subdivision, then checks the **quotient's** remainder against that subdivision and increments when nonzero. This unusual double-use of division is preserved; replacing it with an assumed standard ceiling formula changes results.
- **Countdown:** the phase loop caches a separate beat iterator at +84. When that iterator changes it decrements a nonzero wait counter once. A jump across multiple beats does not automatically decrement once per skipped beat. Transport-suppressed calls leave that progression untouched. When ready, half-edge and initial flags determine whether to recalculate a shortened duration now and how to reload the beat counter.
- **No implicit On toggle:** this generic phase loop changes timing fields and flags, not the effect On byte. Effect-specific processors interpret the resulting timing during their own sample processing.

One reconstruction error was caught and fixed: the even-denominator half-selection path targets the next beat, whereas its other branch targets the midpoint. The first comparison reported 1,439 differing words; correcting that branch produced the final zero-difference result. The oracle is the basis for the implementation, not a generic musical approximation.

## Ownership and remaining composition

Both cached iterators (+84 phase, +108 BPM duration) point into **player-owned beat-grid storage**. The BPM source comes from BpmManager, independently of FX audio target. Do not transplant raw pointers or preserve only an index across an arbitrary grid replacement. Live grid generation, source change and unload/reload invalidation still require outer lifecycle verification.

Still unfinished: full BeatFX manager type/target switching and retained-tail graph behavior; concrete processor composition for the generic phase users; specialized Roll/SlipRoll scheduling; beat-button switching and manager BPM-change notification; live AZ player-state/timestamp adapter; shared Echo module and routing. This pass adds no shared mixer code.
