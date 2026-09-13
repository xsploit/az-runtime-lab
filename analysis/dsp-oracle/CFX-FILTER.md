# RX3 Sound Color Filter: isolated reconstruction

2026-09-12. This advances the full DSP port; no shared mixer/launcher changes.

## Verified result

`cfx_filter.c` reconstructs coefficient generation and initialization. `cfx_process.c` reconstructs the two-filter processing, gain/dry/blend smoothers, and uses the previously verified stereo IIR recurrence. The processor performs no allocation or I/O; scratch/history storage belongs to the caller.

Against the original ARM code: **71,871 state checks, 3,000 audio calls, 179,400 stereo frames, 2,131,704 compared values, zero bit differences**. ARM scalar C and host x86 C pass. Host AddressSanitizer/UndefinedBehaviorSanitizer replay passes without diagnostics. No tolerance was used for pass/fail. `cfx-results.json` records hashes and exact commands.

This establishes the tested Filter stage, not the entire SoundColorFxManager, AZ control integration, four-channel mixer, or all RX3 effects.

## Native oracle boundary

Original instructions cover VA `0xce154..0xce994`: calculation, initialization and execute. The absolute pointer literal at `0xce990` is relocated to a private pair of float ones, matching the original global's use. No DSP instruction is replaced. The branch to `__cxa_end_cleanup` is retained but not invoked by the nonthrowing oracle paths.

Native virtual coefficient setters are intercepted to retain the five emitted coefficients. The two virtual clearDelayBuffer methods zero only the histories used by the stereo oracle and count initialization calls; scalar/quad histories from the original general filter class are not modeled because this stage uses stereo. The virtual process methods call the actual extracted `0xb5788` IIR with duplicated L/R coefficients. This is an explicit dependency substitution; it is not a claim that the complete original object constructors/lifetime were executed.

The oracle uses a manually laid-out, statically checked 88-byte ARM32 Filter object. Portable C stores semantic fields separately. The original constructor's initial blend/dry/side defaults are supplied before native initialize. Generated originals and reference corpora stay private.

## Controls and state

| Field / method | Recovered behavior |
|---|---|
| `SoundColorFx::adjustParameter`, `0xbc7c0` | ID 7 stores color at +28, clamps finite values to 0..1, calls virtual +24; ID 8 similarly clamps/stores parameter +32 and calls virtual +28. Other IDs ignored. NaN behavior is not an accepted host control policy. |
| Filter changeColorValue, `0xcdfd4` | Target step +84 = truncate(color × 1023), arithmetic-shift right by two; normalized finite color gives 0..255. |
| Filter changeColorParameter, `0xcdff8` | Sets dirty byte +77. |
| Current step +80 | Moves toward target by one or two steps per calculation, never more than two. Rate is tied to calculation/block cadence. |
| Low-side flag +76 | Step <=127 selects one blend direction; >127 selects the other. |
| LP/HP center region | Current steps 126..130 use LP frequency 21100 and HP 20, with dry contribution 1. Transitional blending/gain still exists. |
| Gain +48 / target +44 | When calculation occurs, delta = (target-current)/64 for that execute call. It advances once per sample and is not clamped to target in the execute body. |
| Blend +52 | Moves toward 1 or 0 by 0.0022675737272948027 per sample; clamps at endpoints. |
| Dry +60 / target +56 / delta +64 | Delta calculated as (target-current) × 0.0022675737272948027. Per-sample update stops exactly at target when its remaining error crosses zero. |
| Audio combine | `dry*input + (gain*(blend*LP + (1-blend)*HP))*(1-dry)`, retaining native operation grouping and NEON subnormal flushing. |

The low-pass and high-pass coefficient functions use the stock numeric factors `0x39155ff9` and `0x32ae5ec9`; they do not read the object's sample-rate fields in the inspected path. This port reproduces those constants. Do not assume arbitrary sample rates work faithfully. Likewise, 64-frame gain transitions and two-step-per-calculation control changes should not be silently normalized to arbitrary buffer sizes.

The current portable control setter API assumes finite normalized values. The upstream native clamp was mapped statically but is not executed by these setters. Before external integration, add an explicit validated/clamped control boundary and native callback comparison for it; never feed arbitrary floats directly into the integer step conversion.

## Reset and bypass

Native initialize `0xce680` calls clearDelayBuffer on both filters, zeroes cached frequencies/current gain/dry increment, derives current and target step from color, calculates coefficients, then sets dirty=1, dry=current target, blend=the selected side endpoint. The reconstruction verifies these numeric fields and the oracle verifies both clear requests. Caller must also clear `CfxHistory` when initializing/resetting its portable instance, as the harness does.

Filter `changeCfxStatus_On` at `0xce004` and `changeCfxStatus_Off` at `0xce00c` both return integer 1 without altering object state. They are not standalone audio bypass operations. The surrounding SoundColorFxManager decides switching, smoothing and when processors run. That lifecycle remains to be reconstructed before a full effect-enabled/disabled experience can be called faithful. No invented tail-clear policy was added.

## Test coverage and limits

- All 1,024 input knob grid points at 33 parameter settings, each initialized and recalculated.
- Continuous alternating endpoint sweeps, parameter dirty refresh, direction reversals.
- 3,000 audio blocks with sizes 0,1,2,3,16,63,64,65,128,256; independent stereo pseudorandom data and occasional silence; target/parameter changes and explicit resets while carrying histories between calls.
- Every emitted sample, both filters' stereo histories, ten scalar state/control floats, ten coefficients and four integer/flag fields are compared.
- Exact-sized portable input allocations in sanitized replay ensure it does not inherit the native IIR lookahead overread; oracle input includes one padding frame.

No listening test, physical Pi timing, long-term stability, all possible floating-point inputs, sample-rate conversion, or simultaneous four-instance stress claim. Variable block-size matching reproduces the native behavior; it does not endorse those sizes as stock device configuration.

## Reproduce and next step

```sh
python runtime-lab/analysis/dsp-oracle/run_cfx.py
```

Uses the same preserved private RX3 executable and local compiler prerequisites as the IIR harness. It extracts both native reference regions itself.

Next: recover SoundColorFxManager type/bypass transition orchestration and the control clamp boundary, then coordinate a four-instance Filter insert after EQ and before channel faders. Preserve cue tap semantics explicitly. BeatFX remains a separate shared-bus/state job; this Filter result does not substitute for Echo/BeatFX timing, targeting, tails or microphone integration.
