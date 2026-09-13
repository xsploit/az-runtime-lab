# 1.30 aAZ UI and mixer research checkpoint

Scope: supplied EP147 AZ nd EP145 CDJ-3000X 1.40; original CDJ-3000 is a different binary. Static evidence below does not establish working native stems.

## Validated structure

The initial string index has now been cross-checked against the Itanium C++ ABI class-typeinfo vptrs referenced by each binary's dynamic COPY relocations. Direct base records were decoded; candidate virtual tables require an executable first function pointer.

| Binary | Class typeinfo records | Direct base records | Candidate virtual tables |
|---|---:|---:|---:|
| AZ | 6,399 | 6,997 | 7,645 |
| CDJ-3000X | 6,524 | 7,051 | 7,976 |

5,841 type names occur in both maps; 558 only in AZ and 683 only in 3000X. Shared names do not imply matching addresses, object sizes, or binary-compatible methods. AZ has 157 direct-base names unresolved by the initial name index; no claim of complete reconstruction.

Reproduce: `python runtime-lab/analysis/map-inheritance.py`. Full evidence: *-inheritance.json and shared-class-map.json.

## Stem UI

AZ contains `gui::waveform::PadStemWidget`, typeinfo 0x2d8fa10, deriving from `juce::Component` and `gui::waveform::PadStatusWidgetBase`. Its primary vtable address point is 0x2d8fa58 with 44 consecutive executable entries; first entries at 0x1df68d0 and 0x1df6988 have destructor-like structure, including restoring the widget vptr and destroying owned objects. Method identities beyond that are not established.

No exact PadStemWidget type appears in the CDJ-3000X map. This does not prove that all possible stem-related functionality is absent.

Next: map constructor references, paint/resized/input slots and the widget's provider. Establish whether its state originates from host MIDI/HID or standalone deck state. Do not interpret a widget as an embedded separator or standalone stem audio path.

## Mixer and graph anchors (AZ)

| Class | Typeinfo | Primary vtable |
|---|---|---|
| combo_system::AudioSystem | 0x2603e50 | 0x2604e08 |
| meow::SimpleAudioMixer | 0x2e56860 | 0x2e56bf8 |
| device_adapter::mixer::Mixer | 0x2e41f70 | 0x2e42208 |
| mixer_control_ucom::TxDataBuilder (under device_adapter::subcpu_comm) | 0x2e4a3f8 | 0x2e4a490 |

Diagnostic strings also identify `combo_system::AudioSystem::addDjPlayerNode(int)` returning a JUCE AudioProcessorGraph node. Together these provide targets to investigate graph routing versus external mixer control. They do not prove the full effect algorithms live in EP147.

The existing local RX3 fbshim.c demonstrates PCM rerouting and libdl handling, but includes ARM32 inline syscalls and an FLX6-specific control-device override. Port behavior deliberately; do not load that library into ARM64 AZ or assume its two-channel clamp is appropriate for AZ's ten outputs.

## Desired stems integration

User's requirement is full integration with the software mixer: stem audio, deck timing, channel gain/EQ, cue, routing and FX. Preprocessed and live separation remain distinct input paths to investigate; the final integration must not stop at visual controls. DSP parity with AZ requires evidence for every effect and routing mode; RX3 named code is a comparison source, not proof of identical effects.

## Stem construction trace

Direct ADRP+ADD scans found three materializations of the primary widget vtable: two in destructor-like functions and one at 0x1df73f4 in the constructor candidate beginning 0x1df7358. The latter calls a base initializer, initializes the secondary base at object +0xc8, writes the primary vptr and clears an owned pointer at +0xf0. These offsets are observed construction operations, not a complete object definition.

Only four of the 44 primary vtable entries point into this widget's nearby code: slots 0, 1, 26 and 34. Most point to shared JUCE-region implementations. Do not infer mouse handling or audio processing from the widget name. The provider passed to the secondary-base initializer remains the next trace target.

Artifacts: az-stem-xrefs.json, az-stem-construction.asm, az-stem-constructor-callers.json. Objdump prints nearest exported-symbol labels with very large offsets in this stripped binary; these labels are NOT the recovered names of these functions. Use numeric addresses.

## Parent and provider layout observations

The direct caller at 0x1df64f0 allocates 0xf8 (248) bytes for the stem widget, passes a shared context argument and the parent field at +200, then stores the resulting child pointer at parent +272. Adjacent code constructs other pad widgets at +256 and +264 with the same shared context. Layout calls supply width 148 and height 20 for the stem child, matching a compact pad-status field rather than a full mixer panel (the exact called JUCE method has not been symbolized).

The shared base initializer at 0x1df66d8 copies two refcounted pointer pairs from context offsets +4448/+4456 and +4272/+4280. It stores these at secondary-base offsets +8/+16 and +24/+32; the numeric argument is stored at +0. Refcount increment/decrement code supports shared-ownership interpretation. Concrete provider class names remain unresolved.

Parent code at 0x1df60e4 loads the stem child from +272 and forwards a selected boolean-like register through vtable offset +96; surrounding code does the same for neighboring pad children. A jump table at 0x2d8f818 selects branches in this update region. This narrows the next task to decoding that selector and identifying the context's provider objects. It does not yet show native audio mutation.

Evidence: az-stem-provider.asm and az-pad-parent-init.asm. Findings are static, version-specific and not verified by UI interaction.

## Pad selector decoded

The parent update routine at 0x1df6010 reads its state object at +208, calls 0x1fa7a28, and bounds-checks the result against 20 before indexing the 21-entry branch table at 0x2d8f818. Values 11 and 18 select 0x1df6218, which loads the stem widget at +272, sets its visibility-selection register to 1, and calls 0x1df69f8. These are raw internal selector values, not established MIDI numbers or user-facing mode names.

The stem update routine at 0x1df69f8 reads the shared object at widget +208 and a flag at shared-object +193. One path selects an image index based on the widget's +200 numeric field, writes it to the child image component at +200, and calls a graphics-region function. Other paths call provider methods and still need tracing. This is concrete display-state behavior; it does not establish audio control or stem DSP.

The selector getter at 0x1fa7a28 has a local-state fallback (field +172, range 0..7) and provider-dependent paths. Do not label those paths standalone/host without identifying the providers. Evidence: az-pad-selector.asm, az-pad-mode-table.json, az-pad-mode-getter.asm, az-stem-update.asm.

## Named providers resolved in stem update

The lazy object-resolution diagnostics in the stem update routine identify two concrete dependencies:

- Shared-state +16 pointer / +24 object ID: `usecase::pc_control::IPcAppliModeSwitcher`. Failure diagnostic is materialized at 0x1df6b4c–0x1df6b54, pointing to 0x2d8fbe8. Its provider method is called through vtable +24 at 0x1df6a84, returning a value checked via a flag byte.
- Shared-state +64 pointer / +72 object ID: `connection_with_hostapp::IHostAppliInfo`. Failure diagnostic is materialized at 0x1df6c6c–0x1df6c74, pointing to 0x2d8fcc0. Its provider method is called through vtable +16 at 0x1df6aac; the low byte is compared to 1 before selecting another image family.

These names are supported by code-referenced template diagnostics, not a nearby-string guess. This establishes that the existing stem-status rendering consults PC mode and host application information. It does not establish the exact host enum identity, prove absence of every standalone stem path, or provide a standalone separator. The immediate porting value is a reusable visual/status component; native mixer/stem audio integration still must be built and verified.

Next useful traces: identify host-info enum semantics through RX3 names or other AZ callsites; map the audio graph independently rather than treating this status widget as a DSP entry point. Evidence: az-stem-provider-calls.asm and az-stem-provider-diagnostics.json.
