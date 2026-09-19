# Delay/Echo audio differential checkpoint — 2026-09-19

## Resolved in the following continuation

Native disassembly established the missing distinction: destination Off replaces
the notification subject with Off at0x8a394. When leaving Off, the old-type mask
is clear and the remembered effect receives its init callback at0x8a180, not
notifySelected at0x8a458. `beat_pair_switch` now preserves these paths.

Verification now passes:
- `run_beat_pair_audio.py --persistent`:4800 blocks /307200 stereo frames,
  eight type transitions, independently persistent candidate state and rings;
  modeled state, PCM and both complete rings match every block.
- `run_beat_pair_replay.py`: host and ASAN/UBSAN replay pass, comparing state
  and PCM every block and both full final rings. Pointer-bearing player fixtures
  serialize only their fixed-width prefix; record ABI is checked before replay.
- `run_beat_pair_switch.py`:96 direct switches,17184 words, zero mismatches.

The large ARM word count (6,775,233,600) mostly represents repeatedly comparing
the same rings, not billions of unique samples. The persistent report's
`persistent_candidate=true` distinguishes it from the per-block reseeded mode;
its older generic scope sentence describes reseeded mode only. Native records
and executables remain ignored/private. No Pi or live integration was performed.

Remaining acceptance: varied corpus/round-guard coverage for the combined path,
then explicit live graph, command/FIFO and reset/resource integration. These
fixtures are not proof of all BeatFX or AZ effect-ID correspondence.

## Original failing checkpoint (historical)

Run `python3 analysis/dsp-oracle/run_beat_pair_audio.py` from runtime-lab.
This originally exited **1**, intentionally exposing an unresolved candidate
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
