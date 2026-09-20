# AZ Sound Color selector identity check — 2026-09-19

## Scope

This checkpoint tests explanations for the disagreement between native EP147 HUI operation labels and the six anonymous mixer/DSP selector routes. It preserves control metadata, mixer transport, DSP topology, reconstructed RX3 behavior and physical listening as separate evidence classes.

No selector name is accepted by elimination. No default selector-to-F1 policy follows from this checkpoint.

## One-release provenance

The release-mismatch hypothesis is ruled out. A bounded, read-only inspection of the XDJ-AZ 1.30 update image established one container with release metadata `1.30` and both of the relevant payload families:

- the EP147 application came from the system image in that container;
- the mixer-controller S-record came from that same container and reports controller revision `1.03`;
- reconstructing the sparse mixer-controller address space from checksum-valid S-records reproduced the investigated controller image byte for byte;
- the controller segment beginning at `0x601a0000` reproduced the investigated TI AIS image byte for byte;
- the system image's embedded archive reproduced the investigated EP147 executable byte for byte.

The private update image, executable, controller image and AIS payload remain outside the repository. This document records only the derived relationship.

Therefore the HUI tables and the mixer/DSP implementation under comparison belong to the same XDJ-AZ 1.30 release. A cross-version label/order mismatch cannot explain the disagreement.

## Mixer-to-DSP transport result

The selected value is written directly to mixer command offset `0xa6`. The DSP-side SPI staging call supplies source base `0x11800800` to a C66x software-pipelined copy that performs eight 32-byte, offset-preserving iterations into destination base `0x11800a00`.

Consequently:

```text
mixer command +0xa6
-> SPI receive 0x118008a6
-> staged candidate 0x11800aa6
```

There is no byte, halfword, 32-byte-block or selector permutation in this transfer.

## Selected-output ownership

The topology classifications are attached to selected-effect output, not merely adjacent tail or modulation state:

- selector 2 writes its fractional-delay/feedback result into route-owned paired buffers consumed by the common output converter;
- selector 3 writes its filtered result directly into the common output arrays;
- selector 4 writes its generated and recursively filtered PRNG signal directly into the common output arrays;
- selector 6 writes its moving-filter result directly into the common output arrays.

Selectors 1 and 5 have not yet received the same explicit selected-output ownership trace. Their Space- and Crush-like topology classifications remain supported by their internal state and processing laws, but they are not part of the four-route output-ownership result above.

The current native DSP classifications remain:

```text
selector 1 -> Space-like topology
selector 2 -> Dub-Echo-like topology
selector 3 -> Filter-like topology
selector 4 -> Noise-like topology
selector 5 -> Crush-like topology
selector 6 -> Sweep-like topology
```

The `-like topology` wording is deliberate: it records native structure without treating reconstructed RX3 enum order as AZ identity evidence.

## Post-HUI operation path

The six HUI IDs map through explicit records to six operation IDs. Native type information identifies the observer as:

```text
midi_adapter::MixerOperatorHandler
```

`midi_adapter::MixerOperators` has separate button and continuous-operation maps. Its interface vtable uses:

```text
+0x10 -> button/bool lookup at 0x721320
+0x18 -> continuous/float lookup at 0x720eb8
```

The six Sound Color operation IDs are registered in the button map, not the continuous map. Each registration constructs a `midi_adapter::OperationDataServerButton` with the same operation ID in both component-ID fields and `OperatorGroup` 5. No operation-ID permutation occurs during registration.

`MixerOperatorHandler` also has separate event overloads. Button press and release use the button lookup and pass `true` and `false`, respectively:

```text
HUI ID
-> exact mapped operation ID
-> button-map lookup at 0x721320
-> OperationDataServerButton
-> unchanged operation ID, OperatorGroup 5 and bool state
-> midi_adapter::SendManager::send(...)
```

The float callback uses the separate continuous map and does not resolve these button-only Sound Color entries.

## MIDI/HID route classification

`OperationDataServerButton::send(bool)` forwards into the native `MidiHidSendManager` family. The generic send task invokes both the `HidSend` and `MidiSend` branches when their output objects are present, so class ownership alone was not enough to classify these six operations.

The bounded native table and dispatch trace now separates the branches:

- the six operation IDs are absent from all three file-backed `HidSend` mapping-record families;
- they are absent from the two-ID `HidSend` pre-handler index;
- a bounded whole-executable MOVZ/MOVK scan found the six exact IDs only at their `MixerOperators` registrations;
- none is one of the hard-coded `HidSend` exception IDs;
- generic `HidSend` record dispatch supports operator groups `0..3`, `0x10` and `0xff`, but has no group-5 case, so an unhandled group-5 operation returns without modifying a HID report;
- all six IDs are present in the native `MidiSend` group-5 records as MIDI type `0x0b`, status `0xb0`, and CC values `0x69`, `0x6b`, `0x56`, `0x6a`, `0x55` and `0x57`;
- the button path supplies MIDI values `0x7f` for press and `0x00` for release.

Therefore these six concrete operation objects form a MIDI publication/compatibility path and are HID-inert in the inspected implementation. Live MIDI transmission still depends on the runtime output object, connection and mode state; this is a static route-ownership result, not a physical-output claim.

## Separate observations for selector bits 1 and 0

The EP147 receive parser continues after the four `frame[21]` bits assigned to HUI suffixes 2 through 5:

```text
frame[21] bit 1 -> owner field +0x208
frame[21] bit 0 -> owner field +0x210
```

The subclass constructor initializes those fields individually rather than extending the six-ID loop:

```text
+0x208 -> HUI 0x027a9bd941754000
+0x210 -> HUI 0x444b11a9298c5100
```

Native diagnostics identify the two HUI IDs as `Mixer::MicPanel<0>::eqHi()` and `Mixer::MicPanel<0>::eqMid()`. Their exact adapter and MIDI records are:

```text
selector-1 source bit
-> HUI 0x027a9bd941754000
-> operation 0x5976df6d12f7af00
-> OperatorGroup 5, MIDI CC 0x1e
-> official label MIC 1 EQ HI

selector-5 source bit
-> HUI 0x444b11a9298c5100
-> operation 0xf652995807011800
-> OperatorGroup 5, MIDI CC 0x62
-> official label MIC 1 EQ MID
```

Thus selectors 1 and 5 are not hidden suffixes 6 and 7, and their separate EP147 observations do not provide Sound Color names. Instead, they add another concrete example of direct panel bits being published under unrelated compatibility identities.

## EP147TestMode label-table check

A bounded search of the same release's native test-mode executable found a contiguous six-label resource:

```text
SCFX NOISE
SCFX DUB ECHO
SCFX SWEEP
SCFX FILTER
SCFX SPACE
SCFX CRUSH
```

This initially looked like a possible direct control-label table. Direct code references rule that out. The six label blocks compare the incoming identity against HUI IDs `0xc4bddb099942f600` through `...f605` in suffix order and assign local item numbers 1 through 6. The test-mode receive parser independently reproduces the normal application's source mapping:

```text
suffix 2..5 owner fields +0x1e8..+0x200 <- frame[21] bits 5..2
separate owner fields +0x208/+0x210      <- frame[21] bits 1/0
suffix 0/1 owner fields +0x1d8/+0x1e0   <- frame[23] bits 2/1
```

The test-mode labels therefore name the already classified HUI family; they do not form a selector-value table and do not repair the HUI/DSP disagreement. No selector identity is accepted from them.

## Selector feedback output check

A separate trace now follows the selected value back toward the panel rather than through EP147. Mixer updater `0x9e8c` maps selected values `1..6` through an explicit six-entry address table into feedback bytes `0x20026f92`, `0x20026f93`, `0x20026f95`, `0x20026f96`, `0x20026f94` and `0x20026f97`. Mixer packet builder `0x22c2` transports those bytes at panel-packet offsets `0x18`, `0x19`, `0x1c`, `0x1a`, `0x1b` and `0x1d`. Panel decoder `0x3fee` maps them into staged output entries `0`, `1`, `3`, `4`, `2` and `5`; commit routine `0x41ec` activates them, and output builder `0x38e8` serializes active entries `0..5` into six distinct output bits.

This proves dedicated panel feedback-output ownership for all six anonymous selector values and rules out a hidden permutation in the mixer-to-panel return path. It does not identify the physical load, pair an output with a labeled button, or provide a semantic name. A bounded rootfs search for resources containing the complete six-name family found no second candidate beyond the already disqualified EP147TestMode HUI table, including common ASCII and UTF-16 encodings.

## Evidence boundary after route classification

For the four HUI states sharing exact raw panel bits with selector inputs, operation/MIDI metadata still assigns:

```text
selector-source bit for selector 4 -> Sweep MIDI label
selector-source bit for selector 2 -> Filter MIDI label
selector-source bit for selector 3 -> Space MIDI label
selector-source bit for selector 6 -> Crush MIDI label
```

Native selected-output DSP structure implies:

```text
selector 4 -> Noise-like topology
selector 2 -> Dub-Echo-like topology
selector 3 -> Filter-like topology
selector 6 -> Sweep-like topology
```

This is no longer an unresolved hardware-command routing question. The first table belongs to a MIDI-only compatibility/reporting path; the second belongs to the independent mixer-packet/DSP-selection path. Sharing a raw source bit proves simultaneous observation, not that a MIDI CC label names the selected DSP route.

The following explanations are ruled out for the inspected 1.30 release:

- mixer scan-order or packet-field renumbering;
- SPI staging reorder;
- DSP current/pending selector confusion;
- DSP dispatch-target confusion;
- HUI suffix construction or receive-bit order;
- HUI-to-operation record direction;
- MIDI CC byte alignment;
- a generic post-HUI six-way operation-ID permutation;
- a hidden group-5 HID hardware-selection command in the inspected `HidSend` tables or dispatch;
- topology belonging only to an unrelated tail or route;
- EP147 and mixer/DSP payloads coming from different releases.

The remaining identity task is to find native control-label evidence tied to the direct mixer-selector path rather than reusing MIDI compatibility labels. Until all six such identities independently agree with native DSP evidence, runtime behavior remains observation-only unless an operator supplies an explicit complete lab policy.
