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

The six HUI IDs map through explicit records to six operation IDs. The sole registered generic observer is identified by native type information as:

```text
midi_adapter::MixerOperatorHandler
```

Its float callback performs:

```text
HUI ID
-> exact mapped operation ID
-> midi_adapter::IMixerOperatorsByID exact lookup
-> returned operation object
-> operation object's virtual float handler
```

The callback preserves all six Sound Color operation IDs. Its only special operation-ID substitution concerns a different, unrelated ID. No six-way Sound Color permutation exists in this generic observer.

Native component/type strings place this observer under the MIDI HID adapter's mixer-operator family, alongside mixer Beat FX and Beat FX selection adapters. That is evidence about software ownership, but it does not yet prove whether each Sound Color operation object is a hardware-selection command, a MIDI/reporting operation, GUI state, or a compatibility path. The concrete returned operation handlers remain the next trace boundary.

## Remaining contradiction

For the four HUI states sharing exact raw panel bits with selector inputs, operation/MIDI metadata implies:

```text
selector 4 -> Sweep label
selector 2 -> Filter label
selector 3 -> Space label
selector 6 -> Crush label
```

Native selected-output DSP structure implies:

```text
selector 4 -> Noise-like topology
selector 2 -> Dub-Echo-like topology
selector 3 -> Filter-like topology
selector 6 -> Sweep-like topology
```

The following explanations are now ruled out for the inspected 1.30 release:

- mixer scan-order or packet-field renumbering;
- SPI staging reorder;
- DSP current/pending selector confusion;
- DSP dispatch-target confusion;
- HUI suffix construction or receive-bit order;
- HUI-to-operation record direction;
- MIDI CC byte alignment;
- a generic post-HUI six-way operation-ID permutation;
- topology belonging only to an unrelated tail or route;
- EP147 and mixer/DSP payloads coming from different releases.

The unresolved question is now the semantic role of the concrete MIDI-adapter operation objects. Until that path is classified and all six identities independently agree with native DSP evidence, runtime behavior remains observation-only unless an operator supplies an explicit complete lab policy.
