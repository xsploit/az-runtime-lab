# RX3 headphone reconstruction oracle

Run `python runtime-lab/analysis/headphone-oracle/run_setters.py` from the workspace root.
This requires the existing private RX3 binary, ARM32 toolchain and qemu-arm-static. Firmware code and lookup tables are extracted locally, not distributed as source.

## Verified setters

The runner pins the firmware SHA-256, extracts original ARM instructions at
`0x5ad4c..0x5af18`, and runs those instructions without code relocation. The
original lookup table region is mapped at its expected address in the ARM process.
Independent C implementations are compared against every byte of the 256-byte
state after each call. The same native records are replayed on x86 and under
AddressSanitizer/UndefinedBehaviorSanitizer.

Current result: **96,000 calls, zero mismatches** in ARM, x86 and sanitizer runs.
Four setters covered: level, cue/master mix, master cue, and stereo mode.
Fixtures cover normalized level/mix inputs (1,025 positions), repeated requests,
mode changes and randomized finite normal ramp states, including retargeting.
This does not prove sample processing, subnormal behavior or invalid input handling.

Each gain retarget uses `(target - (current + step)) * inverse_length`, resets
count and clears completion. Mix and level use rounded 8-bit lookup indices;
they do not skip repeated values. Master cue and mode skip unchanged values.
Mode writes the requested mode and starts a fade-to-zero phase; the audio
update is responsible for switching active mode and fading back in.

The master/cue mix curves both reach unity at the center; replacing them with
a linear crossblend changes behavior. The independent implementation currently
reads the original lookup tables, so this verifies lookup selection and state
updates, not a newly derived mathematical approximation of the curves.

## Remaining

Reconstruct and independently compare sample processing, all ramp advancement,
block-boundary mode transitions, constructor initialization, and calibration.
Resolve physical output calibration before integration into the software mixer.
AZ native mode enumeration differs from RX3 and requires an explicit translation.

## Audio update oracle

`python runtime-lab/analysis/headphone-oracle/run_audio.py` extracts
`0x5a580..0x5aa28`. One external BL at 0x5a5d0 is redirected to a fixture
that supplies an output buffer. All internal DSP instructions remain original.
The split-mode global at 0x1149680 is mapped and varied by the fixture.

Result: **24,000 blocks, 1,519,905 stereo frames, zero differences** across
ARM comparison, x86 replay and ASan/UBSan. Full 256-byte state and the complete
129-frame output buffer (including unwritten guards) are compared each block.
Each randomized state persists for four calls. Block lengths include -1, 0,
and 1..128; both active modes, all three transition phases, and ramp completion
boundaries are exercised. Tests use finite normal values and synthetic input.

Confirmed: ramps advance after emitting the current sample, snap on old count
>= length, and mode changes occur after the block once fade-out completes.
Split mode puts summed cue on the left and summed master on the right; stereo
mode sums master and cue independently per side. The original negative output
calibration multiplier is reproduced for comparison, not endorsed for direct
physical output. Constructor/global calibration and real hardware routing
remain unresolved. Null source/device paths and setter+audio lifecycle still
need composite coverage before production integration.

## Setter/audio lifecycle

`python runtime-lab/analysis/headphone-oracle/run_lifecycle.py` regenerates the
setter fixtures first, then executes actual native setters interleaved with
native audio update. The independent C implementation receives the same requests.
48,000 blocks / 3,015,873 stereo frames pass full-state/output comparisons on
ARM, x86 replay and sanitizers. Each of 1,500 states persists for 32 calls,
covering repeated knob updates, cue toggles and mode retargeting during ramps.
This closes the earlier isolated setter/audio gap for these fixtures; constructor,
missing-device paths and real calibration are still not part of this oracle.

## Constructor findings (static, not yet native-oracle verified)

The constructor reads unsigned sample rate at 0x4172c0. Ordinary ramp length is
`max(1, trunc_u32((float(sample_rate) * 3.299999952316284f) / 1000.f))`.
Mode gain uses 10.158730506896973f milliseconds instead. Length reciprocal is
1/length. Level, both mix gains and master cue initialize to zero; mode gain
initializes to one. Requested and active RX3 mode initialize to 1 (stereo),
phase to zero. All ramps initialize complete with zero steps/counts.
The constructor leaves padding untouched, so whole-state constructor comparisons
must preserve the initial byte pattern instead of assuming every byte is zeroed.

## Constructor oracle result

`run_ctor.py` now verifies 10,000 constructor cases including sample-rate
boundaries and untouched padding. Original HeadPhone and AbstractOutputDevice
constructor instructions are executed. Temporary JUCE string bookkeeping is
stubbed; exceptional cleanup paths abort and are not claimed verified.
Full 256-byte comparisons pass ARM, x86 replay and ASan/UBSan.
Evidence: ctor-results.json. The static constructor findings above are therefore
verified for these sample-rate fixtures. Physical calibration remains unresolved.

## Shared module verification

`run_module.py` compares the reusable `mixer/headphone_dsp.c` API against the
original ARM routines. 48,000 blocks / 3,088,640 frames match full state and output
on host and sanitizer replay. The fixture uses the verified default split gain
(.5,.5) from global constructor 0x11ae0..0x11c54. API AZ enum translation is
exercised. The wrapper installs each fixture's state before calls; separate API
misuse, initialization lifetime and live graph tests remain necessary.
The module retains original hardware output calibration and accepts private
lookup tables at startup. It does not silently normalize device gain.
