# Combined Off / Delay / Echo manager candidate

`beat_pair.c/.h` represents three object identities under one manager. Effect audio, quantization state, player snapshot and ring are caller-owned. The manager retains the existing modeled manager layout but accesses effect state through typed views, without casting Delay state to Echo state. Supported IDs are0,1,5 only; process assumes at most64frames and native44.1kHz bounds. This research API is not enabled in the live graph.

On2026-09-12, `run_beat_pair_switch.py` executed original ARM switchNextBeatEffect and actual Delay/Echo callbacks versus `beat_pair_switch`.96direct switches compare all modeled manager state, both effect states and both quantization states:17184words,zero mismatches. Includes equal/different beat selections, different times/depths, all initial source/destination On combinations, player quantize and manager quantize combinations, player time and pitch changes. Sources are hashed in beat-pair-switch-switch-results.json. This is an ARM-side differential comparison; no host replay or sanitizer result is claimed for the combined candidate yet.

The native comparison confirms remembered=Off for direct Delay/Echo changes, counter resets, depth transfer and the actual timing behavior with quantize enabled. Existing prose that says destination time is always retained applies only to the earlier nonquantized direct fixture; enabled quantization can recalculate it.

2026-09-19: `beat_pair_process` now passes a persistent4800-block differential
comparison against both native sample loops, covering eight type transitions,
Off/remembered lifecycle, tails, target changes, bypass, quantization and tempo.
It exposed and fixed the Off-path init/notify distinction. Host and ASAN/UBSAN
replay also pass. See `../PAIR-AUDIO-GAP.md` and the pair-audio result reports.
Mix-ramp advancement remains once-per-block, matching the original branch.
This is one deterministic fixture corpus, not universal parity or live graph
acceptance. Do not enable Delay in production without command/routing tests.
