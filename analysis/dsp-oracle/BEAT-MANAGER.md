# RX3 outer BeatFX manager: Off / Echo composition

Status: verified bounded composition, not a complete BeatFX port or integrated software mixer. Run `python3 run_beat_manager_compare.py` from any directory with the original local firmware available. Original bytes, native executables and audio/ring reference records are ignored, not distributable source artifacts.

## Measured result

`beat-manager-results.json` records original firmware hash, exact native ranges, relocation sites, compiler invocations and source hashes. ARM execution of the original routines versus independently reconstructed C, x86 replay, and ASAN/UBSAN replay each report **180 calls, 11,520 stereo frames, 127,051,920 compared 32-bit words (ARM adds 459 native round-guard state words), zero mismatches**. Full Echo ring memory and observable manager/Echo/quantize state are compared after every block, not only output samples. The 352,800-stereo-frame ring is compared repeatedly; that word count is not a claim of 127 million unique audio samples.

The fixture is persistent, 44.1 kHz, 64-frame blocks. It includes Off→Echo, retained Echo tail after requested Off, reselecting Echo during the tail, target changes during normal and retained-tail operation, bypass entry/exit, depth changes, and independent selected-player time/tempo/transport changes with real native Echo quantize callbacks. Source getters are deterministic fixtures. Requested beat enums 0 through 12 are exercised (including rejected 12), with independent BPM values 3000, 4000, 12000, 17405, 99999 and unavailable. Forced and unforced BPM notifications, manager quantize and force-tail transitions are included. Initial Off time is 20 ms to exercise delayed audio within this short run; constructor-exact initial time and all effect variants are not claimed.

## Native ownership and transitions

Evidence: `../rx3-dsp-manager.asm`; operate `0x8a52c`, switch type `0x8a07c`, switch beat `0x8a470`, switch target `0x8ace8`, constructor `0x893d8`. Echo notifySelected is `0xb79b8`; actual Echo execution, On/Off, parameter and quantize methods are the previously tested routines, now composed under the original outer manager.

Manager phase +136: 0 normal, 1 fade out, 2 fade in, 3 retained tail. Current/requested type are +76/+80; current/requested target +0/+4. Main fade starts +96, added dry ramp +144, long ramp +184. Current/requested beat +224/+228, requested depth +232; quantize +236, force +237, previous bypass +238 and round-consumed byte +239.

Selecting Off from Echo with tail support and no bypass leaves active/current type Echo, toggles Echo Off and fades additional dry toward one. Ring history keeps advancing in phase 3. Reselecting Echo calls keepEffectInit, re-enables Echo and fades added dry to zero, preserving history. Target change fades the old insertion site, switches target only at completion, and starts its fade in. Changing target during retained Off resolves to actual Off after the transition. UI requested type and active processing type can therefore differ.

Type switch to Echo calls notifySelected: resets startup counter and starts its input gate; the next audio block resets write position and suppresses early stale reads. This is not an explicit ring-memory clear. Echo On remains immediate even with quantize enabled; the inherited generic phase scheduler must not be added to Echo.

`MixerEngine::update` clears +239 at `0x581ec` once per audio round. Transition completion sets it; subsequent invocations in other channel stages that round return early. A host must preserve this once-per-round contract, not execute a full shared Echo once per channel.

The BPM-source selector is independently owned by BpmManager +8 (`BeatEffect::checkPlayerChannel`, `0xb600c`). It is not the effect target. Beat iterators belong to external player storage; stable fixture storage is used here. Live grid replacement/invalidation is still required.

Bypass is named only by the native argument, not yet equated to a particular UI switch. It forces zero effect depth. Returning from bypass for Echo invokes notifySelected. The long ramp still advances in this composition even though its extra factor applies to another effect (Helix), not Echo.

## Integration proposal and limits

Keep the following boundaries before parent authorizes shared changes:

1. New `mixer/beat_echo.*`: production Echo audio/control state, ring allocated once at initialization, parameter ramps and history lifetime; no allocator or I/O in processing.
2. New `mixer/beat_manager.*`: requested versus active type/target, transition and tail state, separate BPM-source/time/grid snapshot, explicit `begin_round` clearing consumed, target-stage processing at exactly 64 frames/44.1 kHz.
3. Extend `dsp_graph` only after placement is agreed: a single shared BeatFX object must be offered the selected pre/post channel or master buffer at the native insertion point; cue routing must derive from the chosen tap rather than duplicate the effect instance. Existing dry defaults remain intact.
4. Do not expose unsupported effects as native matches. Other 13 BeatFX and other 5 CFX remain unported. Beat-range selection and manager force/beat-change paths are now composed and tested; the remaining production requirements are dynamic-grid ownership and real insertion routing.

`beat_manager_echo.*` is currently an isolated oracle model, not a safe general-purpose public API: it assumes at most 64 frames and only Off/Echo. The original oracle supplies global player-state callback binding. The isolated `beat-port` candidate instead passes explicit per-instance quantize/player context and passes the same oracle with the globals deliberately cleared during processing. Native manager selected/remembered effect objects for other types are outside scope. No Pi performance claim, microphone route claim, hardware-device timing claim, or AZ effect equivalence follows from this result.

## Harness diagnostic

The initial native-only probe crashed because its constructed Echo vtable omitted execute slot +8. The target core showed PC 0 and a `blx` from native manager execute dispatch, with the Echo fixture object as receiver. Adding the actual execute pointer fixed it; this was a fixture setup error, not evidence of a native firmware crash. The probe core was removed after diagnosis. The composite normal and sanitized runs now pass.

## Beat range and update semantics

`checkBeatButtonRange` at 0xb5c80 uses an independent BpmManager BPM value. Unavailable (UINT32_MAX) returns without changing beat/time. Below BPM100 4000 it uses 1500 ms; otherwise integer period is 600000 / ((BPM100 + 5) / 10). It rounds ratio-scaled time by adding float 0.5 then truncating, searches adjacent beat indices until inside effect time limits, always writes the accepted beat and calls time-changed, but writes time itself only when the force-time argument is true. Echo then independently applies the selected player's quantized time and caches its beat iterator if quantize is eligible.

`switchNextBeatButton` validates against active effect bounds when On; when Off it first validates against the Off holder. It updates active and remembered objects. The manager's accepted beat and the effect's range-adjusted beat may differ; preserve both. Off holder time limits and beat limits copy the selected effect during type switching. The composite tests retain these properties rather than treating Off as a stateless null processor.

## Candidate and dynamic ownership

`beat-port/beat_echo.*`, `beat_manager.*`, `beat_grid.*` are isolated production candidates, not wired to live graph. `run_beat_port.py` reruns original native composite with explicit context, including poisoned global harness state. `beat-port/test_grid.c` sanitizer test covers 262144 beats, empty grids, invalid order/count, disabled-grid end sentinel, source-only change and 1000 replacement/free/process cycles. Replacement invalidation is an explicit host safety policy, not a claim that native firmware has the same memory ownership API.


## Fresh Off-to-Echo regression: native conditional time transfer

The prior shared reconstruction incorrectly copied Off's time into Echo unconditionally during a type change. At BPM100 4000, a requested beat8 puts Off at12000ms but independently range-adjusts remembered Echo to beat6/3000ms. Copying the former over the latter made the sample delay exceed the352800-frame ring. No ring-wrap workaround or preset rejection is used in the fix.

Native switchNextBeatEffect at0x8a434 compares old/new beat selections and branches past the time copy when they differ;0x8a444..0x8a450 copies time only when the selections match. Shared and isolated manager models now preserve this condition. Native0x8a260..0x8a278 also bounds the scheduled next beat to the selected effect range; this is applied after selection, so current and requested/applied beat can temporarily differ. Echo upper beat index is9. This matters at very high BPM when a time-valid beat10/11 still exceeds the effect's beat-selector range.

`run_beat_initial.py` (after rebuilding with `run_beat_shared.py`) tests72 fresh native Off→Echo transitions: all12 presets at BPM1000,4000,12000,12800,100000 and unavailable. Every scenario replays12blocks, full manager/Echo/quantize state, audio and complete ring. Native ARM, host and ASAN/UBSAN comparisons all pass with zero mismatches. The prior180-block lifecycle suite also still passes.

`../probe-software-echo-timing.py` additionally runs the public adapter under ASAN/UBSAN:120 fresh scenarios,1024blocks each, plus20000 persistent blocks covering random accepted BPM/preset/depth updates, Off/Echo, all targets, source replacement and reset. Every delay remains within its ring and output stays finite. These adapter checks do not independently assert native equivalence for every random sequence; they complement the explicit native oracle. `software-echo-applied-timing.json` records actual applied times for feedback rather than echoing requested E1 values.
