# RX3 Delay sample-loop oracle

The original ARM32 Delay execute routine and reconstructed C agree on5,632calls,614,606stereo frames and47,055,772compared32-bit words per architecture. ARM/QEMU, native host replay and ASan/UBSan replay all report0mismatches. Compared data includes every output sample, modeled control/processor state and complete ring contents after each call. See delay-audio-results.json.

`python runtime-lab/analysis/dsp-oracle/run_delay_audio.py` extracts the private pinned RX3 routine0xb6404..0xb68b8. Six external branches are rebound: two ceil, two floor, checkQuantizeSetting and checkTimeUpdate. The last is a tail branch and remains a branch rather than a call. Quantize/time callbacks use scripted hooks; their real firmware implementations are not exercised here. Internal instructions/branches remain intact. Linked oracles, extracted instructions and corpus files stay private/ignored.

## Recovered differences from Echo

- Delay startup counter increments once per sample; Echo encodes extra state in its lowbit and increments bytwo.
- At startup, pending delay audio is suppressed while the counter has not passed the delay. Dry/wet smoothers are temporarily snapped to1/0. Depth is reapplied when a block crosses the startup-delay boundary.
- The ring stores input multiplied by the gate, without recirculating delayed audio. Output is dry×input + wet×delayed; there is no Echo-specific extra dry gate based on On/counter bits.
- Time-change handling occurs in the sample loop. While startup suppression is active, it updates delay without clearing the pending flag or starting the crossfade. After suppression, it preserves previous delay and starts the crossfade. Unlike the Echo implementation, it does not discard an unchanged desired delay before the loop.
- Post-block quantize/time hooks run even for0frames, matching the native path.

## Coverage and limits

84scenarios include mixed frame counts0,1,2,3,63,64,65,127,256,511; persistent state across blocks; random/impulse/silent/subnormal input; randomized pre-existing ring contents; startup, near-wrap, settled states; depth/time/On/Off changes; short rings and352800frame rings; long time values including4000ms. The test preserves the original fixture's44.1kHz time conversion.

This finite numeric corpus is not a proof for arbitrary invalid values, all partitions or architectures. Constructor defaults/smoother lengths, selection callback, actual quantization, manager transitions, native AZ type routing and physical audio are not validated by this oracle. Delay is not yet enabled in the live mixer.

Next: recover constructor constants and selection semantics, compose actual quantization, and extend the manager's effect dispatch with native transition tests before live integration.
