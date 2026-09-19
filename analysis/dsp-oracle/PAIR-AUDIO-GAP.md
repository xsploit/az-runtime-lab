# Delay/Echo audio differential checkpoint — 2026-09-19

Run `python3 analysis/dsp-oracle/run_beat_pair_audio.py` from runtime-lab.
This currently exits **1**, intentionally exposing an unresolved candidate
divergence; it is not a passing integration test.

The new probe executes the original RX3 manager and both original sample loops,
then compares BeatPair with identical pre-block native state, player fixtures,
input and independent full delay rings. It compares PCM, modeled manager/effect/
quantization state and both rings after each block. The candidate is re-seeded
each block: this localizes errors but does not establish persistent reconstructed
trajectory parity. Native input runs persistently. No Pi interaction occurred.

First divergence: block1802, Delay -> Off, 13 differing words in the current
comparison. Delay's startup counter becomes0 in the candidate versus38400 in
the native result; ramp state also differs. Blocks0..1801 compare successfully,
including direct Delay/Echo transitions. The separate direct-switch corpus
still passes96 cases /17184 compared words with zero mismatches.

The suspect is `beat_pair_switch` selection notification, especially the Off
holder and remembered-effect path. Suppressing notification when destination
is Off moved the first divergence to block2402 (Off -> Echo; remembered Delay
counter wasn't reset). Unconditionally notifying the remembered effect when
active is Off instead broke block2. Both experiments were reverted: neither
is a verified fix. Trace native switchNextBeatEffect branches around0x8a230
and0x8a458 and the old-type mask before changing the candidate again.

Keep Delay disabled in the live wrapper. Next acceptance: resolve the selection
state predicate, pass all4800 blocks, then add a persistent reconstruction
comparison and host/sanitizer replay before live integration. No faithful full
BeatFX port or audio-quality approval is claimed.
