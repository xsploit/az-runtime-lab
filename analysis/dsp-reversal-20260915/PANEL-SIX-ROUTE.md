# Panel to six-route DSP selector

Static evidence joins the panel MCU, mixer MCU, EP147 receive parser and DSP selector without assigning names to the six AZ algorithms. The original hypothesis that six sequential EP147 HUI IDs form an unknown permutation of mixer selector values `1..6` is disproved in the inspected software: four entries share raw bits, while the remaining two belong to a separate eight-input MCU state machine.

## Panel packet and player bridge

The panel MCU input scanner feeds packed-byte builder `0x3528`, which constructs five input bytes at `0x20009b1c`. Frame builder `0x45f2` creates the 70-byte panel-to-mixer packet: `0x466c` writes little-endian magic `fe ca`, `0x4672..0x468a` copies the five packed bytes to offsets `8..12`, and `0x46f4..0x46fc` stores the CRC at offsets `68..69`. This is static MPNL firmware evidence, not captured hardware traffic.

The mixer MCU parser at `0x2730` unpacks panel input byte 9 into parser storage `0x20026f46..0x20026f4b` in bit order `1,4,0,3,5,2`. Separately, mixer host-frame builder `0x1966` and copy helper `0x1f16` establish the exact bridge:

```text
host frame[20..25] = MPNLRX[8..13]
host frame[21] = MPNLRX[9]
host frame[23] = MPNLRX[11]
```

No HUI inference is needed to recover the six selector inputs from the player receive frame.

## Panel debounce and scan coordinates

The panel application executes from its decompressed ITCM image, not directly from the packed flash payload. With the release's own relocation metadata applied, the relevant runtime addresses are scanner `0x2520`, packed-byte builder `0x3528` and frame builder `0x45f2`.

Builder `0x3528` sources all six selector bits from the following debounce records at base `0x20008e70`:

| Selected value | `MPNLRX[9]` bit | Debounce state | Record index |
|---:|---:|---:|---:|
| 1 | 1 | `0x20008e89` | 5 |
| 2 | 4 | `0x20008eb1` | 13 |
| 3 | 3 | `0x20008e8e` | 6 |
| 4 | 5 | `0x20008eb6` | 14 |
| 5 | 0 | `0x20008ed9` | 21 |
| 6 | 2 | `0x20008ede` | 22 |

Scanner `0x2520` dispatches phases `0..7` through its `TBH` table at `0x2554`. Phases `0/4`, `1/5`, `2/6` and `3/7` share four case bodies. In the first three case bodies, the six selector records occupy the same two GPIO inputs on three distinct scan phases:

| Scan phase | GPIO `0x401bc000` pin 31 | GPIO `0x401bc000` pin 29 |
|---:|---:|---:|
| 0 | selector 1, record 5 | selector 3, record 6 |
| 1 | selector 2, record 13 | selector 4, record 14 |
| 2 | selector 5, record 21 | selector 6, record 22 |

This establishes a phase-indexed three-by-two logical scan arrangement. It does not establish which phase is physically top/middle/bottom, which pin is physically left/right, or which printed label belongs to a coordinate. Those joins require a separately proved row-drive, output/LED or native resource association.

## Selector feedback output path

The mixer-to-panel builder at `0x22c2` constructs a `0x3e`-byte packet in `0x20027a48`. It writes magic bytes `ef be` at offsets `4..5`, copies mixer output state into offsets `8..0x3b`, and stores the CRC over the first `0x3c` bytes at offsets `0x3c..0x3d`. The panel receiver validates the same magic, length and CRC before calling decoder `0x3fee`.

The selector feedback updater at `0x9e8c` owns six mixer output bytes at `0x20026f92..0x20026f97`. Its explicit selected-value jump table is:

| Selected value | Mixer feedback byte | Mixer-to-panel offset | Panel staged output |
|---:|---:|---:|---:|
| 1 | `0x20026f92` | `0x18` | `0x20009a78 + 0` |
| 2 | `0x20026f93` | `0x19` | `0x20009a78 + 1` |
| 3 | `0x20026f95` | `0x1c` | `0x20009a78 + 3` |
| 4 | `0x20026f96` | `0x1a` | `0x20009a78 + 4` |
| 5 | `0x20026f94` | `0x1b` | `0x20009a78 + 2` |
| 6 | `0x20026f97` | `0x1d` | `0x20009a78 + 5` |

Panel commit routine `0x41ec` copies those staged bytes to active outputs `0x20009a8c + 0..5`. Output builder `0x38e8` then packs active entries `0..5` into serial-output bits `6..1`, respectively. This proves that the anonymous selected value controls one of six dedicated panel feedback outputs through an explicit mixer jump table; it also proves the packet permutation shown above.

The path still does not identify the physical load driven by each serial bit, prove that an output is paired with the input at the same apparent logical coordinate, establish panel orientation, or supply a semantic control label. In particular, it does not make the disqualified EP147 HUI suffix labels authoritative for these outputs.

## Mixer MCU six-route selection

Function `0x9ddc`, gated by helper `0x18ba4`, reads only states `0x20026f46..0x20026f4b`. It updates shift histories at base `0x20028344`; low two history bits equal to 1 identify a rising edge. The subsequent scan visits six history slots in an order that rearranges parser storage. Therefore selected values `1..6` correspond to raw `MPNLRX[9]` bits **1,4,3,5,0,2**.

The selected word at `0x20028368` becomes the scan index plus one, or zero when the same selected route is pressed again. Multiple simultaneous edges are processed in scan order. DSP command builder `0x9f88` writes the low halfword as command halfword 83 when its surrounding state gate permits.

| Selected value | Raw source | Mixer state | DSP dispatch target |
|---:|---|---|---|
| 1 | `MPNLRX[9] bit 1` | `0x20026f46` | `0x11806900` |
| 2 | `MPNLRX[9] bit 4` | `0x20026f47` | `0x11805000` |
| 3 | `MPNLRX[9] bit 3` | `0x20026f49` | `0x11808bc0` |
| 4 | `MPNLRX[9] bit 5` | `0x20026f4a` | `0x1181fcf0` |
| 5 | `MPNLRX[9] bit 0` | `0x20026f48` | `0x11807e00` |
| 6 | `MPNLRX[9] bit 2` | `0x20026f4b` | `0x1181fce0` |

Staged command halfword 83 is at `0x11800aa6`. Reader `0x11819420` compares it with persistent word `B14[160]` (`0x11803280`) and conditionally latches the candidate at `0x11819614` amid reset/transition work. Dispatch routine `0x11819050` compares that state with values `1..6` and calls the targets above. Zero or an unmatched value calls none of these six targets in this dispatch; that does not prove global dry bypass or absence of tail processing elsewhere.

## EP147 HUI IDs and exact receive sources

EP147 constructs six sequential IDs at `0x2156280`, assigning suffixes 0 through 5 to owner fields `+0x1d8` through `+0x200`. The top-level receive parser at `0x2154730` passes `frame+0x14` to `0x21540e0`, which supplies these exact host-frame bits:

| HUI suffix | Owner field | Host-frame source | Raw panel source |
|---:|---:|---|---|
| 0 | `+0x1d8` | `frame[23] bit 2` | `MPNLRX[11] bit 2` |
| 1 | `+0x1e0` | `frame[23] bit 1` | `MPNLRX[11] bit 1` |
| 2 | `+0x1e8` | `frame[21] bit 5` | `MPNLRX[9] bit 5` |
| 3 | `+0x1f0` | `frame[21] bit 4` | `MPNLRX[9] bit 4` |
| 4 | `+0x1f8` | `frame[21] bit 3` | `MPNLRX[9] bit 3` |
| 5 | `+0x200` | `frame[21] bit 2` | `MPNLRX[9] bit 2` |

The same parser does observe the two remaining direct selector bits, but not as suffixes 6 and 7 of this family:

| Direct source | Owner field | Separate HUI ID | Native HUI diagnostic identity |
|---|---:|---:|---|
| `MPNLRX[9] bit 1` / selector 1 | `+0x208` | `0x027a9bd941754000` | `Mixer::MicPanel<0>::eqHi()` |
| `MPNLRX[9] bit 0` / selector 5 | `+0x210` | `0x444b11a9298c5100` | `Mixer::MicPanel<0>::eqMid()` |

These IDs publish through group-5 MIDI operations using CC `0x1e` and `0x62`, respectively. The official XDJ-AZ MIDI list names those CCs `MIC 1 EQ HI` and `MIC 1 EQ MID`, not Sound Color controls. This confirms that EP147 observes the bits while also demonstrating that this HUI/MIDI identity layer cannot safely name the direct selector/DSP routes.

This proves only the following HUI/selector overlap:

| HUI suffix | Selected value | Shared raw bit | DSP target |
|---:|---:|---|---|
| 2 | 4 | `MPNLRX[9] bit 5` | `0x1181fcf0` |
| 3 | 2 | `MPNLRX[9] bit 4` | `0x11805000` |
| 4 | 3 | `MPNLRX[9] bit 3` | `0x11808bc0` |
| 5 | 6 | `MPNLRX[9] bit 2` | `0x1181fce0` |

## Why suffixes 0/1 are not selectors 1/5

The four disputed bits trace to distinct debounced panel states:

```text
MPNLRX[9] bit 1  <- 0x20008e89
MPNLRX[9] bit 0  <- 0x20008ed9
MPNLRX[11] bit 2 <- 0x20008ef2
MPNLRX[11] bit 1 <- 0x20008f06
```

No inspected software copy or mirror connects either pair. Mixer parser states `0x20026f5a/5b`, sourced from `MPNLRX[11]` bits 2/1, are entries 6 and 7 of the independent eight-input state machine at `0x9a36`. That function indexes `0x20026f54..0x20026f5b`, uses the identity table `00 01 02 03 04 05 06 07` at `0xa204`, and stores separate output/state at `0x20028756`. The same two inputs also copy to feedback slots `0x20026f88/89`.

The six-route selector instead stores at `0x20028368` and never reads `0x20026f5a/5b` in the inspected path. Conversely, selector states 1 and 5 at `0x20026f46/48` have separate feedback slots `0x20026f92/94`. The eight-input machine has additional special output values `7`, `9` and `10` whose semantics remain unnamed; their existence does not connect that machine to six-route DSP selection.

## Software boundary

`analysis/az_mixer_packet.py` now exposes two separate fields:

- `sound_color_selector_bits_raw`: `frame[21]` bits `1,4,3,5,0,2`, ordered as anonymous selector values `1..6`;
- `sound_color_hui_bits_raw`: the six EP147 sources above, ordered by HUI suffix.

`mixer/native_cfx.py` reproduces only the verified selector rising-edge/scan/toggle behavior. F1 output remains disabled unless a complete selector-to-F1 map and parameter are explicitly supplied. Such a map is host lab policy: F1 types name reconstructed RX3 algorithms and are not evidence for the anonymous AZ DSP targets.

## Evidence limits

The static chain establishes panel packed bits, mixer MCU state machines, EP147 host-frame decoding and anonymous AZ DSP dispatch. It does **not** establish physical electrical aliasing, paired contacts, button labels, algorithm identities, equivalence to RX3 enums, transfer curves, audio output or listening behavior. Host tests validate only the new decoder/state/transport software. The separate 2026-09-16 Pi result in `NATIVE-CFX-CHECK-20260916.md` validates synthetic AArch64 execution of that software; it did not execute EP147, use the physical controller/audio path, or perform listening.
