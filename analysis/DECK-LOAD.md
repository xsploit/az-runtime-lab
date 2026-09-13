> CORRECTION: Earlier load-button offset interpretations below are superseded. The control container is dispatcher+16 (constructor0x2153b70). All four load buttons are packet byte33 bits3,2,1,0 for decks1,2,3,4 respectively. See final correction section.

# AZ deck-load input research

Applies only to EP147 SHA256 736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6. Static findings; no successful deck loading yet.

## Confirmed IDs

The MOVZ/MOVK sequences immediately before the named failure diagnostics establish:

| Control | 64-bit HUI ID | Link call | RX dispatcher member |
| --- | --- | --- | --- |
| loadDeck1 | 0x003abc876b2f2aea | 0x6caa4c | +72 |
| loadDeck2 | 0x0015418214bc7d89 | 0x6cab18 | +80 |
| loadDeck3 | 0x01ce23eafdd238ca | 0x6cabe4 | +88 |
| loadDeck4 | 0x01a8a8e5a75f8b69 | 0x6cacb0 | +96 |

`az-load-deck-links.asm` contains the IDs and exact `helper::linkToObserver<IHuiButton>` diagnostic references. Helper 0x6cba78 looks up the supplied ID in a registry at 0x3b455d8, traverses bucket nodes (ID +0, object +8, next +16), then invokes object vtable +32 with the observer and flag zero. This is registration, not a button press. Do not invoke it as a load action.

The nearby RTTI identifies midi_adapter::HuiEventHandler; this MIDI observer alone does not establish the standalone consumer. Exact-ID scanning also found GUI and hardware references, saved in az-load-button-id-xrefs.json. Candidate scans require local disassembly validation.

## Hardware connection

`az-load-hardware-register.asm` verifies the four IDs passed to helper 0x2144c18 with destination addresses dispatcher +72/+80/+88/+96 respectively. RTTI identifies device_adapter::subcpu_comm::mixer_control_ucom::RxDataDispatcher (primary vtable 0x2e48338).

Within helper 0x2154418, which receives packet +31 according to the main dispatcher mapping, instructions 0x21544ec–0x2154518 extract subregion byte 2 bit 2 into member +96 and bit 3 into member +88, passing a one-byte state to 0x2147bf0. Consequently raw packet byte 33 bit 2 maps to loadDeck4 and bit 3 to loadDeck3. Polarity and press/release semantics still require inspecting 0x2147bf0 and/or executing a controlled original-code probe. Deck1/2 packet locations remain unresolved; do not assume neighboring bits.

The functions 0x199fbd0/0x199fbf0/0x199fc10/0x199fc30 simply test their argument for equality with each load ID; these are predicates, not load implementations. See az-load-consumer-register.asm (filename historical; content is predicates).

## Next evidence needed

1. Resolve deck1/2 packet fields and button state transition semantics.
2. Follow GUI consumers at 0x19c2208, 0x19d2208 and 0x19d8ee8 regions.
3. Inject a controlled press/release into the isolated emulator after selecting the generated tone. Verify deck title, waveform, decoder activity and captured audio separately.

No firmware patch or playback success claimed in this pass.

## Button transition chain verified statically

Factory 0x2144c18 allocates 224 bytes, calls HuiButton constructor 0x21f38f0, stores the pointer in the dispatcher member, and registers its IHuiButton interface at object +192. Constructor installs primary vtable 0x2e63278, saves ID at +208, and initializes boolean state +216 to zero. Source: az-load-adapter-factory.asm and az-button-constructor.asm.

Update helper 0x2147bf0 passes the raw state pointer through primary virtual +32 (0x21eec60). The default adapter 0x21f72b0 normalizes raw byte !=0. The forwarding path compares this against cached byte +216; unchanged values return. Changes update +216 and append the normalized byte to the pending array +160, count +176. Thus repeated high samples do not repeatedly append transitions. This describes the default adapter path only; the forwarder supports custom adapters after existence checks. Saved forward/tail disassembly shows both paths.

The pending transition fan-out and higher-level GUI event enum must still be mapped before calling any GUI handler directly. A raw boolean cannot yet be equated to GUI enum values.

## GUI branch lead

The waveform-region handler compares all four load IDs and routes them to common helper 0x19d8cd0 with deck indexes 0,1,2,3. At 0x19d90fc/0x19d9114/0x19d912c/0x19d9144 it sets the third argument to unsigned(eventCode)<=1. Other event codes therefore reach that helper with false; do not label these codes press/release without tracing the event conversion. Handler also has visibility/state gates. Sources: az-waveform-load-id-handler.asm and tail. Common helper remains to inspect, and no runtime load has yet succeeded.

## Common-helper correction and next direction

Inspection of 0x19d8cd0 does NOT establish a standalone track loader. It obtains an object via owner+544 / 0x1fcc408, checks a nested object's byte+193, then hashes a string beginning at 0x25c1e0a (`diDeckOperator`, a suffix inside `MidiDeckOperator`) with deck-specific data. It resolves the resulting ID through registry helper 0x19e36b0, invokes returned object's virtual+272, and forwards the boolean argument through the returned interface virtual+16. The lookup helper uses registry 0x3b41538. This is strong evidence for a MIDI deck-operator forwarding path, rather than direct file decoding/loading; confirm registry concrete type before asserting exact method names.

RTTI lists midi_adapter::DeckOperators at vtable 0x25e5af0; its +272 slot is 0x72cd80, a shared-pointer/interface lookup accessor, consistent with the above hypothesis. This concrete type match is still inferred from the name and interface shape, not a runtime dynamic-type observation.

The 0x19c2208 region also checks all four IDs but is a filtering branch that consumes code zero under a preceding gate; it does not itself perform a load. Saved `az-browser-load-id-handler.asm` begins mid-function; inspect preceding entry and delegation before using it.

Next: prioritize the native browser/load usecase observer chain or inject the confirmed raw deck3 button through its real dispatcher, rather than treating 0x19d8cd0 as a file-load API. Default transition semantics remain valid, but higher-level event-code meaning is still unresolved. No injection was performed this pass.

## Native load interfaces indexed

Saved the load-usecase RTTI subset in az-native-load-classes.json. TrackLoader implements ITrackLoader at object+216, interface vtable 0x26cc428. Slot2 is thunk 0xa6de18 (this-=216 -> body0xa6d308); slot3 is thunk0xa6d300 (this-=216 -> body0xa6c808). This identifies real loader entrypoints by interface, but not yet their exact argument types or caller.

The slot2 body copies a 16-byte argument at x3, a composite argument at x4 including a 12-byte-element range, and values pointed to by x5/x6, before entering task-dispatch logic. It is not a simple filename function; injecting a path as its argument would be invalid. Saved request-entry disassembly.

DragAndDropTrackLoader inherits network_prodjlink::IUdp_MusicDragAndDrop_Listener at+216. Its name therefore does not establish local touchscreen drag-and-drop support. Avoid treating it as justification for an unverified screen gesture.

The eight-instruction ADRP+ADD heuristic found no address-materialization hits for the four native loader thunk/body entrypoints. This does not rule out virtual calls, longer instruction sequences or direct calls. Next trace ITrackLoader registry acquisition and virtual slots, plus request task RTTI, to recover a native caller.

## Exact request signature and task boundary

Diagnostic at VA0x26ccb50 identifies the explicit overload as `TrackLoader::execute(uint32_t, uint32_t, const trackid::TrackID&, const music_library::HierarchySet&, const music_library::SortKind&, const music_library::ListOrder&)`. Body0xa6d308 references it via 0x26cc470+0x6e0 at0xa6daf8 (two ADDs, explaining the simple scanner miss). This corroborates register mapping x1/x2=numeric selectors (meaning unresolved), x3=TrackID, x4=HierarchySet, x5=SortKind, x6=ListOrder. The other diagnostic names an overload without the two selectors; association with slot3 needs local code confirmation.

At0xa6d49c the explicit overload constructs task vtable0x26cc7a8. Task slot2=0xa6e100. Its entry copies task+32/+40 into loader+256/+264; the selectors from task+48/+52 go to loader+312/+316. Hierarchy tag task+56 goes to loader+272; a 12-byte-element sequence is copied into loader range+280/+288/+296. This is an asynchronous request boundary, not immediate decoder execution. Saved request-full and task-execute disassembly.

Registration code0xce607c hashes `UsecaseTrackLoader` at0x2791680, combines a low-byte discriminator from x21, allocates320bytes at0xce6098, calls constructor0xa6edf0, and stores the +216 interface pointer in a collection before registration helper0xcf0cf0. The discriminator's domain is still unresolved; do not call it a deck number without tracing loop context. See az-track-loader-registration-name.asm.

Direct BL scanning found no callers to bodies0xa6d308/0xa6c808, consistent with virtual invocation but not proof of exclusive virtual use. No runtime injection or playback this pass.

## Native controller handoff and validity gate

Task0xa6e100 finishes storing sort kind to loader+304 and list order to+308, then tail-branches at0xa6e218 to0xa6de20. The latter is now identified as TrackLoader::doLoadTrack by diagnostic0x26ccc78 (materialized as0x26cc470+0x808). It tests loader+232; failure diagnostic0x26cd440 names this member `m_loadController`.

Normal handoff0xa6dfb8–0xa6dfc0 passes loader+256 as x1 and stack+112 as x2 into0xa371f0. Its diagnostic0x26bd2d8 identifies `LoadController::loadCommonProcessing(const loaded_location::LoadedOneTrack&, const usecase::load::TrackLoadOption&)`. Thus loader+256 is the beginning of a LoadedOneTrack representation, not just an arbitrary copied buffer. Exact size/layout still needs validation; earlier field offsets are observations, not a full C++ definition.

The controller's entry enforces the diagnostic `loadOneTrack_.m_trackID.isValid()` (0x26c1488). Passing path requires raw argument byte0 !=0, (byte4 &31)!=0, byte6 !=0, and uint32 at+8 !=0. These are observed validity conditions; individual subfield names remain unresolved. Failure logs and returns before later processing. Preserve these requirements when testing the selected synthetic track; do not bypass them to claim successful loading.

Saved az-track-loader-task-tail.asm, az-track-loader-do-load.asm and az-load-controller-request-entry.asm. No decoder start, deck load or audio is verified yet.

## Controller execution and media dependency

loadCommonProcessing chooses inline vs submitted execution via primary virtual+40. False at0xa37368 invokes closure0xa318a0 directly with stack capture; true builds a648-byte task with vtable0x26bca78 and submits via primary virtual+48. Task slot2=0xa31af0 adjusts this+24 and branches to the SAME closure0xa318a0. Thus this is a confirmed convergence point for instrumentation, without assuming the thread-selection predicate's meaning.

The closure reads controller pointer at capture+544. It branches on option byte0; meanings of values2/3 are not yet established. In the non-3 branch it resolves controller+1512 through helper0x75c550; failure diagnostic0x26c13e0 is `mediaMountState.link()`. Success invokes that object's virtual+16 using a six-byte value from capture+552 (passed via a packed temporary) and zero third argument. Only return value3 proceeds into helper0xa24fe8; other values return. Do not rename value3 as mounted/ready without inspecting the interface definition/implementation.

This makes media-state resolution a concrete additional dependency after TrackID validation. Synthetic USB visibility in the browser does not prove this dependency is satisfied. Next runtime tracing should distinguish: valid ID, valid controller, media-state registry link, returned state, and downstream0xa24fe8.

Saved request-task, lambda-entry and lambda-tail disassembly. No decoder start or runtime playback is claimed.

## Media state query resolved to a stored record

RTTI identifies MountProgressManager implementing usecase::device::IMediaMountState at offset0, primary vtable0x2716928. Slot2 is0xb46790. This is a candidate concrete receiver for the controller query (runtime dynamic type still unobserved).

On its ordinary third-argument-zero path, it splits the six-byte key into uint32+uint16, locks manager+136, calls0xb44c30 with discriminator zero, then returns matched record int32+88. Missing record returns-1. This confirms code3 in the load caller is a stored mount-state value rather than a synthetic success boolean, but does not yet name state3.

Lookup0xb44c30 scans the pointer array at manager+64, count at+80. Each record has packed key at+128: compare caller uint32 against low32, and caller uint16 low8 against bits32..39. With discriminator0, no record+136 check is performed. An optional nonzero discriminator is only checked for key-low5==5. Upper8 of the uint16 key is not part of this ordinary record match. The query's optional nonzero third argument adds a separate comparison against those upper8; the observed load caller uses zero.

This supplies specific addresses/fields for future runtime inspection of the synthetic USB mount record without bypassing state checks. Sources: az-media-mount-query.asm, query-result and record-lookup. No runtime state3 observation or successful deck loading yet.

## Original-code lookup experiment

Executed original unmodified function0xb44c30 under qemu-aarch64-static with synthetic manager/records. All11 cases matched: ordinary keys select distinct records; absent ID/key and empty list return null; upper8 of the16-bit key do not affect matching; discriminator mismatch rejects type5, but the same discriminator does not filter type6. These results verify the static lookup interpretation, not mount state3 or actual USB playback.

Reproducer: run-media-lookup-probe.py with supplied EP147, --cc ARM64 static compiler, --output result path. C harness probe-media-lookup.c. Firmware hash is checked before extraction. Code page and test executable are temporary and removed. Mapping uses a non-destructive address hint and rejects any different returned address. The old compiler lacks MAP_FIXED_NOREPLACE, so no fixed replacement mapping is used. Result: az-media-lookup-execution.json,11cases/0mismatches.

## Mount state2 ->3 transition located

The queried record is consistent with usecase::device::MountProgress: primary vtable0x2713d60 has slot14=0xb39c88, matching the record getter comparison in0xb44c98. Static type and member layout support this identification; runtime vptr still to inspect.

In the0xb3d288-region update path, dependencies at record+24/+40 must resolve. Helper0xb26a90(record+144,1) must succeed, and state+88 must equal2. Branch0xb3d2d0 then reaches0xb3d4f0. After further dependency resolution and virtual calls,0xb3d54c writes3 to state+88. It subsequently reports a boolean1 through dependency virtual+176 and updates the packed media key via another service virtual+128. This locates a concrete transition into the state accepted by TrackLoader; it does not establish its official enum name or that the synthetic USB reaches it.

Other nearby writes:0xb3a33c writes4,0xb3b354 writes5,0xb3bc58 writes2. Names/trigger meanings remain unassigned pending caller analysis. Source: az-mount-progress-state-search.asm. Next inspect readiness helper/dependencies or instrument0xb3d54c to observe the real fixture transition.

## Bounded full-player trace

Added opt-in MOUNT_TRACE to launcher (AZ-only QEMU address filter, no firmware patch). Thirty-second USB-fixture run stayed alive at screenshot and was stopped by launcher. Source screen showedUSB1; no navigation performed. Target0xb3d4f0..0xb3d57c emitted no register blocks. Positive control using the original lookup probe and its known address filter emitted register blocks and passed11cases, validating filter operation in that control. Absence in full player is not proof of failure or absence of state3: another transition path or startup timing may apply. No readiness/decoder/playback claim. Summary az-mount-transition-observation.json; screenshot xdjaz/mount-trace-source.png. QEMU emits unfiltered TB-link messages despite the filter; raw local trace is about6MB.

## Full-player trace control

Expanded MOUNT_TRACE to include the known USB reader0x21b9b90..0x21b9c70 and earlier MountProgress entry0xb3d288..0xb3d57c. A second30-second source-screen run remained alive. The USB reader emitted register trace entries while the targeted MountProgress region did not. This verifies the filter/address scheme in the full process and narrows the absence to the selected mount path. It still does not prove state3 is absent: no Local Library activation or load event occurred. Counts/PCs saved in az-mount-trace-full-player-control.json. Previous raw trace preserved as az-mount-first-run.log. Next test should activate Local Library with this trace enabled, or inspect alternative mount implementations.

## Local Library activation trace

A fresh bounded90-second full-player run (launcher session3023, parent1979) reached SOURCE, then an explicit private-Xvfb click at750,190 opened Local Library. Screenshot `xdjaz/mount-library-active.png` verifies the folder browser, selected LAB-TONE-440Hz.wav, and00:10 duration, with both decks Not Loaded. The observation in `az-mount-local-library-observation.json` contains476 USB-reader register blocks and zero blocks in0xb3d288..0xb3d57c. This extends the earlier source-only observation through actual local-library activation. It does not prove missing mount state3: another state writer/implementation or an actual load request may be necessary. No synthetic load-button event was injected. Next prioritize tracing the native load request and mount query, or the other state writers, instead of repeating source-only probes.

The90-second probe completed with running=true before deliberate teardown and screenshot_exit=0. Added a separate AZ-only LOAD_TRACE launcher option for request overload entries0xa6d308/0xa6c808, shared closure0xa318a0, and query0xb46790. It is mutually exclusive with MOUNT_TRACE. Python syntax check passed; LOAD_TRACE runtime coverage remains untested.

## Touch actions under native-load tracing

LOAD_TRACE full-player90-second run/session72140 parent4900 finished alive before deliberate teardown, screenshot_exit0. After SOURCE readiness, Local Library clicked750,190; two row clicks330,155 and a bottom-deck1 click320,760 followed. Screenshot load-trace-after.png shows selected fixture/00:10, both decks Not Loaded. Neither native request entry0xa6d308/0xa6c808 nor closure0xa318a0 was observed. This supports selection without a traced native load request for these actions; does not exclude other load paths.

The concrete mount query0xb46790 DID execute repeatedly. Sampled return addresses include0x2070758 and0x754aa8 prominently, plus0xb77428/0xb691b0/0xb7725c/0xb7727c/0xb772a0/0xb774c0/0xb743e8/0xb73344. All captured third args zero. Caller observations az-load-touch-callers.json are a mid-run snapshot, not final counts; final PC summary az-load-touch-observation.json. TB chaining prevents treating trace counts as exhaustive call counts.

Static confirmation at0x2070754 is virtual+16 invocation on owner+152, with key from previous service virtual+128; return0x2070758 compares w0 to3. Thus this is a useful concrete runtime mount-state consumer, independently of an actual load request. Saved az-mount-query-hot-caller.asm and az-observed-mount-query-caller.asm. Extended future LOAD_TRACE to these return sites to observe actual result values; extension syntax only checked, not yet executed. No deck load or playback verified.


## Mount return state3 observed in full player

60-second LOAD_TRACE run/session33123 parent8310 completed alive before deliberate teardown, screenshot_exit0. Clicked Local Library after SOURCE readiness; final screenshot mount-return-browser.png shows test fixture00:10, both decks Not Loaded. A subsequent manual screenshot attempt occurred after teardown and failed because private display was closed, not because of a player crash.

Return-site tracing now observes actual w0 values after concrete mount query calls. At0x2070758: -1 (8878 blocks),1 (201),2 (97),3 (8134). At0x754aa8:3 (4400),-1 (6600). Counts are trace blocks with chaining, not exhaustive call counts. Native load entry/closure blocks remain absent. The state accepted by loader,3, is therefore reachable in this lab run despite the earlier specific state-writer region not being observed. This materially weakens any hypothesis that mount readiness is globally missing. Association with the exact selected fixture media key remains unverified; do not claim its load gate passed.

Second caller disassembly az-mount-query-second-caller.asm confirms0x754a60 constructs a six-byte key: uint32=1, uint16=(incoming w1 &255), invokes virtual+16 with third arg0, then maps state3 to return0, state4 to2, other states to4. No enum names assigned. Return registers alone do not retain the original key safely, so follow-up tracing should capture the key at entry or a decoded lookup comparison alongside result.

Reusable streaming parser summarize-mount-returns.py produces az-mount-return-observation.json from the local QEMU log without copying pointed-to memory. Python syntax checked and applied to the real trace. Findings still do not establish deck loading, decoder start, or audio playback.

## Mixer decoder input map extension

Rechecked full dispatcher0x2154730: caller0x2154824 supplies packet+31 to0x2154418. Confirmed deck3 byte33bit3 -> dispatcher+88; deck4 byte33bit2 ->+96. Added these known fields to read-only az_mixer_packet.py. Deck1/2 remain deliberately absent, not assigned zero or guessed adjacent bits.

Same helper0x215457c onward uses dispatcher+882 as first-sample flag. First sample copies signed16 packet34..35 to dispatcher+884 and returns without emitting encoder update. Later samples subtract previous signed16 from current signed16 in32-bit arithmetic, build delta+press event (press=packet31bit0), and call0x21597a8 with dispatcher member+208. It then stores the new baseline. This is an observed counter-difference path; do not assume signed16 wrap correction in this helper, or assign the encoder a final browse/zoom semantic before identifying its HUI ID/consumer. Inspector now exposes encoder_member_208_raw counter and pressed fields, not a fabricated delta for a single packet.

Complete0x2150000..0x215a000 disassembly saved az-rx-dispatch-complete-region.asm. A narrow search for x0 loads from x19/x0+72/+80 found lifecycle-looking sites0x2152b58/6c,0x2155750/64,0x215812c/40 rather than equivalent button updates. This is NOT exhaustive proof that load1/2 are unused: other base registers, aliases, decoder regions, or another communication channel may apply. Next investigate separate deck-side input or registered native HUI load consumers.

Existing12 packet-inspector regression tests pass after the additive map change. Those tests do not independently verify the new fields against hardware; new mapping remains disassembly-derived.


## Critical container-offset correction

Constructor0x2153b70 sets dispatcher vptr0x2e48338, then at0x2153b9c forms dispatcher+16 and passes that to control-container constructor0x21574b0. That constructor passes its same base into0x2155be0. Thus registration offsets are CONTAINER-relative, whereas decoder0x2154418 offsets are DISPATCHER-relative. Earlier notes mistakenly equated these bases.

Correct map: container72/80/88/96 -> dispatcher88/96/104/112 -> loadDeck1/2/3/4 IDs, respectively. Decoder byte33 bits3/2/1/0 feeds those dispatcher members. ALL FOUR load bits are now statically mapped, correcting both the previous3/4 labels and the supposedly missing1/2 mappings. az_mixer_packet.py fixed accordingly. Existing regression tests pass; runtime acceptance remains unverified.

Encoder dispatcher208 corresponds to container192, registered at0x2157724..0x2157740 with ID0x01d690928446227a through factory0x2156690. The superficially matching container208 ID0x009764c6e728555d instead has diagnostic masterEqHi (0x25d5140) and must NOT label this encoder. az-encoder-208-link.asm retains that rejected candidate for audit; corrected candidate file az-encoder-208-link-corrected.asm and rerun encoder-208-id-xrefs.py target the proper ID. Candidate consumers0xab9e64,0xaba0c0,0x19990ec,0x19cfe98,0x19d4568 remain to inspect. No final browse label assigned yet.

## Native transport interface for eventual packet injection

Located concrete SubCpu RTTI at0x2e5a540 (0x2e5a548 is its name pointer, not RTTI base), vtable0x2e5a568. Slots: init+24=0x21c4eb0, start+32=0x21c38d0 (no-op), read+40=0x21c38e0, write+48=0x21c3970. Read obtains fd at transport+16 and raw buffer pointer/count from argument+0/+8, calls libc read, logs negative result. Write uses ioctl0x40107000 with16-byte argument {uint32 0x01000000,uint32 length,uint64 buffer}, treating nonzero result as error. This is not ordinary write(fd,...).

Initializer opens device path via open64 O_RDWR and stores fd+16. It calls configuration helpers with16, configured length128, configured value1, then0x21c4ae0 with1. Config getter/setter requests: helper0x21c3f50 uses0x80027003/0x40027003 (desired16);0x21c40b0 uses0x80047004/0x40047004 (desired128);0x21c4200 uses0x80047002/0x40047002 (desired1). Each gets current value and sets only on difference. Kernel request sizes differ (2/4 bytes); do not blindly write8 bytes into argument storage. Their semantic names and final0x21c4ae0 behavior still need confirmation.

Saved az-subcpu-transport-io.asm, init.asm, config.asm. Existing mixer wiring identifies /dev/subucom_spi3.0. A faithful offline fixture needs a pollable receive descriptor plus intercepted device-specific setup/TX ioctls and bounded delivery of valid128-byte packets. No shim/injection executed yet; no hardware node touched.


## FIRST VERIFIED NATIVE DECK LOAD

Added opt-in MIXER_FIXTURE for AZ with USB_FIXTURE, using offline-mixer-fixture.so. Its open64 intercept substitutes a private pollable FIFO for /dev/subucom_spi3.0, supports the four observed configuration getter/setter pairs, accepts only the observed TX request/header/length, rejects unknown mixer ioctls, and forwards other descriptors. No real mixer device or network is accessed. Final setup helper0x21c4ae0 uses enable getter/setter0x80017001/0x40017001 with one-byte storage.

Run session27168 parent19001: LAB_MIXER opened fixture fd9 and first TX accepted length128. Sent valid neutral128-byte RX packet with header1 and correct CRC, opened Local Library via click750,190, selected row330,155, then sent byte33=8 followed200ms later by0. Native trace observed request0xa6c808 once and closure0xa318a0 once. Screenshot xdjaz/mixer-fixture-after.png shows WAVEFORM page, deck1 LAB-TONE-440Hz.wav, track01,00:10.000; deck2 Not Loaded. This verifies a native deck1 load via the mixer receive path and corroborates the corrected packet bit mapping. BPM150 appears in UI but is not asserted as a meaningful tempo for a sine fixture. No play command/audio capture performed.

Reproducer: existing launcher flags NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 LOAD_TRACE=1 LAB_DURATION_SECONDS=90. send-mixer-load.py (no args) supplies baseline; --deck1..4 supplies baseline/press/release via the private FIFO (CLI uses --deck 1). New helper syntax checked; this first run used equivalent inline packet generation. Additional decks and repeated loads remain untested.

The90-second first-load run completed alive before deliberate teardown, screenshot_exit0. No crash occurred in this probe.

## Play-input search: deck and ERP channels

Located deck_ucom::RxDataDispatcher vtable0x2e427a0, receive slot2=0x2137e88. It validates through0x213bdd0, requires nonzero first uint16, then calls0x21371f0(packet+2),0x21375d0(packet),0x2137880(packet). These inspected helpers deal with status/version-like fields, jog-like multi-field data (packet9 flags, uint16s10/12, bytes22..31), and10-bit values16..19 shifted6; no play-button mapping established. Constructor0x2137c58 stores incoming index at+16; index0 calls control construction0x213b420 on dispatcher+16, index1 calls0x213aa70. This container offset is explicit, avoiding the earlier mixer mistake. Files az-deck-rx-entry.asm, az-deck-button-decode.asm/tail.asm (names reflect search, not proven button handling), az-deck-controls.asm.

ERP dispatcher offers a stronger button-path lead: RTTI0x2e45698,vtable0x2e45718, receive slot2=0x21435c0. Validation0x2147408 then nonzero first uint16. It calls shared helper0x21431b0 twice: dispatcher+48 with packet+8, and dispatcher+400 with packet+16. It then calls0x2142920(packet+24). The difference352 between control blocks suggests two matching groups but deck assignment must be confirmed from construction/IDs. Two additional button forwards at0x21436a4/0x21436bc both read packet10bit0 and target dispatcher+176/+528. Next inspect0x21431b0 and corresponding registration before injecting a play event. No new runtime play/audio claim.

## ERP playPause input identified

Verified ERP constructor0x2142660 initializes group at dispatcher+48 with selector0 and group at+400 with selector1, both through0x2146058. That helper calls registration0x2144df8 for0,0x2145720 for1. Group0 offset0 registers ID0x40045926d6629d00; offset8 registers0x315ffa1ef4831600. Cross-reference link diagnostics identify these as IdStruct::cue() (string0x25d3f90) and IdStruct::playPause() (0x25d3fd0), respectively. They are passed to normal HuiButton factory0x2144c18.

Shared decoder0x21431b0 reads relative byte2bit1 into group+8, and byte2bit2 into group+0. Therefore first ERP group uses packet10bit1 for playPause and packet10bit2 for cue. The second group has the same bit positions at packet18, but its named IDs/physical-deck interpretation should still be verified from group1 registration. Do not call these MIDI note numbers; they are sub-CPU packet bits.

ERP validator0x2147408 requires128 bytes, with successful-length branch0x2147518 still to inspect for CRC coverage. Existing startup0x2100d40 materializes device path string0x2e33aa0 and config length128; exact path and other config fields remain to extract before fixture extension. Saved az-erp-button-group.asm, constructor-verified.asm, group-constructor.asm, group0-register.asm, first-button-links.asm, validator.asm and erp-first-button-id-xrefs.py/json. No play packet sent this pass.


## FIRST VERIFIED PLAYBACK PROGRESSION AND CUE

ERP path confirmed /dev/subucom_spi1.0, config(1,10), length128. CRC uses reflected0x8408 (constant vector0x298d8e0), initial/finalffff over bytes0..27, uint16little-endian stored28..29. This differs from mixer CRC coverage. Added opt-in ERP_FIXTURE requiring MIXER_FIXTURE, creating a separate private FIFO and guest LAB_ERP_FIXTURE environment flag. Shared shim intercepts only these two configured device fds; same observed config/TX ioctl layout. Configuration storage currently shared because both observed devices request the same values; split if later requirements diverge.

90-second run/session86904 parent27918: ERP fd8 and mixer fd9 opened. Sent neutral packets to both. After USB fixture appeared, opened Local Library, selected track, used send-mixer-load.py --deck 1. Screenshot erp-loaded.png confirms00:10.000. Executed send-erp-button.py --button play: valid packets with byte10 masks0,2,0 and200ms spacing. Screenshot erp-play.png shows00:01.589 remaining, shifted waveform, deck1 MASTER highlighted. This verifies native deck1 playback progression through the ERP input, not merely a load event. Then --button cue masks0,4,0 returned display to00:10.000 and beginning position (erp-cue.png). This verifies return-to-cue in this fixture. Playback audio remains NULL ALSA; no sample capture or audible output verification yet. Do not claim sound quality or Pi realtime performance.

Sender helper uses private FIFO only,128-byte atomic writes, CRC28coverage. Actual helper execution verified both play and cue; Python syntax checks passed. Next capture output samples and compare the synthetic440Hz fixture, then assess the four-channel mixing gap separately.


## FIRST VERIFIED DECODED AUDIO OUTPUT

Added AUDIO_CAPTURE option for paced AZ using ALSA file sink with null slave, writing private state/tmp/az-output.raw. Full90-second run session18519 parent31492 finished alive before deliberate teardown, screenshot_exit0. Format logs confirm access3 interleaved,format14 floatLE,44100Hz,10 output channels. Replayed mixer load1 and ERP play using saved helper scripts. Capture contains approximately10seconds of active waveform on channels1/2, identical sample-for-sample; channels3..10 zero. Peak0.045745849609375. A one-second interior sample has440Hz sinusoidal energy fraction0.999999883; active duration9.999977seconds. This verifies actual decoded tone output rather than UI progression alone.

check-az-tone-capture.py records numeric evidence in az-audio-tone-verification.json and exports a2-second mono preview xdjaz/decoded-tone-preview.wav. Uses Python standard library (NumPy unavailable), zero-crossing spacing and440Hz quadrature projection. astats snapshot az-audio-first-capture-astats.txt separately observed nonzero output/noNaN/noInf. This is a single synthetic sine on deck1, not a fidelity, latency, underrun or realtime benchmark. No physical speakers/FLX6 output, external4-channel mixer, other-deck isolation or Pi performance verified. Full capture remains local.


## Deck2 playback and separate audio pair verified

Group1 registration0x2145720 establishes cue/playPause IDs0x40045926d6629d01 /0x315ffa1ef4831601 at offsets0/8, respectively, matching the group0 IDs with lowbyte1. send-erp-button.py now accepts --group0/1 (CLI uses --group 1), default0. Added configurable capture-analysis channel pair/label so new reports do not overwrite first-deck evidence. Preserved first-deck1 raw capture losslessly as xdjaz/first-deck1-output.f32le.gz before the new run.

Full90-second run/session7468 parent35283: load mask4 selected deck2; ERP group1 play toggled packet18bit1. Screenshot xdjaz/deck2-play.png shows deck2 LAB-TONE-440Hz.wav at00:00.972 while deck1 remains Not Loaded. Capture independently shows tone on channels3/4 ONLY, channels1/2 and5..10 zero. Pair identical; peak0.045745849609375; active9.999977sec;440Hz energy fraction0.999999883 and crossing estimate440.005Hz. Numeric artifact az-audio-deck2-tone-verification.json, preview decoded-deck2-tone-preview.wav, full capture first-deck2-output.f32le.gz. Probe completed alive before deliberate teardown, screenshot_exit0. Group1 cue packet was sent afterward but no separate before/after verification is claimed this pass.

This confirms group1 controls deck2 and output mapping deck1->channels1/2, deck2->3/4 for independent runs. Simultaneous two-deck mixing/isolation, decks3/4, physical mixer/FLX6 outputs, and Pi realtime performance remain open.


## Concurrent two-deck decode verified

90-second run/session7949 parent38502 completed alive, screenshot_exit0. Opened synthetic track browser and sent mixer byte33 masks0,12,0: both deck1/2 loaded (dual-loaded.png). Sent ERP byte10 AND18 masks0,2,0: both decks played. Final screenshot dual-finished.png shows both reached end. A manual screenshot after teardown failed because Xvfb was already closed; no player crash inferred.

Capture analyses az-audio-dual1-tone-verification.json and dual2 show both stereo pairs active at capture time65.859047619sec for9.999977324sec. Peaks unchanged0.045745849609375; both pairs identical internally,440Hz projection0.999999883. Channels5..10 silent. Overlap report az-dual-deck-overlap.json confirms the entire observed active interval overlaps, start difference0 at captured-sample resolution. This verifies concurrent output of both decks; same input tone cannot establish crosstalk rejection or general independence for different music. External mixing, hardware output and realtime Pi performance remain untested. Preserved raw capture first-dual-output.f32le.gz.

### Deck-select input trace
Primary ID `0d174d4fd081f300` is linked at 0x6cc08c (diagnostic primaryDeckSelect at 0x6cc0ec); secondary ID `3030e6ac95bc4d00` at 0x6cc158 (diagnostic 0x6cc1b8). Group0 registration at 0x2144f20 and 0x2144f58 places these at +32 and +40. Decoder 0x21431c4..31d8 maps +32 to group byte0 bit0; 0x2143284..3298 maps +40 to group byte1 bit0. Thus group0 packet bytes8/9 bit0 are primary/secondary selection. Sender now supports these names. Runtime selection effect remains to be verified; group1 follows shared decoder but its ID registration still needs confirmation.

### Deck 3 playback verified on PC
ERP secondary group0 selects deck3, group1 selects deck4 (screenshots deck3-select-play.png and deck34-selected.png). Group1 registrations confirmed at 0x2145848/+32 and 0x2145880/+40, IDs ending 01. Deck3 loaded after reselecting the browser row and repeating load3; earlier immediate injections did not load. Playback was requested after the loaded view was ready. Screenshot deck3-playing.png shows 00:09.659 and native waveform. Captured channels5/6 contain the complete 10-second 440Hz tone, identical L/R, other channels zero; report az-audio-deck3-tone-verification.json and archive first-deck3-output.f32le.gz. Deck4 playback remains unverified (load4 was sent after load3 changed page). Primary-selection return attempt occurred after scheduled120sec teardown, so it is NOT a runtime verification. Next run should load3/4 together from a ready selected row, await load readiness, then play both. No Pi performance or hardware mixer verification.

### Deck 3/4 concurrent playback and selection verified
Run PID49394,120-second isolated PC probe. Waited for SOURCE, entered Local Library, selected secondary groups0/1, waited for OneLibrary transient warning to disappear, clicked row, sent combined load mask3 using `send-mixer-load.py --deck 3 --deck 4`. Both tracks loaded (dual34-loaded.png). Separate play presses group0/1 started both native transports (dual34-playing.png). Channels5/6 and7/8 each emitted full10-second440Hz audio, peak0.04574585, identical stereo; channels1-4 and9/10 silent. Starts0.64sec apart match sequential button sends; overlap9.359977sec (az-dual34-overlap.json). Reports az-audio-dual34deck3-tone-verification.json and az-audio-dual34deck4-tone-verification.json. Primary buttons returned visible groups to decks1/2 (dual34-primary-return.png). Native touch4-DECK tab at343,34 renders four stacked lanes, order3/1/2/4 (dual34-four-deck-view.png). This confirms all four deck stereo-pair assignments across separate runs, not all four simultaneous playback, distinct-track isolation, external mixing, FLX6 output, or Pi realtime performance. Next: four simultaneous decks and distinct signals, then software mixer routing.

Probe survived until scheduled teardown: running=true before cleanup, screenshot_exit=0. Full capture preserved as xdjaz/first-dual34-output.f32le.gz.

### Four-deck concurrent decode verified
PID53562 survived120sec probe; final running=true before deliberate teardown, screenshot_exit=0. All four decks loaded together with mixer mask15 from the ready browser row. Played groups0/1, selected secondary groups0/1, then played groups0/1 again. All four full10sec tones decoded on pairs1/2,3/4,5/6,7/8, with6.843515sec common active overlap. Each pair has identical L/R, peak0.04574585,440Hz energy fraction0.999999883. Auxiliary9/10 silent. Evidence az-four-deck-overlap.json, az-audio-fourdeck1..4-tone-verification.json; xdjaz/four-loaded.png and four-playing.png; full archive xdjaz/first-four-deck-output.f32le.gz. Same-tone fixture does not establish distinct-track crosstalk rejection; no hardware mixer/FLX6 audio or Pi performance claim.
