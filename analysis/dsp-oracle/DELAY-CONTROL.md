# RX3 Beat Delay control oracle

The reconstructed Delay callbacks match the extracted RX3 ARM32 instructions for76,800 calls per architecture,140 represented state bytes per call, with0differing calls. ARM/QEMU, native host replay and ASan/UBSan replay all pass. This is not a completed Delay audio effect or a live mixer integration.

`run_delay_control.py` pins the private rbp SHA256, extracts0xb6168..0xb639c without relocations, and maps native callbacks into a fixture with verified field offsets. Run it from any directory. Compiler wrapper remains local to this workspace. Generated native code/records/binaries are private and ignored.

| Callback | RX3 address | Recovered behavior |
|---|---|---|
| initialize |0xb6168|counter+124=0; maximum samples+120=sample rate×8|
| changeTimeValue |0xb6180|time-changed byte+136=1|
| On |0xb618c|reset gate current0 and retarget1; reset dry current/target1, wet current/target0 and both steps0, then recalculate depth|
| Off |0xb6200|retarget gate0, dry1, wet0 from current+oldStep|
| depth |0xb62a8|same tested piecewise dry/wet depth law as Echo, but different object offsets|

Gate/dry/wet pointers live at+140/+144/+148. Native Ramp remains40bytes. Depth boundary corpus includes exact/adjacent values near0,0.009765625,0.75,0.990234375,1; independently varied stereo ramps; repeated On/Off/time actions; signed zero/subnormal ramp values. Counter/rate/flag and all modeled ramp bytes are compared after every callback. Finite corpus is not a universal numeric proof. Constructor smoothing lengths, selection notification and audio loop are excluded.

Delay differs from Echo: Off restores dry and removes wet instead of only closing the input gate; On resets dry/wet before retargeting. Static audio trace0xb6528..0xb6584 loads original input, multiplies it by gate into d19, and stores d19 into the ring. No Echo feedback term is present on that traced path. The audio oracle must verify this alongside startup suppression, time conversion, crossfade and wrapping before enabling a Delay type.

Next: reconstruct0xb6404..0xb68b8 execute and constructor0xb6928, validate native audio and state continuity, then extend BeatFX manager/type dispatch. No arbitrary Echo-with-feedback-zero substitution is claimed complete.

Selection is now included in the control oracle; constructor defaults are separately execution-checked. See DELAY-INITIALIZATION.md. The earlier exclusions describe the original five-callback pass.
