# Audio graph static map

ABI ancestry maps identify 32 AudioProcessor/AudioSource-related class records in AZ and 31 in CDJ-3000X, including library and abstract classes. These are not counts of instantiated graph nodes. See *-audio-processors.json.

Both include DjPlayerAudioProcessor, DjPlayerUnit, preview players, SimpleAudioMixer, SimpleAudioSwitcher and JUCE AudioProcessorGraph. AZ additionally exposes DeckBluetoothAudioSwitcher/BluetoothPlayer; 3000X exposes UsbAudioPlayer. This inventory is useful for finding routing, not evidence that every class runs in standalone mode.

Primary tables recovered in both binaries have 72 entries for combo_system::AudioSystem, 70 for DjPlayerUnit and 66 each for SimpleAudioMixer/SimpleAudioSwitcher. Matching length alone does not prove ABI interchangeability. Reproduce extraction with audio-vtables.py.

Within AZ, SimpleAudioMixer and SimpleAudioSwitcher differ in primary slots 0, 1, 4, 5 and 7. Slots 0/1 are destructor candidates. Remaining targets:

| Slot | Mixer | Switcher |
|---|---|---|
| 4 | 0x21afae0 | 0x21afba0 |
| 5 | 0x21b4620 | 0x7ae7a0 |
| 7 | 0x21b2070 | 0x21b2310 |

Mixer slot 7 reads buffer-like fields at argument +0/+4/+16, uses an internal range at object +312/+320 and prepares a two-channel operation. This makes it a strong processing-method candidate, but the method name and channel semantics remain unverified. Saved initial disassembly: az-mixer-slot7.asm. Next extend through the complete function and identify helper 0x14aada0, then compare with RX3's named AudioProcessor methods.

None of these observations proves complete AZ effects processing lives in CPU code. The separate hardware mixer command path remains a distinct target.

## processBlock confirmed

The error branch in the candidate at 0x21b2070 directly references string 0x2e575c8: `virtual void meow::SimpleAudioMixer::processBlock(juce::AudioBuffer<float>&, juce::MidiBuffer&)`. This resolves the method identity beyond vtable inference.

The method iterates an internal range in 40-byte steps, prepares two-channel buffer views, processes subsequent entries via helper 0x21b5180, and adds processed scratch data into the destination channels using 0x2233060. It bounds sample work by the available lengths and checks input channel capacity against twice the entry count. Exact input roles and gains remain to be mapped.

Helper 0x2233060 implements in-place float addition: destination[i] += source[i], using a four-float NEON FADD loop at 0x2233090–0x22330a8 and scalar tail/overlap paths. This proves CPU-side summation exists in the player. It does not establish that this is AZ's main physical four-channel mixer or that EQ/Beat FX run here.

Evidence: az-mixer-slot7-full.asm, az-mixer-process-diagnostic.json, az-mixer-add-helper.asm. Next identify the 40-byte per-input operation and its coefficient/ramp state, then locate where the graph instantiates this mixer.

## Per-input gain ramp observed

Helper 0x21b5180 performs gain smoothing and multiplication. In its single-channel active branch, it decrements an integer counter at state +12, adds the float at +8 to current gain at +0, multiplies the sample by that gain, then stores both the sample and updated current gain. When the counter expires it uses the value at +4. These support current/target/step/remaining semantic labels for the first 16 bytes; setup code and ramp duration still need tracing.

For multiple channels it computes a shared per-sample gain array, then calls 0x2233eb0 for each channel. That helper uses NEON float multiplication (`FMUL v0.4s`) to multiply source samples by the gain array into destination samples. Reusing a gain array across channels preserves matching gain trajectories without recalculating the ramp separately for each channel.

A flagged alternate path advances the gain counter/current value by a block and copies audio through helper 0x2232c40. This looks like bypass handling; the flag's identity is not yet proven. The state must continue advancing even in that path, an important behavior to preserve in any reimplementation.

Practical relevance: smooth gain changes are a concrete CPU-side primitive available to investigate for stem mutes/levels. This is not a discovered stem engine or evidence of hardware EQ/FX parity. No implementation has been copied into BiteDJ or published. Evidence: az-mixer-input-operation.asm and az-gain-multiply.asm.

## Ramp setup and scratch allocation

Slot 4 at 0x21afae0 accepts a floating-point argument in d0 and an integer in w1. For each 40-byte input state, with d0 > 0, it:

- copies target gain (+4) into current gain (+0),
- zeros remaining count (+12),
- stores d0 at +24,
- computes floor(d0 * state.double_at_32) into the integer at +16.

This is consistent with sample-rate-dependent ramp setup: +24 sample rate, +32 duration in seconds, +16 ramp sample count. The arithmetic and offsets are established; exact parameter names and duration value still need independent constructor/callsite confirmation. The method also allocates a two-channel float scratch buffer sized from w1. This allocation occurs in setup, not in the processBlock summation loop.

Slot 5 at 0x21b4620 is an immediate return. Earlier exploratory disassembly named az-mixer-prepare.asm was renamed az-mixer-slot5-and-adjacent.asm to avoid mislabeling the no-op and unrelated following functions as prepare code. Slot 4 is the actual preparation candidate.

Useful implementation implication: preserve the ramp in time units when changing sample rate, and provision scratch storage before playback. No default ramp duration has yet been recovered.

## Mixer construction recovered

Constructor candidate 0x21b29e0 takes an input count, a double forwarded into each input state's +32 duration field, and a float for a separate gain state at object +272. It requests 2×input-count input channels and 2 output channels, sizes the per-input state vector, and initializes each input target to unity (1.0). Ramp increment is calculated as (target-current)/ramp_count when the count is positive; otherwise current snaps to target.

The only direct BL caller found is 0x21b2c50 in an outer processor constructor at 0x21b2c10. It embeds the mixer at outer object +272 and passes unity for the separate gain parameter. The outer constructor forwards its duration argument, so no hardcoded duration is established at this level. Indirect/inlined construction is not excluded by a direct-call scan.

Artifacts: az-mixer-constructor.asm, az-mixer-constructor-callers.json, az-mixer-factory.asm (exploratory filename; actually an outer constructor). Next identify outer processor callers and supplied duration constants to connect this generic primitive to a concrete audio graph role.

The outer constructor's installed vtable (0x2e56e18) maps to `meow::SimpleAudioSwitcher`. Thus this recovered path specifically constructs a mixer embedded inside a switcher, rather than proving direct construction of AZ's physical four-channel mixer.

## Concrete graph role and duration found

The only direct caller of SimpleAudioSwitcher construction is at 0x7c5cbc inside 0x7c5c80. It passes input count 2 and loads double 0.01 from 0x260fbd8. After the base constructor it installs vtable 0x2604be8, which the validated RTTI map identifies as `combo_system::DeckBluetoothAudioSwitcher`.

This connects the recovered stereo mixer/gain-ramp path specifically to deck/Bluetooth source switching. The duration parameter propagated into ramp setup is 0.01; interpreted with the sample-rate multiplication, this is 10 ms (480 samples at 48 kHz). The numerical constant and construction chain are verified statically; observed transition timing has not been measured in the emulator.

This is a useful finding AND a scope correction: the CPU mixer discovered here must not be presented as AZ's full four-deck EQ/FX mixer. The next high-value direction is the hardware mixer TxDataBuilder path and RX3 DSP comparison, while retaining this source-switching primitive as a reusable behavior reference.

Evidence: callers-21b2c10.json, az-switcher-creation.asm, az-switcher-duration.json, xdjaz-inheritance.json.
