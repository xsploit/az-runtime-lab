# AZ hardware mixer protocol map — partial

Binary: EP147 AZ 1.30, hash recorded in xdjaz-inheritance.json. No hardware response emulation is implemented by this map.

## Transmit builder

`device_adapter::subcpu_comm::mixer_control_ucom::TxDataBuilder` has primary vtable 0x2e4a490. Its slot 2 points to 0x215bfe0. The function checks the input RawArrayRef length at +8 against 0x80 (128); the mismatch branch references `TxFormatField` and `data size mismatch` in its own diagnostic. On the successful non-null path it zeroes all 128 bytes before filling fields.

This establishes a 128-byte builder buffer requirement, not the complete on-wire framing or SPI transaction size.

Initial byte-0 fields observed:

| Bit | Source |
|---|---|
| 7 | builder byte +164, low bit |
| 5 | helper 0x218d530 return, low bit |
| 0 | builder byte +160, low bit |
| 2 | builder byte +161, low bit |
| 4 | builder byte +162, low bit |

Names and polarity of these flags remain unknown. The builder byte +128 controls the next branch. Do not label them power/reset/mute until setter/command methods are traced.

The receiver and nested Command class tables are also indexed in az-hardware-mixer-vtables.json, including secondary-interface tables. Command methods at 0x215caf0 through 0x215cb30 are a promising way to attach names to the byte fields.

Next: map those small command methods and their inherited interface order; extend packet offset mapping; inspect receive validation and confirm which subucom device carries this format. Do not reuse the public CDJ-3000 emulator's 64-byte idle frame for AZ without matching the actual protocol.

Evidence: az-mixer-tx-entry.asm, az-mixer-tx-header.asm, az-mixer-tx-diagnostics.json.

## Receive size and command setter semantics

Receive dispatcher slot 2 (0x2154ec0) calls validator 0x2159a08 with a flag value of 1. That validator also requires RawArrayRef length 128 (comparison at 0x2159a20). A mismatched length returns null; the caller checks null before dispatch. Equal size is only the first check, not proof of a valid frame. Validation beyond the length branch still needs tracing.

The nested Command object's primary setters have these exact local effects:

| Address | Local effect |
|---|---|
| 0x215caf0 | store argument low byte at object +24 |
| 0x215caf8 | XOR argument with 1, store low byte at +25 |
| 0x215cb08 | store 1 at +26 |
| 0x215cb18 | store argument low byte at +27 |
| 0x215cb20 | store 1 at +28 |

Secondary-interface method 0x215cb30 stores 1 at its incoming pointer +20; the secondary table is offset 8 within the object, so that corresponds to full-object +28. It belongs to the inherited shutdown-preparation interface according to RTTI, but the method name and acknowledgement lifecycle remain unresolved. Do not conflate these Command-object offsets with the TxDataBuilder-object offsets until ownership/layout is traced.

The +25 inversion is important: an emulator that assumes every flag has the same polarity would change behavior. No user-facing meaning has been assigned yet.

Evidence: az-mixer-command-methods.asm, az-mixer-rx-entry.asm, az-mixer-rx-validation.asm, az-hardware-mixer-vtables.json.

## Receive checksum recovered

The validation-enabled path at 0x2159b1c constructs a 256-entry reflected CRC table. The 16-byte constant at 0x298d8e0 consists of eight little-endian 0x8408 values. Initial table indices at 0x2864680 are 0, 1, 2, 3. Eight shift/XOR stages generate the table.

The helper at 0x688878 receives lower bound 0, upper bound 128 and requested count 96; its in-range path returns 96. The loop at 0x2159ce8 therefore consumes bytes 0–95 inclusive. It starts with 0xffff, shifts right, and complements the final result (masked to 16 bits). At 0x2159d0c it compares this with the little-endian 16-bit field at bytes 96–97. Mismatch logs an error and returns null. Bytes 98–127 are outside this checksum; their role remains unknown. This matches CRC-16/IBM-SDLC parameters (also called X-25), with the familiar check value 0x906e for ASCII `123456789`.

Important correction to a possible interpretation: calling the constructor/validator with its flag zero does **not** simply bypass checking of existing data. That path clears the entire supplied 128-byte buffer at 0x2159d38–0x2159d54. The receive dispatcher uses flag one.

`az_mixer_packet.py` is a read-only inspector for a single already-delimited receive buffer. It reports length/checksum validity only. It does not assign controls, generate handshake traffic, or claim hardware acceptance. Run:

    python runtime-lab/analysis/az_mixer_packet.py capture-buffer.bin
    python -m unittest discover -s runtime-lab/analysis -p test_az_mixer_packet.py

Four synthetic tests passed: standard CRC check value; wrong sizes; mutation of each protected/checksum byte; and mutation of the unprotected tail. No real mixer capture or direct execution of the firmware validator has been tested yet.

Evidence: az-mixer-rx-checks.asm, az-mixer-rx-check-tail.asm, az-mixer-crc-constants.json; helper disassembly at 0x688878. Next: obtain a real buffer or execute the original validator in isolation to independently verify the reconstruction, then map receive fields and transport framing.

## Dispatcher gate and packed input values

After checksum validation, 0x2154eec loads the first little-endian 16-bit word. Zero takes a diagnostic path; nonzero proceeds to dispatch. The code-referenced diagnostic at 0x2e4a2c8 explicitly says `data->field.version.mixerControlUcom!=0`. Thus bytes 0–1 represent the mixer-control microcontroller version, and a checksum-valid all-zero payload is insufficient for normal dispatch. Encoding of the version number remains unknown. At 0x2154764–0x215476c, the first three 16-bit words are saved at dispatcher offsets 876, 878, 880. The other two words are not named yet.

The main dispatcher 0x2154730 forwards packet regions to these helpers:

| Buffer offset | Helper |
|---|---|
| 6 | 0x2153478 |
| 10 | 0x2153c48 |
| 20 | 0x21540e0 |
| 31 | 0x2154418 |
| 56 | 0x2153dd0 |
| 61 | 0x2153e80 |
| 66 | 0x2153f30 |
| 84 | 0x21545e8 |

These are region entry offsets, not inferred region lengths. Regions can overlap or interleave.

A four-iteration loop at 0x21548d4–0x2154980 decodes four 10-bit values per iteration from bytes 36–55. For group g=0..3 and lane k=0..3:

    value = (packet[36 + 5*g + k] << 2)
          | ((packet[40 + 5*g] >> (6 - 2*k)) & 3)

Each group's fifth byte carries all four low two-bit pairs. Destinations are four pointer fields in each 56-byte group beginning at dispatcher+616, +624, +632, +640, passed to helper 0x2159560. Values span 0–1023. This is consistent with control samples, but the precise EQ/gain/fader identities are not yet established and are deliberately left unnamed.

The inspector now exposes header words, the nonzero-header gate and these raw groups independently of CRC validity (so corrupt captures remain inspectable). Five tests pass, including explicit packed-field vectors and isolated group indexing. No real hardware acceptance claim.

Evidence: az-mixer-rx-entry.asm, az-mixer-rx-dispatch.asm, az-mixer-rx-84.asm, string at 0x2e4a2c8. Next trace dispatcher construction to attach control identities to the destination pointers.

## Packed-value destinations: slider adapters and registration values

Constructor 0x2153b70 sets the validated RxDataDispatcher vtables and calls 0x21574b0 with `this+16`. This offset matters: the packed-value destination at full dispatcher+616 is constructor-helper-relative +600 (0x258), not +616.

The four decoded lanes in each group are initialized through 0x2156580. That helper creates a 24-byte adapter via 0x21f0210, with integer parameter 1023 and float parameter 1.0. The adapter constructor installs vtable 0x2e63960, mapped through validated RTTI to `meow::HuiSliderDefaultAdapter`. It then creates a 232-byte control object through 0x21f2480 and registers an interface at object+192 via 0x2138490. Thus the packed data feeds slider-style control adapters; this is stronger evidence than the bit width alone. The exact normalization formula and physical labels remain untraced.

The four lane registration values for group zero are:

| Lane | Dispatcher pointer offset | 64-bit constructor value |
|---|---|---|
| 0 | 616 | 0x0004d17e2dc19f00 |
| 1 | 624 | 0x7dcb7936b7ed2b00 |
| 2 | 632 | 0xa6518fb8028ca800 |
| 3 | 640 | 0xdacc2ca9faed3600 |

Groups 1–3 repeat at 56-byte object strides and replace the low byte of each value with the group index. These are observable registration values, not proven MIDI IDs, cryptographic material, or control labels. They provide a precise next search target for consumers elsewhere in the binary. An additional slider at each group's +32 offset has a different registration value and is not among the four values decoded by this particular loop.

Evidence: dispatcher-xrefs.py / az-mixer-dispatcher-xrefs.json; az-mixer-dispatcher-construction.asm; az-mixer-control-construction.asm and tail; adapter constructor at 0x21f0210 and validated xdjaz-inheritance.json. No claim that these four lanes are trim/high/mid/low until consumers or named RX3 equivalents prove that mapping.

## Physical control names resolved through consumer diagnostics

The MOVZ/MOVK search (`slider-id-xrefs.py`) found the same sixteen registration values in `midi_adapter::HuiEventHandler::linkToMixerHui()`, in addition to the previously mapped dispatcher construction. The search produces candidates; the consumer disassembly confirms materialization, stack storage, call to 0x6c5330, then a failure branch with a control-specific diagnostic. These diagnostics establish the names for each exact registration value.

The four lanes at bytes 36+5*g through 39+5*g are, in order:

1. `huiid::Mixer::Ch<g>::trim()`
2. `huiid::Mixer::Ch<g>::eqIsoHi()`
3. `huiid::Mixer::Ch<g>::eqIsoMid()`
4. `huiid::Mixer::Ch<g>::eqIsoLow()`

All sixteen channel/lane diagnostics were cross-referenced, for internal channel indices 0–3. For channel zero, strings at 0x25d53c8 / 0x25d5408 / 0x25d5448 / 0x25d5490 identify trim/high/mid/low, following the respective registration calls. `IHuiKnob` in these consumer diagnostics is compatible with the generic HuiSliderDefaultAdapter previously observed; it does not mean these are physical channel faders.

The read-only inspector now emits `mixer_knobs_raw` with these names. Values are still raw 0–1023 samples: this does not establish gain in dB, EQ/isolator mode, filter coefficients, physical controller channel order, or successful injected events. Five tests pass, including the named output for a synthetic packed vector.

Nearby consumer diagnostics also identify color/cue/fader links. They are useful next targets for finishing channel controls, but their packet offsets are not established by this name mapping alone.

Evidence: az-slider-id-xrefs.json; az-slider-consumers.asm; az-slider-consumer-labels.json. Earlier uncertainty about the four lane names is superseded by this cross-reference; runtime validation is still pending.

## Channel fader and Color packet mapping

The dispatcher passes packet+10 to 0x2153c48. That helper decodes four packed 10-bit values from bytes 10–14 into object pointers at full dispatcher offsets 664, 720, 776, 832. The first pointer is constructed at helper-relative +0x288 (plus outer +16 = 664) with registration value 0x02b1ffa6b4312d00; later channels vary its low byte. The matching consumer at 0x6c7ac0 loads the same value, and its diagnostic identifies `huiid::Mixer::Ch<0>::fader()`. Thus:

    channel_fader[g] = (packet[10+g] << 2) | ((packet[14] >> (6-2*g)) & 3)

Likewise packet+61 goes to 0x2153e80 and pointers 648, 704, 760, 816. Constructor-relative +0x278 maps to outer+648 and registration value 0x02b270af0dbaba00. The matching consumer at 0x6c792c and diagnostic at 0x25d54d8 identify `Ch<0>::color()`:

    channel_color[g] = (packet[61+g] << 2) | ((packet[65] >> (6-2*g)) & 3)

The shared low-byte channel-index pattern and explicit four-pointer dispatch establish four channels in each region. Values remain raw; no attenuation curve, Color FX transfer function, or live response has been validated.

The inspector now exposes both arrays. Six synthetic tests pass, including distinct fader/Color vectors that leave the trim/EQ groups zero. Evidence: az-mixer-rx-region10.asm, az-mixer-channel-extras.asm, constructor and consumer artifacts above. The exploratory filename az-mixer-fader-region.asm actually covers the unrelated region+31 button helper; do not treat its name as evidence of fader semantics.

## Channel cue button bits

Packet+20 is passed to helper 0x21540e0. Instructions 0x215422c–0x2154288 extract its byte-zero bits 3, 2, 1, 0 into dispatcher pointers 656, 712, 768, 824 respectively. These pointers are initialized at constructor-helper +0x280 and 56-byte strides (outer dispatcher adds 16). Their registration values are 0x0000085abad35000 + channel index. The consumer at 0x6c79f8 builds the same channel-zero value, calls the button-link helper 0x6c5080, and its failure diagnostic names `linkToObserver<IHuiButton> (huiid::Mixer::Ch<0>::cue(), this)`.

Therefore internal channels 0–3 have raw cue bits:

    cue_bit[g] = (packet[20] >> (3-g)) & 1

No inversion occurs in this extraction. That does not yet establish electrical pressed/released polarity, whether the later adapter toggles cue state, or that headphones receive audio. Helper 0x2147bf0 dispatches through the control's callback and observer machinery; it is not itself evidence of an audio-route change.

Decoder field `channel_cue_bits_raw` preserves this distinction. Seven synthetic tests pass, including one-hot channel bit ordering while all unrelated upper bits are set. Evidence: az-mixer-cue-candidates.asm, az-button-dispatch-entry.asm, constructor and consumer maps.

## Default knob/slider conversion — executed original code

Primary adapter vtable 0x2e63960 points to conversion at 0x21ee490 and range getter 0x21edc30. The conversion loads the event's unsigned 32-bit raw value at +8, converts to float, divides by adapter integer max at +12, multiplies by float scale at +16, then clamps to its range. With the observed constructor parameters max=1023 and scale=1.0, the range is [0,1]. This is input normalization, not the downstream audio transfer function.

An isolated ARM64 harness (`probe-slider-adapter.c`) maps the original code page at its original virtual address, constructs the observed default adapter layout and invokes the original conversion instructions under qemu-aarch64-static. It uses the original range-getter address in the vtable, selecting the code's inlined default path. No stock boot scripts, devices, cabinet data, UI or player threads are involved.

Executed raw values 0 through 1024 inclusive: 1,025 results, zero differences from float32(min(raw/1023,1.0)) at the printed precision (5e-10 absolute tolerance). Raw 511 becomes 0.499511242; 512 becomes 0.500488758; 1023 and 1024 both become 1. Thus there is no exact 0.5 value at the two central integer samples in this adapter. Any center detent/deadband downstream is not established here.

Evidence: az-slider-adapter-convert.asm, az-slider-adapter-execution.csv/json, probe-slider-adapter.c. Extracted firmware code page and compiled harness remain under private/. This test verifies original adapter execution, not full control dispatch, audio output, or subclasses with overridden ranges.

### Reproduce the original-code check

A portable runner now performs hash validation, ELF code-page extraction, static cross-compilation, bounded QEMU execution and numerical verification:

    python runtime-lab/analysis/run-slider-probe.py /path/to/EP147 \
      --cc /path/to/aarch64-linux-gnu-gcc \
      --output /path/to/results.json

`--qemu` can override the qemu-aarch64-static executable. Temporary firmware bytes and executable are deleted on exit; retained outputs are numeric CSV and JSON. The exact analyzed firmware SHA-256 is required because function addresses/layouts are version-specific. A fresh run produced 1,025 matches; an empty/wrong firmware test was rejected before compilation or report creation. Evidence: az-slider-reproducible-check.json/csv. This runner does not need cabinet material, network access or the Pi.

## Crossfader input resolved

The final value in packet+10 helper 0x2153c48 uses bytes 15 and 16 and dispatches to full-object pointer +296 (0x128). Constructor helper 0x21574b0 saves its +0x118 pointer in x26 at 0x215780c; at 0x2157cd0 it initializes that pointer with ID 0x00229b0c0c98ac94. Adding the outer +16 proves the destination match. Consumer 0x6c5e8c builds the same ID and its failure diagnostic at 0x25d4b40 explicitly names `linkToObserver<IHuiSlider> (huiid::Mixer::crossFader(), this)`.

    crossfader_raw = (packet[15] << 2) | (packet[16] & 3)

The inspector now decodes this value. Eight tests pass, with an exhaustive synthetic sweep of all 1,024 crossfader values while unrelated high bits of byte 16 are set. This establishes input identity and packing, not left/right audio assignment or crossfader curve.

Evidence: az-mixer-rx-region10.asm, constructor at 0x2157cd0, az-crossfader-id-xrefs.json, az-crossfader-consumer.asm. Crossfader assignment switches and audio attenuation law remain separate tasks.

## Transmit checksum differs from receive layout

The successful transmit builder path at 0x215c1ac constructs a RawArrayRef of length 104 and passes it to 0x215a098, storing the returned 16-bit checksum at packet+104. The helper uses the same 0x8408 reflected table, initial 0xffff and final complement as receive. Thus TX protects bytes 0–103 and stores CRC little-endian at 104–105, whereas RX protects 0–95 and stores at 96–97. Both builder buffers are 128 bytes; this does not establish the physical transaction size.

The read-only packet inspector supports `--direction tx` (default rx). Nine tests pass, including mutation of every protected TX byte and checksum byte and mutation of the unprotected tail. These are synthetic checks, not a real TX capture or execution of the original TX helper.

TX builder helper regions include packet+4 to 0x215a2f8, packet+24 to 0x215a4a0, and packet+36 to 0x215bd78 then 0x215be38. Packet bytes 16–18 copy three bytes from a shared state object. Their semantic names remain unresolved; do not label the packet an audio-DSP command stream solely from its class name.

Evidence: az-mixer-tx-body.asm and az-mixer-tx-crc.asm. Next identify helper field ownership and actual transport loop.

## Outgoing four-record blocks and update flags

Both helpers at 0x215bd78 and 0x215be38 receive packet+36. They access four source-state objects at shared-state offsets 32, 184, 336, 488 (152-byte stride). The semantic record names are still unknown.

First helper calls 0x2130940 for each state. It writes a 32-bit value at absolute packet offsets 88, 92, 96, 100 when the returned availability byte is nonzero. Byte 39 bits 0–3 encode that availability. Getter 0x2130940 checks an internal flag at state+80 and clears it at 0x21309b4 when consuming its value. This supports treating those bits as pending-update indicators rather than continuous knob/button states; synchronization failure can also produce no value. A receiver must not assume a zero payload means an explicit zero update when the corresponding bit is clear.

Second helper calls 0x21309d0 and uses byte 39 bits 4–7 as availability for four 12-byte records at offsets 40, 52, 64, 76. Each record contains three little-endian 32-bit words. The middle word is derived from a float using one multiply by 100 followed by fused multiply-add with another factor 100 and +0.5, then unsigned conversion. The third word comes from a single byte, widened into a 32-bit store. Exact units and record identities are not established. Do not name them BPM, timing, effects or DSP gains based only on this scaling.

These are conditional outgoing records, not raw incoming control samples. No transmit injection implemented. Evidence: az-mixer-tx-region36.asm and az-mixer-tx-state-getters.asm. Next trace state writers and their RTTI/diagnostics to identify the records.

### Conditional record inspection

The TX inspector now emits `unnamed_word_updates` and `unnamed_record_updates`, using null when the corresponding availability bit is clear. This preserves the distinction between absent updates and present zero values. All 256 availability masks are tested against distinct little-endian values in all eight slots; ten tests pass overall. No semantic names have been inferred from the numeric values.

Direct-call scanning confirms 0x2130940 and 0x21309d0 are called only by the respective four TX builder sites in the analyzed executable's direct BL instructions. This does not exclude indirect calls. Neighboring variant-dispatch code is preserved in az-tx-state-neighbors.asm but does not yet identify the outgoing record types.

## Outgoing record source class identified

The shared-state constructor writes vtable 0x2e422e8 to four objects beginning at offsets 32, 184, 336, 488. The loop at 0x2130c38 advances 0x98 bytes and stops at shared-state+0x280. These are precisely the four objects read by TX helpers 0x215bd78/0x215be38. Validated RTTI identifies this table as `device_adapter::mixer::PlayerInfoReciever` (spelling preserved), derived from `IPlayerInfoReciever`.

This ties the conditional outgoing records to player information supplied to the mixer. It does not yet identify each numeric field or establish a four-channel audio DSP pipeline. The class has four small virtual methods at 0x2134680, 0x2134650, 0x2134620, 0x21345f0 that atomically OR 1, 2, 4, 8 respectively into its byte +8. These notification flags are separate from the serialized byte-39 availability flags; no one-to-one equivalence is assumed.

Evidence: playerinfo-xrefs.py, az-playerinfo-xrefs.json, az-playerinfo-constructor.asm, az-playerinfo-setters.asm, xdjaz-inheritance.json. The constructor artifact begins mid-function at 0x2130c00; it is not a proven entry address. Its empty direct-call result is therefore not meaningful as a constructor-call inventory. Next identify virtual methods at 0x21305c0 and 0x2130548 and incoming listener bindings.

## Player-information update storage

Virtual setter 0x2130548 writes an incoming 32-bit field at input+0 to receiver+88 and an incoming 64-bit field at input+8 to receiver+96. It sets pending byte +80 if necessary and overwrites the same storage when already pending. Together with getter 0x2130940 clearing +80 after retrieval, this establishes a latest-value slot: multiple writes before consumption replace earlier values rather than queueing each event. The TX word builder serializes only the low 32 bits of the second field (receiver+96); do not assume the first field at +88 is transmitted in that packet slot.

Virtual setter 0x21305c0 similarly stores a 13-byte logical record at receiver+16 through +28 and sets byte +12. Named fields remain unknown; observed input members are a 32-bit word at +0, byte +4, 32-bit word at +8 and byte +12. Its getter 0x21309d0 has additional merge/optional-value behavior, so it must not be substituted with the simpler word getter's consume-on-read model without further tracing.

Neither setter has direct BL callers in the analyzed scan; both are present in the validated virtual table. This motivates following interface bindings/indirect callsites, not treating them as unused code.

Evidence: az-playerinfo-data-setters.asm, az-playerinfo-record-consume.asm, callers-2130548.json, callers-21305c0.json. Practical implication: replaying every historical value through the mixer would not match the observed coalescing behavior of the first slot.

## Mixer player-info accessor and channel bound

The primary Mixer vtable at 0x2e42208 contains the accessor at byte offset 56 (slot 7): 0x21301e8. Its own diagnostic at 0x2e41818 names `Mixer::playerInfoReciever(int)`. The normal path returns `this + 32 + index*152`. Its unsigned comparison with 3 sends both negative indices and values above 3 to the diagnostic path. This independently confirms the four-object layout and gives the virtual call offset needed to find listener setup.

Direct BL scanning found no callers of this accessor, so the next useful search is indirect calls through IMixer slot 7 or devirtualization comparisons against its address. Do not keep searching direct-call lists as if an empty result meant the feature is unused. The first exploratory artifact az-mixer-playerinfo-accessor.asm starts at 0x2130088 and is not this accessor; the verified body is in az-mixer-indexed-accessors.asm.

Evidence: az-mixer-indexed-accessors.asm, callers-21301e8.json, validated Mixer primary vtable and code-referenced diagnostic. No new runtime behavior has been claimed.

## Binding-search result and adjacent callback disambiguation

Address-materialization search for playerInfoReciever accessor 0x21301e8 found no direct ADRP+ADD candidates. This scan is heuristic (eight-instruction window) and cannot rule out all references. Together with the empty direct-BL result, it favors tracing IMixer virtual calls rather than repeating direct searches.

The adjacent function 0x2130650 is **not** a PlayerInfoReciever setter. Its pointer occurs in Mixer secondary vtable 0x2e422c0 slot 2; RTTI identifies that secondary base as IHuiButtonObserver at outer offset 8. The callback recognizes IDs 0x685fe879a480e800 and 0x685fe879a480e801, storing the event byte at incoming-object +15 or +16 respectively (full Mixer +23/+24). Other IDs return without a write. Control names are unresolved. This prevents conflating nearby button handling with the player-information record pipeline.

Evidence: az-playerinfo-accessor-xrefs.json (empty candidate list), az-playerinfo-binding-candidate.asm, validated Mixer secondary table. The artifact name reflects the original search hypothesis, not a verified player-info binding.

## Adjacent observer IDs resolved: deck Shift

The two previously unnamed IDs are deck Shift buttons, not mixer-specific physical buttons. At 0x6cd12c the ID 0x685fe879a480e800 is linked with diagnostic `helper::linkToObserver<IHuiButton> (IdStruct::shift(), this)` in `HuiEventHandler::linkToDeckHui<Deck<0>>()`. At 0x6cf9b4 the corresponding ...e801 ID uses the same shift diagnostic in Deck<1>. The control-specific diagnostic is at 0x25d4658 and enclosing-function diagnostics at 0x25d3ec0/0x25d3f28.

Mixer caches these two incoming Shift states at full-object +23/+24. Method 0x2130040 performs the same ID comparisons/stores from the primary-object pointer; 0x2130650 performs them via the secondary +8 interface, which explains its +15/+16 stores. Neither is a query despite the exploratory artifact filename az-mixer-shift-query.asm. This is an actual input dependency of mixer behavior, but which operations consult it still needs tracing.

Evidence: az-mixer-button-id-xrefs.json, az-mixer-button-consumer0.asm, az-mixer-button-consumer1.asm, az-mixer-shift-query.asm. Index 0/1 refers to internal deck-side Shift controls; do not infer four independent Shift controls from the four audio channels.

## Shift state forwarded to the hardware mixer

TX helper 0x215a4a0 is called with packet+24. At 0x215a4bc it loads shared Mixer byte +23 and packs its low bit into destination bit 1. At 0x215a4e4 it loads Mixer+24 and packs its low bit into destination bit 0. Therefore packet byte 24 carries Deck<0> Shift in bit 1 and Deck<1> Shift in bit 0. This completes the observed path from named input registration through Mixer cache to outgoing mixer-control packet.

The TX inspector now exposes `deck_shift_bits_raw`; eleven tests pass including all four Shift combinations with unrelated upper bits set. This establishes forwarding, not what action the physical mixer performs with these modifiers. No in-process Shift-dependent DSP behavior was established by the local Mixer code search.

Evidence: az-mixer-tx-field-helpers.asm 0x215a4a0 onward; az-mixer-tx-body.asm packet+24 call; preceding named Shift consumer and callback evidence. Next trace other fields in this same outgoing region and the mixer-side interpretation when available.

## Outgoing region includes LED state

The field builder beginning at 0x215a4a0 reads object pointers from TxDataBuilder+80, +72, +64 after packing Shift. For the first two it compares virtual slot 3 to 0x214c190 and follows an inlined default path when equal. Validated RTTI/vtable lookup identifies that method in `meow::HuiLed` primary table 0x2e63640. Thus these field sources are LED objects, not evidence of EQ coefficients or audio gains.

For the +80 source, the low byte of slot-5 result must be 0–2; lookup table 0x2e4a548 maps it into bits 0–1 of destination+2 (absolute packet byte 26). The +72 source uses the same lookup for bits 2–3. Other source fields and exact light identities remain unresolved. Keep enum values unnamed until the registration and LED implementation are traced.

Evidence: az-mixer-tx-field-helpers.asm, validated HuiLed vtable; az-tx-field-object-construction.asm begins construction of outgoing UI objects but has not yet tied each pointer to a named light. This changes the next action: identify the LED registrations before assigning meaning to packet byte 26.

## First two outgoing LED identities: registration route

TX constructor passes `this+8` to helper 0x215e160 (not +16 as in the RX constructor). Helper-relative pointer +72 therefore maps to TX builder+80, and helper-relative +64 maps to TX builder+72.

- TX+80 / packet byte 26 bits 0–1: registration 0x01dd13c6e4639cdd; constructed at 0x215e994 onward; consumer at 0x20426a8 requests selector 8 from a provider and stores the resulting wrapper at owner+88.
- TX+72 / packet byte 26 bits 2–3: registration 0x005ac673002904dd; constructed at 0x215e8dc onward; consumer begins at 0x204271c.

The three-state lookup table is the identity mapping [0,1,2]. Physical light names and enum meanings remain unknown. These registration-to-packet connections are validated by matching constant construction and pointer offsets; the broader MOVZ/MOVK scan remains a candidate generator, not proof for unrelated hits.

Evidence: az-tx-led-construction.asm, az-tx-builder-xrefs.json, az-led-id-xrefs.json, az-led-consumers.asm. Next follow the consumer's provider selector definitions to name the lights.

## LED provider identified and lookup semantics

The direct caller at 0x20eb790 passes an object constructed by 0x207e1f8 as the provider to 0x2043928. The constructor installs primary vtable 0x2e13fd8, validated by RTTI as `indicator_control::IndicatorControl`, derived from `IIndicatorControl` and `meow::TaskDrivenThreadWithTimer`. The constructor's thread label is `IndicatorCtrl` at 0x2e14908. This is a concrete constructor-to-interface connection, not an inference from nearby symbols.

Provider slot 0 is 0x207af98. It searches the pointer collection at object+752/+760 for a group whose byte +32 matches the low byte of argument w3. It then searches that group's collection at +8/+16 for an indicator whose 32-bit field +104 equals selector w1. It returns the matching pointer, or null if either lookup fails. These calls pass w3=-1, so the group match is 255. Argument w2 is overwritten before use in this implementation.

The second LED registration 0x005ac673002904dd requests selector **7** at 0x2042740 and stores its wrapper at owner+96; the first remains selector **8**, wrapper owner+88. Do not infer sequential selector numbering from the order of registration. These are IDs searched in indicator objects, not direct array indices. Physical light names and enum meanings remain unresolved; the next route is to identify construction of the matching group and indicator objects, particularly their field +104.

Evidence: az-led-factory-caller.asm, az-led-provider-constructor.asm, az-indicator-selector.asm, az-led-consumers.asm, xdjaz-inheritance.json. Static evidence only; no hardware light behavior has been tested.

## Indicator group is the browser controller

Population function 0x207d6c0 constructs a 64-byte object with 0x205a568 and inserts it into IndicatorControl's group collection at +752. That constructor writes group byte +32=255 and vtable 0x2e0ce30, validated as `indicator_control::browser::IndicatorController`. Its loop creates exactly eleven 112-byte indicator objects with selector IDs 0–10 at +104. Their installed table 0x2e0ce60 is `IndicatorWithIdentifier<indicator_control::browser::IndicatorKind>`.

This connects the previously traced TX byte 26 fields to the browser indicator group. It does not yet identify physical button labels. Although the provider searches by selector, this particular constructor inserts sequential IDs, allowing its subsequent direct vector loads to be tied to selectors: +56 selects 7 and +64 selects 8.

At 0x205ab00 selector 7 is passed into helper constructor 0x204d570 at 0x205abe8, alongside a source pointer x19+24. Selector 8 is loaded at 0x205ac90 and passed into the same constructor at 0x205ad78 with source x19+32. The source object x19 requires continued tracing before assigning GUI field names. Both registrations compute the same hash from the string suffix at 0x2e0da87 (inside `UI->GuiIndicator`) and appended characters; no claim about hash semantics is needed to establish the distinct source addresses.

Evidence: az-indicator-populate.asm, az-indicator-default-group.asm, az-indicator-global-bindings.asm, and validated RTTI in xdjaz-inheritance.json. Next inspect the source object constructor and field semantics, then the helper's subscription behavior.

## Browser indicator names resolved: TagListView and PlaylistView

The x19 source base in the preceding section is the static global address 0x3baf668, materialized at 0x205a900/0x205a908. It is not an instance pointer returned by 0x2057bb8. Global initialization at 0x65fec8 constructs string-like values:

| Global address | Initializer call | Literal address | View name | Indicator selector | TX field |
|---|---|---|---|---|---|
| 0x3baf680 (+24) | 0x65ff54 | 0x298dc20 | TagListView | 7 | byte 26 bits 2–3 |
| 0x3baf688 (+32) | 0x65ff78 | 0x298dc30 | PlaylistView | 8 | byte 26 bits 0–1 |

These stored view-name values are copied by binding helper 0x204d570 through 0x230e3e0, then passed as a one-element collection into 0x204d260. Thus the preceding description of them as distinct GUI state sources was too broad: they are view-name binding inputs. The precise active-view matching and state-to-light behavior still require tracing 0x204d260 and its updater callback. Do not yet assign enum 0/1/2 to off/on/blink or claim a physical button test.

The full verified static route is named view string -> browser selector -> HUI LED registration -> TX packed field. This is useful for browser indicator emulation and establishes that these two fields are unrelated to mixer DSP coefficients.

Evidence: az-browser-source-global-init.asm; az-browser-source-global-xrefs.json (candidates manually checked); az-browser-indicator-binding-helper.asm; earlier constructor, provider lookup, HUI registration and TX builder artifacts. az-browser-gui-source-constructor.asm is an exploratory updater constructor, not the global string initializer; its base table identifies IndicatorUpdaterBase.

## BrowserMode state selection traced

The view-name binding constructor 0x204d260 installs vtable 0x2e0a438, whose RTTI names `indicator_control::browser::BrowserMode`. Its first virtual method is 0x204c7b8. On the path with a resolved provider at updater+72, that method fetches a current value through provider slot 2 and flags through slot 5. It compares the returned 64-bit name representation against each entry in the configured collection at updater+40/+48. A match selects state **2**. Without a match, an overlap between provider flags and updater byte +64 also selects 2; otherwise it selects **1**.

Both paths submit that integer through 0x207a1e8 to the associated indicator pointer at updater+8. The submit helper locks the indicator mutex when threading is enabled and writes the supplied integer to indicator+56, together with default ancillary state. Thus these are internal indicator states, not merely branch-local values. Their translation to the HuiLed enum and physical brightness/blink behavior remains unverified; do not equate internal state 2 directly with TX enum 2.

The absent-provider branch beginning 0x204c93c attempts additional resolution and is outside this established normal-path rule. Also, 0x204d6f8 is vector insertion/growth for the view-name collection, not the updater callback despite the exploratory filename az-view-indicator-update.asm.

Evidence: az-view-indicator-updater-constructor.asm, az-browser-mode-callback.asm, az-indicator-state-submit.asm, validated BrowserMode RTTI. Next trace indicator+56 consumption and the resulting HuiLed values, or probe this normal-path decision with controlled inputs.

## IndicatorConnector output conversion

Wrapper helper 0x20422f8 allocates 40 bytes and calls 0x20213f0. Its installed vtable 0x2dffbb8 is validated as `hui::IndicatorConnector`, derived from `meow::IHuiLedIndicationSource`. The constructor stores the HUI registration ID at +16 and the indicator pointer at +24. It finds the registered HUI LED, checks its slot-3 result against 1 to initialize connector byte +32, and registers the connector through LED slot 6.

Indication-source callback 0x2021258 loads that indicator pointer atomically, obtains packed state through indicator slot 3, and an additional low-byte value through slot 4. For a non-null indicator, its low output byte maps state 1 to 1, state 2 to 2, and other states to 0. Ancillary color bytes depend on connector+32 and the packed state's color bytes; there is a separate null-indicator fallback. This establishes conversion to the indication-source result, not yet every step of HuiLed's subsequent processing or physical on/off/blink semantics.

The actual browser indicator slot-3 getter is 0x2079ac8. It reads stored state at +56 and ancillary bytes +60..62 under mutex protection, but also consults objects at +64 and +88 through helper 0x204b550. Therefore the stored browser state is only the base input: override behavior must be understood before assuming the getter always returns it unchanged. No claim of a steady output at every instant is established.

Evidence: az-led-wrapper-constructor.asm, az-led-adapter-constructor.asm, az-led-indication-source.asm, az-indicator-state-getter.asm, validated IndicatorConnector and browser IndicatorWithIdentifier tables. Next examine overrides and HuiLed slot-5 processing; physical timing is still untested.

## Timed override mechanism and boundary behavior

Override predicate 0x204b550 returns true indefinitely when its duration field +8 is zero. Otherwise it reads `std::chrono::system_clock::now()`, subtracts start value +48, converts by signed division by 1,000,000, and returns `duration > elapsed`. Exactly at the duration boundary it returns false. The magic multiply/shift sequence was independently reconstructed with Python integers and checked against division on 10,011 signed boundary/seeded samples; zero mismatches. This is arithmetic validation, not execution of original firmware. The conversion is consistent with nanoseconds to milliseconds; the imported clock implementation's units have not been independently inspected.

State helper 0x204b438 computes signed `elapsed % period` using period at +0. It selects the state pointed to at +32 while the remainder is <= period/2 (signed division rounded toward zero), and the state at +40 when greater. Thus the exact midpoint belongs to the first phase. This is a two-phase timed pattern, not another browser-event callback. Period validity is not checked in this body; do not invent a positive-period guarantee without inspecting construction.

Getter 0x2079ac8 gives a live override at indicator+64 precedence, returning its pattern state and override color data. If that override is absent/expired, it checks +88 and can replace the base state using the same timed pattern helper. Expired objects are cleared during the getter. Therefore polling can change the returned state without a new browser event. Actual configured periods, LED on/off meanings, and applicability to the TagList/Playlist bindings remain open.

Evidence: az-indicator-override-predicate.asm, az-indicator-pattern-state.asm, az-indicator-state-getter.asm, az-indicator-clock-scaling-check.json. This explains a mechanism for timed indicator changes; it does not explain or measure waveform flicker.

## HUI LED cache and packet inspector integration

HuiLed slot 5, 0x21edba0, returns cached byte +48 as the low output byte; it does not invoke the indication source. Slot 7, 0x21f00d0, has a validated IndicatorConnector path: it calls source slot 2 then feeds the result into 0x21f0020. That helper writes the source low byte to HuiLed+48 and updates ancillary fields when changed. Optional processing through object+24 affects the ancillary word at +60, not the cached state byte. The final TX two-bit fields therefore reflect the cached indication state at packet-build time. Refresh cadence/order is not yet measured.

The inspector now reports `browser_indicator_states_raw` with PlaylistView from TX byte26 bits0–1 and TagListView from bits2–3. It preserves raw value 3 even though the observed builder lookup accepts only 0–2; decoding malformed data must not silently reinterpret it. Tests cover all 256 values of byte26, including unrelated upper bits; all 12 packet tests pass. These synthetic tests verify extraction, not device acceptance or physical on/off semantics.

Evidence: az-huiled-readout.asm, az-huiled-refresh.asm, az-huiled-cache-write.asm; az_mixer_packet.py and test_az_mixer_packet.py. Next determine refresh scheduling or test the complete cache-update path under controlled emulation.

## Original LED cache functions executed

`run-led-cache-probe.py` verifies the exact EP147 hash, extracts two executable pages into a temporary directory, compiles `probe-led-cache.c` statically for ARM64 and executes it under bounded QEMU. The harness calls the original 0x21f0020 cache writer and 0x21edba0 getter on a constructed object with no optional color adapter.

All 32 combinations passed: initial and target states 0–3, unchanged/changed ancillary color and metadata, followed by a repeated identical update for each case. Checked the stored state, getter low byte, ancillary fields and return value. State 3 is preserved by this cache layer even though the TX builder's downstream table admits 0–2. This confirms the distinction between cache behavior and packet-builder validation.

Evidence: az-led-cache-execution.json records firmware hash, case count and scope. Extracted firmware pages/executable are temporary; the harness contains no firmware bytes. This executes original instructions, unlike the earlier Python clock arithmetic check. It does not test the scheduler, optional color-adapter callback, player initialization or physical LEDs.

## Refresh ordering resolved: packet builder invokes it directly

The empty direct-BL and ADRP+ADD searches for 0x21f00d0 were expected: the relevant calls are virtual. Reinspection of TX helper 0x215a4a0 identifies the actual ordering on the normal LED-kind path:

- PlaylistView source TX+80: virtual slot7 call at 0x215a520, then slot5 readout at 0x215a530, followed by enum validation and packing at 0x215a544..568.
- TagListView source TX+72: virtual slot7 call at 0x215a594, then slot5 readout at 0x215a5a4, followed by enum validation and packing.

This corrects any impression from the preceding cache discussion that this TX path depends on a separate refresh thread. The getter is cached, but the builder refreshes synchronously immediately before reading each field. The slot7 return value is ignored. Consequently, if the refresh method takes one of its early-return paths without updating the cache, the builder can still read its previous value. The successful IndicatorConnector path recomputes the timed indicator state during packet construction.

There is no evidence here for a separate scheduling delay between these two calls. Packet production frequency, source resolution failures and browser updater scheduling remain unmeasured. This narrows timing investigation to those real boundaries. The kind-check diagnostic branches have not been used to infer alternate device behavior.

Evidence: az-mixer-tx-field-helpers.asm at the exact callsites above, az-huiled-refresh.asm and az-huiled-readout.asm. Search artifacts callers-21f00d0.json and az-huiled-refresh-xrefs.json remain negative heuristic results, not proof of absence of callers.

## Packet production is driven by HuiTimer

Validated RTTI identifies `meow::SubCpuCommunicator` as IHuiEventInterpreter at offset0 and HuiTimer at offset16. Primary vtable0x2e5ab68 slot4 points to 0x21c5340; the code-referenced diagnostic at 0x2e5abb8 names `SubCpuCommunicator::huiTimerCallback()`.

The callback calls builder object+64 slot2 with txBuffer at communicator+88. Diagnostic0x2e5b1e8 explicitly reads `builder->build (txBuffer)`. A nonzero low-byte build result leads to transport object+48 slot6 with that same buffer. Failure takes the diagnostic/error-device path instead of the normal transmit call. This is the generic communicator route; the mixer-specific constructor wiring must still be validated before assigning a particular timer interval to the mixer.

Startup helper0x21c55e0 calls transport slot4 then invokes 0x21f1920 on its HuiTimer subobject (+16), passing communicator's configured integer +104. Direct callers are0x2100bf8,0x2100e10,0x2102530. These are the next sites to inspect for mixer wiring and period selection. No packet frequency has yet been measured or inferred from GUI FPS.

Evidence: az-subcpu-communicator-methods.asm, az-subcpu-timer-start.asm, callers-21c55e0.json, validated inheritance and code-referenced diagnostics. The failed exploratory string-reader command was corrected before interpreting results; final diagnostic reads succeeded.

## Mixer communicator wiring and timer setting

Setup function0x21023c8 constructs configuration at sp+120. It assigns the device string `/dev/subucom_spi3.0` from0x2e33b50, copies the two 32-bit constants (1,3) from0x25e4e68 into config+8/+12, and stores128 at config+16. It constructs mixer TX builder through0x215c2d8 and RX dispatcher through0x2153b70, then passes their ownership holders into SubCpuCommunicator constructor0x21c5660 at0x21024e8. The result is stored at owner+56 and started at0x2102530.

Constructor0x21c5660 transfers RX into communicator+56 and TX into+64. It copies config+12 into communicator+104 at0x21c5710..5720. Startup subsequently supplies that field to HuiTimer start0x21f1920. Therefore the mixer communicator's configured timer value is **3**. The units and actual observed callback cadence still require verification; do not report a measured333Hz rate from this constant alone.

This is a concrete mixer-specific linkage, unlike the earlier generic communicator trace. It also identifies the expected transport node for a host emulation shim. Configuration+8=1 is passed into the transport initializer alongside config+16=128; its meaning remains unassigned.

Evidence: az-mixer-communicator-config.asm, az-subcpu-start-third.asm, az-subcpu-constructor.asm, az-subcpu-timer-start.asm; literal reads at0x25e4e68 and0x2e33b50. Next inspect HuiTimer's interval units and dispatch mechanism, then measure under the emulation harness.

## Mixer timer units verified: 3 milliseconds

HuiTimer registration helper0x21f09e0 inserts timers into a linked collection and sets pool+16 to clock0x231e850 plus the first timer's integer +8. Clock0x231e850 calls clock_gettime with clock ID1, reads timespec seconds/nanoseconds, and computes seconds*1000 + nanoseconds/1,000,000 in a32-bit result. Thus the timer interval uses milliseconds, and the previously traced mixer configuration requests **3ms** (nominally about333.3 callbacks/s if delivered without delay). This is not an observed packet rate or a real-time guarantee.

RTTI also identifies HuiTimerPool::CallTimersMessage; its table0x2e641e8 has callback slot2 at0x21fc620. The first two entries0x21f8520/8530 are destruction paths; the exploratory az-huitimer-message.asm did not yet inspect the message callback. Next follow0x21fc620 to determine overdue-timer and dispatch behavior rather than assuming a dedicated real-time timer thread.

Evidence: az-huitimer-registration.asm, az-huitimer-clock.asm, validated CallTimersMessage table, and preceding mixer configuration chain. Clock behavior near32-bit wrap and unusual clock adjustments has not been audited.

## Overdue timer dispatch coalesces missed intervals

CallTimersMessage callback0x21fc620 resolves the timer-pool singleton and tail-calls0x21f6a20. On its successful-lock path, dispatch first calls0x21f0960 to subtract elapsed clock milliseconds from each timer's remaining value at+8. It processes timers whose remaining value is <=0.

Before invoking a due timer,0x21f6ae0..6af4 replaces remaining+8 with the configured period+12, removes the timer, and reinserts it in sorted order. It then releases the shared lock and invokes timer virtual slot2 (the SubCpuCommunicator HuiTimer thunk reaches the packet callback). The loop reacquires the lock to inspect other due timers. It does not advance the old negative remainder by repeated periods or replay every missed tick in this pass. A3ms timer with remaining-27ms is reset to3ms, not invoked ten times to reproduce missed historical ticks.

This establishes normal-path missed-interval coalescing, not a measured jitter profile. Concurrent timer modifications, lock-contention retry/message behavior and32-bit clock wrap are separate paths still requiring inspection. The practical implication is that emulation stalls can lower actual packet frequency despite a3ms setting; reducing the interval alone does not guarantee responsiveness.

Evidence: az-huitimer-message-callback.asm, az-huitimer-dispatch.asm, az-huitimer-elapsed.asm, prior timer registration and communicator callback. No attribution to waveform flicker is made by this finding.

## Timer lock contention takes the message-posting route

The lock helpers have now been verified against imported pthread calls:0x232c0f0 calls pthread_mutex_trylock and returns true on success;0x232c0e0/110 wrap lock/unlock. Thus the alternate branch at0x21f6a48 is specifically a failed try-lock path, not a timer-disabled branch.

It loads the pool's message pointer at+32 and passes it to0x21f6040. That helper forwards to0x21fc270 when the message-manager singleton is present; its absent-manager path returns zero after reference handling. No due timer callback executes on this failed-lock branch. The caller ignores the posting return value. It also does not execute the successful dispatch tail that clears pool+24. Whether later scheduler work guarantees recovery after a posting failure remains unresolved.

This establishes deferred/message-route behavior under lock contention, not a guaranteed immediate retry, bounded queue, or lossless delivery guarantee. Queue insertion and ownership validation within0x21fc270 still need full inspection, as does the meaning and producer-side use of pool+24.

Evidence: az-timer-lock-methods.asm, az-huitimer-dispatch.asm, az-huitimer-retry-message.asm, az-hui-message-post.asm. No changes to thread priorities or lock implementation have been made.

## Pending-message gate and 300ms recovery threshold

Pool constructor0x21f17b0 allocates one CallTimersMessage, stores it at pool+32, and zeroes +24/+28. Producer0x21f6430 is called from the epoll loop at0x21f6704 after a nonnegative epoll_wait result. It validates the manager/thread context and attempts the shared mutex; failed try-lock returns without posting in this producer path (different from dispatch's failed-lock path).

When no message is pending and a timer is due, producer atomically changes pool+24 from0 to1, records `now_ms+300` at +28, releases the mutex, and posts the retained message through0x21f6040. Successful dispatch clears +24 as previously traced.

When +24 already equals1, producer skips normal due-timer posting until `now_ms > pool+28`. At exact deadline it still returns without retry. Beyond that deadline it posts the same retained message again. This retry branch does not update +28, so the observed code does **not** establish a once-per-300ms retry limit. Repeated producer passes can attempt reposting until pending clears; queue-side duplicate handling remains unverified.

This resolves the previously open recovery lead: there is an explicit retry mechanism, but it is not proof of eventual delivery or bounded queue growth. Actual epoll-loop cadence and queue insertion behavior remain the useful next measurements.

Evidence: az-huitimer-pool-construction.asm, az-huitimer-producer.asm, az-huitimer-dispatch.asm. The broader epoll-loop search was performed in /tmp/az-hui-region.asm; its callsite0x21f6704 should be preserved in a focused artifact before relying on that temporary file later.

## Message posting supports both queued and inline execution

Posting0x21fc270 asks its backend at manager+16 through virtual slot5. A true result calls0x21fc040 to allocate a40-byte task wrapper and then backend slot6 to submit it. The wrapper installs table0x2e64358, already validated as `AsyncTaskBoxBase::AsyncTask<HuiMessageManager::postMessage(HuiMessageBase*)::{lambda()#1}>`, and retains the message pointer at wrapper+24. There is no message-pointer duplicate lookup in this wrapper-allocation path; downstream backend submission still requires inspection before asserting duplicate queue behavior.

A false backend result instead validates the message and invokes message virtual slot2 directly at0x21fc4dc, followed by reference handling. Thus “posting” does not unconditionally mean deferred execution. The earlier contention description should be qualified accordingly: dispatch routes through the posting layer, whose active backend mode determines queued versus inline behavior. Do not infer actual recursive retry from this branch alone without proving the relevant backend predicate result.

The positive message reference count checked at0x21fc388 is not evidence of deduplication: with the expected ownership tag it increments the count at0x21fc500 and proceeds into the same posting logic. That distinction matters when evaluating retained CallTimersMessage retries.

Evidence: az-hui-message-enqueue.asm, az-hui-message-task-wrapper.asm, validated task-wrapper RTTI and prior posting entry artifact. Next establish backend concrete type and predicate semantics, then examine submission queue.

## Concrete HuiMessageThreadTaskBox always selects asynchronous posting

Validated table0x2e63f60 belongs to HuiMessageThreadTaskBox. Its slot5 is0x208d8f8, whose complete body is `mov w0,#1; ret`. Thus, when this concrete backend is installed, the postMessage predicate is always true and the inline branch is not selected. This remains conditional on proving the manager's installed backend; the generic interface permits other implementations.

Its slot6 submission method0x21f6230 validates the incoming task, then on a valid manager/context path allocates a40-byte object with table0x2e63f38 (`HuiMessageThreadTaskBox::AsyncMessage`). It stores the incoming task pointer at wrapper+32. This is a second wrapper layer after the40-byte AsyncTask allocated by0x21fc040. The allocations are observed structure sizes, not the full allocator footprint or a measured per-tick overhead. Submission can reject invalid tasks/context, so this is not a delivery guarantee.

Evidence: az-hui-taskbox-mode.asm, az-hui-taskbox-submit.asm and validated RTTI tables. Next identify actual manager backend installation and follow AsyncMessage submission/callback. This provides a concrete candidate for measuring allocation overhead once runtime instrumentation is in place.

## Task-box submission reposts through the manager; jog construction is a concrete user

Following the remainder of 0x21f6230 changes the interpretation of this candidate backend. At 0x21f6314..631c it passes AsyncMessage+24 and taskbox+40 to helper 0x21fa6a0 (helper semantics remain unverified). It then passes the newly allocated AsyncMessage to posting entry 0x21f6040 at 0x21f6324 and returns that result. It does not visibly insert into a queue in this method. Therefore this concrete task box cannot yet be treated as the manager's final queue backend: doing so would introduce an unexplained recursive posting chain. The earlier two-wrapper description is conditional, not evidence of two allocations on every mixer timer tick.

A table-materialization scan locates construction at 0x21f2190; instructions 0x21f21f4..2220 install HuiMessageThreadTaskBox table 0x2e63f60 and initialize its fields. A directly adjacent caller at 0x21f2294 constructs this task box at owner+8. The enclosing constructor later installs 0x2e63528 at 0x21f2314, validated by the RTTI map as meow::HuiJog (secondary IHuiJog at offset192). Thus at least one concrete user is a jog object's embedded task box, not a proven manager backend. Other callers and the actual manager backend assignment remain to be traced.

Evidence: az-hui-taskbox-submit-tail.asm, az-taskbox-construction.asm, az-taskbox-table-xrefs.json, taskbox-table-xrefs.py, xdjaz-inheritance.json. Scan results are candidates manually checked against instructions. No runtime queue latency, deduplication, or allocation-rate claim follows from this pass.

## Actual manager backend is AsyncTaskBox

The normal epoll-loop startup at 0x21f662c loads owner+408 and publishes it to singleton address 0x3bd6db8 at 0x21f6638. Owner setup allocates a32-byte manager, calls 0x21f2050 at 0x21f6c44, then stores it at owner+408. Manager constructor 0x21f2050 allocates a208-byte backend, calls 0x220c9d0 with w2=2048, and stores the returned object pointer at manager+16 (0x21f2104).

Backend constructor 0x220c9d0 installs table0x2e67ac8 at0x220ca58, validated as meow::AsyncTaskBox. This resolves the actual constructor chain and supersedes the earlier hypothetical HuiMessageThreadTaskBox backend. Runtime replacement has not been exhaustively excluded, but this is the explicit normal construction path used by the singleton.

The backend constructor's loop0x220ca70..caa8 allocates64-byte nodes. Counter x19 begins0; comparison precedes increment and branch, so argument2048 yields2049 allocations on this normal loop (131136 requested bytes, excluding allocator overhead). Nodes are linked using a48-bit pointer portion with a16-bit tag. Subsequent code removes a node from that list. This is observed preallocation, not yet proof of usable queue capacity, overflow policy, or freedom from subsequent allocation. Those require tracing AsyncTaskBox submission and consumption. Likewise the backend's slot5 predicate must be inspected independently; the jog task box's constant-true predicate does not establish this one's behavior.

Evidence: az-manager-construction.asm, az-manager-owner-install.asm, az-manager-global-install.asm, az-manager-backend-constructor.asm and validated inheritance map. No measured latency or rendering-speed improvement is claimed.

## Real queue mode is thread-sensitive; reserve exhaustion allocates

AsyncTaskBox table0x2e67ac8 slot5 is0x957408, not constant true. It calls0x232dc50 (a direct tail branch to pthread_self), compares the result with backend+48, and returns true only when different. Initialization0x21f0500 gets pthread_self at0x21f0554 and passes it to0x220a9d0; that helper stores the supplied identity at backend+48 (0x220aa10). Combined with the already traced postMessage branch, the registered thread uses inline message callback execution and other threads use queued tasks.

Normal epoll-loop startup calls that initializer before its loop; the timer producer is then called from the same loop. Consequently the normal same-thread producer posting follows the inline branch, absent later rebinding or other exceptional state. Earlier speculation about a task-wrapper allocation on every mixer timer tick does not apply to this normal path. This is a static control-flow conclusion, not a measured jitter result. Failed-lock retry from this thread also needs reentrancy analysis now that inline dispatch is established; do not assume it always waits in a queue.

Actual slot6 submission0x220c820 calls queue helper0x22122d0 with backend+56. The helper normally pops a node from its free list at queue+128 (backend+184). When that list's48-bit pointer is zero, branch0x2212444 allocates a new64-byte node via operator new and rejoins the enqueue path. Thus2048 is not demonstrated as a hard maximum: the code expands node storage when the reserve is exhausted. There is no duplicate-payload comparison in this helper; it stores the incoming task pointer in node+8 and links the node using atomic operations. Allocation failure behavior under the C++ runtime and overall memory limits are not audited.

Submission has a helper-false branch that calls0x2211550 then returns zero. The exploratory filename az-async-task-release.asm must not imply a destructor-only path:0x2211550 invokes task virtual slot0 before returning storage through the allocator. That failure branch therefore also needs exact callback semantics before calling it a dropped task. The complete exhaustion path above rejoins normal enqueue rather than directly returning false.

Evidence: az-async-queue-predicate.asm, az-thread-id-helper.asm, az-async-thread-bind.asm, az-manager-thread-initialize.asm, az-async-queue-submit.asm, az-async-queue-push.asm, az-async-task-release.asm. All findings are static instruction evidence; no FPS or latency benchmark was run in this pass.

## Event-loop ordering and queue-drain loop

The event loop passes timeout1 to epoll_wait at0x21f66e0..66ec. After a nonnegative result it checks due timers through0x21f6430, then validates the manager and calls0x21f0670 via0x21f693c, before proceeding into returned fd-event handling. The requested1ms epoll timeout is not a measured1ms scheduling guarantee.

Consumer entry0x21f0670 verifies manager/backend thread identity and pthread_self, then calls backend consumer0x2210050. Consumer pops a queued task with0x2212460 at0x22101d8. The normal valid-task path calls task virtual slot2 at0x221035c, cleans up via0x2211550, increments a processed counter, and branches back to the pop at0x221039c. That normal loop has no per-item count or elapsed-time stop check between callback and next pop; queue-empty exits the loop. Optional instrumentation branches and exceptional paths remain incompletely mapped.

This gives a concrete delay mechanism to measure: a long queued callback, or a sustained batch, can postpone the next outer-loop timer check and fd processing. It does not establish that this happens during waveform flicker, or that this HUI loop owns the waveform renderer. There is no justification yet for changing queue drain policy without runtime timing evidence.

The consumer distinguishes task execution (virtual slot2) from cleanup helper0x2211550's virtual slot0 plus allocator return. Earlier wording that warned against assuming destructor-only cleanup should not be read as proof of execution on enqueue failure: the observed execution slot is2, not0. Exact task destruction semantics should be validated using its concrete vtable before finalizing failure handling.

Evidence: az-manager-consumer-entry.asm, az-epoll-timer-queue-order.asm, az-epoll-consumer-call.asm, az-async-consume.asm and az-async-consume-tail.asm. Useful next instrumentation points: timer entry0x21f6430, queue drain0x2210050 entry/return and task callback0x221035c. Record durations and thread identity before attempting scheduling patches.

## Original queue instructions executed: FIFO, growth and node reuse

New hash-gated runner run-queue-probe.py extracts the original executable page0x2212000 into a temporary directory and invokes push0x22122d0/pop0x2212460 under qemu-aarch64-static. Probe source probe-queue.c constructs an empty queue with one sentinel and no free nodes. Only the push helper's operator-new call at0x221244c is redirected to a counted calloc adapter using a trampoline; queue operations otherwise execute original instructions. A non-fixed mmap hint is checked for the exact required address before executing, avoiding overwriting another mapping.

Three rounds each enqueue3000 payloads then dequeue3000. Payloads repeat in groups of three, exercising duplicate retention as well as ordering. All9000 pushes and9000 pops succeeded with exact FIFO results; empty checks succeeded before and after batches. Growth made3000 allocations during round1 and none during rounds2/3, demonstrating node recycling by pop. The constructed queue begins with zero spare nodes, unlike the real constructor's2048 reserve; this is an isolated functional test, not a full-runtime capacity measurement.

Evidence: az-queue-execution.json, run-queue-probe.py, probe-queue.c, az-async-queue-push.asm, az-async-queue-pop.asm. No concurrency, failed allocation, tag-wrap, timer jitter or rendering behavior was tested. The legacy cross compiler lacked MAP_FIXED_NOREPLACE; the initial build failure was resolved by using a checked address hint, and the final executable passed. Proprietary code pages and executable are temporary and are not embedded in the probe source.

## Concurrent original queue execution: four producers, one consumer

Added probe-queue-concurrent.c and run-queue-concurrent-probe.py using the same hash-checked original push/pop page and sole allocator-call redirection. Four pthread producers each send50000 unique sequence-labelled values while one consumer drains the queue. An atomic start gate overlaps producers; the allocator counter is atomic. Validation requires every producer's sequence to arrive exactly once and in order, all200000 total values to arrive, all producer threads to join, and a final empty result. It does not impose an artificial total order between unrelated producers.

The run passed:200000 pushes and pops, zero mismatches,7159 growth allocations. That allocation count depends on scheduling and is not a stable expected result. The test exceeds the65536 tag range in total operations, but does not deliberately orchestrate a stale observer across a full ABA-tag cycle and cannot prove general ABA safety. It also does not establish real-hardware memory ordering, bounded latency, or behavior with multiple concurrent consumers. The successful run narrows basic queue-loss/order concerns; the next performance question remains task durations and outer-loop scheduling in the actual player.

Evidence: az-queue-concurrent-execution.json and the two source-only probe files. Proprietary instruction bytes and executable remain temporary. The original single-thread FIFO/growth test is preserved unchanged.

## Running-player host-thread baseline: null audio dominates this harness

Executed two bounded20-second offline AZ probes with process/thread sampling. Both remained running through screenshot capture and were then terminated by the harness. In the null-ALSA run, JUCE ALSA consumed5.82 CPU seconds across6.077 observed seconds (~95.78% of one host core). HuiProcessor consumed0.30 seconds across7.088 seconds (~4.23%), with0.011173 seconds accumulated runqueue wait. The main QEMU thread averaged26.06% across19.107 seconds including startup.

Repeating with NULL_AUDIO unset (normal missing-audio-device harness) removed the JUCE ALSA thread from the sampled summary. HuiProcessor remained4.23% across7.087 seconds; the main thread was25.8% across19.107 seconds. This supports treating the high audio load as specific to the enabled dummy-audio path, not as a measurement of native Pi audio cost. The null sink has no physical audio clock; an unpaced loop is a plausible explanation, not proven solely by counters. No songs were playing, and startup occupied much of each capture; these are short host-QEMU baselines, not steady-state playback/FPS benchmarks.

Saved raw samples for both configurations and a reusable summarize-process-profile.py. It groups by PID/TID/start-time to avoid combining reused IDs, computes deltas over each observed lifetime, and reports scheduler runtime, runqueue wait, affinity and wait channel. It does not measure guest function durations. The lab should use a clocked audio device or explicitly paced diagnostic sink before drawing audio-performance conclusions from null-ALSA runs.

Evidence: az-null-audio-profile-raw.json, az-no-audio-profile-raw.json, az-source-thread-baseline.json, az-no-audio-thread-baseline.json, summarize-process-profile.py. No native Pi accessed or modified.

## Null audio transfer path observed directly

Added an opt-in AUDIO_TRACE build of the offline shim that intercepts and forwards PCM writei/writen/readi/readn/wait, logging only the first three and100000th calls. Original offline-midi build remains the default. In a bounded NULL_AUDIO=1 OFFLINE_MIDI=1 AUDIO_TRACE=1 run, readi and writei both reached100000 calls of64 frames, each logged result64. snd_pcm_wait also reached100000 calls, timeout2000 and result1. This is at least6.4million output frames in a roughly20-second launch, confirming an unpaced dummy path rather than normal real-time consumption. No sample-rate measurement is implied.

The run reported running=false before screenshot capture, unlike the preceding baseline runs. Its terminal status was not included by the original launcher and logs showed no explicit termination cause. Therefore this is transfer-path evidence, not a successful stability run. Updated launcher output to include process_returncode on future probes; no cause assigned to the premature exit yet. Pacing has not been implemented. Next capture actual configured rate and install a diagnostic clock only on the null sink's output handle, then compare load and stability.

Evidence: offline-audio-trace.c/.so (local diagnostic build), az-null-audio-transfer-trace.log and run-az-probe.py AUDIO_TRACE selection. No audio buffer contents, keys or credentials logged.

## Paced diagnostic null output reduces harness CPU

Added opt-in offline-audio-paced.c/.so. It records the successfully opened output PCM, obtains the accepted rate from snd_pcm_hw_params, and after successful writei/writen calls waits against an absolute CLOCK_MONOTONIC deadline advanced by accepted frames/rate. It paces output only; input still uses the null device. A stall beyond100ms resets the diagnostic deadline. The launcher requires both NULL_AUDIO and OFFLINE_MIDI when PACED_AUDIO is requested. Default shim behavior is unchanged. This is an isolated diagnostic sink, not a production ALSA driver, buffer-latency emulator, or audible mixer implementation.

A20-second run accepted44100Hz, stayed running through screenshot capture, and was then stopped by the harness. JUCE ALSA used0.34 CPU seconds over6.076 observed seconds (5.6% of one host core), versus95.78% in the earlier unpaced baseline. Its final wait channel was hrtimer_nanosleep. HuiProcessor was4.51%; main QEMU thread26.06% including startup. These short runs support attributing most of the prior idle audio CPU usage to the unpaced diagnostic sink. They do not establish native playback cost, sustained stability, or a fix to the earlier trace-only early exit.

Evidence: az-paced-audio-profile-raw.json, az-paced-audio-thread-baseline.json, az-paced-audio-transfer-trace.log, offline-audio-paced.c and run-az-probe.py. Next use paced output for deliberate local playback tests and guest callback timing. PCM reopen/reconfigure lifecycle and multi-output use are not covered by this minimal single-output harness.

## Actual outgoing mixer capture verified
Opt-in MIXER_TX_CAPTURE=1 (requires MIXER_FIXTURE) records only mixerfd ioctl0x40107000 payloads after header/length checks. ERP packets excluded. Maximum4096 frames (512KiB), private tmp file reset at launch, no network or hardware writes. Shim uses a nonblocking atomic capture lock; overlapping capture calls can be skipped, so this is not a lossless timing trace. Each frame incurs diagnostic file IO; do not use for performance measurements.

30sec probe PID58554 survived to scheduled teardown. All4096 captured128-byte frames pass independently reconstructed TX CRC over0..103 with stored104..105. Ten distinct frames; byte39 availability is0 in every frame, so no player-info update records were present in this idle capture. Browser indicator raw states changed0 to1; physical meaning remains unverified. Evidence analysis/az-mixer-tx-idle-capture.json and xdjaz/first-mixer-tx-idle.raw. This replaces synthetic-only checksum evidence with running-firmware TX evidence. Next capture during load/play with a later capture window to connect record changes to player state. Do not assume these are audio DSP commands.

## TX during deck1 load and playback
Raised opt-in capture ceiling to32768frames/4MiB to cover startup and manual navigation; remains diagnostic and unsuitable for timing benchmarks. PID60782 survived90sec then scheduled teardown. Saved25764frames, all CRC-valid, to xdjaz/first-mixer-tx-playing.raw. Reusable summarize-mixer-tx.py writes frame-indexed updates and byte-change counts; report az-mixer-tx-playing-capture.json.

Observed first record for all four slots starts[0xffffffff,10000,0]. Only deck1 was loaded. Its record changes to[0xffffffff,10000,6], then[15000,10000,6] when analysis/UI shows150BPM; play changes third field to3; end-of-track changes it to17. Word-update slot0 emits400 on24 occasions during playback, separated by roughly126..132captured packets. Other word slots stay absent. Cue attempt was after teardown and failed, so no cue-state meaning is verified.

Hypotheses, not final field names: first record word is BPM*100 with unknown sentinel0xffffffff; second is tempo ratio*10000 (matches static scaling and nominal1.0); third is a transport/state bitmask or enum; standalone400 word could be beat interval milliseconds (60000/150), with periodic emission consistent with beat events. Need second BPM and pitch change, plus callback/type evidence, before naming fields in parser. This narrows player-info roles but does not show DSP coefficients or effects implementation. Screenshots tx-loaded.png and source/browser readiness preserved.

## Native tempo injection verified
Opt-in DECK_FIXTURE=1 adds private group0/1 FIFOs for spi5/spi2;152-byte writes and independent configuration per mixer,ERP,and each deck. New send-deck-tempo.py encodes version1,position/reference10bit values and CRC0..37 at38. Group0 center512 then768 changed actual loaded deck1 UI to+5.10%,157.7BPM;256 later produced-5.15%,142.3BPM. Native converter hysteresis explains why the two magnitudes differ after sequential input. Screenshots xdjaz/tempo-positive.png and tempo-negative.png. PID71823 survived120sec until scheduled teardown. This validates full receive/observer/tempo UI path, not physical FLX6 or audio pitch quality.

TX record first word stays15000 as speed changes; second changes10000->10510 (speed ratio1.0510). Repeated word updates stay400 during accelerated playback, so prior possible interpretation as current beat period is rejected. It may represent source-grid interval; needs another base-BPM track to prove. Report az-mixer-tx-tempo-capture.json, private capture xdjaz/first-mixer-tx-tempo.raw. Next real-output pitch/duration measurement and other group/deck mapping, plus distinct base-BPM input for record semantics.

## Fader injection versus decoded output: first runtime comparison

Probe PID95124 loaded the generated 10-second 440Hz tone into deck1 and started native playback. `probe-fader-output.py` injected CRC-valid mixer packets with all four raw channel faders alternating 0,1023,0,1023, two seconds per state. Other packet fields were zero, matching the baseline load fixture. The script logged raw-capture frame offsets at enqueue and two seconds later; the analyzer excludes the first0.5sec and final0.25sec of each interval.

Deck1 stereo RMS across these intervals was approximately0.0323595,0.0323612,0.0323601,0.0323622; peak approximately0.0457623 throughout. Channels3–10 were exactly zero. There was no observed output attenuation at either raw extreme. This supports treating these ALSA channels as deck feeds requiring a separate master/cue mixer, but **does not prove that the injected fader values reached their final observers**: no dispatcher acknowledgement or readback was instrumented. Do not claim the native fader path verified merely from a successful FIFO write. Persisted Master Tempo settings may account for small sample differences from earlier tone captures; no effect-quality claim.

Evidence: `az-fader-output-events.json`, `az-fader-output-comparison.json`, `xdjaz/fader-loaded.png`, and archived `xdjaz/first-fader-output.f32le.gz`. Next discriminate ignored controls from intentionally pre-fader output using a traced observer callback, then build the separate mixer against the established deck channel layout.


## Native fader receive path observed under QEMU instruction tracing

The follow-up run PID99220 enabled opt-in `FADER_TRACE=1`, recording only the fader decoder and shared slider dispatch address ranges (plus QEMU bookkeeping). For each of four distinct control objects, entry0x2159560 has caller return address0x2153c80/ca4/cc8/cec and raw w2 sequence `[0,0,0,0,1023,0,1023]`. These are the three baseline/load packets followed by the four experiment states. Thus the earlier concern that the FIFO packets might simply never reach the native fader decoder is resolved for this run.

All four control objects are observed at0x215958c after their virtual adapter call and at0x215965c within the notification path. Channel0 is explicitly observed at0x21596f0, the basic block invoking notification virtual slot2 at0x2159704. QEMU TB chaining suppresses some repeated block-entry logs; per-address counts must not be treated as exhaustive callback counts, and absence of a block for another channel is not proof it never executes. Downstream observer identities and their effects are still unmapped.

Simultaneous captured output again stays approximately0.03236 RMS /0.0457623 peak on deck1 stereo at either extreme, with all other channels silent. This is stronger evidence for separate pre-fader deck feeds, not a guarantee about every mixer mode or physical hardware configuration. The trace is diagnostic and unsuitable for FPS/latency benchmarking.

Evidence: `az-fader-dispatch-trace.json`, `az-fader-output-comparison.json` (follow-up run), `az-fader-first-comparison.json` (original run), `xdjaz/fader-trace-loaded.png`, preserved `xdjaz/fader-dispatch.log.gz` and `xdjaz/fader-traced-output.f32le.gz`. Source tools: summarize-fader-dispatch.py, probe-fader-output.py, check-fader-output.py. Next map the notification receiver and implement software mixer routing; native fader input receipt is no longer the main uncertainty.


## First actual fader notification receiver: OnAirManager

Extended the trace to HuiSlider notification method0x21f4950. A60second idle probe PID103472 injected raw faders0,1023,0 without loading a track. For channel0, the virtual observer target captured in x22 at0x21f4a00 is0x101d2b0. The validated RTTI vtable database associates that slot2 target with `domain::onair::OnAirManager`, secondary address point0x281b0d8 and offset-to-top-824. Disassembly independently confirms the callback thunk subtracts0x338 (=824) and branches to0x101cd48. This is a runtime-linked receiver identity, stronger than merely finding the class name in strings.

The shared notification code also recognizes0x21f2ec0 as a special default target; RTTI maps that target to `meow::UiOperationDetector`. This default branch was identified statically, not observed for the fader in this run. Do not confuse it with the actual captured OnAirManager callback.

OnAirManager entry0x101cd48 copies callback arguments into a56-byte allocated message-like object, installs address point0x281b220, and dispatches via manager virtual slot6 at0x101ce80. The eventual task handler and on-air state rules remain to trace. No direct audio sample multiplication is visible in this entry path, but that alone does not exclude processing downstream.

Evidence: `az-fader-receivers.json`, map-fader-receivers.py, `az-slider-notify.asm`, `az-onair-slider-callback.asm`, `az-onair-slider-entry.asm`, private `xdjaz/fader-receivers.log.gz`. Only one receiver was positively resolved; TB chaining means this is not an exhaustive observer list. Probe survived to scheduled teardown. Previous simultaneous audio experiment remains the evidence that decoded deck output did not change with injected faders.


## Deferred fader task: exact latest-value cache behavior executed

Message address point0x281b220 has slot2=0x101b9d0. That function compares message+24 against the four known fader IDs0x02b1ffa6b4312d00..03. It reads manager pointer from message+32, checks signed channel-count at manager+848, then stores the32-bit payload from message+40 into the array pointer at manager+896, indexed0..3. An unknown ID or channel outside count returns without writing. The task itself does not apply a threshold, scaling or PCM gain; it stores raw payload bits, including non-finite float patterns. No claim is made that normal slider adapters emit such exceptional patterns.

`run-onair-cache-probe.py` hash-checks the supplied EP147, extracts its executable page via ELF program headers into a temporary directory, compiles `probe-onair-cache.c`, and runs original unpatched task instructions under QEMU.125 cases (counts0..4, four valid plus one unknown ID, five32-bit values) passed. Guards around the four-channel array stayed intact; task and manager storage stayed unchanged. This validates the bounded cache writer, not deferred scheduling, all invalid pointers/counts or the eventual on-air decision.

Report `az-onair-cache-execution.json`; disassembly in `az-onair-region.asm`0x101b9d0..0x101ba68. Next identify consumers of this cached array to obtain actual on-air threshold/combination rules. The previous expectation that the deferred task itself computes those rules is superseded by this direct code result.


## On-air state has a separate mixer listener input

Validated OnAirManager inheritance distinguishes `device_adapter::mixer::IChannelListener` at+816 from `IHuiSliderObserver` at+824. Mixer-listener vtable0x281b0b0 slot2 targets0x101e6d0, which subtracts816 and branches to0x101db38. That body takes channel index w1 and low-byte state w2, performs a thread check, and either queues a separate task or runs the local path. Local path0x101dd2c checks manager byte852 and channel count848, combines state with byte853 for one notification value, and at0x101ddf8..0x101de20 sets/clears the channel's cached bit at pointer+856 according to incoming state. No read of fader array+896 occurs in this local path.

Therefore searching this handler for a fader threshold was the wrong assumption: the manager accepts a separate channel-state notification from the mixer interface. This does not yet establish where that boolean originates, what physical settings bytes852/853 represent, or whether a different mode computes state from cached faders. Method0x101b950 updates byte853 and replays cached channel bits through virtual slot17 (0x101db38). The cache and enabled/gated notification state are distinct.

Evidence: `az-onair-input-paths.json`, validated inheritance/vtables, `az-onair-region.asm`. Next trace the mixer IChannelListener producer and its receive-packet field. Do not claim an on-air threshold recovered or complete on-air emulation from this static mapping.


## On-air receive bits mapped to Channel listener notifications

RX dispatcher0x2154730 retains the full packet pointer in x20. Instructions0x215485c..0x21548ac extract packet byte94 bits7,6,5,4 and call0x2132268 with channel indices0,1,2,3. Objects are Mixer+640,+736,+832,+928 (96-byte strides), matching accessor0x2130308 and Channel vtable0x2e42380. Constructor0x2130c70 initializes the first object with that vtable and channel index0; subsequent objects use indices1..3.

Helper0x2132268 caches initialized flag+88 and state+89; identical subsequent state returns early. First state or a change iterates listeners and invokes slot2 with `(channel_index, state)` at0x2132384 (ordinary raw-pointer variant). That matches the OnAirManager IChannelListener callback already mapped. Inspector now exposes `channel_onair_bits_raw` in internal channel order. This is a static end-to-end packet/notification map; live on-air UI/ProDJLink changes are not yet verified.

Important rejected lead: helper0x21315a0 has a similar+88/+89 cache but sends only one listener argument. Its direct caller0x2154650 uses Mixer+0x530 and packet+84 low two bits, so it is not the four-channel on-air path. `az-channel-state-callers.json` is the exploratory caller list for that rejected target, not evidence for on-air. This correction prevents conflating generic listener machinery across different mixer objects.

Evidence: az-mixer-rx-dispatch.asm0x215485c onward, az-mixer-channel-region.asm0x2132268 onward, accessor and constructor. Next inject bit94 states in the private runtime and trace actual OnAirManager callbacks before relying on visible on-air behavior.


## Four-channel on-air packet path verified in the running player

Bounded60second probe PID112809 used `ONAIR_TRACE=1` (mutually exclusive with other instruction traces; QEMU `nochain` avoids missing chained block entries). `send-mixer-onair.py` sent upper-nibble masks0,8,4,2,1,15,0 as byte94 values00,80,40,20,10,f0,00, with valid receive CRCs. The native Channel handler0x2132268 recorded all28 expected `(channel,state)` pairs in exact order. OnAirManager interface thunk0x101e6d0 received exactly18 calls: four initial states, then only actual state transitions. Repeated unchanged states were suppressed. Both comparisons in `az-onair-runtime.json` pass.

The full manager body0x101db38 also receives internal initialization/replay calls, so its total is intentionally not compared one-for-one against packets. Private SOURCE-stage probe did not load music or contact a network. This verifies packet decode, change filtering and delivery to the actual on-air manager, not UI colors, ProDJLink transmission or an audible mixer. The runtime survived until scheduled teardown.

Artifacts: `xdjaz/onair-dispatch.log.gz`, analysis/az-onair-runtime.json, source send-mixer-onair.py/check-onair-trace.py. The checker expects this particular seven-mask experiment; do not reuse its boolean verdict for arbitrary captures. An eventual software mixer can provide these native notifications, but must first choose and validate its own audibility rules; those are not recovered hardware DSP behavior.


## Native ON AIR badge responds to emulated mixer state

Probe PID115220 loaded LAB-TONE-440Hz.wav into deck1. With byte94=0 the native ON AIR badge was absent; byte94=0x80 made a red ON AIR badge appear at the top right of the deck1 track panel. This happened while paused at cue. Native play kept the badge visible (9.641sec remaining); clearing byte94 removed it while playback continued (8.982sec remaining). All four screenshots were visually inspected.

This completes the practical packet-to-visible-UI path for deck1 in this fixture. It also proves that this badge can be set independently of deck transport; it must not be used as evidence of actual audible master output. A software mixer must supply meaningful state rather than force all bits on. Other decks' callbacks are verified by the preceding trace, but their visible badges were not checked in this run.

Evidence: analysis/az-onair-ui-verification.json; xdjaz/onair-ui-off.png, onair-ui-on.png, onair-ui-playing-on.png, onair-ui-playing-off.png. Physical audio/mixing and ProDJLink transmission remain unverified.


## Separate software mixer: first original implementation

Added mixer/deck_mix.c/.h: four deck stereo feeds to master and pre-fader cue, channel gains, left/right/bypass crossfader assignment, independent master/headphone gains, cue/master blend. This is our original implementation with an equal-power crossfader, not recovered Pioneer coefficients or DSP. Processing has no allocation/I/O, but live transport and control smoothing remain absent.

Distinct stereo input values verify each deck and side, cue independence from a closed fader, auxiliary-channel exclusion, unclipped summation, gain/blend and crossfader endpoints/center. The offline renderer processed the preserved actual four-deck AZ capture (4796672frames,108.768seconds) with demo gains master0.25 and deck1 cue0.5. All output samples matched a separate scalar routing calculation exactly in this fixture; zero samples clipped. Same-tone deck capture does not replace a distinct-track end-to-end isolation test.

Artifacts: mixer/README.md, source kernel/test/renderer; xdjaz/mixed-master-cue.wav and mixed-master-cue.json. Four output channels are logical masterL/R/headphonesL/R, not yet mapped to FLX6 ALSA channels. No audible physical output, live latency, Pi performance, EQ or effects claim.


## Live AZ -> FIFO -> host mixer -> captured master/cue verified

Added opt-in MIX_STREAM launcher mode, mutually exclusive with AUDIO_CAPTURE. asound-stream.conf directs the original player's ten-channel PCM into private az-decks.fifo; a separately compiled host mix_stream.c applies the smoothed mixer kernel with fixed demo settings and writes four-channel float32LE output. No physical audio device is opened. Launcher owns and stops the mixer process and now exits its observation loop when the firmware process becomes terminal.

First attempt PID123903/guest123905 failed with SIGSEGV SI_USER on a Shutdown thread before loading music. The mixer received EOF and exited. The initial interpretation of normal ALSA reinitialization was unproven: the EOF could follow the crash. Crash record az-first-live-mixer-crash.txt contains unsymbolized context; no recent OOM event found and15GiB remained available when checked. Root cause remains unresolved. No core was exported. Reconnect support is independently verified by test_stream.py rather than claimed from that failed run.

Revised run PID127442 survived100seconds until scheduled teardown, and the host mixer exited0. Native deck1 load/play fed a9.999977sec active tone through the live FIFO. Interior frequency439.999985Hz. Headphone samples equal2*master exactly under configured0.5/0.25 gains; stereo differences are below1e-8. The complete final capture/report are preserved as xdjaz/first-live-mixed-output.f32le.gz and analysis/az-live-mixer-verification.json. Blocking FIFO/file I/O is still a diagnostic implementation, not a physical device backend or a real-time latency guarantee. Controls remain fixed in this bridge.

Source: mixer/mix_stream.c, mixer/test_stream.py, shims/asound-stream.conf, analysis/check-live-mix.py, run-az-probe.py. Next live control snapshots, physical-device channel routing, underrun/discontinuity accounting and Pi evaluation; EQ/effects still absent.

## Native browser input continuation

Expanded disassembly0x2154418..0x21545e8 resolves packet32 bits7..2 to dispatcher pointers120,144,152,160,168,176; packet33 bits0..7 to112,104,96,88,128,64,56,48. These are raw button routes, not inferred physical labels. Earlier verified load bits are part of this group. Full inventory: az-browser-input-layout.json.

Encoder bytes34/35 are sign-extended16-bit values. First packet caches baseline at dispatcher884 and sets initialized882, with no encoder submit. Subsequent packets subtract previous from current in32-bit arithmetic and pass delta plus packet31 bit0 to object pointer208 via0x21597a8. A signed-boundary transition therefore creates a large intermediate delta; downstream normalization remains unknown. Do not assume simple modular arithmetic reproduces the consumer.

Submit0x21597a8 calls virtual slot4 with converter pointer184, then dispatches pending12-byte records at160/count176 to listeners via virtual slot2. Records/listeners use copied collections and type checks. Exact target classes and physical flag meaning remain unresolved. Evidence az-browser-encoder-submit.asm; this is static tracing, not measured browser response.

az_browser_input.py accumulates relative steps into a private packet counter, preserves all other fields and recalculates RX CRC. It rejects unverified signed-boundary crossings. Test verifies preservation, signed steps, CRC and wrap rejection. Caller must send a baseline once at initialization and retain shared state; no physical input or native movement claim yet.

## Native browse movement verified

Run PID146367 with two generated10sec tracks,440Hz and660Hz. Initial sidebar-focused BROWSE showed no track-selection change from counters0→1(flag0),→2(flag1),→6(flag1). Clicking track1 established track-list focus; counter6→10(flag0) selected track2,10→9 selected track1,9→10 selected track2. Screenshots browse-counter-*.png inspected directly. Thus +/-1 counter steps cause native next/previous selection in the focused track list. The initial negative result is focus-dependent; flag1 semantics are still unknown. No native enter/back/view button established here. Evidence az-browser-live-verification.json. send-browser-counter.py is neutral diagnostic input and resets unrelated fields; production integration must use shared state.

## Named native navigation buttons

Constructor2153b78 passes dispatcher+16 to21574b0, which calls2155be0 with that same base. The latter registers button IDs in eight-byte slots through2144c18. Hence constructor-slot offsets must add16 to match the RX dispatcher offsets. Matching those IDs to validated materializations and failure diagnostics in midi_adapter::HuiEventHandler::linkToOtherHui gives:

- Back: packet33 bit7, ID009fc1f55209ac55; link6ca238..254, diagnostic25d5c08 explicitly IdStruct::back().
- Browse: packet32 bit6, ID0063bb660eeceeae; link6ca700..71c, diagnostic25d5d90 explicitly IdStruct::browse().
- Source32 bit7, TagTrack33 bit6, TrackFilter33 bit5, Shortcut33 bit4, TagList32 bit5, Playlist32 bit4 likewise named in adjacent diagnostic branches.

These resolve input names, not actual behavior in every UI context. Browse is a candidate for the FLX6 VIEW preference; Back behavior and entering the focused track list still need live verification. Artifacts: az-browser-named-buttons.json, az-browser-button-links-full.asm, az-browser-button-diagnostics.json, az-browser-button-ids.json. ID scanner output remains candidate references except links manually checked against MOV/MOVK/store/call/conditional failure paths. The constructor excerpt stops before all slots; do not call it an exhaustive inventory.

## Browse and Back live behavior

PID153456: packet32 bit6(Browse) from initial SOURCE opens browser with 'Please select a source'. Source button then pointer selection of local library opens USB browser. Browse while already browsing switches to WAVEFORM; another Browse returns to browser with sidebar focus. Thus this physical native control toggles views and does not guarantee track-list focus. Directly mapping FLX6 VIEW would violate the requested always-open-Browse behavior unless current page is known.

After pointer-established track-list focus(FOLDER heading), packet33 bit7(Back) returns to sidebar-focused BROWSE. Before/after screenshots inspected. This confirms Back in that context, not every modal/folder state. Source selection and track focus still use pointer; Enter and reliable page-state readback remain next. Evidence az-native-navigation-verification.json and native-back-*.png. send-browser-button.py preserves explicitly supplied counter but otherwise sends neutral diagnostic fields; not a shared production control state.

## Encoder flag continuation

Browser encoder slot at dispatcher208 is constructed by2156690 (via2157740 at embedded base192) using21f3e10, with final primary vtable2e63428. Its slot4 is21eedd0. Default converter vtable2e63400 is constructed inside21f3e10; adapter checks converter slot2 against21f7310 before its inlined path. On that path it reads raw delta and flag, compares flag against stored byte220, and returns only when delta is zero AND flag is unchanged. Changed flag alone therefore can generate a record; prior movement experiments with flag1 do not establish whether it represents an encoder press. Cumulative value stored216 adds incoming delta; flag stored220 updates before record construction. Need downstream record/observer semantics or a zero-delta flag pulse live test. Evidence az-browser-encoder-constructor.asm, az-rotary-constructor.asm, az-rotary-adapter.asm. No Enter identification claimed yet.

## Native encoder press and full source-to-load path verified

PID158999, no pointer input: packet31 bit0 pulse0→1→0 with unchanged counter0 moves USB1 focus to Local Library; second pulse selects local library, with expected transient OneLibrary warning; third pulse enters track list. Counter0→1 selects the second generated660Hz track. Deck1 load pulse with counter1 preserved loads LAB-TONE-660Hz.wav, confirmed name/duration/waveform screenshot. Thus bit31:0 functions as encoder press/Enter in these contexts. Activation edge (press versus release) was not isolated. This supersedes the earlier unknown-flag status, within tested contexts.

The old standalone load helper reset counter to0. Once scrolling is used, that can introduce a negative delta during load. Added --counter to preserve known counter; production still needs one shared packet state. Record az-native-enter-verification.json, screenshots encoder-*.png, pulse-browser-flag.py. View remains a toggle and needs state-aware handling for preferred FLX6 behavior.

## Persistent FLX6 navigation adapter

flx6_navigation.py reads saved BiteDJ XML bindings for encoder turn/press, Load1..4, Back and View. One packet state retains signed encoder count and held native bits across all messages; press+turn and load no longer reset counter. Unrelated bytes are preserved. The caller must send initial packet() to establish firmware baseline, and only this owner should write these navigation fields. It is a complete-message adapter, not raw MIDI/device transport.

View emits Browse only when caller explicitly reports browser_visible=False; Back emits native Back inside browser and Browse outside. Unknown visibility raises before state mutation; it cannot safely infer page from sent buttons because touchscreen/modal/native changes exist. Current-page readback is unfinished, so this does not claim a working production View adapter. Simultaneous View/Back holds sharing Browse bit retain it until both release.

test_flx6_navigation.py verifies saved XML addresses, held encoder plus turn, note-off release, four deck loads preserving count, untouched on-air/fader bytes, CRC, unknown-state rejection and preferred View/Back logic with supplied state. Live combined adapter/device test remains pending; previous live tests used diagnostic senders. Counter wrap still rejects, browse acceleration has not been ported, and device reconnect/pickup is unfinished.

## Candidate Browse page readback measured

PID164038,90sec normal launcher exit0: private TX capture25592 complete128-byte frames, all CRC104/105 match payload0..103. Visually checked stable pages sampled over30 consecutive frames each. TX byte26: SOURCE149(0x95), BROWSE101(0x65), WAVEFORM85(0x55), BROWSE return101, focused FOLDER101, TAG LIST89(0x59). Bytes24/25 remained0 and27 remained82. Thus byte26 bits4..5 are2 for BROWSE/FOLDER and1 for the other checked pages. This is a candidate Browse light/page indicator, not yet a universally validated browser_visible boolean. TagList's separately traced bits2..3 became2 as expected.

Artifacts: az-browser-tx-page-samples.jsonl, az-browser-page-field.json, xdjaz/browser-page-tx.raw.gz. Samples taken after tool-delivered screenshots confirmed each page; final post-TagList Browse screenshot missed scheduled teardown, so no claim for that last transition. No screenshots were saved for all intermediate samples; images were directly inspected during the run. Capture confirms correlation, not bit freshness at press time or modal coverage. Next statically link byte26 bits4..5 to named Browse indicator, then bounded fresh-frame readback and a live preferred-View round trip. Do not use the full capture file's existence as proof the producer is alive.

## Browse TX indicator static binding confirmed

TX helper215a4a0 receives packet+24. It loads LED pointer at TXobject64(215a5e0), obtains slot5 state, maps low enum0..2 through table2e4a548 and writes destination+2 bits4..5 at215a64c..650. Embedded constructor215e824..85c registers ID0195b2ef924ef657; stores its pointer at constructor-base56, matching enclosing TXbase64 (same+8 adjustment established for adjacent TagList/Playlist fields).

Consumer2042634..265c materializes this exact ID and requests browser group255 selector6. Indicator setup205a960 loads collection index6(+48) and passes it to204d260 at205aa4c, with a two-element view-name array copied from globals3baf670 and3baf678. Global3baf670 is explicitly initialized to BrowseView (literal298dc10) at65ff24. The second value at3baf678 remains unidentified. This is a BrowseView-containing group, not yet a claim that it matches only one UI page. The previously traced BrowserMode callback selects state2 when a configured name matches.

Decoder now exposes BrowseViewGroup raw bits4..5 without converting unknown/invalid states to a boolean. Existing exhaustive byte26 test extended; all13 packet tests pass. Runtime evidence remains six stable page samples from PID164038; transition freshness and second-name semantics remain open. Artifacts az-browse-led-binding.asm, az-browse-led-id-xrefs.json, existing indicator-global-bindings and source-global-init disassemblies.


## Browse group second identity and capture freshness

Resolved global3baf678: initializer65ffac forms x19+0x10;65ffb8/65ffbc loads literal298dc50, and65ffc0 initializes PcControlView. First global3baf670 is BrowseView. Thus selector6/LED0195b2ef924ef657/TX26 bits4..5 represents BOTH BrowseView and PcControlView. Earlier unresolved-second-name statements are superseded. Evidence: az-browser-source-init-tail.asm, direct ELF PT_LOAD string reads, az-browser-page-field.json. Do not wire raw state2 to universal browser_visible without handling PcControlView and modal contexts.

az_tx_freshness.py adds a diagnostic raw-group reader. It baselines existing/replaced/truncated files, requires two newly completed CRC-valid agreeing records, returns only known raw1/2, expires unchanged observations after250ms, and rejects missing/unknown/bad frames. Tests pass alongside13 packet decoder tests. This is capture-growth freshness, not a process-liveness guarantee: same-inode truncate-and-regrow between polls cannot always be detected; two samples do not establish settled UI after an input; bounded capture stops eventually. Production needs a session-bound streaming readback and separate page/mode identification. No live preferred-View claim yet.


## Combined XML navigation live test

PID174713: probe-flx6-navigation.py feeds complete FLX6 messages through Navigation into private mixer FIFO. View from explicit browser_visible=False opens BROWSE from WAVEFORM; repeated View with True emits no native toggle and stays BROWSE. Fresh TX group1→2→2 agrees, and saved flx6-nav-waveform/view-opens/view-repeat.png were visually checked. This verifies combined adapter behavior in the known local USB scenario, not automatic mode disambiguation or a physical controller. The initial screenshot labelled folder actually shows sidebar-focused BROWSE, and Back leaves it unchanged. Therefore the scripted Enter sequence did not establish focused FOLDER in this run; its assertions only checked group2, insufficient to verify focus. Record retains this limitation explicitly. Next investigate startup timing/focus before claiming full pointer-free adapter sequence.


## Real MP3 playback through host mixer

User requested any MP3 after Windows drive authentication blocked desktop access. Copied notorious_b.i.g._-_dead_wrong_acapella.mp3 from mounted FL/Samples into private USB fixture, original unchanged. ffprobe MP3 stereo44100Hz183.344042sec. PID179634300sec probe MIX_STREAM: touchscreen select and native deck1 load, ERP play. Screenshot loaded03:03.227/86BPM; later02:25.371/168.7BPM with populated overview. BPM was updated during analysis; initial value is not final tempo evidence. Five-second mixed capture window3595692..3816192 has masterRMS~.0366, cue~.0732, finite samples, exact2:1 cue/master ratio; no physical listening or full duration assertion. Saved JSON and UI preview.


## MP3 rendering cadence baseline

PID179634/bwrap, guest qemu179636, live MP3 at0% tempo; six-second60Hz X11 raw crop850x170+180+90 into framemd5,360frames.98 adjacent hash changes,16.33 changes/requestedsec. Gap histogram in60Hz sample units:3:68,4:13,5:1,6:11,7:4. Most~50ms with occasional100ms+ intervals. Capture and software rendering impose overhead; hash changes may include partial updates. This establishes sluggish visible updates in this run, not a definitive renderer FPS, scheduler cause, or Pi5 speed. qemu ps lifetimeCPU101%,RSS1733796KiB includes emulation; not PiRAM usage. Later screenshot01:15.638 remaining vs prior02:25.371 proves further playback advance. Need CPU/presentation profiling or controlled rendering configuration comparison.


## Host affinity lead

Live guest179636 has236threads; five-sec sample aggregate93.95%CPU, main44.48%, JUCE ALSA18.35%, FGPRKeyConMain9.77%. Main allowed14-17, ALSA18; shell parent0-19. lscpu shows0-11 paired cores max5.1GHz and12-19 unpaired max3.9GHz. No affinity code found in lab shim .c/.h search; origin still to trace. Initial temporary faster-core sample0changes invalid: screenshot confirmed completed track00:00. Marked invalid in JSON. Cue/replay produced240samples each: original14-17=76changes/4sec(19Hz), main0,2,4,6,8,10=99/4sec(24.75Hz). Restored original mask finally. Sequential segments and no repetitions; promising host scheduling/topology lead, not proven cause/fix or Pi projection. Artifacts az-mp3-thread-cpu.json, az-mp3-replay-affinity.json and raw hashes.


## Affinity helper located in native AZ

EP147 imports pthread_setaffinity_np PLT424d30; executable direct BL scanner found one call232dce8. Function232dc70 constructs128-byte cpu_set from32bit w0 mask, calls pthread_self, pthread_setaffinity_np(self,128,set), then sched_yield. Return value is ignored here. Direct branch/call sites to helper:222067c and2347430. This establishes native program affinity-setting code, not yet which callers produce observed host14-19 masks. Stock affinity_setting.sh changes workqueue mask to2f and threads with3f to2f, reserving CPU4; x11-only.sh pins X to5. The isolated launcher executes EP147 directly and does not run those boot scripts. Artifacts az-affinity-callers.json, az-affinity-mask-callers.json, az-affinity-helper.asm. Probe179634 completed300sec launcher0/mixer0; no full audio quality assertion.


## Affinity runtime provenance

Caller222067c loads mask from registry object+16; caller2347430 loads thread object+304 if nonzero before virtualrun. Added optional AFFINITY_TRACE=1 pass-through pthread_setaffinity_np interposer,512call logcap, no mask changes. Probe189297:246calls captured; allself=1,size128,result0,caller232dcec. Maskcounts:bc000222,3c00017,b8000five,b0000one,40000one. Firstcall tid2 mask3c000. Thus EP147 itself supplies host14-19 masks; QEMU receives already-high bits. Likely count-based topology adaptation remains inference until producer is traced. No claim these masks suit heterogeneous hosts or4corePi. Raw logs az-affinity-live.txt, native callsite snippets az-affinity-thread.asm and az-affinity-startup.asm.


## CPU-count source candidate

Direct sysconf PLT426c70 scanner found15sites; most w0=30(page-size), several84. No verified affinity chain through these. Stringxref /proc/cpuinfo313afa8 points to2353d38/d88/e38/e78/f08; cpu cores313b038 at2354100. In2353ef0 CPU-information initialization, helper2353b00 called with path and processor literal26b1540 at23540c8; strtol decimal then+1 stored object0 at23540e4. cpu cores parsed2354118; physical id313b048 parsed2354140; product cores*(physicalId+1) stored object4 at235414c. Helper semantics (which matching entry wins) and connection to mask construction not yet traced. Thus last-six CPU hypothesis remains unproven despite observed masks. Saved az-sysconf-callers.asm, az-cpuinfo-xrefs.json/script, az-cpuinfo-parser.asm.


## Native mask reversal verified

Accessor2354220 returns CPU-info logical count at global3bd76b8 offset0. Direct callers221ddb4 and2220858 feed enabled reversal paths controlled by global3bd7380. Helper221dd90 returns mask unchanged if flagfalse; true path221dda4 obtains CPU count. Scalar loop computes shift2*i-N+1, shifts input left/right and selects bit i, equivalent to reversing N bits for tested range. Extracted original221dda4..221def4 instructions; only CPUcount BL221ddb4 replaced with MOVw0,w1 supplied harness count. ARM64 static harness underQEMU passed16384cases (mask0..4095, N4/6/20/21). No vector-pathN>21 coverage. Source code/test-native-mask.*, private binary az-mask-body.bin. At20, inverse candidates for observed masks:3c→3c000(main),3d→bc000(common),02→40000(audio),1d→b8000,0d→b0000. Runtime pre-transform source masks and flag provenance still unverified. This is stronger than last-six hypothesis: enabled bit reversal is proven in original scalar instructions.


## Static thread configuration table recovered

Three reversal-enabling paths pass pointer2988ad0 and count211 into221fc70. Registration loads count+8, iterates array with stride48 at221ff58; record pointer registered by ID atoffset0, and runtimeaffinity readsrecord+16. extract-thread-config.py uses ELFPT_LOAD mapping and decodes211 records:ID0,namepointer8,mask16,raw24,labelpointer32,raw40. Maskhistogram2:1,3c:17,3d:190,1d:2,d:1. AfterN20 reversal these produce exactly observed40000,3c000,bc000,b8000,b0000. Named examplesIndicatorControl3c,FGPRKeyConMain1d,HuiProcessor1d. LabelsFifo/RR/Other exposed but raw priority encoding and whether scheduling calls succeed remain to verify. Static record counts differ from runtime call counts because configurations can be reused. Saved complete table az-thread-config-table.json, registration snippets and extractor.


## Scheduling request outcomes

Helper221f1e0 receives policyID, label, level0..10, nice-20..19. FifoID11209954→policy1 at221f684; RR2c34→policy2 at221f76c. Level1..10 priority=min+((max-1-min)*(level-1))/9; level0 separate branch untraced. Audiolevel10 producesFIFO98, HUIlevel9 FIFO87 on this host. Tracer extended pass-through pthread_setschedparam bounded512logs. Probe199371 records requests+actualreturn: all recorded FIFO/RR attempts failEPERM(1), ordinary/idle mostly succeed. Do not infer elevated privileges or change them automatically. Includes JUCE direct scheduling attempts beyond tablehelper; normalpolicy0 failure possible ESRCH? Actualreported1only; no guessed cause. Raw logs/report az-scheduling-live.txt/json. Need controlled performance experiment with appropriate audio service scheduling later; core placement and denied realtime both materially differ from original AZ.


## Repeated affinity experiment blocked by startup failure

probe-affinity-repeat.py prepared: replay same cue, alternate original/fast/original/fast main-thread affinity,60Hz six-sec raw crop and screenshot per sample, restore mask finally. Not executed: baseline201275/guest201277 exited139 before load, without tracinglibrary. coredump confirms Shutdown thread SI_USER SIGSEGV, command contains only offline-mixer-fixture.so. Full failure log/core metadata saved. Available RAM~15Gi. CipherElements semaphoreEACCES present, but also in older source-screen/null-audio logs; no causal claim. Do not call hook the cause, do not report repeatedFPS results until valid run. Original single sequential19/24.75Hz experiment remains preliminary.


## Repeated affinity comparison completed

Retry203791/guest203793 reachedSOURCE and loadedsameMP3. Four same-cue restart six-sec60Hz crops, mainaffinityalternating14-17 and0,2,4,6,8,10. Counts112,179,111,181 /360samples each:18.67,29.83,18.5,30.17 visiblechanges/sec. Original mask restored finally. Allscreenshots reviewed: same track,remaining02:55.874/.797/.839/.778. Analysis progressed:firstpair86BPM/partialoverview; secondpair168.7/full. Withinpairs similarvisualstate and repeatedimprovement supportsPC main-core placement effect. Singleprocess/track, not nativeFPS or Pi estimate. No physicalaudioverification in this nullsink run. az-affinity-repeat.json/0..3framemd5/png.

### CDJ-3000X control checksum verified against native instructions
The 64-byte ERP packet CRC covers bytes 0–61 and is stored little-endian at 62–63. Extracted ARM64 instructions 0x225f958..0x225fae8 matched an independent bitwise implementation for 10,000 deterministic generated packets under QEMU. The harness supplies the original vector constants and register inputs; this tests CRC generation, not the complete validator or live transport. Reproduce with `python runtime-lab/analysis/test-cdj-crc.py`.

Dispatch at 0x225ae40 passes packet+8 into 0x22579a8, so that callee's byte 6 means full packet byte 14. Initial anonymous boolean fields are saved in cdj3000x-erp-layout.json; names still require tracing member initialization. Do not label these Play/Cue yet. No live control packets sent.

### CDJ-3000X Browse and Back mapping
Constructor 0x225bad8 installs the dispatcher vtables and calls 0x22608a0 on dispatcher+16. That constructor binds Browse ID 0063bb660eeceeae to subobject+8 (full dispatcher+24), and Back ID 009fc1f55209ac55 to subobject+48 (full dispatcher+64). Helper 0x225cb18 passes the supplied ID to the control constructor and stores the pointer at the requested member (0x225cb60). Receive code maps these members to full packet byte14 bit1 (Browse) and byte15 bit0 (Back). Names derive from matching previously verified AZ IDs; CDJ live behavior remains untested.

The secondary group is constructed by 0x225f070 at full dispatcher+128. Its first two IDs match AZ group IDs 315ffa1ef4831600 and 40045926d6629d00, but they must not be assumed to be Play/Cue. Follow this group and its named event consumers next. Disassembly evidence and updated layout JSON are saved locally.

### Mixer BeatFx method map
Vtable2e42338 slots2/3/4 are two-instruction byte setters at2134458/2134448/2134450, storing object+10/+8/+9. No validation/notification in these setters. Names remain unresolved. Direct B/BL scan found no callers; virtual-call tracing is next.
Slot5(21314e0) appends a24-byte listener record under object+16 lock, releases lock, then calls cached-state helpers2131378 and2131448. First gates onvalid+92 and sends+96/+100 to listener virtual offset24. Second gates on+104, constructs state from+106/+107/+108/+109/+112; discriminator+108==5 has alternate representation. This is state transport, not an identified DSP sample loop. Saved az-beatfx-method-map.json and notification disassembly. Need identify field semantics, listener lifetime, setters' consumers and hardware serialization before direct integration.

### BeatFx application listener consumes only selected callbacks
Validated usecase::effector::BeatFx IBeatFxListener secondary base+56 has vtable2692458. Slots3/4/5/6 at984288/984298/9842a8/984268 are RET-only. Therefore the previously traced cached-state callback virtual+24(slot3) is ignored by this concrete listener. Do not generalize listener registration replay to actual UI/effect application. Other implementations can differ.
Slot2 at9836e0 adjusts this by-56 and branches9831a8. This handler masks input to8bits, routes1/3 together,0 separately, and returns for other values. Shared1/3 branch uses application object+88 settings wrapper with value1 and request/notification machinery. Semantic enum names and complete update path still unproven. Evidence az-beatfx-app-callbacks.asm, az-beatfx-app-slot2.asm, az-beatfx-app-state-update.asm and az-beatfx-application-listener.json.

### Beat FX Quantize encoding resolved
Application BeatFx+88 is Quantize: constructor983994 loads this wrapper and registers listener at fullthis+24; its allocated ItemHolder vtable2634b18 and any-holder2636bd0 independently identify application_setting::beat_effect::Quantize. Incoming IBeatFxListener slot2 handler9831a8 maps low8 input0->setting0,1/3->setting1,other->return. Quantize listener thunk9823c8 adjusts-24 to982050, verifies setting identifier, then calls object+64 interface virtual+24 with2 for setting0 or3 for setting1. Unexpected setting values take diagnostic path and emit2. Concrete downstream object identity remains unproven; do not equate these integers with DSP enable bits yet. Evidence az-beatfx-setting-bindings.asm, az-beatfx-quantize-listener*.asm and updated az-beatfx-application-listener.json.

### Quantize downstream mixer object proven
Effector constructor9960c4 obtains IMixer (mapped-pointer failure diagnostic2699128 explicitly names it) and calls virtual+128. Concrete Mixer vtable2e42208 slot16 is2134570, returning Mixer+1328. Constructor2130e3c installs BeatFx vtable2e42338 there. Returned object goes to application BeatFx constructor x1 and is stored at application+64. Therefore Quantize listener virtual+24 reaches2134448, storing2/3 at BeatFx+8 = Mixer+1336. Full static identity chain proven; serialization and live effect timing remain pending.
Re-ran earlier direct branch scan with explicit hexadecimal prefixes0x2134448/0x2134450/0x2134458: no direct B/BL results. Previous unprefixed numeric inputs were decimal; result has now been correctly checked.

### Quantize serialized to mixer TX byte17
TX body215c150 loads Mixer pointer from builder+112, adds1328, copies BeatFx+9/+8/+10 to packet16/17/18 respectively (215c160..174). Therefore Quantize is raw TX byte17; application setting0/1 maps2/3 through the verified setter chain. Helper215a478 independently shows identical byte order. Other two field names unresolved. Packet inspector now exposes beat_fx_controls_raw with quantize and unnamed16/18, preserving all byte values. All14 packet tests pass, including256 distinct Quantize inputs with neighboring bytes independently varied and correct CRC. Tests verify decoder behavior, not native toggles or audible effects. Historical captured-value histogram saved separately.

### Beat FX routing bytes identified
MicSelect listener secondarybase+40 thunk982048 ->981d00; validated setting identifier and unsigned enum<=2 index byte table2692540=[1,2,0], then mixerBeatFx virtual+32(slot4) ->2134450 ->object+9 ->TX16. Out-of-range mic values enter diagnostic path; fallback not yet traced.
ChannelSelect base+8 thunk982648 ->9823d0: enum3..7 indexes2692788=[2,0,1,3,7]; others use0. Calls mixerBeatFx virtual+16(slot2) ->2134458 ->object+10 ->TX18. Names derived from typed listener bases; actual enum display labels and live routing not verified. TX17 remains Quantize. Inspector raw-field names updated to mic_select/quantize/channel_select. Routing map saved az-beatfx-routing-mappings.json.

### Beat FX setting validation and update lifecycle
Typed ChannelSelectSetting vtable2633f70 slot3=850e28 accepts unsigned values0..7. MicSelectSetting vtable2633fd0 slot3=850e38 accepts0..2. Thus channel values0..2 collapsing to TX0 are valid enum cases, not simply rejected invalid inputs; display labels remain unresolved. State callbacks8649f8(channel)/864950(mic) verify identifier, suppress unchanged values, optionally lock object+48, store+96, unlock, and call notifier via+24 only if byte+100 is set. These callback bodies do not invoke the separate validator. Directly invoking callbacks could bypass the intended validation lifecycle; trace the public settings update entry before integrating event injection. Saved validation/state-update disassembly and updated routing map.

### Microphone selection UI path located
MixerValueTableController has typed MicSelect listener atbase+144, vtable2c93a08 slot2=1d07528. Same-thread-looking branch normalizes1/2 unchanged and other values0, then updates utility row20 through1d00208 and model object+312 through1d2d6e8. Byte744 guards an alternate path. Labels remain unresolved; next trace row20 value list and model setter. No direct UI callback injection attempted; thread/lifetime requirements not yet proven. az-mic-select-ui-binding.json and listener disassembly saved.
