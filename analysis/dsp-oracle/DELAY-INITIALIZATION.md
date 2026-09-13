# RX3 Delay initialization and selection

Original constructor0xb6928..0xb6cc0 was executed under ARM QEMU with allocator and JUCE string fixtures. The sample-rate global reference was rebound to an explicit test rate. Numeric defaults and the four40-byte smoother states match the independent checks for rates1,100,1000,44100,48000,96000,192000. See delay-constructor-results.json and run_delay_constructor.py. This does not validate real JUCE allocation/string lifetime or exception paths.

Defaults: depth0; time500ms; time bounds1..4000; On0; ring pointer/length0; delay/previousdelay1; write index/counter/maxsamples0; time-changeflag0. Beat button default5, upper bound9 (constructor initially writes11 but overrides it at0xb6c38). Sample rate stored at+4/+8 and reciprocal at+12; constructor probe currently asserts only the listed numeric fields and smoother members, not all padding/base-class state.

Smoother lengths use float32 intermediates: max(1,trunc(float32(float32(rate×ms)/1000))). Crossfade/dry/wet ms bits0x40555555; gate bits0x408b3f46. At44100Hz the lengths are147/191/147/147 in crossfade/gate/dry/wet order. Count0, done1, step0. Initial current/target0 except dry1. The constructor fixture checks all meaningful smoother words and lowbyte done, excluding uninitialized padding.

Selection0xb6d18 clears the startup counter then calls vtable slot9; native Delay vtable0x425348 slot9 is0xb618c (On callback). This does not itself write the stored On flag. Extended Delay control oracle covers selection plus initialize/time/depth/On/Off across76800calls, with0state mismatches on ARM, host and sanitized host.

Do not infer multi-rate audio support from the constructor-rate tests. The separately recovered execute routine uses a44.1samples/ms conversion. Actual quantization and manager selection/type-transition behavior remain next; Delay is still not enabled in the live software mixer.
