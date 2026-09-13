# Native Off / Delay / Echo audio composition

Verified 2026-09-12 using `python runtime-lab/analysis/dsp-oracle/run_beat_dual_audio.py`.
`beat-dual-audio-switch-results.json` records firmware hash, original native ranges, branch/literal relocations, compiler invocation, source hashes and observed output.

This executes the original outer manager, Delay and Echo sample loops, all their applicable control/selection methods and native quantization methods. Each effect has its own 352,800-frame ring. In particular Delay execute slot 2 now points to original Delay code at 0xb6404, and its final time-update branch is preserved as a tail branch. The native-side fixtures supply player state and allocations; they do not substitute reconstructed sample loops.

The persistent run processes 4,800 blocks / 307,200 stereo frames at 44.1 kHz using deterministic stereo sine/cosine input. Schedule: Off -> Delay -> Echo -> Delay -> Off -> Echo -> requested Off -> Delay -> Echo. Native target changes and a bypass interval are included. Quantization turns on after block1200 and pitch changes later, producing500ms and476ms times. These are fixture observations, not physical performance measurements.

Eight actual type transitions complete. Echo is active for2098blocks, Delay for1800, and retained Echo tail for300. Delay has1109blocks and Echo836blocks with positive wet gain and startup counter beyond current delay. Every output sample is finite, ring write indices remain within bounds, and only Echo enters retained-tail phase3. Aggregate output energy3347.49322 is a reproducibility diagnostic, not a perceptual quality metric.

The Echo->requested-Off section retains Echo until a target change forces the real Off transition at block3302. Delay->Off completes at block1802. Direct Delay/Echo changes complete after the normal fade-out at blocks602,1202 and4202. Output state traces are in the report.

## Verification boundary

This establishes a running native reference with both actual processors; it does NOT yet compare the shared host implementation to it. Finite audio and positive wet gain do not establish artifact-free sound or sample equivalence. Next: use this both-object setup for differential comparison of a unified manager, including full effect state/rings and quantization. Only after that should live mixer type1 routing be enabled. The Pi, physical controller and live AZ player were not changed.
