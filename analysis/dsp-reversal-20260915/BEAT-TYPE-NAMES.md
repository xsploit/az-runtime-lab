# BeatFxType names and selector bridge

EP147 SHA256 `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6` has an explicit name mapper at0x185a670 for the `device_adapter::mixer::BeatFxType` domain. This is code-backed enum labeling, not a claim that each DSP algorithm has been fully recovered.

| Value | Host label | String VA |
|---:|---|---|
| 0 | DELAY | 0x2954db8 |
| 1 | ECHO | 0x2954dc0 |
| 2 | PING PONG | 0x2954dc8 |
| 3 | SPIRAL | 0x2954dd8 |
| 4 | HELIX | 0x2954de0 |
| 5 | REVERB | 0x2954de8 |
| 6 | FLANGER | 0x2954df0 |
| 7 | PHASER | 0x2954df8 |
| 8 | FILTER | 0x2954e08 |
| 9 | TRIPLET FILTER | 0x2954e00 |
| 10 | TRANS | 0x2954e10 |
| 11 | ROLL | 0x2954e20 |
| 12 | TRIPLET ROLL | 0x2954e18 |
| 13 | MOBIUS | 0x2954e28 |

FILTER and ROLL deliberately use pointers eight bytes into the corresponding longer strings. For example, comparisons0x185a69c/185a6a8 exclude values up to10, select12 at0x185a8f0, and select11 at0x185a908; those paths materialize0x2954e18 and0x2954e20 respectively. The TypeSelectSetting validator0x850e58 separately accepts unsigned0..13. A debug OSD list uses different sparse IDs and must not replace this mapping.

## Connection to command89

MCU selector byte0x20017cd9 is loaded at0x9fc2 and written at0x9fda to DSP frame+0xb2, command halfword89. The same selector is copied through0x20026fb3 and packed into host RX byte85's high nibble at0x1ada–1ae6. Normal values0..13 retain their identities on both routes.

EP147 decodes that nibble at0x21545e8, updates the mixer cache via0x2131848, and routes ordinary notifications through0x2131448/21307e8 to a MixerHandler listener. RTTI identifies its callback as `typeAndOrParameterChanged(BeatFxType, BeatFxTime const&)`. Its queued callback compares the incoming type with the cached previous type; on change it calls the name mapper with the previous type before storing the new one. Thus the mapper labels the same type domain, although that particular call performs old-type cleanup rather than labeling the new arrival immediately.

## Limits

DSP command89 is consumed by transition logic before persistent state503 dispatches cases0..13; special state98 also exists. The host label is therefore not proof that a particular numeric routine ran in any observed block. EP147's alternate tagged notification for type5 still needs tracing. Upstream typed-setting transmission and every MCU selector writer are also not closed. The [shared11/12 phase map](BEAT-11-12-PHASES.md) corresponds to the numeric values labeled ROLL/TRIPLET ROLL, but exact DSP formulas and audio behavior remain independently unverified.
