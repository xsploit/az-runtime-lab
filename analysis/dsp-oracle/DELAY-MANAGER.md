# Original RX3 manager composed with Delay

Verified 2026-09-12. Rebuild using `python runtime-lab/analysis/dsp-oracle/run_beat_delay_manager.py`, then run `python runtime-lab/analysis/dsp-oracle/run_beat_delay_initial.py`.

## Native evidence and behavior

Delay is manager type 1, selected through manager +0x14 (switch table entry 0x8a0cc -> 0x8a368). Echo is type 5, manager +0x24. Delay constructor 0xb6c40 writes zero to the tail-support byte +0x50. The original manager checks that byte at 0x8a628 before entering the retained-tail path. Therefore deselecting Delay uses the normal fade-out/type-switch sequence, rather than Echo's retained phase 3. Delay's keepEffectInit slot points to the actual base no-op at 0x8b080, included in the native oracle.

Both types are in the native mask 0xe2 at 0x8a580: returning from bypass invokes notifySelected. For Delay this resets the startup counter and calls On. Switching insertion targets calls Off on the old target, fades, changes target, then calls On at the new target. The round-consumed guard prevents a second invocation after transition completion in the same audio round.

The selected-effect beat bound is 9. The Off holder inherits time/beat bounds from Delay, and conditional manual-time transfer only occurs when beat selections match. Manager BPM range adjustment and selected-player quantized timing remain distinct operations.

## Verification

`beat-delay-manager-results.json`: 180 persistent 64-frame blocks, 11,520 stereo frames, zero mismatches on ARM/native, host replay and ASAN/UBSAN replay. Compares manager state, Delay state, quantization state, PCM and the entire 352,800-frame delay ring after every block. Host runs compare 127,051,560 words; ARM additionally checks repeated native round-guard state, totaling 127,052,070. Large counts mostly come from repeated ring comparisons, not unique music samples.

`beat-delay-initial-results.json`: 72 fresh Off-to-Delay scenarios, all 12 requested beat indices at BPM100 0, 4000, 12000, 12800, 100000 and unavailable. Each runs 12 blocks through native, host and sanitizer comparison with complete state/audio/ring checks. All pass. The lifecycle corpus additionally includes rejected beat index 12, player tempo/transport changes, forced/unforced beat updates, target changes, bypass and repeated selection/deselection.

The original outer-manager machine code is executed, not modeled on the native side. Native callbacks dispatch to Delay rather than substituting Echo. The reconstruction in beat_manager_delay.c is an isolated differential-test model; the existing Echo model was reused with verified type and tail differences. Player getters and allocated object setup are fixtures. Constructor-exact initial time is not claimed: the short corpus uses 20 ms to exercise ring output sooner.

## Still required

This does not yet integrate Delay into the live AZ software mixer. Direct Delay-to-Echo transitions need a composite with both real objects, including remembered-object ownership and parameter transfer. Then refactor the shared manager around verified per-effect operations and explicit player context, preserve channel/master routing, and test the public command/FIFO path. Do not expose Delay as complete merely because Off/Delay passes. No Pi performance or physical-controller result follows from these PC oracle tests.

Native instruction blobs, linked binaries and reference record files remain private and ignored.
