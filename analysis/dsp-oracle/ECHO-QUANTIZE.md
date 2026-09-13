# Echo with actual native timing callbacks

This pass replaces the scripted quantize callbacks in the earlier Echo audio oracle with **actual native quantize decision routines**, plus an independent reconstruction in `echo_quantize.c`. It does not replace live player state with guessed DSP behavior: player-engine queries have an explicit controlled-fixture boundary, while all the timing decisions under test execute their original instructions.

## Results and reproduction

`python3 runtime-lab/analysis/dsp-oracle/run_echo_quantize.py`

**1,920 composite calls, 107,520 stereo frames and 34,425,600 compared 32-bit words; zero differences on ARM, x86 and sanitized x86.** See `echo-quantize-results.json` for native ranges, every relocation, compiler commands and source hashes. The previous scripted-boundary audio oracle was rerun after adding the separate post-block adapter and still passes all 5,632 calls.

The new test compares audio, processor state, quantize state, cached beat iterator (normalized to an index), beat-grid relative-position mutation, every ring write, and full eight-second rings at scenario completion. Native and reconstructed state persist across 40 blocks in each of 48 scenarios. Inputs exercise:

- All twelve beat-duration enum entries, explicit immediate time recalculations and automatic per-block updates.
- Tempo changes from -32% through +32%, including changes within an unchanged beat interval.
- A grid changing from BPM 128.00 to 174.00, below-threshold BPM 30.00 and threshold BPM 40.00 fixtures.
- Exact beat timestamps, before-first and after-last positions, changing player time, unloaded/unavailable source, absent beat data and global quantize Off.
- Reverse, jog scratch, jog spin and scan suppression.
- Zero-frame, one-frame, 64-frame and 127-frame calls; timing updates remain after sample processing.

The fixture allocates a readable sentinel beat beyond the vector end for the special `grid_enabled == false` path. Native code selects the end iterator in that path, and direct set-time subsequently reads its BPM field. The test makes that read defined; it does not establish that arbitrary empty/disabled production beat grids are safe. Empty vectors and malformed player state need a validated host boundary, not blind native pointer emulation.

## Original code executed

| Routine | Native range |
|---|---|
| BpmQuantizeEffect::setQuantizedTime | `0x9885c..0x989dc` |
| BpmQuantizeEffect::checkTimeUpdate | `0x989dc..0x98b24` |
| QuantizedBeatEffect::checkQuantizeSetting | `0x98fa0..0x99030` |
| QuantizedBeatEffect::checkBeatPosition | `0x99060..0x990a4` |
| BeatEffect::adjustParameter | `0xb5b38..0xb5c80` |
| Echo execute and its control callbacks | As documented in ECHO-AUDIO.md and ECHO-CONTROL.md |

Native virtual `adjustParameter` slot +12 calls parameter ID 3 and then Echo's actual time-dirty callback through slot +60. The native depth callback remains in slot +56. The three absolute pointers in set-time are relocated to verified ordinary numeric constants: minimum BPM×100 of 4000 and the twelve beat numerator/denominator values. External integer division and floor/ceil are relinked to their actual runtime operations.

External fixture getters provide player-channel validity, engine references, beat-grid storage, global mixer quantize, transport modes, current player time and tempo. They do not perform beat lookup or time selection. Those decisions are performed by the native routines listed above. Full singleton construction, live PlayEngine implementation and AZ state ingestion are outside this oracle.

## Verified timing behavior

**Quantize eligibility.** A valid selected player, a non-null beat-grid object and global quantize On are required. The latest global setting is stored at object byte +97. On an ineligible path the native code clears +96, +93 and the integer at +88, and sets +94 to 1. Other represented fields remain unchanged. Meaningful names for those scheduler flags require the remaining On-scheduling trace; the reconstruction keeps their offsets explicit rather than inventing meanings.

**Beat selection.** With an enabled grid, subtract its offset (+40) from player time. Negative relative time selects the first beat. Otherwise store the relative value at beat-grid +48 and perform lower-bound lookup: select the first beat timestamp greater than or equal to the relative time, falling back to the last beat when after the end. Thus the cached iterator represents the upcoming/equal beat under this lookup, not an unconditional previous-beat selection.

**Automatic update.** Reverse, jog scratching, jog spinning or scanning returns without updating the cached beat or delay time. Otherwise compare the chosen beat pointer to effect +108. Only a changed iterator invokes `setQuantizedTime`, then caches the iterator—even when the BPM threshold causes that set-time call to return without changing delay. Tempo changes alone within the same cached beat do not invoke automatic set-time in this routine. A separate beat-button action can request immediate recalculation; that outer setter remains to be composed.

**Tempo and time.** Selected beat data contains a 16-bit BPM×100 value at beat +2. Compute `bpm100 = trunc(float(beatBpm100) * float(1 + tempo))`. If below 4000, leave delay time unchanged. Otherwise:

`timeMs = (6000000 * numerator / denominator) / bpm100`

Both divisions use unsigned integer division in that order, then the actual parameter setter clamps the result to Echo's 1–4000 ms bounds and invokes the time-dirty callback. Enum pairs 0..11 are:

| Enum | Beats |
|---:|---:|
| 0 | 1/16 |
| 1 | 1/8 |
| 2 | 1/4 |
| 3 | 1/2 |
| 4 | 3/4 |
| 5 | 1 |
| 6 | 2 |
| 7 | 4 |
| 8 | 8 |
| 9 | 16 |
| 10 | 32 |
| 11 | 64 |

The standalone set-time function itself does not check global quantize or transport suppression; its caller supplies those policies. The test deliberately exercises direct set-time separately from automatic per-block checks to preserve that distinction.

## State ownership and adapter consequences

Static inspection of `BeatEffect::checkPlayerChannel` at `0xb600c` shows it reads **BpmManager's selected source field +8**, rejects negative values, and verifies `PlayEngine::isLoaded` for that source. `getPlayEngine` and `getMixerEngine` use cached singleton references. Evidence is saved in `echo-player-source.asm`.

Therefore **BPM source and audio FX target are separate state**. A microphone/master-target effect may still derive beat timing from a selected player. Do not infer the timing player directly from the native effect-target enum or TX target bytes. The future AZ adapter needs a stable audio-thread snapshot containing the selected tempo source, its loaded state, beat-grid identity/generation and beat data, current time/tempo and transport modes, plus global quantize independently from the effect target.

The current oracle uses a pointer-stable fixture grid. Production grid replacement, unload/reload and channel changes require an explicit cached-iterator invalidation policy matched to native lifecycle behavior; comparing indices alone is insufficient when the underlying grid changes. Field +108 is an iterator into external player-owned storage, not owned delay memory.

## Still required for full pipeline

- Native quantized **On scheduling**: `QuantizedBeatEffect::changeEffectStatus`, `calcPlayingTime`, `calcQuantizedTime`, delayed switch/countdown and remaining flags. The checks verified here synchronize delay duration; they do not by themselves prove beat-aligned effect activation.
- Actual beat-button setter and other time/percent/BPM changes composed with the manager.
- BeatFX manager type/target changes, initialization versus keep/tails, microphone/master placement and complete dry/cue routing.
- Player-grid lifetime and timestamp-domain mapping for AZ, followed by live native state ingestion.
- Shared module packaging and integration after parent review. No shared mixer edits were made in this pass.

Correction and subsequent verification: [QUANTIZE-PHASE.md](QUANTIZE-PHASE.md) verifies the real manager/Echo immediate On/Off path and the generic phase timing primitives/countdown separately. “Quantized On scheduling” above was an overly broad planning label: Echo does not delay its On switch through the generic phase loop. Full outer manager and effect-specific composition remain pending.
