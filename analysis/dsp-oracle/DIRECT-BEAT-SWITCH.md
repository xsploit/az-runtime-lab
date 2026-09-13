# Direct Echo / Delay switch callback

Native execution verified 2026-09-12. Run `python runtime-lab/analysis/dsp-oracle/run_beat_direct_switch.py`. Report: `beat-direct-switch-results.json` with pinned firmware SHA, native ranges, relocations and source hashes.

The probe constructs both effect objects and calls the original switchNextBeatEffect routine at 0x8a07c, with actual Delay and Echo control/selection/quantization methods. Twenty-four alternating direct switches pass assertions, covering equal and different beat selections, distinct stored manual times and varied depth. Both player quantize and manager quantize are disabled in this corpus; original BPM range adjustment still executes using the explicit BPM fixture.

Confirmed:

- Destination becomes active, current type becomes 1 or 5, and manager phase becomes 2 (fade in).
- Remembered object becomes the Off holder. It does not become the source effect. The switch table explicitly writes the Off pointer to manager +12.
- Destination manual time remains its previous value, including when source/destination beat selections match. The conditional time-transfer branch at 0x8a434 is reached for transitions involving Off, not this direct pair.
- Depth is copied from source to destination through native parameter dispatch.
- Source ends Off, destination ends On.
- Both effect startup counters become zero. The old type mask 0xe2 selects notifySelected at 0x8a458; the destination also receives notifySelected at 0x8a230. Later audio startup must therefore not assume the inactive source retained its old counter.

This is a callback-state probe, not audio comparison through a direct transition. The Delay execute vtable slot is not exercised by this probe. It does not establish quantize-enabled direct switching or all initial On/Off combinations. Full original operate execution with both actual audio loops and a matching shared reconstruction is still required before live integration.

These observations expose why combining the isolated Off/Echo and Off/Delay models by changing only effect IDs would be incomplete. The shared model needs explicit objects for Off, Delay and Echo, and source/destination/remembered identities must follow the native paths.
