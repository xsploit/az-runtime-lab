# Delay native quantization and status composition

Verified locally on 2026-09-12 with `python runtime-lab/analysis/dsp-oracle/run_delay_status.py`.
The firmware hash, exact native ranges, branch/literal relocations, build commands and source hashes are recorded in `delay-status-results.json`.

## What executes

The original ARM32 Delay sample loop and On/Off/depth callbacks execute alongside the original QuantizedBeatEffect status switch, BeatEffectManager setOnOff, quantization eligibility, tempo-to-time calculation, beat lookup, time update and parameter dispatch. Native vtable slots dispatch to the actual Delay callbacks. The final execute branch at 0xb6790 remains a tail branch to the real time-update routine; it is not replaced by a scripted time hook.

Player accessors are explicit fixtures: beat grid, current time, pitch, reverse, scratch, spin, scan, channel availability and mixer quantize setting. This does not execute the complete player engine or outer Beat FX manager.

## Result

ARM/native comparison, host replay and AddressSanitizer/UndefinedBehaviorSanitizer replay each pass **3,840 blocks, 215,040 stereo frames and 68,843,520 compared 32-bit words with zero mismatches**.

The 96 scenarios cover all ten constructor-supported beat buttons (0..9), tempo changes, exact beat boundaries, positions before the first beat, absent channels/grids, quantize disabled, reverse/scratch/spin/scan exclusions, BPM below and at the minimum, repeated On/Off requests, zero/one/64/127-frame blocks, startup counters 0/1, counters around the initial delay and maximum length, and writes crossing the ring boundary. State, quantization flags, cached beat position, output samples, changed ring cells and the complete final ring are compared.

The status switch calls Delay On immediately when toggled on, stores On=1, clears wait and two quantization flags, and samples the mixer quantize setting. Quantization eligibility does not defer that switch. Turning off calls the actual Delay Off callback, including its dry/wet ramps. Unchanged On/Off requests are filtered by the actual manager wrapper.

## Limits and next step

This is finite differential coverage at 44.1 kHz, not proof for every possible input or sample rate. Selection and constructor checks remain separate oracles. Full manager type switching, parameter routes, channel/master placement and production mixer integration are still required. Delay remains disabled in live Beat FX dispatch. The separate Delay quantization implementation intentionally remains in the research oracle until shared-manager integration is verified.

Firmware instruction blobs, native record files and linked oracle executables remain private and ignored; no firmware or keys were published.
