# AZ / CDJ-3000X runtime tracker

Latest packaged checkpoint: 2026-09-14. See [PI-SETUP.md](PI-SETUP.md) and
[native performance results](analysis/native-performance-20260914/RESULTS.md).
Native Pi playback, real USB files, FLX6 navigation/headphones and the documented
rendering improvements have since been exercised. Full mode/effect coverage and
long-session stability remain unfinished.

The original 2026-09-12 queue below is historical; its Pending/unavailable labels
are not current status where superseded by those reports.

## Current result

Both real player binaries reach SOURCE under isolated local ARM64 emulation. AZ now browses a synthetic USB fixture and loads LAB-TONE-440Hz.wav onto deck1 through a synthetic mixer packet. Screenshot xdjaz/mixer-fixture-after.png and native load-entry tracing verify this step. Native deck1 play progression and return-to-cue are now verified with ERP packets (erp-play.png, erp-cue.png). Decoded deck1 stereo output is verified with the440Hz fixture (analysis/az-audio-tone-verification.json). Physical audio output, real USB library import, cloud login, FLX6 support and Pi performance remain unverified. Pi is unavailable; no firmware flashing. Cabinet and identifiers stay private.

## Work queue

| ID | Task | State | Evidence / next acceptance check |
|---|---|---|---|
| R01 | Preserve supplied firmware and cabinet | Done | originals/, private/, PROVENANCE.md; identical cabinet copies confirmed |
| R02 | Extract and identify both binaries | Done | AZ EP147, 3000X EP145, ARM64; recorded hashes |
| R03 | Reach both real player UIs | Done, bounded probe | Each model's source-screen.png/log; 20-second runs survived |
| R04 | Reproduce offline startup | Working prototype | run-az-probe.py, offline Wi-Fi marker, read-only cabinet, fw_printenv fixtures, offline MIDI shim |
| R05 | Complete U-Boot environment handling | Partial | Basic offline fields work. Supplied device identity/auth fields not wired or verified. Keep private |
| R06 | Index RTTI/type names in both binaries | Initial map done | analysis/*-rtti.json; addresses and aligned references, not proven layouts |
| R07 | Reconstruct class relationships and method tables | Next research | Validate actual typeinfo/vtable structures, inheritance and callsites; separate facts from heuristics |
| R08 | Cross-reference RX3 / PrimeGo / mods framework | Pending | Inspect existing RX3 shims and exact project revisions; identify matching semantics before porting patches |
| R09 | Capture thread scheduling and resource use | Verified on AZ probe | PROFILE=1 launcher option; 20 samples captured; host thread stat, schedstat, affinity and wait channels |
| R10 | Locate exact ALSA device/rate/channel requirements | AZ tone output verified | 44100Hz float32LE, 10 channels, 64-frame callbacks; deck1–4 occupy pairs1/2 through7/8. CDJ paced startup uses96000Hz stereo; its playback remains unverified |
| R11 | ALSA loopback audio-routing experiment | Priority lead | First open expected device successfully; route outputs through snd-aloop and capture channel-separated PCM. Requires suitable kernel device access outside current private /dev |
| R12 | Four-channel software mixer | Master/cue kernel and private live FIFO verified | Fader values reach native decoder/notification processing (az-fader-dispatch-trace.json) without altering deck1 PCM; downstream observer identities remain unmapped. Implement and validate gain/EQ/crossfader/master/cue, then effects |
| R13 | Recover RX3 DSP behavior | Research, not assumed portable | Confirm whether processing lives in CPU code or external DSP; map behavior and validate output before implementation |
| R14 | Emulate subucom protocol | Pending | AZ references four SPI nodes; 3000X one. Record ioctl/frame contracts and hardware responses |
| R15 | FLX6 browse/back/view/jogs and touch | Pending | Preserve preferred BiteDJ mapping semantics; current MIDI stub intentionally exposes no devices |
| R16 | Rekordbox USB / OneLibrary | Pending | Read-only copied fixture, track discovery and playback test; do not modify user's USB |
| R17 | Streaming authentication | Deferred | Letacy reports success. Our network is isolated and no provider login attempted |
| R18 | Xorg acceleration | Stock config verified only | AZ 20-modesetting.conf requests EXA, DRI2, FlipFB always. Xvfb probe does not exercise it; verify driver support and actual acceleration on target hardware |
| R19 | Affinity / priorities | Stock assumptions verified | AZ boot script pins X/SPI to CPU 5. Adapt for four-core Pi; inspect app affinity calls too; measure underruns/frame timing |
| R20 | Diagnose RX3 flicker/frame pacing | Pending | Compare render, presentation and scheduling timing; letacy's scheduling/Xorg explanation remains a hypothesis |
| R21 | Real-time kernel for MIDI/audio | Deferred until baseline | Measure latency/xruns with ordinary scheduling first; compare RT only if justified. No kernel changes made |
| R22 | Pi native validation | Waiting for hardware | Boot/power check first, then RAM/CPU/thermal/audio/frame-time capture. PC QEMU is not a Pi benchmark |
| R23 | Portable human setup | Later | Reproducible dependency/build checks and useful failures, secret-free scripts/docs, user-supplied firmware |

## Evidence and limits

- AZ: 6,443 demangled type-name candidates, 6,405 with aligned references.
- CDJ-3000X: 6,544 candidates, 6,530 with aligned references.
- These counts include templates and library types. They are not counts of fully reconstructed classes or recovered source files.
- Host profiling contains emulation overhead. Do not report its CPU use as native Pi requirements.
- ALSA loopback is transport. It does not reproduce external mixer DSP or automatically enumerate as the player's expected soundcard.
- Stock EXA config is Rockchip-specific evidence; do not transplant it blindly to Pi graphics.

## Repeatable checks

    OFFLINE_MIDI=1 PROFILE=1 python runtime-lab/run-az-probe.py
    PLAYER=cdj3000x OFFLINE_MIDI=1 PROFILE=1 python runtime-lab/run-az-probe.py
    python runtime-lab/analysis/map-rtti.py

Launches are bounded and stopped after screenshots. Original firmware scripts are not run against the host. Cabinet remains read-only. TRACE=1 is available but syscall traces can include sensitive read buffers: keep traces local/private and review before sharing.

## Updating this tracker

For each new lead: record source, relevant task ID, what is claimed, what was observed, next falsifiable check, and any hardware prerequisite. Mark done only after the acceptance check passes. Do not equate interface drawing with playback or streaming success.

## Preserved community reference

Full user-supplied conversation: [Letacy Discord reference](private/references/letacy-discord-2026-09-12.txt). Preserved verbatim, private and excluded from git by private/. Treat technical claims as leads pending verification. Provenance and SHA-256 are stored beside the reference.

## Usage checkpoint

User authorized PC groundwork while Pi is unavailable. Reassess at 40% account usage remaining (interpretation stated to user). Initial check: 98% remaining. Check periodically at substantive milestones; do not spend tokens merely to reach the threshold.

## Audio probe update

Guest calls confirmed: output PCM `outs`, input PCM `default`. Stock AZ asound.conf combines hw:ALPHATHETAD810,0 (8 channels) and hw:ALPHATHETAD810,1 (2 channels). With optional NULL_AUDIO=1 test config, both opens succeed and the app configures 10 output / 2 input channels, access enum 3 and format enum 14. This is an ALSA null plugin probe, not snd-aloop, audible playback, or verified channel roles. Evidence: xdjaz/null-audio-probe.log. Next: add pacing and capture output to a file/loopback, verify stream rate and load a test track.

## UI, stems and mixer mapping

See [UI and mixer evidence](analysis/UI-AND-MIXER.md). Validated class-typeinfo maps and candidate vtables now exist for both binaries. AZ PadStemWidget confirmed structurally; source of its state still unresolved. Full stems integration into the software mixer is required, including timing/cue/FX, not merely buttons. Next map widget providers and AudioSystem graph connections; compare named RX3 methods before implementing DSP.

Stem UI follow-up: traced 248-byte child allocation, parent ownership at +272, compact 148×20 layout arguments, and two shared-provider fields in the base initializer. Next decode parent selector and name provider objects. See analysis/UI-AND-MIXER.md; no native stem audio claim.

Stem provider finding: code-referenced diagnostics resolve IPcAppliModeSwitcher and IHostAppliInfo dependencies in the image-update path. Existing widget demonstrably consults PC/host state. Shift native-stems work toward audio-graph/mixer integration; do not treat this widget as a discovered separator. Details in analysis/UI-AND-MIXER.md.

Audio graph pass: mapped processor ancestry and comparable vtables in both binaries. Narrowed AZ mixer/switcher differences to three non-destructor slots; slot 7 is a processing candidate based on buffer access. See analysis/AUDIO-GRAPH.md. No runtime graph membership or effects parity claim.

Confirmed SimpleAudioMixer::processBlock at AZ 0x21b2070 via code-referenced diagnostic. Its summation helper performs NEON/scalar float addition. CPU-side mixing proven; placement in the runtime graph and main hardware FX role still unresolved. See analysis/AUDIO-GRAPH.md.

Mixer input processing: static trace confirms a sample gain ramp and NEON source×gain multiplication, including shared gain trajectory across channels. Ramp setup/duration and graph placement remain open. See analysis/AUDIO-GRAPH.md.

Audio role resolved: DeckBluetoothAudioSwitcher constructs the recovered two-input stereo switcher with a 0.01 duration parameter (10 ms interpretation through sample-rate setup). This is source switching, not proof of main four-deck EQ/FX in CPU code. Shift next trace to mixer hardware commands and named RX3 DSP comparison.

Hardware mixer protocol: TxDataBuilder requires a 128-byte buffer, clears it and packs several byte-0 flags. Flag semantics and transport framing unresolved. See analysis/HARDWARE-MIXER.md and extracted vtables.

Receive validation update: recovered reflected 0x8408 CRC with initial/final XOR 0xffff over bytes 0–95, compared against little-endian bytes 96–97 in the 128-byte receive buffer. Added read-only az_mixer_packet.py and four passing synthetic tests. Hardware captures and original-validator execution remain unverified. Flag-zero path clears the buffer rather than accepting existing bytes unchecked. See analysis/HARDWARE-MIXER.md.

Community contact preference: user says not to hound letacy. Contact only for a specific unresolved question that would unblock work; exhaust useful local leads first. No technical message or reply-check automation has been sent/created in this pass.

Receive dispatch update: code diagnostic identifies bytes 0–1 as mixerControlUcom version and rejects zero before normal dispatch. Recovered sixteen packed 10-bit values in four five-byte groups at offsets 36–55; control identities remain unresolved. Packet inspector exposes these raw values and header words; five tests pass. Next trace constructor destination assignments to identify controls.

Packed-control construction: traced full dispatcher+16 subobject offset, linked all four lanes per group to HuiSliderDefaultAdapter (1023, 1.0 constructor parameters), and recorded repeated 64-bit registration values with low-byte group index. Physical labels remain unresolved; search registration consumers next. See analysis/HARDWARE-MIXER.md.

Control names resolved: matched all sixteen constructor registration values to code-referenced HuiEventHandler diagnostics. Packed lanes are trim/eqIsoHi/eqIsoMid/eqIsoLow for channel indices 0–3. Inspector now emits named raw values; five tests pass. DSP curves, controller channel ordering and live event injection remain unverified. Nearby color/cue/fader consumer links are next targets.

Fader/Color update: cross-referenced constructor IDs with consumer diagnostics and receiver pointers. Four channel faders occupy packed bytes 10–14; four Color knobs occupy 61–65. Decoder updated; six tests pass. These are raw samples, with audio curves and live controller behavior still pending.

Cue button update: identified channel cue bits in packet byte 20, bits 3/2/1/0 for channel indices 0/1/2/3, through pointer layout and matching IHuiButton diagnostic. Decoder exposes raw bits; seven tests pass. Pressed polarity, toggle behavior, cue lights and headphone routing are still unverified.

Original-code execution: ran AZ HuiSliderDefaultAdapter conversion in an isolated static ARM64/QEMU harness for raw values 0–1024. All 1,025 outputs match float32 clamp(raw/1023,0,1) for the observed default parameters. Saved output and harness; downstream DSP and center/deadband behavior remain open. See analysis/HARDWARE-MIXER.md.

Reproducibility update: run-slider-probe.py now rebuilds/runs the original-code adapter check from a supplied EP147, requires its exact known hash, uses temporary code/executable files, and emits only numeric evidence. Fresh 1,025-sample run passed; wrong-firmware rejection verified before compilation. This is a portable research check, not the full human setup deliverable.

Crossfader update: packet bytes 15/16 map to Mixer::crossFader via constructor ID 0x00229b0c0c98ac94 and code-referenced consumer diagnostic. Decoder updated; eight tests pass, including all 1,024 raw values. Audio assignment and attenuation curve unverified.

TX mapping update: transmit uses CRC over 104 bytes with stored checksum at 104–105; receive uses 96 bytes with stored checksum at 96–97. Added explicit tx direction to inspector; nine tests pass. Outgoing helper regions located, but command semantics and physical transport remain unresolved.

TX record update: located four conditional 32-bit payloads at 88/92/96/100 and four 12-byte records at 40/52/64/76, gated by byte 39 bits. First getter consumes an internal pending flag, so absent updates must not be interpreted as zero-valued controls. Record semantics still unknown; state writers are next.

TX tooling update: inspector preserves pending-update semantics with null for absent records and numeric zero for present zero. Exhaustively tested all 256 flag masks; ten tests pass. Direct callers of both state getters confirmed; semantic record names remain unresolved.

TX source identified: all four outgoing record source objects are PlayerInfoReciever, proven by constructor vtable writes at the exact getter offsets and validated RTTI. Four atomic notification methods mapped separately from packet availability bits. Numeric field meanings remain open; listener bindings and remaining virtual methods are next.

Player-info setters: first outgoing update uses an overwriteable latest-value slot with a consumed pending flag, not a queue. Traced which stored field supplies its serialized 32-bit value. Second record setter stores a 13-byte logical record but its getter has extra merge behavior. Virtual bindings remain the next naming lead.

Player-info interface route: identified IMixer primary slot 7 (byte offset 56) accessor at 0x21301e8, returning this+32+152*index for indices 0–3. Own diagnostic confirms name. No direct BL callers; follow indirect slot-7 bindings/devirtualization next.

Binding search: no direct address-materialization candidates for playerInfoReciever. Disambiguated nearby 0x2130650 as Mixer's IHuiButtonObserver callback with two recognized IDs, not a player-info setter. Continue via virtual interface references; avoid proximity-based naming.

Shift dependency resolved: the two IDs cached by Mixer's button observer are Deck<0>/Deck<1> Shift, proven by consumer diagnostics. Primary and secondary-interface callbacks write the same full-object +23/+24 bytes. Preserve these modifier states when building controller input; downstream uses still untraced.

Shift path complete through TX: cached Deck<0>/<1> Shift states are forwarded in outgoing byte 24 bits 1/0. Decoder updated; eleven tests pass. Actual hardware action in response remains unknown, so software-mixer modifier behavior is not yet implemented.

TX field source finding: part of outgoing region+24 reads HuiLed objects (validated slot-3 target), not DSP parameter objects. First two sources pack three-state values into packet byte 26. Exact light identities unresolved; trace LED registrations next.

LED registration route: resolved the two IDs feeding TX byte 26 bit pairs, accounting for TX constructor's +8 subobject offset (RX used +16). First consumer requests provider selector 8. Physical LED names still unresolved; follow selector definitions next.

### LED provider lookup resolved
- Traced caller 0x20eb790 through constructor 0x207e1f8 and RTTI: provider is indicator_control::IndicatorControl.
- Verified slot-0 lookup 0x207af98 searches group tag 255 and indicator selector field +104; not a selector-indexed array.
- Confirmed second outgoing LED uses selector 7, first selector 8. Physical names remain open.
- Saved three new disassembly artifacts and details in analysis/HARDWARE-MIXER.md. Next trace indicator/group construction rather than guessing light names.

### Browser indicator group traced
- Group tag 255 is browser::IndicatorController; constructor creates eleven IndicatorKind objects (0–10).
- Followed selectors 7/8 to GUI source offsets +24/+32 through helper 0x204d570; physical labels still unresolved.
- Preserved population and binding disassembly. This rules out interpreting those particular TX fields as audio-processing parameters.

### Named browser-to-TX indicator routes established
- Selector 7 / TX26 bits2–3 binds TagListView; selector 8 / TX26 bits0–1 binds PlaylistView.
- Verified literals in global initialization and corrected earlier “source state offsets” interpretation: these are stored view-name strings at 0x3baf680/688.
- Remaining: updater active-view matching and LED enum interpretation; no hardware validation claimed.

### BrowserMode normal-path decision traced
- View-name bindings use browser::BrowserMode, callback 0x204c7b8.
- Matching configured view or matching flags selects internal state 2; otherwise 1, submitted to indicator+56 under the state helper's locking path.
- Internal-state-to-HuiLed translation remains open. Corrected exploratory vector-helper filename interpretation.

### Indicator-to-HUI conversion mapped
- Identified hui::IndicatorConnector and its registered IHuiLedIndicationSource callback.
- Verified state 1/2 preservation in callback output, other states ->0, with separate color and null handling.
- Getter includes override objects; base stored state alone cannot establish steady hardware output. Saved full getter and connector evidence.

### Timed indicator overrides characterized
- Override duration uses clock elapsed /1,000,000; zero duration is indefinite, exact expiry boundary is inactive.
- Two-phase state selection uses elapsed modulo period, midpoint included in first phase.
- Validated scaling arithmetic across 10,011 signed cases; no firmware runtime timing claim.
- This is indicator behavior, not evidence about waveform rendering flicker.

### HUI cache-to-packet path completed statically
- TX reads cached state; separate HuiLed slot7 refreshes it from IndicatorConnector.
- Added named PlaylistView/TagListView raw fields to packet inspector.
- All 12 tests pass; new coverage checks every byte26 combination. Refresh scheduling and physical timing remain unverified.

### Original LED cache execution verified
- Added reusable hash-gated ARM64/QEMU harness for original cache writer/getter.
- 32 cases passed, each including an identical repeat; zero mismatches.
- State3 preservation confirmed at cache layer only; downstream packet validation differs.
- Firmware code pages remain temporary/private. Scheduler and optional adapter still untested.

### TX refresh ordering resolved and interpretation corrected
- TX helper invokes HuiLed slot7 synchronously immediately before slot5 readout for PlaylistView and TagListView.
- No separate refresh-thread dependency demonstrated on this path. Prior cache discussion must be read with this correction.
- Refresh return ignored; unsuccessful refresh can leave cached value. Actual packet cadence still unmeasured.

### Packet production timer located
- SubCpuCommunicator HuiTimer callback builds txBuffer then submits it through transport slot6 on success.
- Startup passes configured integer +104 to HuiTimer start; three direct startup callsites identified.
- Mixer-specific wiring and configured interval are next; no cadence measured yet.

### Mixer-specific communicator configuration resolved
- Device /dev/subucom_spi3.0 wired to verified mixer RX and TX constructors.
- Config+12=3 copied to communicator+104 and passed to HuiTimer start.
- Actual interval units/cadence not verified; config+16=128 and config+8=1 recorded without guessing latter meaning.

### Mixer interval units confirmed
- Timer pool adds configured interval to a clock that computes seconds*1000 + nanoseconds/1,000,000.
- Mixer requests3ms; nominal frequency is not a measured delivery guarantee.
- Located CallTimersMessage callback0x21fc620 for dispatch/overdue behavior follow-up.

### Overdue timer behavior established
- CallTimersMessage reaches dispatch0x21f6a20; due timers reset to full period before callback.
- Missed periods are coalesced in the normal dispatch path, not replayed individually.
- Actual jitter, contention and message-thread scheduling still unmeasured.

### Timer contention branch identified
- Confirmed pthread try-lock semantics; failure routes timer message toward manager instead of executing due callbacks.
- Posting result ignored; successful-dispatch flag clear is bypassed on this branch.
- Recovery guarantees/queue details not yet established; saved exact path for continued analysis.

### Pending timer-message recovery threshold resolved
- First due-message post sets pending flag and now+300ms deadline.
- Pending messages suppress ordinary posting; strictly after deadline the same message can be reposted.
- Retry branch does not advance deadline, so do not claim retries are throttled to300ms.
- Queue duplicate behavior and actual producer cadence remain open.

### Message posting modes distinguished
- Backend predicate selects async task wrapper/submission or direct message callback.
- Corrected unconditional “deferred” interpretation of timer contention path; active mode unproven.
- Reference count handling is not deduplication; downstream queue still needs tracing.

### Concrete HUI task-box posting policy verified
- HuiMessageThreadTaskBox slot5 always returns true: async branch for that backend.
- Submission allocates another40-byte AsyncMessage around task; full allocation/queue cost not measured.
- Actual manager backend installation remains to be traced before applying this unconditionally.

### Task-box ownership corrected; submission tail traced
- Verified AsyncMessage submission returns to the generic manager posting entry; no final queue insertion established.
- Verified HuiJog constructs an embedded HuiMessageThreadTaskBox at +8. Do not assume this is the manager backend or count its wrapper allocation as per-mixer-tick overhead.
- Saved focused disassembly and table xref script/results; next trace actual manager backend assignment and remaining task-box constructor callers.

### Actual AZ message-manager backend traced
- Normal owner+408 / singleton construction installs meow::AsyncTaskBox at manager+16, not the jog's HuiMessageThreadTaskBox.
- Constructor receives2048 and preallocates2049 64-byte nodes; effective capacity/overflow still unverified.
- Next inspect actual backend predicate, submission and consumer before quantifying timer allocation overhead or queue congestion.

### Queue growth and same-thread dispatch established
- Actual AsyncTaskBox predicate compares pthread_self with registered thread identity. Normal epoll timer producer takes inline postMessage execution.
- Free-list exhaustion allocates another64-byte queue node;2048 is preallocation, not a proven hard limit. No payload dedup in enqueue helper.
- Corrected per-timer queued-allocation assumption. Next inspect inline failed-lock retry/reentrancy and task execution/consumer scheduling; still no measured waveform cause.

### Event loop ordering and queue drain mapped
- epoll timeout requested1ms; timers checked before manager queue drain, then fd handling.
- Normal consumer executes task slot2 and pops again without a visible per-item time/count budget. Long work can delay the next timer pass; actual occurrence and waveform linkage unmeasured.
- Saved disassembly and concrete timing probe addresses. Cleanup slot0 is distinct from execution slot2; do not assert enqueue-failure execution.

### Original queue execution probe passes
- Added private-firmware hash-gated runner and source-only harness; original push/pop with counted allocator substitute.
-9000 FIFO pushes/pops pass, repeated payloads preserved;3000 growth allocations in first batch, zero extra in next two batches.
- No concurrency or real-player timing claim. Next useful expansion is concurrency/tag-wrap verification or bounded runtime timing instrumentation.

### Concurrent queue probe passes
- Four producers and one consumer execute original ARM64 push/pop under QEMU:200000 values, exact per-producer order and no loss/duplicates.
-7159 dynamic nodes allocated in this scheduling-dependent run. No claim of exhaustive ABA safety, native-hardware latency or waveform relevance.
- Preserved single-thread harness; added separate concurrent runner, source and JSON result.

### Runtime host-thread baseline collected
- Two bounded AZ Source-screen probes with/without null ALSA completed and stopped normally.
- Dummy audio path consumes~96% one host core; without it no JUCE ALSA sampled. HUI~4.23% in both short observed spans.
- Saved raw profiles and summarizer; avoid attributing dummy sink cost to native Pi performance. Need clocked/paced audio and playback workload for useful latency testing.

### Null sink transfer loop verified; stability caveat captured
- Opt-in audio trace confirms>=100000 readi/writei64-frame transfers and immediate-ready wait calls in bounded probe.
- Probe exited before screenshot; cause unknown, old launcher omitted returncode. Added returncode to future output; do not call this a stability pass.
- Next capture configured rate and pace only diagnostic output; pacing not implemented yet.

### Paced null audio harness works in bounded run
- Added guarded PACED_AUDIO opt-in; accepted rate44100Hz drives absolute monotonic output pacing.
- Player alive at capture. Audio host CPU5.6% vs unpaced95.78%; saved raw profiles and trace.
- Harness correction only, not native performance claim. Next local playback/callback timing; prior trace-only early exit still unexplained.

### CDJ-3000X paced audio configuration verified
- Fixed missing asound.conf bind target that prevented initial launch; retry alive at capture.
- Accepted96000Hz stereo,64-frame writei,~4.28% one host core during short observed audio span. Differs from AZ44100Hz configuration.
- Saved raw/summary profiles, trace and consolidated PACED-AUDIO.md. Playback and DSP remain unverified.

### Local media discovery lead mapped
- Shipped scripts mount /media/usb/<device> then notify custom /proc/udev_usb1/2 endpoints with mount path, filesystem and protect flag.
- AZ and CDJ use different hardcoded bus IDs. Need logical-port translation, not literal Pi bus emulation.
- Saved LOCAL-STORAGE.md and script hashes; next inspect executable notification reader/parser and synthetic fixture. No shipped mount scripts executed.

### Executable USB registration chain found
- Verified USB1/USB2 proc paths paired with internal codes0/1, SD3 and NFS4.
- Connection/mount prefixes passed alongside path entries to0x21ba400; object stored owner+64.
- Saved xref/disassembly evidence. Reader/poll/parser still needs tracing before fixture implementation.

### StorageMountDetector read contract identified
- RTTI and constructor identify timer-driven detector; scans reopen each configured proc path, set nonblocking, read<=4095 bytes, close.
- Static-file replay and FIFO blocking are concrete fixture concerns; prefer narrow queued-response shim after parser audit.
- Saved constructor/timer/reader evidence. Exact interval and event result handling still open.

### USB notification classifications mapped
- Ordinary mount/umount/connect/disconnect produce1/2/3/5; no read/unknown gives0. Combined connect+mount has additional result4 path, not fully audited.
- Mount/unmount retain full input for downstream parsing. Reader does not acknowledge/truncate; fixture must consume pending events itself.
- Saved parser/prefix-helper disassembly. Next result1 payload handling and isolated fixture.

### Synthetic USB1 discovery succeeds
- Isolated read-only generated tone directory plus one-shot proc notification adapter.
- Running AZ visually recognizes USB1/Local Library; screenshot preserved. Both decks Not Loaded.
- Next local-source navigation and tone loading; playback not yet verified.

### Navigation harness added; second probe crashed
- Private XTest click helper plus LAB_CLICK. Local Library click no observed transition, process alive.
- Arrow attempt exited139; systemd core actual child4157129, Shutdown thread SIGSEGV. Input causality unproven, no OOM evidence in checked journal.
- Next inspect shutdown/guest fault and event timing. No track loaded yet; USB discovery result remains valid.

### Crash follow-up: no root cause yet; no-click control alive
- Inspected full host core thread backtraces; stripped QEMU frames do not locate guest fault. Temporary extracted core deleted.
- New no-click traced USB probe alive at capture. Both events present, no guest exit/SIGSEGV found in selected trace search.
- Next readiness-based input with immediate liveness evidence, then guest debugger if reproducible.

### Ready-screen navigation and WAV discovery verified
-60-second controlled run: USB1 arrow then Local Library selection/double-click opens BROWSE.
- Screenshot lists generated LAB-TONE-440Hz.wav with00:10 duration; input API calls succeed. Player alive at scheduled teardown.
- Late track click hit already-closed display, not crash. Next load tone into deck; playback still unverified.

- Deck-load research: recovered all four exact HUI IDs and RX dispatcher members; statically mapped deck3/4 to packet byte33 bits3/2. See analysis/DECK-LOAD.md. Deck1/2 fields, event polarity and successful playback remain open.

- Verified default HuiButton transition suppression (cached state +216, pending byte queue +160/+176), and GUI load-ID routing to common helper 0x19d8cd0 with indexes0–3. Need GUI enum conversion/common-helper semantics and runtime load test; see DECK-LOAD.md.

- Corrected GUI common-helper interpretation: 0x19d8cd0 likely forwards to MIDI deck operators, not standalone file loading. Saved registry/accessor evidence in DECK-LOAD.md. Native load consumer remains unresolved.

- Native ITrackLoader interface located (object+216, vtable0x26cc428, request bodies0xa6d308/0xa6c808). Argument structures and caller unresolved. DragAndDropTrackLoader is a ProDJLink UDP listener, not evidence of touch drag support.

- Recovered explicit TrackLoader::execute signature via compiler diagnostic and linked it to async task0xa6e100/vtable0x26cc7a8. Located UsecaseTrackLoader construction/registration0xce607c. Selector meaning and upstream caller remain open.

- Native chain now confirmed by diagnostics: TrackLoader task -> doLoadTrack0xa6de20 -> LoadController::loadCommonProcessing0xa371f0. Identified track-ID validity gate and m_loadController pointer+232. See DECK-LOAD.md; runtime load remains open.

- Controller inline/task paths converge at0xa318a0; recovered mediaMountState.link() dependency and return-code3 gate before0xa24fe8. Browser USB visibility alone does not verify this gate.

- IMediaMountState candidate implementation resolved: MountProgressManager slot2 0xb46790 returns matched record+88, missing=-1; key matching0xb44c30 mapped. Meaning of state3 and runtime synthetic USB state remain unverified.

- Executed original media-record lookup under ARM64 QEMU:11 synthetic cases,0 mismatches. Verified key/discriminator interpretation; full-player media state and loading still unverified. Reproducer/results in analysis.

- Located MountProgress state2->3 at0xb3d54c, guarded by0xb26a90 and dependency setup; state3 matches loader gate. Actual fixture transition not yet observed.

### Deck 3 playback verified on PC
ERP secondary group0 selects deck3, group1 selects deck4 (screenshots deck3-select-play.png and deck34-selected.png). Group1 registrations confirmed at 0x2145848/+32 and 0x2145880/+40, IDs ending 01. Deck3 loaded after reselecting the browser row and repeating load3; earlier immediate injections did not load. Playback was requested after the loaded view was ready. Screenshot deck3-playing.png shows 00:09.659 and native waveform. Captured channels5/6 contain the complete 10-second 440Hz tone, identical L/R, other channels zero; report az-audio-deck3-tone-verification.json and archive first-deck3-output.f32le.gz. Deck4 playback remains unverified (load4 was sent after load3 changed page). Primary-selection return attempt occurred after scheduled120sec teardown, so it is NOT a runtime verification. Next run should load3/4 together from a ready selected row, await load readiness, then play both. No Pi performance or hardware mixer verification.

### Deck 3/4 concurrent playback and selection verified
Run PID49394,120-second isolated PC probe. Waited for SOURCE, entered Local Library, selected secondary groups0/1, waited for OneLibrary transient warning to disappear, clicked row, sent combined load mask3 using `send-mixer-load.py --deck 3 --deck 4`. Both tracks loaded (dual34-loaded.png). Separate play presses group0/1 started both native transports (dual34-playing.png). Channels5/6 and7/8 each emitted full10-second440Hz audio, peak0.04574585, identical stereo; channels1-4 and9/10 silent. Starts0.64sec apart match sequential button sends; overlap9.359977sec (az-dual34-overlap.json). Reports az-audio-dual34deck3-tone-verification.json and az-audio-dual34deck4-tone-verification.json. Primary buttons returned visible groups to decks1/2 (dual34-primary-return.png). Native touch4-DECK tab at343,34 renders four stacked lanes, order3/1/2/4 (dual34-four-deck-view.png). This confirms all four deck stereo-pair assignments across separate runs, not all four simultaneous playback, distinct-track isolation, external mixing, FLX6 output, or Pi realtime performance. Next: four simultaneous decks and distinct signals, then software mixer routing.

### Four-deck concurrent decode verified
PID53562 survived120sec probe; final running=true before deliberate teardown, screenshot_exit=0. All four decks loaded together with mixer mask15 from the ready browser row. Played groups0/1, selected secondary groups0/1, then played groups0/1 again. All four full10sec tones decoded on pairs1/2,3/4,5/6,7/8, with6.843515sec common active overlap. Each pair has identical L/R, peak0.04574585,440Hz energy fraction0.999999883. Auxiliary9/10 silent. Evidence az-four-deck-overlap.json, az-audio-fourdeck1..4-tone-verification.json; xdjaz/four-loaded.png and four-playing.png; full archive xdjaz/first-four-deck-output.f32le.gz. Same-tone fixture does not establish distinct-track crosstalk rejection; no hardware mixer/FLX6 audio or Pi performance claim.

## Actual outgoing mixer capture verified
Opt-in MIXER_TX_CAPTURE=1 (requires MIXER_FIXTURE) records only mixerfd ioctl0x40107000 payloads after header/length checks. ERP packets excluded. Maximum4096 frames (512KiB), private tmp file reset at launch, no network or hardware writes. Shim uses a nonblocking atomic capture lock; overlapping capture calls can be skipped, so this is not a lossless timing trace. Each frame incurs diagnostic file IO; do not use for performance measurements.

30sec probe PID58554 survived to scheduled teardown. All4096 captured128-byte frames pass independently reconstructed TX CRC over0..103 with stored104..105. Ten distinct frames; byte39 availability is0 in every frame, so no player-info update records were present in this idle capture. Browser indicator raw states changed0 to1; physical meaning remains unverified. Evidence analysis/az-mixer-tx-idle-capture.json and xdjaz/first-mixer-tx-idle.raw. This replaces synthetic-only checksum evidence with running-firmware TX evidence. Next capture during load/play with a later capture window to connect record changes to player state. Do not assume these are audio DSP commands.

## TX during deck1 load and playback
Raised opt-in capture ceiling to32768frames/4MiB to cover startup and manual navigation; remains diagnostic and unsuitable for timing benchmarks. PID60782 survived90sec then scheduled teardown. Saved25764frames, all CRC-valid, to xdjaz/first-mixer-tx-playing.raw. Reusable summarize-mixer-tx.py writes frame-indexed updates and byte-change counts; report az-mixer-tx-playing-capture.json.

Observed first record for all four slots starts[0xffffffff,10000,0]. Only deck1 was loaded. Its record changes to[0xffffffff,10000,6], then[15000,10000,6] when analysis/UI shows150BPM; play changes third field to3; end-of-track changes it to17. Word-update slot0 emits400 on24 occasions during playback, separated by roughly126..132captured packets. Other word slots stay absent. Cue attempt was after teardown and failed, so no cue-state meaning is verified.

Hypotheses, not final field names: first record word is BPM*100 with unknown sentinel0xffffffff; second is tempo ratio*10000 (matches static scaling and nominal1.0); third is a transport/state bitmask or enum; standalone400 word could be beat interval milliseconds (60000/150), with periodic emission consistent with beat events. Need second BPM and pitch change, plus callback/type evidence, before naming fields in parser. This narrows player-info roles but does not show DSP coefficients or effects implementation. Screenshots tx-loaded.png and source/browser readiness preserved.

## Native tempo path located
See analysis/TEMPO-CONTROL.md: named tempoSlider ID resolves to deck-ucom dispatcher+104 and packed10-bit values at packet16..19. Runtime injection pending transport/validator and event conversion verification. This is the next route for testing mixer tempo-field hypotheses.

## Deck validator and immediate dispatch
Validator0x213bdd0 compares supplied length to0x98=152 at0x213bde8. With verification enabled it computes CRC16 over38bytes (count supplied0x213befc via688878), using0x8408 table constant at298d8e0, initialffff/final complement, and compares to LEu16 at38 (0x213c0d4). CRC excludes bytes40..151. Receive entry0x2137e88 calls validator with flag1; zero versionLEu16 at0 enters diagnostic path at2137eb4. Nonzero normal path dispatches tempo using packet base unchanged at2137f1c..f24. Verification-disabled validator branch zeroes buffer; it must not be used as an acceptance shortcut.

Read-only inspector az_deck_packet.py captures size,version,CRC and packed tempo event words. Its static source does not constitute original-code execution or transport verification. Saved validator disassembly az-deck-validator.asm (first region); checksum tail inspected0x213c080..c140. Next identify deck fd/driver configuration and slider adapter semantics, then original-code/runtime verification.

## Transport construction and converter identified
Constructor0x2100aa8 loops twice. Index0 selects `/dev/subucom_spi5.0` (branch0x2100afc to0x2100c3c uses x24); index1 selects `/dev/subucom_spi2.0` (x23 at0x2100b00). At0x2100b24 sets buffer152; config constant0x2e33a30 is(1,4);0x2100b64 constructs deck dispatcher with current index, and0x2100ba8 wires shared SubCpuCommunicator. Full driver config semantics still require checking shared transport interpretation; do not copy mixer's single global config state for multiple devices.

Tempo adapter RTTI is `device_adapter::TempoSliderConverter`, address-point0x2e4ea20, conversion slot2=0x216bff8. It reads event words+4/+8 (packet b/a scaled64). On first valid event it initializes cached pair and computes output. With a=position and b=reference as provisional functional descriptions: for scaled a<=b output is negative bound*(b-a)/(b-768), clamped to bound when difference exceeds denominator; for a>b positive bound*(a-b)/(64767-b), similarly clamped. Bounds constructor -1/+1. Subsequent calls use stateful thresholds: constructor+40=96,+44=48 and comparisons adjust cache when difference reaches threshold. Therefore a stateless linear map does not reproduce this adapter. Unsigned underflow/domain edges and exact hysteresis behavior still need original-code tests. Named percentage/range and physical calibration not yet established.

Next implement original converter execution tests (code spans0x216b000/0x216c000), then independent per-fd deck FIFO/config state. No native tempo UI change is yet verified.

## Original tempo converter executed
run-tempo-probe.py hash-checks supplied EP147, extracts executable pages0x216b000..0x216cfff into temporary storage, compiles a static ARM64 harness and executes original unpatched0x216bff8 via QEMU. Mapping uses a checked address hint, not MAP_FIXED. All1024 fresh positions at reference512 match piecewise scaling within1e-7;0mismatches. Raw0/12 produce-1,512zero,1012/1023+1. Full sample CSV and report az-tempo-converter-execution.json preserved.

Stateful sequence observed:512,513,512,511 all retain0;510 gives-0.0025;511/512 retain it;514 gives+0.002500078;513/512 retain it. Sequence is observed evidence, not a full hysteresis correctness assertion. Confirms that tiny input changes can be deliberately ignored. Scope uses valid events, constructor bounds-1/+1,threshold96,adjust48,reference512 only. Does not test invalid/calibration-edge references, native tempo range selection, real hardware, or full-player injection. Next add independent deck FIFO channels with152-byte transport and use reference512/position768 as a moderate positive test.

## Native tempo injection verified
Opt-in DECK_FIXTURE=1 adds private group0/1 FIFOs for spi5/spi2;152-byte writes and independent configuration per mixer,ERP,and each deck. New send-deck-tempo.py encodes version1,position/reference10bit values and CRC0..37 at38. Group0 center512 then768 changed actual loaded deck1 UI to+5.10%,157.7BPM;256 later produced-5.15%,142.3BPM. Native converter hysteresis explains why the two magnitudes differ after sequential input. Screenshots xdjaz/tempo-positive.png and tempo-negative.png. PID71823 survived120sec until scheduled teardown. This validates full receive/observer/tempo UI path, not physical FLX6 or audio pitch quality.

TX record first word stays15000 as speed changes; second changes10000->10510 (speed ratio1.0510). Repeated word updates stay400 during accelerated playback, so prior possible interpretation as current beat period is rejected. It may represent source-grid interval; needs another base-BPM track to prove. Report az-mixer-tx-tempo-capture.json, private capture xdjaz/first-mixer-tx-tempo.raw. Next real-output pitch/duration measurement and other group/deck mapping, plus distinct base-BPM input for record semantics.

## Audio speed and pitch verified at +5.10%
ProbePID75889 with DECK_FIXTURE and AUDIO_CAPTURE: centered raw512, selected/loaded tone, raw768, inspected UI+5.10%/157.7BPM, then played once. check-tempo-audio.py measures9.514852608sec active output (expected10/1.051=9.514747859sec),462.4400754Hz (expected440*1.051=462.44), identical stereo; other8channels silent. Duration difference~0.105ms, measured frequency difference~0.000075Hz. Supports actual speed/pitch change through native player pipeline. No pitch-preservation/master-tempo claim; current result is rate-changing playback. No music-quality, glitch-free realtime, or Pi performance inference from sine. Evidence analysis/az-tempo-audio-verification.json and xdjaz/tempo-audio-loaded.png.

## Master Tempo button mapped; first test hit startup crash
Named link IDa6b7444dca1b6d00 at6ccb98..6ccbb4, diagnostic masterTempo at6ccc14. ERP registration2145268 places button at group+152; decoder2143214..2143220 maps this to group byte0 bit3. Added --button mastertempo (packet8+8*group,mask8) to private ERP sender. Group0 static chain confirmed; runtime toggle remains unverified.

Attempt PID80154/guest80156 exited before UI with a core: SIGSEGV SI_USER, host thread Shutdown, unsymbolized QEMU stack. coredumpctl report az-master-tempo-startup-crash.txt. Memory15Gi available, no kernel OOM entries in ten-minute window. No input was sent to the guest before the crash, so no evidence implicates the new button mapping. Cause not established; no firmware/mixer fix claimed. Prior successful captures preserved. Next retry after launcher cleanup, then inspect actual Master Tempo toggle and audio.

## Master Tempo retry: no pitch-preservation result yet
RetryPID84026 survived120sec with successful final screenshot. First mastertempo packet was sent immediately after load/tempo actions; full playback still measured462.440075Hz/9.514853sec, identical to ordinary speed change. Thus button mapping/runtime state is not yet confirmed. A second toggle after playback plus cue returned native UI to00:10.000, but second play occurred at scheduled teardown; do not treat it as a complete pitch-preservation trial. Evidence az-master-tempo-audio-verification.json (first playback), az-master-tempo-attempt-segments.json, xdjaz/first-master-tempo-attempt.f32le.gz. Next inspect button callback gating/actual master-tempo state and retry with time reserved after fully loaded UI. No claim of unavailable DSP based on this failed activation attempt.

## Master Tempo pitch preservation verified
Extended bounded launcher maximum to300sec; actual probe180sec PID87919 to allow both comparison playbacks. Loaded deck1 completely, set+5.10%, toggled mastertempo, played. First pass9.514852608sec with seven interior1sec windows462.43998..462.44008Hz. Toggled again after completion, cue then play; second pass9.515804989sec with seven windows439.99991..440.00013Hz. Source440Hz/10sec. This directly confirms both button-controlled rate-changing and pitch-preserving modes in native AZ audio under PC emulation. Initial toggle state must not be assumed across runs: fixture settings persist, and prior activation attempts did not establish state.

Evidence az-master-tempo-long-segments.json, check-tone-segments.py, xdjaz/mt-long-loaded.png and mt-long-second.png. Sine fixture does not establish transient/music quality, four simultaneous stretched decks, realtime Pi capacity, or FLX6 output. Next music/impulse tests and multi-deck cost, while continuing mixer implementation.

- Live host mixer snapshots implemented and synthetic stream verified (mixer/test_live_controls.py). Next: native AZ tone with live fader/cue changes, then authoritative shared control state for FLX6 and native indicator synchronization. Full effects and physical audio are still open.

Native AZ live control experiment verified: fader-down zeros master while pre-fader cue continues; cue-off zeros headphones while master continues; restoring both restores exact2:1 demo gain ratio. Four sample windows measured in analysis/az-live-controls-verification.json; archived PCM and control log in xdjaz/live-controls-*. Launcher ended143 without normal teardown report, cause unresolved; this is routing evidence, not stability evidence. Next: shared FLX6/native state and physical output.

- FLX6 XML-based host mixer state/replay implemented and tested. Still required: timed MIDI/device ingestion, assignment/pickup/reconnect policy, native navigation and indicator synchronization, hardware verification. Current replay defaults are lab settings, not complete BiteDJ equivalence.

- Native browser counter +/-1 now visually verified in focused track list. Next resolve native focus/enter/back/view so controller navigation does not depend on pointer clicks. Two-track fixture also enables later distinct-source audio isolation checks.

## Current priority: AZ controls and standalone usability
User shared Letacy feedback: prioritize AZ tempo faders, touchscreen Menu/Search, rotary browse encoder and related buttons. Treat shared codebase as a lead, not proof that fixing AZ automatically fixes 3000X. QEMU timing is host-emulation evidence, not Pi performance.

- Tempo: native AZ UI and audio rate change already verified in lab. Physical FLX6 input and remaining deck selection/ranges need integration verification.
- Menu/Search: inspect native AZ touchscreen behavior and identify missing prerequisites/handlers. Unverified.
- Browse encoder, press, Back, View: partial native lab tests exist; reliable automatic page-state handling and end-to-end FLX6 workflow remain unfinished. Preserve preferred BiteDJ semantics.
- Keep CDJ work secondary to AZ. Just saved live 3000X Play/Cue result: 64-byte ERP fixture starts MP3 and Cue returns to03:03.227. See analysis/cdj3000x-live-transport.json. No audio quality claim.

## AZ Menu/Search baseline observations
Run230007: pointer click Local Library opens raw Folder browser (3 files), where Search is absent. Top-left Back and USB icon clicks caused no observed navigation. Hardware Source packet byte32 bit7 successfully returns to SOURCE; gear pointer click then opens native Local Library waveform settings. This proves some native pointer settings work, not full Menu/Search support. Need an exported-library fixture and explicit Menu handler tracing. Evidence analysis/az-menu-search-baseline.json and screenshots.

## Full DSP and native interface integration scope
User explicitly requests full DSP, Sound Color FX and Beat FX pipelines, complete state and integration into the software mixer, and HUI EasyID/interface tracing for reliable injection without simulated touchscreen input. Preserve this full scope.

Required evidence before completion:
- Locate actual processing implementations in available RX3/AZ artifacts; separate hardware commands from host DSP. Record algorithm boundaries, parameters, units, ranges and defaults.
- Reconstruct channel signal order, EQ/isolator, CFX, Beat FX targeting, wet/dry, beat timing, quantize, microphone handling, bypass/tails, transitions and reset/load state. Do not substitute generic effects and label them faithful ports.
- Integrate processing and complete state into four-channel software mixer, master and cue routes. Verify independent channels and audible output against native reference where executable.
- Trace EasyIDs, observer registration/lifetime, thread/queue ownership, notifications and readback; establish reliable internal input route for buttons, encoders, sliders, jogs, menus/search and effect state. Screenshots alone do not verify an internal event contract.
- Test on PC first; Pi/FLX6 needed later for hardware audio latency, performance and physical mappings.

Initial evidence: analysis/az-effects-interface-inventory.json contains206 RTTI name candidates (includes templates/observers, not206 algorithms). Validated class layouts saved in az-effects-class-layouts.json: application BeatFx has ChannelSelect, Quantize, MicSelect and mixer BeatFx listener bases; separate device_adapter::mixer::BeatFx and TaskDrivenThread-derived Effector exist. Next trace mixer BeatFx virtual slots at0x2e42338 and application listener methods. No DSP port complete.

Export fixture test234073 copied existing export.pdb under isolated PIONEER/rekordbox; native browser remained EMPTY Folder view. This is an incomplete fixture/library-recognition investigation, not evidence Search is broken. Original export untouched.

AZ microphone label formatter0x1ceaf18 resolved:0=MIC1,1=MIC2,2=MIC1+2, updates utility row20. Caller0x1cefa00 has direct and allocated-closure queue paths, so callback injection must preserve ownership/threading. Row agrees with typed MicSelect UI listener; exact registration relation remains unverified. Evidence analysis/az-mic-label-binding.json and az-mic-label-selection.asm.

Typed microphone label chain now verified: MixerItemTableController MicSelect listener+144/vtable2c8a220 slot2=1cf3d08 forwards unchanged enum to1ceaf18. Thus MIC1 setting0→TX16=1, MIC2 setting1→TX16=2, MIC1+2 setting2→TX16=0. Static mapping only; microphone audio routing and safe injection API remain unverified.

Native BeatFxMicWidgetController action0x19ebcc0 maps three stored IDs at3b86458/460/468 to enum0/1/2 and calls setting submission0x19ebd70. Unlike raw state callbacks, this path validates0..2 (optimized validator850e38) before constructing update payload. Full submission queue and ID initialization remain to trace. analysis/az-mic-widget-native-action.json. No direct UI state mutation performed.

Mic setting submission traced to typed Setting::updateItem async task vtable2636300. Queued execute89dcb0 adjusts+24 then calls89d878, same helper as direct path. Invalid enum uses setting+40 fallback (not simple rejection); corrected action record. Scheduler predicate/concrete ownership and notification semantics still pending. DSP agent saved DSP-PORT-PLAN.md and begins isolated native IIR comparison next.

Mic update fanout89d600 resolved: skip excluded listener, virtual slot2 receives identifier/value, with optimized cached-setting callback864950. Existing unchanged value returns before fanout; changed writes then notifies when identifier nonempty. This constrains adapter echo suppression and refresh assumptions. Evidence analysis/az-mic-setting-notification-contract.json. Missing-item insertion and collection/reentrancy ownership still pending.

Mic widget action identifiers resolved at static initializer543940: mic1Button, mic2Button, micBothButton constructed via2344a50 into3b86458/460/468. These named identifiers must not be confused with numeric HUI EasyIDs or hardcoded runtime pointer values. Full named button→validated setting→queued/direct handler→listener mapping saved; live object discovery/invocation remains pending.

Native mic controller discovery narrowed: ctor19eb298,104-byte allocation, owner+16 holds instance and deletes old via virtual slot1. Constructor obtains setting via dependency virtual+320 into controller+40. Observe lifetime rather than scan/retain arbitrary pointers. analysis/az-mic-controller-lifetime.json.

First live mic-controller observation succeeded in bounded30sec guest262658(normal teardown): constructor19eb298 executes at startup, this preserved into setting lookup, returned storage x8=this+40 verified from CPU trace. MIC_CONTROL_TRACE opt-in added; no guest state writes. Evidence analysis/az-mic-controller-live.json/log. Actual invocation/object memory validation still pending. DSP IIR oracle independently reported bit-exact tests; full CFX Filter work continues.

Live GDB observation succeeded guest265596: breakpoint after ctor, both expected vtables29f22c0/29f2308, nonnull setting+40, and mic1Button/mic2Button/micBothButton runtime strings verified. Detached without action submission. LAB_GDB opt-in Unix socket added; no TCP exposure. See analysis/az-mic-controller-gdb.json/log and observe-mic-controller.gdb. Not performance evidence.

Native mic action attempt268351 failed before breakpoint: guest thread2.49 SIGSEGV atab8808; no call executed. No core found. Added exact-PC guard to debugger scripts so unexpected stops cannot lead to stale-register invocation. Retry required.

Native MIC2 action verified guest270522: guarded post-constructor GDB call19ebcc0 with mic2Button; setting vtable2633fd0 and initialcache2(Both) recorded. Call returned, CRC-valid TX16 transitioned0→2(MIC2). No simulated touch. Saved analysis/az-mic-native-action-verified.json and rawcapture. Physical mic/DSP routing and generic adapter pending. Lab setting nowMIC2.

Native action probe270522 completed normal bounded teardown. Added CRC-gated named beat_fx_mic_target decoder, preserving raw bytes and returningNone for unknown/corrupt. Fifteen packet tests pass including256 values+badCRC; archived native action capture decodes Both→MIC2. analysis/az-mic-target-decoder-check.json. Mixer audio routing not yet wired.

BeatFX target labels found in native debug combobox:4 Ch1,5 Ch2,3 Ch3,6 Ch4,7 Master,0 Mic1,1 Mic2,2 BothMic. Class has typed ChannelSelect listener and same setting getter virtual312. Need selection callback confirmation before final semantic TX decoder. analysis/az-fx-target-labels.json.

BeatFX target label chain statically verified: combobox creates enum+1 IDs, callback subtracts1 and validates0..7. Critical: TX18=0 collapses Ch1 and Mic1/Mic2/BothMic, so packet-only inverse is ambiguous. Native setting readback required for complete software mixer target. analysis/az-fx-target-labels.json and az-beatfx-routing-mappings.json updated.

Live native BeatFx state readback succeeded guest276782 at9960f8: validated application+setting vtables, ChannelSelect=7 Master and MicSelect=1 MIC2. Prior MIC2 action remains next startup. Establishes direct source for distinct target/mic state, not continuous observer. analysis/az-beatfx-state-live.json.

Startup faultab8808 traced to vtable dereference of deck-state object from16-byte record list; compared implementationac1498 belongs usecase::system::DeckState. Original register value missing, so null/stale/race not established. Enhanced all GDB unexpected-stop guards with key registers+all-thread bounded backtraces. analysis/az-startup-fault-analysis.json.

50sec continuous debugger probe280393 did not reproduce fault; guest alive at scheduled teardown, debugger remote closed then batchexit1. No new crash pointers captured, no stability fix claimed. analysis/az-guest-fault-probe.json.

Consolidated reproducible native-control probe commands and scope in analysis/NATIVE-CONTROL-PROBES.md. LAB_GDB/MIC_CONTROL_TRACE now verify exact EP147 SHA before launch; py_compile passes. This prevents known-address probes silently targeting a changed runtime. Full mixer graph integration under review with DSP agent.

Prepared F1 filter command parser in mixer/dsp_control.c/.h: channel0..3, Off/Filter type, normalized finite color/parameter, complete-message validation and no output mutation on rejection. Sanitized C parser checks pass for malformed, embedded-NUL, overflow and nonfinite input. Not wired to stream yet; DSP agent confirms graph API and atomic accepted/busy/invalid contract. Full FX control versions remain required.

Prepared compile-guarded F1 dispatch in mix_stream plus send_filter.py sender. Graph processing/build not enabled until new modules complete and reviewed. Existing default stream/control regressions pass (193frames fragmentation/reconnect, live fader/cue snapshots). F1 is a host normalized snapshot policy, not claimed native full-effects protocol.

Prepared DSP stream process/init/reset call sites behind LAB_DSP_GRAPH; terminal partial input padded64, actual frames written, graph reset on EOF. Dry default live controls and193-frame fragmentation/reconnect regressions still pass. Graph-enabled build awaits agent modules/composition results; not enabled in launcher.

Recovered14 AZ debug BeatFX type label/value pairs, including values14..16. Candidate callback validation<=13 conflicts; investigate before treating names as supported effects. analysis/az-fx-type-labels.json. No effect type injection attempted.

Confirmed BeatFxTypeComboBox callback18b9be0→18b9930 uses itemID-1; addItem uses stored pair+1; actual TypeSelect validator850e58 only0..13. Constructor pairs14/15/16 therefore remain suspect; intervening container copies/live behavior must be checked, normal hardware effect mapping separate.

DSP_GRAPH=1 MIX_STREAM=1 launcher option added for verified four-channel Off/Filter graph. End-to-end synthetic FIFO test passes14080frames, cue error3.7e-9 and master Filter difference RMS0.01865; request during transition rejected. Same-block requests before transition may supersede, as native manager does. AZ probe295341 emits finite silent audio through graph and accepts F1 atframe666624; song-through-effect remains unverified. analysis/az-dsp-stream-launch.json. Full FX/native setting integration still pending.

AZ DSP song probe297825: native encoder pulses selected Local Library, counter2 selected MP3, deck1 Load and ERP Play; no pointer input. Screenshot dsp-song-playing.png shows02:53.887 remaining and populated waveforms. Dry/Filter 132288-frame windows finite/nonzero with exact2:1 cue/master lab routing; F1 accepted atframe2563776. Saved compressed windows and analysis/az-dsp-song-verification.json. Windows are different song segments: do not infer frequency response from RMS ratio. Synthetic matched-input Filter test remains effect-behavior evidence. Pi/physical listening/native UI-to-effect sync unverified.

Channel/headphone native interface inventory extracted: az-channel-control-vtables.json and methods.asm. Channel slot3 identified select(InputSource) by original diagnostic; slots2/headphone2/3 are byte setters with semantic labels pending. No SoundColor/CFX names in demangled RTTI candidates; insufficient to prove absence or hardware-only implementation. az-channel-control-interface.json. Next trace typed callers/TX serialization before mapping to software graph.

Typed listeners mapped: CrossFaderAssign0..2→[1,0,2] at26cf748 to interface+40 slot2; HeadphonesMonoSplit0/1 pass through slot2; LinkVolume0..3→[3,2,1,0] at26d5438 to slot3. Original listener base offsets/thunks/identifier checks saved az-channel-headphone-settings.json and disassembly. Concrete constructor identity, TX fields and display labels still pending; no direct callback mutation or DSP gain interpretation.

Native TX routing fields established from ctor+builder: four Channel objects640/736/832/928, +8 → TX6 two-bit lanes6/4/2/0. HeadphoneOut vtable2e420f8 atMixer1296, +8→TX8bits6..7, +9→TX9. Added raw decoder channel_assign/headphone_settings;16 tests pass including256byte extraction. Typed application constructor identity/display enum labels/live audio behavior remain next. az-channel-headphone-settings.json and az-mixer-tx-routing-builder.asm.

Named routing UI paths verified statically through global identifier initializers and action callbacks: CrossFaderAssign A enum0/raw1, B enum2/raw2, THRU enum1/raw0; Headphones MonoSplit enum1/raw1, Stereo enum0/raw0; LinkVolume -9/-6/-3/0dB enums0..3/raw3..0. Stored native controller/action/update entry points in az-routing-native-buttons.json. Runtime constructed JUCE names, not numeric EasyIDs; live injection/thread lifecycle still pending. Link Volume signal path not established, so do not change global headphone gain.

Live native headphone action verified PID311450 atpostctor19c2fe4: validatedcontroller/listener/setting vtables and exact JUCE identifiers; cachebefore0Stereo; mono action1a03a70returned. CRC-validTX8mode transitions1→0→1 during startup/action, no badCRC in saved capture. az-headphone-mono-live.json/log and headphone-mono-native-tx.raw. Private lab nowMonoSplit; physical/software mono audio behavior unverified. RestoreStereo next guarded probe.

Headphone native reverse action PID313878 verified: cachebefore1 proves priorMonoSplit persisted; Stereo action returned, TX mode1→0 with validCRC. Saved az-headphone-stereo-live.json/log and headphone-stereo-native-tx.raw. Private lab restoredStereo. Added CRC-gated routing_settings semantic decoder using verified label maps;17 packet tests pass, including1024 mode/link combinations and corrupt/unknown values. No mixer audio policy changed.

Shared native/FLX6 state groundwork: MixerState.native_routing accepts CRC-valid inspect_tx snapshots, translates A/B/THRU atomically and preserves all existing MIDI gains/cue/position. All81 assignments tested plus corrupt/unknown lanes. Compiled C mixer endpoint isolation passes; saved FLX6 tests pass. No automatic transport wired; headphone mode/LinkVolume audio not implemented, crossfade curve still lab equal-power. mixer/test_native_routing.py and README record scope.

Opt-in NATIVE_ROUTING launcher mode wires fresh TX capture→live_routing single owner alongside complete MIDI datagrams→M1 audio mixer. Real probe320174 starts bridge and M1 accepted atframe764096 after injected FLX6 fader/cue messages. test_live_routing.py passes fragmentation, interleaved state preservation, CRC rejection, capture reset termination. Capture capped32768frames, so continuous transport remains required; physical MIDI/LEDs and live assignment UI change not tested. az-live-routing-launch.json.

Continuous TX groundwork: opt-in LAB_MIXER_TX_STREAM shim emits128-byte Unix datagrams to/tmp/mixer-tx.sock, nonblocking/no retries/atomic try-lock. ARM64 compile succeeds. Host transport harness exercises missing receiver,100000 sends with full queue(0.016s), drain/recovery and boundaries. live_routing --datagram receive mode added; file follower regressions pass. Datagram end-to-end test and launcher switching still pending; installed shim remains prior build. This replaces capped-capture dependency only once wired/verified.

Continuous NATIVE_ROUTING_STREAM wired into launcher and rebuiltARM64shim. Datagram receiver40002packet test passes beyond32768capture cap with3bad packets rejected/MIDI state preserved. RealAZ325500 received9225valid/0bad and M1 accepted, exposed deadline race; fixedbridge duration+30. Retry327308 received nativeTX and scheduled screenshot/routing/mixer teardown succeeded. az-continuous-routing-verified.json. Datagram drops permitted on full queue; routing snapshots recover, not lossless event transport. Physical/controller/Pi and livecrossassign UI tests pending.

Native crossfader end-to-end PID330290: postctor19f4e7c(x20), expectedcontroller/listener/setting vtables and button identifiers validated. Beforeenum1THRU; nativeaButton returned; TXlane0→1 mappedA; livebridge emitsassign[-1,0,0,0];DSPstream acceptsM1frame107584. az-crossfader-a-live.json/log and nativeTXcapture. No manual assignment/fake touch. Labchannel0A; restoreTHRU next guardedrun. Physical/audio-live behavior remains separate.

Crossfader reverse/persistence verified PID332575: cachebefore0A survived restart; bridge emitsA ataudioframe15296 then nativeTHRU action updatesbridge andM1at107008.6354validTX/0invalid, all subprocesses clean. Private lab restoredTHRU. az-crossfader-thru-live.json/log/raw. NATIVE-CONTROL-PROBES.md consolidated commands/addresses/semantics with physical and production limits explicit.

RX3 headphone DSP static map: HeadPhoneupdate5a580, lookupmixcurves256entries and5independent smoothing blocks. Mode change fadesgain0, swaps requested+200→active+204 atblockend, fadesgain1. Active0 branch sums sources into separate sides; nonzero mixesstereo. AZMonoSplitenum1 must NOT be copied directly. Calibrationnegativeconstant/runtimegain unresolved; no naive gain port. rx3-headphone-stage-map.json plusupdate/constructor/setters.asm. Native oracle required next.

### RX3 headphone setter oracle expanded
- Reconstructed all four headphone setters: level, mix, master cue and stereo mode.
- Executed original ARM instructions at 0x5ad4c..0x5af18 with original tables mapped at their expected address; no instruction patches.
- 96,000 calls: full 256-byte state comparisons pass on ARM, x86 replay and ASan/UBSan.
- Normalized knob inputs and finite normal ramp fixtures only. Lookup values remain firmware-derived; no sample processing/calibration equivalence claim.
- Evidence: `analysis/headphone-oracle/setter-results.json`, runner and README.
- Next: audio-update/ramp/mode-transition composite oracle; keep physical headphone calibration unresolved until verified.

### RX3 headphone audio update reconstructed
- Native ARM update range 0x5a580..0x5aa28 compared to independent C; only external output-buffer lookup BL replaced by fixture.
- 24,000 persistent blocks / 1,519,905 stereo frames: full state and output-buffer comparisons pass ARM, x86 replay and ASan/UBSan.
- Covers stereo/split paths, per-sample ramp updates, block-boundary mode transitions, finite randomized state and -1..128-frame blocks.
- Original calibration reproduced in oracle; physical suitability, constructor initialization, missing-device paths and setter/audio composite remain open. Not integrated into live mixer yet.
- Evidence: analysis/headphone-oracle/audio-results.json and run_audio.py.

### RX3 headphone combined control/audio lifecycle
- 48,000 interleaved setter/audio blocks, 3,015,873 stereo frames, zero state/output differences on ARM, x86 and sanitizers.
- All four actual native setters linked with original audio routine; independent portable state persists for 32 calls per fixture.
- Constructor static map: ordinary smoothing 3.3ms, mode smoothing ~10.15873ms, unsigned sample-rate derived lengths clamped to minimum1; initial RX3 stereo mode1, mode gain1, other gains0.
- Remaining: constructor oracle, missing-device branches, physical calibration and shared mixer integration.
- Evidence: analysis/headphone-oracle/lifecycle-results.json, run_lifecycle.py and README.md.

### AZ native headphone mode delivery prepared
- Added native_headphones.py: CRC-valid TX settings -> explicit H1 stereo0/mono_split1. No fabricated default or Link Volume gain assumptions.
- live_routing.py opt-in --headphone-control emits H1 independently of unchanged M1 FLX6 routing state. Default remains disabled until receiver support exists.
- Verified all 1024 mode/link combinations, checksum corruption, repeated/unknown modes; existing file/datagram routing tests pass (40,002 continuous valid TX records).
- Replayed actual native AZ mono/stereo captures through live Unix datagram bridge: native transitions delivered as H1; simultaneous MIDI fader preserved; sockets cleaned up.
- Evidence analysis/az-headphone-delivery-results.json and mixer/test_headphone_delivery.py.
- This is control delivery only; H1 receiver and headphone audio integration remain open. Agent owns dsp_graph/mix_stream Echo integration and will expose separate master/cue buses for headphones.

### AZ headphone DSP module prepared for graph integration
- mixer/headphone_dsp.c/.h contains reconstructed per-instance RX3 headphone processing, private lookup tables provided at init, no audio allocation/I/O/global mutable state.
- AZ mode0stereo/1split translates explicitly to RX3 mode1stereo/0split.
- Resolved split gain initialization: RX3 global ctor11ae0..11c54 writes float2(.5,.5) at1149680; saved rx3-headphone-global-init.asm. This averages summed stereo sides.
- Independent original ARM comparison of shared module API:48,000 interleaved blocks /3,088,640frames, zero full-state/output differences x86 and sanitizer replay.
- Evidence analysis/headphone-oracle/module-results.json, run_module.py.
- Original negative output calibration remains explicit; module not yet enabled in AZ graph. Agent exposing master/cue buses while integrating Echo.

### AZ headphone graph and stream integration
- Optional LAB_HEADPHONE_DSP graph path uses separate master/cue buses with or without Echo. Native AZ H1 mode maps into recovered DSP; M1 level/mix updates reach its setters.
- Preserves mode on FIFO reset; explicit caller-provided output calibration, private tables loaded once at startup. LAB_HEADPHONE_TABLES and LAB_HEADPHONE_SCALE required to enable. Default path unchanged.
- Graph tests normal+ASan/UBSan pass stereo/split, reset, master fader/cue isolation. Existing Echo FIFO regression passes with delayed energy .122349 and cue error0.
- Runtime H1 receiver test:7,680 synthetic stereo frames, all3 changes accepted; phones stereo(.4,.7)->split(.4,.15)->stereo(.4,.7), master(.2,.1) unchanged.
- Evidence analysis/az-headphone-stream-results.json, mixer/test_headphone_graph.py, mixer/test_headphone_stream.py.
- Not yet enabled in launcher or verified with actual AZ song playback/physical outputs. Remaining HUI/native interface coverage and all other effects remain open.

### Actual AZ native headphone chain verified
- Added explicit HEADPHONE_DSP launcher opt-in with validated private table path and output scale; live bridge H1 forwarding enabled only with receiver support.
- Actual AZ PID367591: guarded native Stereo action returned; valid TX mode1->0 became H1 accepted at audio frames0/15040.
- 8,732 valid TX records, zero invalid;1,157,760 frames processed. Launcher/mixer/routing completed cleanly after bounded45sec run.
- PCM was silent (no song loaded): proves live control/receiver integration, not audible performance. Private setting remains Stereo.
- Evidence analysis/az-headphone-integrated-live.json and saved native/mixer/routing logs.

### Actual AZ MP3 through headphone + Echo integration
- PID370653 loaded notorious_b.i.g._-_dead_wrong_acapella.mp3 via native encoder pulses/counter2, deck1 Load and ERP Play; no fake pointer input.
- Recovered headphone DSP and manually commanded software Echo active; P1 source0 BPM8600/time0/tempo0 loaded1 quantize0, E1 Echo5 channel0 beat3 depth.5 accepted frame3047552.
- 132,300-frame capture finite/nonzero: master RMS~.01736, phones~.00990. Saved compressed PCM and screenshot headphone-song-playing.png.
- Screenshot confirms playing waveform/time02:41; AZ FX UI remains Delay, explicitly proving UI/software FX are not synchronized yet. Native BPM evolved after initial load; P1 remained manually supplied, not native timeline synchronization.
- Evidence analysis/az-headphone-echo-song.json and mixer log. No listening/Pi/physical output assertion.

### AZ Beat FX native RX state path identified
- Original AZ dispatcher2154850/58 passes RX+84 to21545e8, updates device BeatFx at Mixer+1328.
- Traced two changed-state notification functions21316e0 and2131848 back to packet fields84..93. Added raw decoder with signed/endian conversion; preserved unknown musical semantics.
- State1 u16RX88/89 + RX84bit6; state2 signed16RX90/91, byte86, flag84bits2/3, high nibble85, signedbyte92, highnibble93. Representation nibble==5 is special; do not equate to Echo enum5.
- Existing17 decoder tests plus1,024 new flag/signed-edge cases pass. Evidence az-beatfx-receive-map.json, az-mixer-driver.asm and az-beatfx-notify-callers.json.
- Next live differential RX injection -> native FX display/readback, before linking software E1/P1.

### Actual AZ Beat FX BPM/time injection
- PID378504: native mixer RX88/89 value1280 displays128.0 BPM; RX90/91 value375 displays375ms with representation0. No fake touchscreen.
- Initial12800 showed280.0 (oversized formatting); do not infer valid range from that. RX84bit6 change had no visible effect; semantics unresolved.
- Saved screenshots fx-rx-1280-375.png/fx-rx-flag6.png and analysis/az-beatfx-rx-live.json.
- Bounded110sec run ended before next representation1 injection; FIFO rejected that later request, no state mutation. Remaining type/beat feedback mapping and audio synchronization open.

### Actual AZ native Echo selector and TAP feedback confirmed
- PID383523 final scheduled screenshot shows ECHO,128.0 TAP BPM,375ms from RX85high=1,RX88u16=1280,RX84bit6=1,RX90i16=375. No fake touch.
- Immediate captures lagged native async UI; prior bit6-unresolved/no-visible-effect observation superseded by final settled screenshot.
- Screenshot fx-native-echo-confirmed.png; evidence az-fx-native-echo-confirmed.json. Launcher completed normally at100sec.
- Beat-fraction fields remain zero -> infinity BEAT display; must complete representation before feedback integration. Do not equate native Echo1 with software/RX3 Echo5.
- Added az_fx_feedback.py verified-subset encoder preserving all unrelated packet bytes/bits. Two tests cover preservation/CRC and invalid/unsupported rejection. Not automatically connected to audio commands yet.

### AZ typed BeatFxTime callback ABI mapped
- Traced normal notification helper21307e8: listener virtual+32 receives effect type separately inw1 and BeatFxTime pointerx2.
- Eight-byte temporary: signed16ms@0, RX86@2, bool(RX84&12)@3, sign-extended RX92@4, RX93high@6; byte7 padding untouched.
- Type5 follows alternative listener virtual+40 short-parameter path. AZ label map calls5 Reverb, not reconstructed software Echo5.
- Evidence az-beatfx-time-layout.json and az-beatfx-typed-callback.asm; fractional field roles still unresolved pending consumer trace/live differential.

### AZ native beat-fraction display verified
- PID395412 actual UI: RX86 6=1/3,7=1/2,8=2/3 with Echo1/BPM1280/TAP/ms375 fixed. Native browse/load, no pointer injection.
- RX84 bit2 enabled with RX92=50 shifts beat preset strip half a cell. Widget code1ddeeb0 computes base minus trunc(adjustment/100*59). Remaining exact flag modes/ranges and RX93high/X-PAD unresolved.
- Evidence analysis/az-beat-fraction-live.json and xdjaz/fx-fraction-*.png; static widget assembly saved. Preset index roles now established for three values, not yet full enum or E1/P1 sync.
- Previous timer-only1e08400 lead did not consume BeatFxTime; actual widget update1ddff78 reads shared state through widget+0xf8.

### AZ feedback preset encoder and software timing boundary audit
- encode_feedback optionally accepts verified exact fractions1/3,1/2,2/3; sets RX86 and exits adjusted display mode while preserving unrelated fields/X-PAD. Four tests pass including captured adjusted packet transition and unsupported fraction rejection. No automatic DSP bridge yet.
- RX3 Echo software preset ratios lack thirds. Do not silently map AZ thirds to nearest RX3 preset or reuse enum values.
- New integration crash found by probe-software-echo-timing.py: BPM4000/Echo5/beat8, ASAN read outside ring at beat_echo.c:30. Evidence echo-timing-crash.json. Current timing probe intentionally reproduces unresolved failure; no complete timing table produced. Agent az_dsp_port assigned faithful native lifecycle investigation/fix.
- Feedback must publish applied Echo timing after manager transitions/clamping, not simply requested E1 values.

### AZ X-PAD native feedback chain identified
- RX87 -> native listener slot72 -> FxState::beatFxXPadValueChanged -> state+0x5e. RX85low -> slot80 -> beatFxXPadTouchAreaChanged -> state+0x5f. RTTI-named async tasks and stores verified, evidence az-xpad-fxstate-map.json.
- XPadParamWidget has separate continuous-marker and six-region-marker paths. Units/readout scale remain unverified; input injection path is distinct from this feedback path.
- FxState task1f4b540 copies complete BeatFxTime at state+0x52 and type at+0x51, closing prior inferred RX86/RX92 to widget-state link.

### X-PAD area feedback verified in AZ UI; Echo crash fixed
- PID408341 native X-PAD feedback: area4 highlights1/2; area1 highlights1/16. Value64/128 changed alongside area, so continuous value scaling remains unverified. Evidence az-xpad-live.json, saved screenshots.
- Blue infinity-BEAT label stays unchanged; earlier assumption that this is an erroneous numeric readout is unproven. Trace actual purpose before trying to replace it.
- Agent fixed native Echo transition reconstruction and verified72 initial native cases/120 adapter cases/20000 persistent updates. Crash record updated to resolved; see native oracle and applied timing evidence.

### Applied Echo snapshot API for native display integration
- Added lab_beat_fx_snapshot: scheduled vs active type/target/beat, range-adjusted effect beat, milliseconds, actual/previous delay taps, delay transition flag, source and grid flags. No allocation/I/O or state mutation.
- Must read on processing thread between blocks and hand off a copy; not a cross-thread synchronization primitive. Source BPM is manager input, not a claim of effective grid tempo. Scheduled values may themselves be range-adjusted, not original E1 history.
- test_beat_snapshot.py passes normal and ASAN/UBSAN: native regression40BPM/beat8 resolves Echo3000ms/132300samples/effectbeat6; target scheduling and reset verified. Existing beat stream regression passes.
- Still pending: nonblocking telemetry transport and single RX state owner integration. No claim that AZ UI follows mixer automatically yet.

### Nonblocking applied Echo telemetry on control socket
- Q1 replies to bound local Unix datagram requester with version1 JSON, frame, graph attachment, scheduled/active state, actual and previous delay taps, pending transition, source/grid fields. No allocation/retry/wait; retained16requests/block bound.
- test_beat_telemetry.py deliberately filled receiver queue:34880PCMframes continued,167 replies queued/377 dropped; fresh post-drain reply confirmed actual3000ms/132300samples at40BPM. Existing beat stream regression passes.
- Documented mixer/TELEMETRY.md. Still needs native RX owner/encoder integration and complete AZ preset map; no automatic screen/audio sync claimed.

### Full native AZ Echo preset display range verified
- PID416104 screenshots confirm RX86:1=1/16,3=1/8,5=1/4,9=3/4,10=1,12=2,14=4,16=8,17=16. Earlier6=1/3,7=1/2,8=2/3 complete Echo display range. Evidence az-echo-preset-enum.json and fx-preset screenshots.
- encode_feedback now covers all12 observed Echo fractions. encode_applied_echo translates settled Q1 active effect beat/time into AZ enum/BPM tenths, explicitly rejects transition/unattached/unknown tempo/quantized-grid cases until effective-tempo feedback exists. Caller must own freshness/session and explicitly supply TAP/AUTO mode.
- Six tests pass including native screenshots map and40BPM requestedbeat8->appliedbeat6->AZ2beat/3000ms regression. Not yet wired to live RX owner; other effect preset ranges unverified.

### Live applied mixer -> native AZ UI round trip verified
- Added analysis/sync_echo_feedback.py: fresh bound Q1 reply socket, explicit baseline/socket/FIFO paths, CRC and baseline-change checks, nonblocking128-byte RX write. Exclusively owned baseline required; no concurrent RX merger claim.
- PID421403 actual native UI displayed Echo40.0TAP/2beats/3000ms from Q1 frame1736640, then120.0TAP/1/2beat/250ms from frame3424512. Screenshots viewed and stored live-echo-feedback{,-second}.png; both telemetry replies saved. No pointer injection. Paused tone fixture; not a listening or physical performance test.
- Three sync tests pass: round trip, no write for transition, no write for changed baseline. Persistent RX owner integration and quantized effective tempo remain.

### Single-owner RX merge core for continuous feedback
- Added az_rx_owner.py with exact verified FX ownership masks; every valid control frame emits in order while preserving applied FX fields. No pulse coalescing.
- Explicit mixer epoch, increasing frame watermark, reply age, unsupported-state rejection and stale status; newer unsupported replies prevent older settled rollback. Last displayed fields held during degradation, not claimed current.
- Five tests pass including browse press -> Echo feedback -> release interleaving and corrupt control CRC. No I/O service yet; next integrate continuous control/telemetry sockets with sole RX FIFO writer.

### Continuous RX feedback service verified live
- run_rx_feedback.py now wires native control socket, fresh Q1 polling, single owner and sole nonblocking FIFO writer. Explicit failure on replaced mixer inode/backpressure; owned input socket cleanup verified.
- test_rx_feedback_service.py passes real socket/FIFO test:4merged packets, ordered press/release, two applied presets, valid CRCs, clean exit.
- Actual AZ PID429970: browse and load via service, automatic40BPM/2beats/3000ms ->123BPM/halfbeat/244ms display.15RX packets,0invalid, serviceexit0. Evidence continuous-rx-live.json, service log and screenshots viewed. Paused tone fixture; no physical performance claim.
- Still needs normal launcher integration; shared library packaging, full FX/native controller paths and quantized tempo remain unfinished.


### Launcher-owned continuous RX feedback
- Added opt-in RX_FEEDBACK with required explicit TAP/AUTO mode, DSP graph and AZ mixer fixture. Waits for actual FIFO reader and mixer socket, announces input socket only after service binding; bounded startup and monitored service/mixer exit.
- Normal native run PID438132: browser press/release and applied40BPM Echo passed through service; three packets, zero invalid; current feedback reached. Launcher, service and mixer exit0. Evidence analysis/launcher-rx-feedback.log.
- Injected service exit PID439749 during native run PID439633: launcher detected loss, exited1 explicitly, service/mixer clean exit0, no remaining player/mixer/service or private socket directory. Evidence analysis/launcher-rx-feedback-failure.log.
- Stops RX service before player on shutdown. Existing direct FIFO input helpers still need socket routing integration. Five owner tests and real service socket/FIFO regression pass.
- Sweep3 native manager/DSP composition now integrated by DSP worker; see analysis/dsp-oracle/SWEEP.md. EQ audio/reset consumption still missing; Dub Echo4 andSpace5 next. Shared-library consolidation remains after AZ verification.

### Native browse/load CLI through continuous RX owner
- Added az_rx_transport.py and --input-socket/--baseline options to browse and load helpers. Nonblocking validated complete datagrams; optional exclusive FIFO compatibility remains. Preserves unrelated baseline fields and leaves applied FX ownership to service.
- test_rx_input_cli.py executes actual CLIs through real service: six packets; browse and dual-deck load press/release, counter and baseline bytes preserved; all CRCs valid and applied Echo unchanged.
- Actual AZ PID443263: updated CLI browse/load commands loaded LAB-TONE-440Hz.wav on deck1; native screen simultaneously shows Echo123.0TAP/halfbeat/244ms. Screenshot rx-cli-loaded.png viewed. Service14packets/0invalid, clean launcher/service/mixer shutdown. Evidence analysis/rx-cli-live.json and rx-cli-service-live.log.
- Paused fixture, not physical audio/performance proof. Raw BeatFX probe remains exclusive/direct because service intentionally owns those feedback fields. Full FLX6 and native interface mapping remains open.

### Preferred FLX6 Back focus behavior verified natively
- Replayed saved BiteDJ XML Navigation messages through launcher RX owner, actual AZ PID446511. Native B6/40/+1 moves440Hz->660Hz selected track. Back96/65 moves focus to Folder sidebar; encoder press96/41 returns to660Hz row. Screenshots viewed; this resolves the earlier unsuccessful Back focus observation.
- View96/7a opens browser from waveform and repeated View stays there. Script supplies explicit visibility in known local USB context. Fresh TX group2 agrees with browser but also identifies PcControlView; not universal automatic page identity.
- Evidence analysis/probe-flx6-back-owner.py, flx6-back-owner-live.json and xdjaz/flx6-owner-*.png. No pointer input, no physical FLX6.
- Saved BiteDJ JS inspected: View opens library, Back opens library outside it/MoveFocusBackward inside; encoder optional4x/10x acceleration only when visible track list. Acceleration and automatic page/focus detection still need native state integration.

### Exact native view-state getter mapped (static)
- gui::ViewObjectManager RTTI29cb050 derives IViewStateGetter29cae40; vtable29cb4a0 slot16=198cac0, slot40=198ced0. Verified against pinned ELF via map-view-state-getter.py, with proper section-based VA mapping.
- Identity getter follows manager+24, calls nested virtual slot488. Expected concrete198f468 returns current object(+336)+248 identity, or null identityglobal3bd76f0. BrowserMode callback204c7b8 consumes same slot16/40 shape and reduces identity membership/flags to grouped1/2 signal.
- This is an exact-identity candidate, not a proven live provider match; opaque interned/native identity must not be treated as a C string. Dynamic override paths exist. Evidence az-view-state-getter-map.json and getter/construction assembly.
- Debugger attempt PID450158 hit startup SIGSEGV107fa5c before callback; observer rejected unexpected stop, read no provider. Cause unestablished; no stability fix claimed. Logs page-provider-{launch,gdb}.log. Next capture provider vtable/current identity on a successful live run, then compare Browse/PcControl/page/focus before automatic mapping.

### Live current-view identity verified without debugger
- Second debugger attempt faulted before198cac0 atab8808; no view read. Register/backtrace saved view-getter-gdb.log. No crash fix or causal claim.
- Read-only /proc guest-memory discovery found one matching ViewObjectManager in PID458486. Manager vtable29cb4a0, nested vtable29cd220, virtual getter198f468 all confirmed. Bounded individual mappings scan read4.35GB with39 unreadable chunks; discovery-only, not production polling.
- Subsequent tiny repeated reads correlated with visually reviewed native SOURCE, FOLDER, WAVEFORM transitions. Folder identity exactly equals live BrowseView global3baf670 and differs from PcControlView global3baf678. Source and Waveform are distinct. This resolves live Browse identification for tested pages beyond the groupedTX flag.
- Evidence analysis/find-live-view-manager.py, view-memory-candidates.json, probe-live-view-identity.py, live-view-identity.json and xdjaz/view-identity-*.png. Reads only, no guest suspension or memory changes; navigation uses native RX packets.
- Still need synchronized/session-pinned production observation, live PcControlView test and focus identity for accelerated scroll. No automatic navigation bridge completion claim.

### Session-bound live view observer verified
- Added analysis/az_live_view.py: pidfd + open guest-memory FD, mapped getter/vtable checks, per-sample object/virtual override checks, two matching complete reads, monotonic observation time. Rejects missing/aliased names, no current object, changed layout and ended process.
- Six unit tests pass. Actual native PID464771 integration read initial opaqueother then Browse after five native encoder press/release pairs, and raised Player session ended after launcher shutdown. Evidence analysis/live-view-reader-result.json, reader-candidates.json and reader-launch.log; harness test_live_view_session.py. This run used MIX_STREAM without DSP_GRAPH because the target was UI observation.
- Documented analysis/LIVE-VIEW.md. Matching reads are not GUI-thread synchronization; automatic input still needs a race-tolerant policy or in-process hook. PcControl live test and track-list focus remain. Discovery scan4.35GB is one-time lab work, not a production polling method.

### Direct native view-owner discovery replaces heap scan
- Traced ViewObjectManager constructor198e620 (192bytes), GuiObjectManager member400/store2012694, UiLayerObjects member16/store20eb6b0, EP147Application member272/store18d8d48. Application base stores this at global3bd5d70 through218cfb8.
- Added auto discovery to LiveView(pid), validating each owner vtable and rechecking chain before/after samples. Nine tests pass including partial startup/wrong owner; native PID471684 resolves manager immediately with no heap scan and observes Browse after native input. Evidence az-view-owner-chain.json/direct-view-owner-live.json and constructor assembly.
- Earlier4.35GB scan is now research fallback only. Updated live session harness to direct lookup. Process lifetime checks retained; atomic page/input synchronization and focus still pending.
- Dub Echo4 integration complete (see DUB-ECHO.md), including correct postfader retained tails. Space5 native isolated processor matches, manager integration remains in progress; no full FX completion claim.

### Automatic preferred Back/View replay verified
- Extended native view names to SourceSelectView global3baf668 and WaveformView3baf6d0 from static initializer. Requires four distinct initialized identities. Ten observer/discovery tests pass.
- Added az_live_navigation.py: fresh <=50ms observation per new Back/View press; applies preferred saved mapping on Browse/Source/Waveform. Releases and held repeats need no page read; unknown/PcControl rejects before changing held state. Four adapter tests pass (stale/future/unknown, release during outage, no-read encoder).
- Actual PID478566, probe-auto-navigation.py: automatic Source/Browse/Waveform classification; Back moves track focus to sidebar, View returns from waveform, repeated View keeps browser open. Screenshots reviewed; no caller-provided visibility or pointer input. Evidence auto-navigation-live.json and auto-nav-*.png.
- First replay reached scheduled teardown before finishing; follow-on startup needed more than15sec. Reused still-live run once initialized rather than restarting it. No firmware crash/fix claim for these timeouts.
- Persistent physical MIDI/launcher bridge and atomic page/input policy remain. Space link list added in launcher while DSP agent completes integration.

### Production mixer graph moved off stack
- Expanded Space rings make graph~3.7MB. mix_stream now calloc's graph once at startup before opening audio FIFO; all DSP attach/reset/process uses heap pointer; normal shutdown frees it. No allocation added to processing loop.
- Existing Echo FIFO regression with256KiB process stack passed14,080frames, cueerror0, delayedenergy.12234945596506909. Added optional LAB_TEST_STACK_LIMIT to that test.
- Compiler stack-usage with DSP+headphones reports main8096bytes; -Wframe-larger-than=65536 -Werror passes. Evidence analysis/mix-stream-stack-usage.txt and mix-stream-heap-graph.json.
- Headphone FIFO7680frames and Space FIFO70400frames pass after relocation, including Space closed-fader tailRMS.07307107436 and cue isolation. Host checks only; no Pi RAM/FPS benchmark claim.

### Persistent native FLX6 navigation datagram service
- run_native_navigation.py waits for direct native observer, binds0600 MIDI socket, accepts complete3-byte messages via saved mapping, sends nonblocking native packets to RX owner. Pins owner socket identity, continuously checks player lifetime; graceful stop releases held buttons and removes socket.
- Actual PID485268/fullDSP+RXfeedback: loaded LAB-TONE440Hz on deck1, preserved Echo123TAP/halfbeat244ms, View opens Browse and Back focuses sidebar. Screenshots reviewed.17 native input packets + shutdown release=18,0rejected; serviceexit0/socket removed. Evidence native-nav-service-live.json/log and probe-native-nav-service.py.
- This is a private MIDI socket, not physical MIDI intake. One navigation producer; no concurrent raw full-frame controls. Launcher must stop navigation before RX owner/player; integration still pending. Native EQ/isolator and remaining BeatFX work continues separately.


## Launcher-managed native navigation — 2026-09-12

`NATIVE_NAVIGATION=1` now starts navigation after RX ownership is ready,
selecting the AZ QEMU guest only from the launcher's descendant tree. Readiness
and premature exits are monitored. Shutdown stops navigation before the RX
owner/player so held buttons can be released. The separate navigation MIDI
socket does not yet provide physical controller intake or unified mixer routing.

Verified actual AZ guest PID492811: fixture loaded on deck 1, 13 input packets
plus one held-encoder release on shutdown, all 14 received by the RX owner with
zero invalid packets. All managed services exited 0 and the socket/guest were
gone afterward. Screenshot was visually reviewed. Evidence:
`analysis/navigation-integrated-result.json`, corresponding launcher/service/RX
logs and `xdjaz/navigation-integrated-loaded.png`. Descendant selection test
covers unrelated guests, disappearance, wrong model and ambiguity; 14 existing
observer/adapter tests also pass. Replay's post-send diagnostic print failed;
this did not affect the completed input stream or lifecycle verification.


## Native Search/Menu interface trace — 2026-09-12

Pinned AZ RTTI plus original instructions identify SearchView's
ISearchStartButtonNotify listener at subobject+0x1720, vtable0x29db518 and
callback0x19bd488. It gates on a native component check and dispatches the
original payload through managed IKeywordSearch virtual+0x10; the diagnostic
explicitly names IKeywordSearch and needLock=true. Payload ABI, registration,
thread ownership and live invocation remain pending. Search bar mode selection
and text clearing are separate operations, not substitute search commands.
BrowseMenuWidgetController has button/checker/popup listener bases; its primary
button action remains to trace. Evidence: analysis/az-search-menu-contract.json,
az-search-menu-vtables.json, reproducible map-search-menu-vtables.py and saved
original disassemblies. No controller mappings or firmware memory were changed.


## Pi returned; first native DSP timings — 2026-09-12

Pi SSH verified, PREEMPT_RT ARM64 kernel, BiteDJ running, no throttling flags.
Controller absent. Copied only reconstructed mixer source into an isolated
~/az-dsp-bench-20260912 directory and compiled/reran with active-effect assertions.
All seven CFX selections (Off plus six effects), four channels plus master Echo,
completed. See analysis/PI-DSP-BENCHMARK.md for per-case one-core-equivalent
cost and timing tails. This is offline DSP evidence, not complete AZ/Pi audio,
UI or controller validation. BiteDJ and its routing were left running.


## Native AZ starts on Pi; quick sequential baseline — 2026-09-12

Native AZ initially rejected Pi16KiB pages through bundled jemalloc. A sandbox
bind of Debian jemalloc5.2.1-3 overcame this startup failure; native EP147 then
reached SOURCE, USB fixture visible, and survived the45-second probe. Kernel and
firmware executable unchanged. Source/script: run-az-pi-probe.py (experimental,
minimal native fixture path verified; QEMU-only options rejected).

BiteDJ baseline0.55% of one core,512.7MiB RSS; AZ baseline8.25%,921.3MiB RSS,
235 threads versus BiteDJ40. Different display paths and null audio mean this is
not a matched playback/FPS benchmark. Software mixer not attached to AZ in this
comparison. BiteDJ restored, AZ and Xvfb stopped. Evidence and allocator
provenance: analysis/PI-BITE-AZ-COMPARISON.md and pi-bite-az-comparison.json.


## Search payload and scheduling — 2026-09-12

KeywordSearchFacade vtable0x2dbc488 slot+16 leads to0x1eefbb8. Original
instructions establish a reference-counted string payload, copied through
0x230f530; raw char* injection is invalid. Matching-thread path calls
ListUpdateHandler0x1eb5138; other-thread path retains the string in a48-byte
native task and queues it. Task0x1eef628 reaches the same consumer; destructor
releases its string. Thread-owner identification, construction/encoding, live
facade lifetime and source readiness still need validation. Updated
analysis/az-search-menu-contract.json and saved facade/task/copy/consumer asm.
EQ agent has file ownership for opt-in graph/module integration; parent retains
stream command and launcher changes. No live Search injection performed.


## Two-track native Pi sample — 2026-09-12

Both BiteDJ and native AZ played the same two real MP3s; screenshot timers
verify both decks advanced20seconds. BiteDJ6.35% one core/584.7MiB RSS;
AZ44.70%/990.6MiB. BiteDJ remained on Settings, AZ showed main waveforms,
and audio backends differ. These are partial workload measurements, not
matched rendering or full-pipeline comparisons. Initial one-deck AZ attempt
excluded. See analysis/PI-TWO-TRACK-COMPARISON.md and raw samples/screenshots.
BiteDJ restored; final health saved. EQ stream integration paused for this
user-requested benchmark: parser done, graph landed, source lists/stream loader
and EQ1 delivery still pending.

## EQ1 stream integration — 2026-09-12

Parent wired EQ1 channel/mode/HIGH/MID/LOW parsing and audio-block delivery into
mix_stream. LAB_EQ_TABLES loads and validates a private immutable16,464-byte
startup fixture; launchers pin its SHA256. Added channel_eq.c to Python graph
build lists. Real FIFO cases verify selected-channel full cut, independent cue
bit equality, malformed commands and unattached rejection. Fixture truncation,
trailing bytes and nonfinite coefficients are rejected before FIFO open.
Evidence: mixer/test_eq_command.c, test_eq_stream.py and
analysis/eq-stream-results.json. Existing Space FIFO without EQ still passes.
No native AZ knob delivery or Pi EQ performance claim yet; previous Pi playback
and DSP measurements preceded this integration.


## Corrected waveform benchmark and AZ EQ control map — 2026-09-12

Previous goal turn made concrete progress: invalid Settings comparison was superseded by visually verified PLAY/main-waveform samples. Both tracks advanced for 20 seconds. BiteDJ at 1280×800: 11.95% of one CPU core, 581.4 MiB RSS; normal 1920×1200: 13.70%, 607.9 MiB. Prior AZ WAVEFORM 1280×800: 44.70%, 990.6 MiB. Rendering/audio paths still differ and AZ mixer is omitted: no full-system or FPS ratio claim. Normal BiteDJ restored fullscreen on PLAY, temporary keyboard removed, AZ stopped, throttled=0. See PI-TWO-TRACK-COMPARISON.md.

Native EQ groundwork: pinned AZ EqIsoWidgetController button callback 0x19fb9f0 maps interned eqButton/isoButton identifiers to setting enums 0/1. Identifier initializer 0x543e10 establishes globals 0x3b86598/0x3b865a0. Setting listener and thread-checked UI update mapped. Reproducible map-eq-hui-ids.py recovers all 12 channel HIGH/MID/LOW HUI registration IDs from original diagnostic references and MOVZ/MOVK constants, validating unique IDs. See az-eq-native-contract.json, az-eq-mode-vtables.json, az-eq-hui-ids.json and az-eq-native-paths.asm. This is static evidence, not live knob injection. Next trace the typed observer payload and application setting-to-hardware path before integrating EQ1.

Prior Pi EQ FIFO validation also completed: pi-eq-stream-results.json records full cut and unaffected cue verification. Raw EQ/isolator DSP timing results exist in pi-eq-dsp-benchmark.jsonl and pi-isolator-dsp-benchmark.jsonl; summary remains pending. No AZ native-to-EQ1 delivery yet.


## EQ HUI observer payload and dispatch — 2026-09-12

Previous turn was progress: verified native EQ/ISO button identities and generated all 12 EQ HUI IDs. This pass traced registration0x6c5330 through its guarded global registry: resolves ID and subscribes HuiEventHandler+0x30 via component virtual+0x30. RTTI confirms that subobject is IHuiSliderObserver; callback0x6c4838 reads float32 plus a second32-bit field from x3, forwarding event ID x2 to full-owner listener vector+0x60/+0x68, virtual+0x40. Primary equivalent0x6c4258 independently confirms the owner offset.

HuiEventAdapter slot8 0x6c37b0 then translates HUI ID to operation ID and forwards unchanged float/field to listener virtual+0x28. Missing IDs allocate a24-byte zero-mapped entry and drop delivery: this is not a realtime-safe injection endpoint. Saved original disassembly and az-eq-observer-contract.json. Float normalization/field meaning, current listener registration, live ownership, hardware EQ mode and software mixer synchronization are still open; no live injection performed. Reproducible RTTI map updated with HuiEventHandler/HuiEventAdapter/HuiSlider.


## Generic HUI slider value production — 2026-09-12

Prior goal turn was progress: original EQ observer/MIDI adapter dispatch saved. This pass traces producer0x21ef320 and default converter0x21ee490. The8-byte observer value is float at owner+0xd8 plus original input uint32(+8) at owner+0xdc. Default conversion divides raw by configured unsigned denominator and multiplies configured float scale, with adapter-provided range (default0..max(scale,0)). Generic producer compares pre-clamp delta to float epsilon0x34000000, suppressing smaller changes; accepted values clamp to[-1,1], retain raw integer, and append an8-byte queued event. Raw-only changes can be suppressed. Queue growth allocates, reinforcing the control-thread requirement. Actual EQ range, denominator and center remain unverified; do not assume generic[-1,1] means bipolar EQ. Saved az-slider-value-contract.json and original disassembly; observer contract updated to replace unknown second-field wording. No Pi app changes or live injection this pass.


## Read-only live EQ registry probe prepared — 2026-09-12

Previous goal turn made progress by tracing generic slider conversion/raw preservation. Queue dispatch scheduling remains unproven after current static pass. Added analysis/az_eq_probe.py to inspect an explicit player PID via read-only /proc memory and pidfd lifetime checks. Pins lookup/producer instruction bytes, performs bounded registry traversal for all12 EQ IDs, requires exact HuiSlider interface and owner vtables plus own ID, and reports current float/raw and opaque adapter identity. Repeated complete reads reject detected changes; this is not an atomic snapshot and cannot exclude all races. No player writes or callback injection.

Five synthetic tests pass: collision chain/all12 controls, incorrect component, cyclic chain, changed sample and incorrect owner ID. Both instruction guards independently checked against SHA-pinned original ELF. Actual live registry shape/configuration is not yet verified: run this only against a known bounded lab player next, and use its result to resolve EQ adapter settings. Pi left untouched in this pass.


## Live EQ adapter configuration verified — 2026-09-12

Previous turn added and tested the read-only probe. Bounded50-second PC QEMU AZ launch now completed with status0; guest548681. All12 IDs resolved immediately through101-bucket registry, with exact generic HuiSlider interface/owner identities. A second live read inspected every adapter: vtable0x2e63960, denominator1023, multiplier1.0. Vtable slots2/3 match original default conversion0x21ee490 and range0x21edc30. This establishes EQ's configured raw0..1023 to float0..1 conversion, superseding unresolved generic-range assumptions. Current values were all0/raw0 in lab fixtures; no injected nonzero event or hardware/mixer response claim.

az_eq_probe.py now reports configuration only for this pinned default adapter, validating conversion/range entries and finite positive settings; unknown adapters remain opaque. Six tests pass, including default-adapter extraction and changed-method rejection. Saved az-eq-live-probe.json (launcher exit0), az-eq-live-adapters.json and eq-live-launch.log; updated slider contract. Next differential raw-input test and native/software EQ1 synchronization. Pi untouched.


## Packet-to-native EQ delivery verified — 2026-09-12

Prior turn verified live adapter configuration; this turn exercises actual synthetic mixer RX input, no direct memory writes or fake touchscreen. New reproducible probe_eq_packet_delivery.py packs all12 distinct EQ values into CRC-valid128-byte frames, reads native HUI objects until values match, and checks corrupt CRC leaves initial state unchanged. Bounded PC QEMU guest555628 passed all5 patterns (distinct per knob, reversed, all0, all1023, all512), covering60 native raw/float correspondences; launcher exit0. az-eq-packet-delivery.json records requested/observed values. This is native input delivery, not mixer audio synchronization.

An early-start attempt failed to reach values; a second attempt stopped before injection on ambiguous guest discovery. Preserved both reports. Probe now waits15seconds before discovery and retries transient ambiguity while retaining exact component/code guards; final result passed. The evidence supports readiness as a practical requirement, not a proven root cause of every earlier failure.

Static wrapper0x2159560 now maps queue dispatch: invokes adapter update, checks pending count, try-locks and snapshots observers, then dispatches each8-byte event to valid observers via component virtual+16 and clears pending count. Try-lock failure leaves queue pending. Allocations remain on this path. Saved az-slider-input-dispatch.asm/json. Next connect verified native EQ state and mode to software EQ1, then test audio changes end-to-end. Pi remains on BiteDJ and was not touched.

### AZ native EQ/isolator mode reaches TX bitfield (2026-09-12)

- Extended pinned RTTI map to usecase::mixer::Mixer and device_adapter::mixer::Mixer. The EqIso listener is owner+8, thunk 0xa8ac78 to0xa8a910; validates setting Identifier and maps enum0/1 tobyte0/1. Other enums log and fall back to0.
- Forwarder0xa8a7b8 calls adapter virtual slot3; concrete Mixer slot3 at0x2134518 stores byte+0x14. TX builder0x215a2f8 loads its adapter fromowner+0x70, packs that byte into output+4 bits4..5. Caller supplies packet+4, so absolute TX byte8 bits4..5.
- Saved az-eq-mode-output-contract.json and az-eq-mode-output-path.asm. MasterEq is a separate setting and is not used to infer channel EQ/ISO.
- Added raw and checksum-gated named eq_iso_mode fields to az_mixer_packet.inspect_tx; unknown2/3 and corrupt packets produce no named mode. All18 packet unit tests pass, including preservation of neighbouring routing bits.
- Static trace only: live native mode change, concrete runtime adapter ownership, native-to-EQ1 synchronization and resulting audio remain to verify. No Pi changes; BiteDJ remains open there.

### Decoded RX/TX EQ state drives actual software-mixer audio (2026-09-12)

- Added mixer/native_eq.py session-local state component. Accepts complete CRC-valid RX knob packets with nonzero dispatcher header and CRC-valid TX EQ/isolator settings. Requires both directions before emitting EQ1; no guessed mode/knob defaults. Unsupported native modes suspend output. Changed channel commands remain pending until caller confirms delivery; new instance required on session replacement.
- Added two state tests covering incomplete state, corrupt packets, unknown modes, channel-selective updates, global mode changes and delivery retry. Passed.
- Extended actual FIFO audio test with synthetic native RX/TX packet decoding into EQ1. Three new cases each20480frames: normal master energy24.10131653576831, isolator full-cut0.0, EQ full-cut0.7962242862285271. The independent cue channel is bit-identical between normal and selected-channel isolator cut. Existing malformed/unattached/fixture checks still pass. Results in analysis/eq-stream-results.json.
- First new test incorrectly required cue equality across the global EQ/ISO mode change; corrected that expectation because allfour channels receive mode changes. No DSP code change was needed.
- This proves the packet-decoder-to-software-audio segment using synthetic packets, not the full native runtime path. Still need attach the component to the single live RX/TX owner, test native UI mode changes into captured TX and audio, and verify physical FLX6 input. Pi untouched.

### Live AZ native EQ bridge delivery verified (2026-09-12)

- run_rx_feedback.py optionally follows --eq-tx-capture with session-local NativeEq. Skips historical and partial-at-start records; rejects replaced/truncated files and mixer socket replacement. Knobs enter state only after successful native RX FIFO write; complete changed EQ1 snapshots go to attached software mixer.
- Both launcher sources support NATIVE_EQ=1 requiring RX_FEEDBACK, MIXER_TX_CAPTURE and pinned LAB_EQ_TABLES. Pi copy not deployed/run. Early PC attempt failed because TX capture is created after FIFO readiness; launcher now waits for capture too. Failure evidence retained in eq-native-service-early-attempt.log.
- Existing RX service press/release and effects-feedback test passes. New real-socket/FIFO test passes: historical/partial TX ignored, bad CRC ignored, unsupported mode suspends, selected-channel and global-mode delivery, replacement terminates. Evidence eq-feedback-service-results.json.
- Live PC AZ run completed status0: own native TX supplied EQ mode0, injected three RX snapshots through running owner. Nine software mixer eq_frame applications all result1. Read-only live native HUI snapshot confirms all12 final EQ values raw1023/float1. Saved eq-native-service-results.json, eq-native-service-hui.json, launcher and service/mixer logs.
- Still unverified: native GUI EQ/isolator toggle, full live song audio response, physical FLX6. Prior synthetic packet-to-real-audio test separately proves DSP response; do not conflate it with this live delivery test.

### Native Utility EQ/ISO toggle verified (2026-09-12)

- First mode-test launch exited139 before GUI on actual qemu PID573461, Shutdown thread SIGSEGV/SI_USER. coredumpctl and limited all-thread host stacks saved; no kernel OOM record and17Gi available. Similar to earlier intermittent startup failures, cause unresolved. Temporary extracted core removed automatically. No input had been sent.
- Retry reached native Utility > Mixer > EQ/ISO but bounded launcher expired before toggle. Used observed route to implement probe_native_eq_mode.py. No production touchscreen dependency added: clicks are solely for validating an authentic setting change.
- Next run: native shortcut RX button through existing owner opens Shortcut; observed gear opens Utility; Mixer and EQ/ISO selections expose EQ/ISO radio options. ISO click changed screen and actual TX byte8 bits4..5 to1, allfour software EQ applications result1. EQ click restored TX0 and allfour channels result1. Viewed eq-mode-isolator.png and eq-mode-restored.png confirm native labels/radio state. Full probe result eq-mode-live-results.json and eq-mode service/mixer logs.
- This closes native UI setting -> TX decoder -> software EQ mode delivery. Distinguish utility radio path from separately statically mapped EqIsoWidgetController callback. No music loaded in this run; live song audio and physical FLX6 still pending.

### Live song EQ audio attempt: silence, verification failed (2026-09-12)

- Added probe_native_eq_audio.py to load track3 from fixture USB, send play, set software M1 gain, change native EQ/ISO and capture three output windows. Screenshot eq-audio-loaded.png viewed: native deck1 shows notorious_b.i.g._-_dead_wrong_acapella, BPM86, remaining03:03.227; this proves load metadata, not advancing playback.
- All three ~66100frame normal/cut/restored capture windows have master RMS0.0. Explicit assertions failed; launcher nevertheless shut down cleanly0. Saved eq-audio-silent-attempt.json and screenshot/launcher copy. No live EQ audio success claim.
- Player log contains repeated cipher semop Permission denied plus read-only USB waveform-cache save failure. Relevant warnings saved; neither is established as cause of silence. Need verify playback timing/ERP acceptance and decoder output before changing DSP.
- Harness now requires nonzero captured master PCM before proceeding to native EQ test; source compiles, new precondition not yet run. Existing synthetic packet/audio tests and native mode delivery remain valid within their scopes. Physical controller not tested, Pi unchanged.

### Silent playback investigation and pre-DSP diagnostics (2026-09-12)

- Two more native startup exits139 before audio trial: actual guest588324 and589920. First core info saved eq-audio-startup-crash.txt.17Gi available. Probe now separately records native exit codes; launcher0 is not native success. Longer load delay has not yet been tested through playback because both runs failed during startup.
- Connected AArch64 GDB through private guest stub (probe_az_startup_debug.py). Paced null-audio/mixer-fixture run, without software mixer/RXfeedback, had no stopping fault during45sec observation, launcher0. Saved guest debugger output and eq-startup-debug-result.json. This is a different configuration under instrumentation; it does not resolve intermittent crash cause.
- Added opt-in LAB_AUDIO_STATS to mix_stream.c: accumulates per-channel native input peak, energy, nonfinite count and frame count before all DSP; prints once on orderly shutdown. No allocation or I/O in sample loop; diagnostic math adds overhead only when enabled.
- Six real FIFO EQ audio cases pass with stats enabled. Each verifies10channel stats,20480frames, nonzero expected inputchannels0..3, silent4..9 and0nonfinite values. Existing output energy and cue-isolation assertions still pass.
- Audio probe now enables these input stats, so next live trial can distinguish native silence from software DSP silence. Live trial with new stats remains unrun. No Pi changes.

### Live native song -> EQ/isolator -> captured audio passes (2026-09-12)

- probe_native_eq_audio.py successful run with longer10sec load wait before Play,4sec post-Play wait, and explicit nonzero-output precondition. Loaded Dead Wrong acapella from fixture USB; viewed screenshot eq-audio-loaded.png shows drawn waveform and02:58.834 remaining, confirming progression from03:03.227. Earlier silence is consistent with premature Play, not yet a race root-cause proof.
- Native Utility ISO and EQ clicks changed actual TX1/0 and allfour software channels accepted eachmode. Then native ISO plus RX knob snapshots yielded three66176frame windows: normal RMS0.010179556825270832, cut0.0, restored0.021453555549737317. Different song positions, so normal/restored levels need not match. No per-window upstream input capture; aggregate pre-DSP stats show active inputpair0/1, finite samples across10channels.
- Full assertions passed; launcher0 and native player still alive at scheduled capture/teardown. Results eq-audio-live-results.json, screenshots, rx-feedback and mixer logs saved. No physical audio device/controller and no Pi changes. Synthetic tests independently verify fixed-input EQ-vs-ISO attenuation and independent cue.
- Native mode + knob delivery + real song software output now demonstrated. Remaining: FLX6 hardware, complete preferred mapping, broader EQ response/cue tests, production transport and performance; other CFX/BeatFX and firmware research remain active.

### Preferred FLX6 EQ mapping reaches native AZ and software mixer (2026-09-12)

- Added flx6_eq.py: parses all24 saved BiteDJ EQ CC bindings (four channels ×three bands ×MSB/LSB). Requires complete mapping, rejects conflicting addresses/options. Explicit raw14>>4 quantization. No first update until bothhalves have been seen; session reset discards halves. Raw packet writes preserve trim, adjacent packed lanes and other controls. Saved hashed source mapping in flx6-eq-bindings.json.
- Optional EQ integrated into the same Navigation.frame owner, not a competing full-frame writer. run_native_navigation.py --eq-controls; PC NATIVE_NAVIGATION+NATIVE_EQ enables it. Other navigation behavior unchanged. Three new EQ tests, existing navigation script and four live-page adapter tests pass.
- First attempt hit pre-input startup crash guest601453; core report and failed launcher retained. Retry succeeded: probe_flx6_eq_live.py replayed actual saved CC pairs at8192,0,16383. Read-only native HUI confirmed raw512,0,1023 across all12controls (36checks). All observed software EQ applications result1, final allchannels[1023,1023,1023]. Result flx6-eq-live-results.json.
- Runtime message replay only: no physical FLX6, pickup/reconnect or knob-travel response comparison. Pi untouched. Full CFX/BeatFX and broader firmware research remain open.

### RX3 Beat Delay callbacks reconstructed and native-tested (2026-09-12)

- Shifted focus from verified EQ pipeline to missing BeatFX Delay. Read unstripped native symbols and disassembled exact control/execute functions. Delay Off ramps gate0/dry1/wet0; On resets dry/wet before depth recalculation. This differs from current Echo control.
- Added private oracle runner, Delay control C/header and compare harness. Pinned original rbp SHA, extracted0xb6168..0xb639c without instruction relocation. Native object field offsets differ from Echo by4bytes after ring index. Initial harness array bound error caught atcompile and corrected before execution.
- ARM, host and sanitized replay each pass76,800callback calls/140state bytes with0mismatches. Results delay-control-results.json. DELAY-CONTROL.md details covered callbacks, finite-corpus limits and next boundaries.
- Execute disassembly shows gated input d19 written directly to delay ring; no Echo feedback on that traced path. Audio execution remains unverified. Delay is not enabled in live BeatFX type dispatch yet; constructor, quantize and full manager integration remain. Proprietary extracted code/records and linked oracle binaries added to ignore list.

### RX3 Delay audio sample loop reconstructed and native-tested (2026-09-12)

- Added delay_audio.c/.h, native compare harness and run_delay_audio.py. Extracted execute0xb6404..0xb68b8 from SHA-pinned original. External ceil/floor and scripted quantize/time hook branches rebound; original final time hook remains a tailbranch.
- All three runs pass:5632calls,614606stereo frames,47055772compared32-bit words each,0differences. ARM/native host/sanitizer compare PCM, modeled state and entire ring after every block. Includes startup/wrap, zero-length blocks, changing delays, On/Off, random/silent/impulse/subnormal inputs and long delay cases.
- Concrete Delay differences: counter++ rather than Echo'sencodedcounter+=2; ring stores gated input without feedback; dry path lacks Echo'sadditional gate; different time-change handling during startup suppression. Control callbacks already native-tested.
- DELAY-AUDIO.md and delay-audio-results.json document exact scope. Constructor, actual quantize hooks, selection and manager/type dispatch are still pending. Delay remains disabled in live mixer. Proprietary oracle instructions/corpora/executables ignored.

### Delay constructor and selection execution checks (2026-09-12)

- Recovered Delay vtable0x425348: selection0xb6d18 clears counter+124 then calls slot9=On0xb618c. Added DELAY_SELECT and native selection fixture; six-action control corpus76800calls ×ARM/host/sanitized,0state differences. Does not change stored On flag.
- Executed original constructor0xb6928..0xb6cc0 with explicit allocator/JUCE-string fixtures and rebased sample-rate global. Seven rate inputs pass numeric/default and all meaningful smoother checks. At44100: cross/dry/wet147frames, gate191. Defaults time500/bounds1..4000, delay/previous1, depth0, empty ring, On0; final beat upper bound9 overrides earlier11.
- Saved runner, probe, disassembly, result and DELAY-INITIALIZATION.md. Native instruction blobs/linked oracle remain private/ignored. Constructor-rate coverage is not audio-rate coverage: execute time conversion remains44.1samples/ms. Real allocation/exception paths excluded.
- Next real quantization/status composition and manager/type dispatch. Delay remains disabled live.

### Delay real quantization/status composition verified (2026-09-12)

- Added delay_quantize.c/.h, delay_quantize_compare.c and run_delay_status.py. Executes original Delay audio/control together with native manager setOnOff, status switching, eligibility, beat lookup, time update and parameter dispatch. Actual tail branch to time update retained. Player getters are explicit fixtures.
- ARM/native, host and sanitized runs each pass3840blocks/215040stereo frames/68843520compared words, zero differences. Covers ten supported beat buttons, tempo/grid/transport eligibility, repeated On/Off, startup and near-ring-boundary states; compares audio/state/quantization/ring. DELAY-QUANTIZE.md records scope.
- Runner uses separate generated status-control assembly so it does not overwrite the earlier selection oracle; restored that generated artifact after initial reuse. Proprietary native records/blobs/executables ignored. No Pi or public repository changes.
- Remaining: full BeatFX manager type selection and routing, then live Delay integration. Other effects, AZ native control integration, hardware and performance work remain open.

### Delay outer manager composition passes (2026-09-12)

- Traced type1 selection at0x8a0cc/0x8a368 -> manager+0x14. Delay constructor clears tail-support byte+0x50; native operate checks it at0x8a628. Unlike Echo, Delay deselection follows normal fade/type switch. Actual keepEffectInit base no-op0x8b080 included. Both Delay/Echo participate in bypass-return notify mask0xe2.
- Added isolated beat_manager_delay model and native outer-manager composition. Actual manager/Delay/quantization methods execute with explicit player fixtures. 180blocks/11520frames, full state/audio/ring, zero ARM/host/sanitizer differences. 72 additional fresh transitions across12beat requests/sixBPM inputs also pass allthree. Reports beat-delay-manager-results.json and beat-delay-initial-results.json; DELAY-MANAGER.md records boundaries.
- Next: direct Delay↔Echo composite with both real objects and remembered-object state, then shared manager refactor and live type1 integration/FIFO checks. Existing Echo live path unchanged. Pi untouched, no publication.

### Direct Delay/Echo callback ownership verified (2026-09-12)

- Added native-only beat_direct_switch_probe.c and run_beat_direct_switch.py. Executes original switchNextBeatEffect with both actual control/selection method sets.24 alternating direct switches pass state assertions, including equal/different beat selections and varied depth/time.
- Direct switches retain destination manual time, copy source depth, set remembered=Off holder, turn destination On/source Off, reset both startup counters and enter fade-in phase2. Direct pair bypasses the Off conditional-time-transfer branch. This differs from simply extending isolated one-effect ownership.
- DIRECT-BEAT-SWITCH.md and beat-direct-switch-results.json saved. Player/manager quantize disabled in this corpus. No audio execute or complete direct transition equivalence claim. Next full both-object audio/manager composition and shared refactor; no live/Pi changes.

### Both native BeatFX audio loops under one original manager (2026-09-12)

- Added beat_dual_audio_probe.c and run_beat_dual_audio.py. Original manager operates actual Delay and Echo loops with separate rings and native controls/quantize. Correct Delay execute slot and native time-update tail branch included.
- Persistent4800blocks/307200frames completes8type transitions, target changes, bypass and quantize/pitch changes. All output finite; write indices in range. Echo2098activeblocks, Delay1800;300retained-tail blocks exclusivelyEcho. Positive wet gain past initial delay on1109Delay/836Echo blocks. Report beat-dual-audio-switch-results.json; DUAL-BEAT-AUDIO.md documents scope.
- This is the combined native reference, not host equivalence. Next unified manager differential comparison preserving both objects and Off holder, then live integration. No Pi/live changes or publication.

### Delay candidate now uses explicit player/quantization context (2026-09-12)

- Added beat-port/beat_delay.c/.h and candidate beat-port/beat_manager_delay.c. Reconstructed audio and post-block quantize/time methods use caller-owned context, not global harness callback state. No processing allocations or I/O; native44.1kHz/bounds contract remains.
- run_beat_delay_port.py clears global cq/cp during reconstructed processing. Original ARM manager/Delay comparison, host and sanitizer each pass180blocks/11520frames/full states/audio/ring.72fresh transition cases also pass. Results beat-delay-port-results.json and beat-delay-port-initial-results.json; beat-port/DELAY.md documents limits.
- Unified Off/Delay/Echo manager and direct-transition differential comparison still pending. Candidate not wired to live graph; Pi unchanged.

### Pi AZ display demo and direct interactive display (2026-09-12)

- User requested AZ instead of BiteDJ with a song. Stopped BiteDJ supervisor and mixxx. Initial Xvfb preview via ffplay was fullscreen but30FPS and did not forward touch; user correctly reported no touch/jitter. That preview is now stopped.
- Pi package xwayland installed (plus libtirpc-common/libtirpc3t64/libxcvt0). Existing Sway configuration, including its xwayland-disable setting, unchanged. Launch rootful Xwayland directly as a Wayland client: -displayfd -geometry1280x800 -fullscreen -nolisten tcp -ac. AZ connects directly to this display within its sandbox. No video capture/presentation layer remains.
- Pi /home/pompu_5/az-native-lab/run-az-interactive.py is copied from Pi launcher, uses Xwayland and3600second demo bound. Displayfd readline fixes observed premature-pipe-close startup failure; LAB_PI_JEMALLOC points to existing compatible allocator. First earlier launch without allocator failed Unsupported system page size; fixed flag on actual run.
- Current launcher PID6126, Xwayland6128, sandbox6135 at launch. Remote az-interactive.pid/log record actual state. BothEstara andDeadWrong loaded via pi-az-two-input.py; physical display screenshot /tmp/az-direct.png confirms waveforms and advanced timers. Still paced NULL audio, no audible output claim. No ffplay or mixxx process when checked.
- Asked physical tap of4DECK; reply pending. Touch and jitter/performance improvement not verified merely from screenshot. Direct screen appears pixel-scaled at1280x800 onto1920x1200; no native1920layout claim. Saved launcher snapshot analysis/pi-run-az-interactive-snapshot.py (reference copy; relative paths require Pi lab placement).
- Before user demo interruption, created beat-port/beat_pair.c/.h unified manager candidate. Only syntax-checked, NOT differentially verified or enabled. Review/fix against native pair reference before using. In particular process ramp tick semantics and Off/remembered switching need full comparisons. Overall firmware goal active.

### Combined manager direct switches match native state (2026-09-12)

- While user explores Pi, no further remote controls issued this turn. Earlier unexpected UI navigation coincided with user interaction; do not treat it as proven mapping defect. Physical-touch quality remains unverified.
- beat-port/beat_pair.c/.h now compiles and actual switchNextBeatEffect comparison passes96direct Delay/Echo cases/17184words, all modeled manager/both-effect/both-quantization state equal. Includes initial On combinations, equal/different beats, manual time/depth, player and manager quantize combinations and tempo/time changes. Added beat_pair_switch_compare.c, run_beat_pair_switch.py, report beat-pair-switch-switch-results.json and beat-port/PAIR.md.
- Removed unused helper; corrected candidate mixed-ramp loop to make advance decision once per block as native does. Processing itself remains unverified. Next full persistent dual-loop differential harness, Off transitions, rings, host and sanitizer comparisons before live integration. No Pi changes during this comparison.

### Confirmed race in simulated vsync timestamp publication (2026-09-12)

- User still reports jitter/flicker on direct Xwayland; shifted priority to display pacing. Actual running AZ logs retrieveLastVsyncMsec empty-lines failures. Launcher rewrites synthetic /sys/module/rockchipdrm/parameters/vsync_time via Path.write_text, truncating it first.
- Read-only8second sample of running Pi file:13377reads,63empty,471observedupdates,integer-ms gap16..18median17. This is synthetic file cadence, not rendered/displayedFPS. Saved analysis/pi-vsync-file-baseline.json.
- Added display_timing.publish_timing: write complete timestamp to same-directory temporary then atomicreplace, clean staging in finally. Both local PC/Pi launchers initialize before native process starts and use atomicpublication thereafter. Synthetic clock source and relative60Hzsleep unchanged to isolate fix; still not real DRM/compositorvblank.
- Independent8second concurrent-reader test onPi:13346reads,0empty/invalid/backwards/errors/staging leftovers. analysis/pi-vsync-atomic-test.json. Syntax checks pass. Helper and patches saved to Pi run-az-interactive.py/run-az-pi-probe.py with .before-atomic-timing backups. Running process not restarted while user explores; improvement in actual rendering unverified. Next fresh-run log/frame-pacing measurement.

### AZ vsync units corrected and deployed (2026-09-12)

- Actual AZ reader at 0x212eef4 converts the first file line to a number, then 0x212eef8..0x212ef04 divides by double 1,000,000.0. Clock routine 0x212f190 uses CLOCK_MONOTONIC seconds*1000 + nanoseconds/1,000,000. Synthetic file must contain monotonic nanoseconds; previous millisecond writer was wrong by factor 1,000,000. Evidence analysis/az-vsync-timing.asm and az-vsync-xrefs.json.
- Changed local PC/Pi launchers and remote Pi interactive/baseline launchers to time.monotonic_ns(); renamed helper argument/documented units. Atomic replacement retained. Python syntax checks pass. Remote backups .before-nanosecond-timing.
- Restarted direct Xwayland AZ launcher PID7008/sandbox7013 with same paced-null-audio fixtures and allocator. Running after startup. Five-second live check:4546reads,0empty,age0.356..17.864ms,0empty-lines assertions in fresh AZ log. Report analysis/pi-vsync-nanosecond-live.json. These checks establish units/publication only, not rendered FPS or reduced visible jitter.
- Initial song input sequence ran before USB navigation was ready and loaded nothing; second Source selection verified USB1 visible and reloading test tracks underway. No audible audio claim.
- Second source/navigation sequence succeeded: screenshot /tmp/az-nanosecond-playing.png confirms Estara and Dead Wrong loaded, waveforms present and playback timers advanced. Still paced NULL audio. Visible smoothness and actual frame intervals remain unmeasured.

### Live drawing cadence measured after timing fix (2026-09-12)

- Previous goal turn classified progress: timestamp unit/publication fixes deployed and verified on fresh AZ. Current native process7015 still live before measurement. Screenshot /tmp/az-damage-state.png confirms two running waveform tracks (Estara1:49remaining, DeadWrong0:40remaining).
- Added analysis/probe-xdamage.py, a ctypes XDamage NonEmpty root observer with immediate subtraction. Low overhead notification measurement only: notifications can represent partial/coalesced drawing, not completed or presented frames. Ten seconds gave684events, median5.02ms/p9545.87ms/max51.46ms;223gaps>25ms,86>40ms. Saved pi-az-damage-nanosecond.json. Bursts prevent interpreting event count asFPS.
- Independently sampled X11 waveform crop850x170 at180,90 with x11grab120Hz for8seconds.959samples,165changed hashes (~20.5change intervals/sec), median pixel-change interval50ms,p9566.67ms,max91.67ms. Saved pi-az-waveform-nanosecond.framemd5/.json. This is actual pixel-change evidence consistent with complaint; capture can add overhead and samples partial updates, not panel presentation. No pre-fix equivalent capture, so no quantified speedup claim.
- Saved az-vsync-callers.json and az-vsync-timers.asm. Standalone constructor0x212edc0 has no BL callers found; timer constructor0x212f768 inlines1000/frequency at0x212f7b8 and stores period+0x58. Next trace its callers/frequency and callback work, distinguish scheduling from rendering cost, and obtain repeat measurements before tuning. Do not blindly claim refresh cap or compositor fault.

### Native timer rate and concrete XImage conversion mismatch (2026-09-12)

- Previous goal turn made progress by measuring actual waveform changes. Native process7015 revalidated live this turn. Constructor factory0x212f880 calls0x212f768; factory caller0x2101dd8 loads double59.24Hz from0x2e33a40. Timer period1000/59.24, not a24FPS cap. Saved az-vsync-rate.json, az-vsync-rate-caller.asm and constructor-callers.json. Current synthetic publisher remains60Hz; discrepancy is a separate tuning variable.
- Restarted existing tracks through traced ERP Cue then Play pulses for both groups. Ten-second perf cpu-clock99Hz sample,384samples/no losses, saved pi-az-drawing.perf and text reports.44.79% samples are main-thread libX11,16.93% main-thread EP147. Hotspots0x29acc/29ab8/29abc fall in generic pixel accessor byte assembly; XPutImage appears too. This is CPU distribution, not wall-time stall accounting.
- Brief GDB breakpoint at mapped XPutImage captured x3 XImage:1280x800,ZPixmap2,LSBFirst0,bitmap_unit32,depth24,bytes_per_line3840,bits_per_pixel24. Saved pi-az-ximage-layout.txt. Debugger detached; TracerPid0 verified. Profiling occurred before debugger attachment.
- XListPixmapFormats on actual Xwayland reports depth24 uses32bits/pixel, pad32. Saved pi-xwayland-pixmap-formats.json. Thus AZ supplies packed24-bit rows while server expects32-bit. Generic getter fallback confirmed by _XInitImageFuncPtrs disassembly:24bpp selects0x29818 (hot branch),32bpp selects0x29fb0. Saved az-x11-image-hotspot.asm.
- Next implement opt-in XPutImage24->32 conversion shim with correct source rectangles, byte order, bounds, unchanged fallback and buffer lifetime; validate pixel equivalence then A/B native waveform cadence. Do not change firmware bytes blindly or infer speedup before measurement. Native59.24Hz synthetic pacing adjustment can be tested separately. No claimed fix yet; full DSP/mixer goal remains open.

### Packed24 upload shim implemented, pixel-verified and live (2026-09-12)

- Previous goal turn classified progress: native rate and XImage/server format mismatch established. Added shims/ximage-packed24.h and ximage-fast24.c. Expands only supported LSB packed24 depth24 ZPixmap rectangles, retains masks/depth/GC/destination, uses independent per-call buffer and original-call fallback for unsupported geometry/format/allocation failure. No firmware edits or global preload. Optional XIMAGE_FAST24=1 added local PC/Pi and remote interactive/Pi launchers; backups .before-fast24.
- tests/test location shims/test-ximage-packed24.c:3000rectangles,898180pixels compare native XGetPixel including padded rows, offsets/source immutability and rejection cases. Host normal+ASAN/UBSAN and Pi normal pass. Initial invalid random scanline fixture rejected by XInitImage; corrected to valid padded rows before successful runs. shims/test-ximage-upload.c compares original libX11 handle call versus interposed call on real Xwayland pixmaps:100uploads,320000server pixels equal including GC clipping. System libX11 oracle, not firmware lib version execution.
- Pi build cc -O3 -fPIC -shared -nostdlib avoids recent glibc symbol-version dependencies (readelf no version information). Restarted native session launcher7906/sandbox7911/EP1477913. /proc7913/maps confirms ximage-fast24.so loaded; native UI screenshots render correctly. Sources/build/limits documented shims/XIMAGE-FAST24.md.
- First source/load sequence before ready loaded nothing, second loaded Estara/DeadWrong but screenshot/capture showed paused and expanded-waveform view; first pi-az-waveform-fast24.framemd5 is stationary, NOT benchmark. Explicit Play pulses then second capture confirms timers advancing (/tmp/az-fast24-moving.png). 960samples/8sec at120Hz,161changed,20Hz visible updates,median50ms,p9591.67ms. Saved pi-az-waveform-fast24-moving.framemd5/.json. View differs from earlier baseline (side panes collapsed), so no controlled performance comparison or regression claim. No FPS benefit demonstrated. Added summarize-framehash.py using actual timebase and safe stationary handling.
- Eight-second perf sample173/no losses versus earlier384/10sec; total sampled CPU approximation0.218CPU vs0.388, not matched-track-position/view A/B. New shim appears5.78% of samples; original libX11 hotspot no longer appears above1%. This supports successful interception/removing conversion cost, not causal frame-rate improvement. Reports pi-az-fast24-perf[-dso].txt. Raw sample remains Pi/tmp/az-fast24.perf. Timing source still60Hz to isolate change. No audible output (paced NULL) and no completed DSP/mixer/native-control claim.
- Next bottleneck remains drawing/timer cadence despite removed pixel-conversion hotspot. Obtain matched-view comparison, trace repaint callbacks and scheduling, and test native59.24Hz publisher separately. Overall firmware goal open.

### Live repaint/blit scheduling mapped (2026-09-12)

- Previous goal turn made progress with pixel-equivalent fast path and live benchmark/profile. Current EP1477913 revalidated. User requested temperature:58.4C,vcgencmd throttled0x0; responded immediately. Continued scheduling task.
- MainDisplayUpdateTimer callback0x212fb40 reads elapsed tick count floor((now-vsync)/period)-floor((previous-vsync)/period), gates callback on >1, schedules secondary timer+0x50 via0x212f900, updates+0x78, and schedules own next-boundary+period. This alone is not proof of complete-display cap because secondary timer is present. Diagnostic strings identify reserveToRepaint and onImageBlit. Native period16.88048615800135ms verified live.
- perf uprobes unavailable: CONFIG_UPROBE_EVENTS interface absent; perf probe failed cleanly, no probes installed. Brief GDB break at0x212fb40 captured timer object0x7fff9a4f19a0, vtable0x2e414e0. Saved pi-az-timer-object.txt. Detached. Read-only /proc/7913/mem followed std::function invoker0x1986a78 -> object0x7ffeb2f08d40/vtable0x29c98c0/slot+0x10 -> actualcallback0x1987038. Stored+0x38 happened to resemble a code address but is not the call target; avoid guessing from unused std::function storage. az-display-repaint-callback.asm now contains actualtarget.
- Secondary timer object0x7ffeb3c09d20/vtable0x315e560 has callback0x24fb350, entering X11 event/blit handling; partial disassembly az-secondary-display-timer.asm. Continue full path to exact image-present scheduling/ack behavior.
- Eight-second read-only timer-field sample:257observed +0x78changes after initial,median32.833ms,p9536.840ms,max39.066ms;192observed+0x80changes afterinitial,median37.126ms,p9554.541ms,max56.070ms. Saved pi-az-live-timer-cadence.json. These internal fields corroborate slower/uneven two-stage updates, not panelFPS. Playback state not separately screenshot-verified during this timer sample. Added parameterized probe-az-timer-state.py with vtable/period checks; runtime addresses must be rediscovered perlaunch.
- Next complete secondary X11 timer and onImageBlit interaction, then matched pacing tests; no speculative refresh-cap patch deployed. Full firmware/DSP task remains open.

### X11 upload delay hook resolved; period experiment inconclusive (2026-09-12)

- Previous turn progress: live timer map and field cadence. Current readonly /proc7913/mem resolves global0x3bd6708 to main timer interface+0x28/vtable0x2e41590. slots0/8/16 are onImageBlit0x212f608, delayquery0x212f3c8, timer-registration0x212fce0. Saved pi-az-display-hook-vtable.json.
- X11timer0x24fb350 calls register0x21b59d0 then delay0x21b59b0. Nonzero delay reschedules BEFORE painting. Dirty region path0x24fa6f0 eventually XShmPutImage0x24fabc4 or XPutImage0x24faca0 then onImageBlit dispatch0x21b5990. Thus two-stage scheduler, not solely image-copy performance. Added AZ-DISPLAY-SCHEDULING.md and detailed tail/fallback disassemblies.
- Ran short runtime-only original/half-period experiment on timer+0x58 with finally restoration. Confirmed original16.88048615800135ms restored. No firmware bytes changed. Both captures show no motion; screenshot confirms tracks remained ended at0:00. ERP Cue+Play attempt did NOT reset end-of-track as assumed. Both az-period-original/halfperiod.framemd5/.json are invalid for throughput comparison; no speedup/no-effect inference. Temporary remote az-period-experiment.py hardcodes current-session addresses and is NOT reusable without rediscovery; not published.
- Next establish reliable seek/reload with verified playback before rerunning period test, or use internal timer state as separate scheduling evidence. Fast24 remains enabled, original period restored. Overall objective open.

### Moving period A/B/A shows scheduling improvement (2026-09-12)

- Previous goal turn made progress mapping two-stage upload hooks but stationary experiment was invalid. Revalidated7913. Source/load helper reloads currently selected DeadWrong into both decks (not deterministic Estara choice); screenshot /tmp/az-reload.png verified fresh nonzero remaining times but paused/red needle. Explicit Play-only pulses then started both. Avoid claiming generic Cue restarts ended tracks; fix input lifecycle separately.
- Controlled within-session A/B/A: period16.880486158ms(original),8.440243079ms(half),16.880486158ms(restored),8sec120Hz captures each, same expanded waveform layout and same two files, continuing sequential positions. Final field restoration verified by exact bytes in finally. Fast24 enabled throughout, synthetic file60Hz unchanged.
- Original155changed samples=>19.25Hz,median50ms,p9591.67ms,max100ms. Half230=>28.596Hz,median35.531ms,p9555.509ms,max66.953ms. Restored161=>20Hz,median50ms,p9591.67ms,max100ms. Timestamp parser uses actual per-capture timebase (half capture differs from1/120). The return toward baseline supports a scheduling effect, not CPU conversion alone. One sequence is not comprehensive stability or exact panelFPS proof.
- Saved az-moving-period-{original,halfperiod,restored}.framemd5/.json and az-period-aba-results.json. Screenshot /tmp/az-moving-period-halfperiod.png confirms both tracks progressed (2:37/2:44remaining), correct visible waveform layout. Reference experiment analysis/pi-period-experiment-session-7913.py has hardcoded current-process addresses; don't reuse after restart or treat as production tool.
- Original timer remains restored at turn end. Next test repeatability/rate options and replace experimental field edits with a validated opt-in runtime setting before user-facing deployment. Goal remains open.

### Reusable timer diagnostic and user visual-quality feedback (2026-09-12)

- Added analysis/az-timer-experiment.py: defaults read-only; verifies /proc/pid/exe SHA256, discovers hook via0x3bd6708, validates hook/main vtables and untouched period before mutation. Supports bounded scale1/.5/.25,<=60seconds; exact-byte restore on normal/error and SIGTERM/SIGINT (SIGKILL cannot cleanup). Compiles; actual read-only query and class-based sweep validated on7913. Individual CLI signal cleanup not yet exercised. Copied Pi lab.
- Reloaded two DeadWrong tracks and explicit Play-only pulse. Sweep8seconds each: half28.872Hz,median33.482ms,p9558.313ms,max66.571;quarter32.730Hz,median31.899ms,p9547.417ms,max59.104;original20.626Hz,median49.983ms,p9583.427ms,max99.977. Saved az-sweep-{half,quarter,original}.framemd5/.json. Quarter captured only731samples rather than~960, indicating capture could not sustain120Hz; not a fair exact panelFPS or throughput comparison. Original field restore verified both finally and fresh read-only diagnostic.
- User says it almost looks worse, grid flickers/jitters, similar impression onRX2. Acknowledged subjective visual quality matters, no smoothness improvement claim. Faster counts still uneven. Investigate line rendering/scaling separately, not just count.
- Temporary Sway con36 fullscreen-off/floating1280x800 probe visibly CROPPED content instead of clean1:1 rescale. Screenshot /tmp/az-native-size.png. Immediately restored floating disable/fullscreen enable, success. This is NOT evidence scaling caused shimmer; fullscreen rootful-Xwayland geometry/content relationship needs verification. No persistent config edits. Synthetic timing60Hz and fast24 remain enabled; original16.880ms timer restored.

### Actual X11 geometry and phase-locked clock preparation (2026-09-12)

- Previous turn progress: reusable timer discovery/sweep plus subjective feedback preserved. Queried actual X11 root and top-level AZwindow with XGetGeometry/XQueryTree:both1280x800depth24. Fullscreen Sway surface1920x1200 was verified earlier;1.5x scaling is real, but previous floating test merely clipped its surface. Saved pi-az-x11-geometry.json. No further window mutation or image-quality claim.
- Added optional display_timing.SyntheticVsync with rational frequency and epoch-anchored integer-nanosecond deadlines. Late wakeups skip elapsedticks instead of phase drift; published timestamp is never future; next deadline strictly after now. Pure invariant checks at1/59.24/60/120/240Hz through24h passed. Class is NOT integrated into launcher yet; active writer stays old relative60Hz loop.
- Copied helper toPi and ran independent5sec59.24Hz temporary-file publication/deadline test, not active AZ timing. Result pi-absolute-vsync-independent.json. Next bounded compare active clockcadence with same timerperiod/view, then true unscaled server startup experiment. No permanent changed timing, no new FPS claim.

### Absolute59.24Hz clock verified and enabled in Pi launcher (2026-09-12)

- Previous turn progress: actual1280x800 X11 geometry and rationalclock prototype. Clock-only A/B/A kept original native period and fast24 while existing launcher7906 was SIGSTOPped (only parent, not nativechildren) for temporarywriter, then SIGCONT after writer join. Finally cleanup succeeded, no errors; parentSs/nativeSl verified. Both DeadWrong tracks visibly advanced. Before20.125Hz/median50ms/max100ms; absolute59.24Hz29.595Hz/median33.335ms/max41.789ms; after19.875Hz/median50ms/max100ms. Reports az-clock-*.framemd5/.json and az-clock-aba-results.json. Single sequence not panelFPS guarantee.
- Integrated optional LAB_VSYNC_HZ into local PC/Pi and remote interactive/Pi launchers. SyntheticVsync initialized before childlaunch; eachloop publishes elapsed epoch tick then sleeps to absolute deadline. Omittingflag keepslegacyrelative60Hz for comparison. Backups .before-absolute-clock. Syntaxchecks pass.
- Restarted Pi using prior launcher environment plus LAB_VSYNC_HZ=59.24. Newlauncher9255,sandbox9260,native9262. Native timer query automatically found newobject0x7fff3e8f1900 and confirmsoriginal16.880486158ms. Noempty-lines assertions in freshlog. Fast24 remainsenabled; no nativeperiodpatch.
- Initial Source pulse opens emptyPleaseSelectSource browser; second Source pulse opens usableSource page. LoadhelperthenloadsEstara/DeadWrong but leavespaused; extraPlay-only pulses confirmedmoving via pixelchanges. This repeatable startup/input-state issue deserves separate fix, not blindCue/Play claims.
- Fresh deployed-launcher8sec capture958samples,238changed=>29.625Hz,median33.333ms,p95/max41.667ms. az-clock-deployed.framemd5/.json. Confirms gain persists through actual launcher implementation/restart. Still synthetic59.24clock, originalnative~30Hz two-tickpolicy, no panel-vblank synchronization or subjective flicker-elimination claim. Fullscreen restored; pacedNULLaudio persists. Full firmware/DSPgoal open.

### Stable-clock timer retest and grid-maker entry mapped (2026-09-12)

- Previous turn progress: deployed absolute59.24clock and verified29.625Hz cadence. Current native9262 verified through firmware-hash-aware Timer diagnostic. Original/half/restored6sec captures on stableclock:29.5/29.627/29.460Hz. Median~33.33ms throughout, no meaningful throughputgain; originalperiod restored in finally. Reports az-stableclock-*.framemd5/.json and az-stable-clock-period-aba.json. No basis to deploy timer shortening.
- Shifted focus to native grid drawing per user flicker complaint. Added grid-xrefs.py ADRP/ADD candidate scanner. DetailedWaveformWidget::update gridMaker.makeGridImage diagnostic refs at0x1b97940,0x1b97fe8,0x1b986b4. First inspectedcall0x1b97984 ->0x1dffe10, receives object+0x90, zoom in s0, integeroffsetw2, dimensionw3,flagw4/w5. Image result assigned widget+0x110.
- Grid maker caches image atobject+0x28, manipulates pixel rows, and builds12-byte grid descriptors in vector+0x10. At0x1e006d0..0x1e006f0 converts position through floatdivide, multiply150.0, multiplyzoom, truncates tointeger then subtractsintegeroffset. Integerxstored0x1e006fc, colorbytes+4..7,flag+8,12bytestride. This proves integer-coordinate grid records at this stage, not complete lack of downstream filtering or cause of perceivedflicker. Denominator/positionunits still need tracing.
- Saved az-grid-xrefs.json, az-grid-maker-call.asm, az-grid-maker-entry.asm and az-grid-maker-tail.asm. Next trace final descriptor rasterization/compositing, compare native grid pixel behavior across frames and zoom; avoid claiming fractional scaling alone explains RX2 or Pi behavior. Current absoluteclock+fast24 remainenabled; originalnativeperiod/fullscreen unchanged.

### Grid image rasterization confirmed (2026-09-12)

- Previous goal turn was a status explanation without new evidence; resumed with local firmware inspection. Revalidated EP147 SHA256 and regenerated entry disassembly: exact match with --no-show-raw-insn (initial comparison differed because raw instruction bytes were enabled).
- Traced descriptors into actual pixels: 0x1e00000..08 writes one 32-bit descriptor color into a row; intervening pixels use background. Flag-clear path copies that row vertically at0x1e00340..388. Thus cached grid image uses one-source-pixel-wide lines with integer positions and no fractional coverage in this routine. Flag-set path selectively changes lower rows using descriptor+8. Downstream filtering and perceptual cause remain unproven.
- Saved AZ-GRID-RASTERIZATION.md with exact addresses, object layout, limits, and next experiments. No live runtime changes. Next trace cached image compositing and measure actual line motion/intensity, followed by genuine unscaled startup comparison. Overall firmware/DSP objective remains open.

### Grid image paint transform mapped across three waveform variants (2026-09-12)

- Previous turn progress: direct one-pixel grid rasterization. Revalidated live Pi EP1479262/Xwayland9256 (1280x800 fullscreen); temperature57.6C. No process restart or display modification.
- Added SHA-pinned RTTI/vtable mapper for DetailedWaveformWidget Blue/RGB/3Band. Primary slot4 methods0x1b857b0/0x1b85630/0x1b854b0 all paint grid cached+0x110 through0x23b05e0 with zero integer x/y andflag0. Helper builds explicit identity affine transform then forwards to0x23b04e0; image backend dispatch atslot+0xc8. Thus no fractional horizontal positioning or local scale added at this boundary. Existing graphics context/backend and compositor still require tracing; no claim of whole-pipeline absence of filtering.
- Saved variant disassembly and draw helper disassembly; extended AZ-GRID-RASTERIZATION.md with vtables, callsites, identity transform and lower mirrored reuse. No native code patch. Full firmware/DSP objective remains open.

### Live JUCE software backend and integer context verified (2026-09-12)

- Previous turn progress: mapped three paint variants. Revalidated EP1479262 and briefly attached GDB twice; Blue paint and first grid draw hit. Both detached; final TracerPid0. Saved pi-az-grid-backend.txt/pi-az-grid-state.txt.
- Live backend vtable0x3142bc0 resolves RTTI juce::LowLevelGraphicsSoftwareRenderer, image method0x23fb5b0 -> savedstate renderer0x23fad60. Captured context integer-translation flag1, x/y=-5/0, identity stored affine, supplied image x/y0/0, opacity255, quality-related field1. Thus no local scale/fractional movement in this actual grid draw. Saved backend disassembly and extended AZ-GRID-RASTERIZATION.md.
- Static backend chooses integer path for identity plus integer translation even with qualityfield1. Sampling-quality toggle alone cannot restore upstream discarded subpixels. Remaining work: capture native line motion/intensity and compare genuine unscaled output; compositor behavior still unverified. No native patch, no flicker fix claimed. Overall goal remains open.

### Native grid motion captured: uneven one-pixel holds, stable color (2026-09-12)

- Previous turn progress: live software renderer and integer transform. Current screenshot showed both tracks ended. Reloaded via Browse/helper, explicitPlay pulse, screenshot confirmed DeadWrong both decks with nonzero remaining times and white cursors. No valid moving-data claim from ended state.
- Captured native620x1 red-grid strip atx420/y100, sixsec120Hz rawRGB24/NUT. Added analyze-grid-strip.py with preserved timestamps, frame-count assertions, edge-excluded exact shift matching and ambiguity rejection. Corrected ffmpeg decoder default frame resampling using fps_mode passthrough after assertion caught mismatch.
-720samples,113changes all-1pixel, no rejected shifts;16735line samples allwidth1/RGB255,0,0. Holds mainly33/67ms,median66.666,max75ms. This measures grid quantization holds, NOT applicationFPS. Evidence supports uneven native stepping rather than red-line intensity blinking in this crop; physical display and scaling unmeasured. Files az-grid-strip.nut/.json, expanded AZ-GRID-RASTERIZATION.md. No renderer patch; overall firmware/DSPgoal open.

### Matched enlargement capture shows unequal grid widths (2026-09-12)

- Previous turn progress: native red-grid motion capture. Briefly froze verified EP1479262, captured X11+grim, finally resumed and confirmedR. Native1280x800 and compositor1920x1200 screenshots retained.
- Numeric comparison of20matched grid lines: source allwidth1; output12width1 and8width2. Confirms enlargement introduces spatially unequal hard-pixel line widths; temporal width pumping is plausible but not directly measured here. Simple nearest floor/center predictions notexact, so no exactfilterclaim. Added analyze-scale-pair.py/az-scale-comparison.json and documentation. PIL unavailable, usedffmpegRGB decoding without installing dependencies.
- User asked whether eachfix restarted. Clarified launcher/library fixes restarted; recent diagnostic-only passes and temporary timing experiments did not. No permanent new renderingfix yet. Overallgoal remainsopen.

### Live output filter trial enabled after static A/B/A (2026-09-12)

- Previous turn progress: matched enlargement line widths. OutputDSI-2 explicitlynearest. Runtime-only nearest/linear/nearest test with same frozen frame proved different linear result and identical before/restored PNGhashes. Finallycleanup restorednearest/resumedAZ. Ended-track sample only validatesfilter pixels, notFPS/motion. Corrected initiallyemptycrop to actualredgrid x270..445/y150.
- Linear distributes linecoverage into intermediate redvalues42/43/127/128/212/213 instead of hard255. Screenshot inspected: smootheredges/softertext. Saved az-filter-*.png/az-filter-comparison.json, documentedcontrol/rollback.
- Intentionallyenabledlinearruntimefilter after test, command success; user informed. No persistentfileedit/no AZrestart needed. Native timing remainsunchanged; no flickereliminationclaim. Next movingplayback visual/overhead comparison. Overallfirmware/DSPgoal open.

### Linear output filter verified during two-track playback (2026-09-12)

- Previous turn progress: filter staticA/B/A and enabledlineartrial. Revalidated9262/9256/1143/launcher9255. Reloaded tracks; three screenshots show sameview/zoom and advancingDeadWrongbothdecks. Differentzoomfromearlierline-motiontest, do notconflate.
- Session-specificpi-filter-playback-probe.py runslinear/nearest/linear6sec each, checksprocessstarttimes andrestoresoriginalfilterfinally. Nativechanges29.833/29.5/29.5Hz; allmedian33.33,p95/max41.67ms. CPUonecoreAZ31.43/31.59/31.75%,Xwayland21.17/21.65/21.01%,Sway2.73/3.05/3.05%. No materialaddedCPU ornativecadenceregression inshorttest;GPUutilization/physicalflicker/audio-underruns notmeasured.
- Reports/screenshots az-filter-play-*, CPUaz-filter-playback-results.json, extendedAZ-GRID-RASTERIZATION.md. Linearremainsactive. Native~30Hz/integerpositionmotionstillunfixed; fullfirmware/DSPgoalopen.

### Four-instruction scheduling candidate tested and rejected (2026-09-12)

- Previous turn progress: linearfilterplaybackCPU/cadencecheck. Revalidated native9262. Added pi-one-tick-experiment.py with SHA/starttime/byteverification, GDBstoppedcodewrites and finallyrestoration; SIGINT/TERMcleanup. No firmwarefileedits. Candidate changesmain/uploadelapsedtickthreshold1->0 and bothreserveToRepaintdelaybranches to1ms. Encodingsllvm-mcverified.
- Pixelcapturesoriginal29.460/candidate29.627/restored29.460Hz, same~33msmedian. Originalsamplebeganbefore reloadhelpercompletioncollected: explicitlyexcludedfromstrictbaselineclaim. Candidate/restoredalone shownogain.
- Added --timer-fields follow-upwithoutffmpeg. Original/candidate/restoredall177repaint+178blitchangespersixsec,medians~33.7ms. Internal schedulerdidNOTspeedup, so cannot inferupstreamdatarefreshcap. Remainingpost-callbackextra-periodandblockedbranchpolicyneedtracing.
- Saved AZ-ONE-TICK-EXPERIMENT.md, az-one-tick-*captures/logs/fieldreports. Exactoriginalinstructionsrestoredtwice; nativeStateS/TracerPid0verified. Linearfilterremainsactive; no permanentnewtimingpatch. Overallgoalopen.

### Complete one-tick policy doubles callbacks, not waveform changes (2026-09-12)

- Previous turn progress: incompletefourinstructioncandidate noeffect. Added three matchingpolicychanges: removeextra postcallbackperiod0x212fc1c and fallback1->0 at0x212fc44/0x212f358. SHA/byte/starttimeguardedGDBexperiment pi-full-one-tick-experiment.py, exactrestorationfinally.
- Sixsectimerfield A/B/A:original178/177repaint/blit,candidate355/355,restored177/178. Medians~33.7->16.8->33.7ms. Thus actualinternalcyclecanrun59Hz.
- Verifiedreloadcompletedbeforerunningpixeltest.850x170capture~29.67/29.48/29.50changes/sec; candidatecapturefellto648samplesandAZCPU31.3->51.0->31.4%onecore. Repeated400x32crop(pi-small-one-tick-experiment.py) sustained~720samplesbutcontentstill29.5/29.63/29.46Hz. This is newevidenceofextra workwithoutdistinctwaveformgain, notsuccessful60FPSfix.
- Saved AZ-FULL-ONE-TICK-EXPERIMENT.md, az-full/small-one-tick-*reports/screenshots/logs andJUCEstart-timerdisassembly. Originalinstructionsrestoredaftereachtest; no nativecandidateleftenabled. Linearfilterremainsactive. Nexttracewaveformupdate/provider vsuploadgating; overallfirmware/DSPgoalopen.

### Waveform position source resolved to persistent native field (2026-09-12)

- Previous turnprogress:59Hzinternalcallbackswithoutdistinctwaveformgain. Tracedgrid update0x1b976f0 via directcalls0x1b93cc0/0x1b94430 to positionretrievalat0x1b94380. Added reusableAArch64BLscanner andsavedcallchain/disassembly.
- Livegetterresolved0x1b8e580 (owner0x7fff0981c010/vtable0x2b6f208). Defaultbranchconfirmed0x1b8e5f0 readsowner+0x19808pointee+0xf8; sessionfield0x7fff3e695008,value183334. Temporaryx6stackreference explicitlynotpersistent. GDBunwindfailed, rawstackreturn-likevalueswerenotusedasproof.
- AddedAZ-WAVEFORM-POSITION-PATH.md withbranches, sourceownership, limits. Endedtrackstate meansnocadenceclaimyet. Nextsamplepersistentpositionduringverifiedplayback andcompareoriginal/candidatetiming. Allbreakpointsdetached; no newpatch. Overallgoalopen.

### Cached waveform position remains30Hz; writer found (2026-09-12)

- Previous turnprogress:resolvedpersistentdefaultpositionfield. After completedreload, original/candidate/restoredsixsec memorysamples:repaint29.69/59.27/29.73Hz whileposition29.69/29.72/29.73Hz withmedianincrements34units and~1000units/sec. Thus knownwaveformpositioncache stays30Hz evenwhenredrawdoubles; underlyingaudioenginepositioncadence notyetknown. Added guardedpi-position-rate-experiment.py/summarize-position-rate.py andraw/summaryreports. Originalinstructionsrestored.
- GDBhardwarewatchpoint caughtmainthreadwriter0x1fbd8ec copyingobj+e0to+f8. Enclosingroutine1fbd680fetchesposition via1493718 to+e0; accessorusuallyreadssource+e8timesdouble+20withmode/sentinels/rounding. StaticBLcaller1fc9b00found. Saveddisassembly/watchlog/callerJSON andextendedAZ-WAVEFORM-POSITION-PATH.md.
- Nexttracesnapshotupdatescheduler/sourceownership. No permanenttimingpatch, no inventedpositionwrites. Linearfilterstillactive; goalopen.

### Zoom demo and residual wobble investigation (2026-09-12)

- Demonstrated native encoder zoom with counter3,4,3,2,1 and five-second holds; final screenshot confirms32/64/96 labels restored. Linear scaling stays enabled. User reports improvement but residual grid/possibly waveform wobble.
- Position advanced4994 units in4.99712sec with no negative steps. Six-second native capture719 samples:113 exact grid transitions, all left1pixel; waveform rows changed178 times but exact-color shift matcher rejected all, so their direction remains unresolved. Physical panel motion not captured. Saved analyzer/report and documented limitations.
- Extended static position snapshot chain to four-entry polling routine1fcc4f0 and caller198728c. Next resolve enclosing update cadence and how waveform rasterization differs from integer grid motion. No new runtime patches; broad firmware/DSP goal remains open.

### Drawing conditions and fractional waveform path (2026-09-12)

- User requested another code-level investigation of line redraw/wobble. Valid grid updates reset/rebuild descriptors; image dimension checks reuse allocation but still rasterize. No evidence of presenting a cleared intermediate frame.
- Same position reference feeds grid and waveform; grid truncates to integer x, while waveform retains fractional phase and uses it in Q15 column-color blending. Additional fractional threshold coefficient branches retained, not fully reconstructed. This is a candidate explanation for relative shimmer; physical backward wobble unproven.
- Tested scalar float32 grid versus float64 waveform base expressions over0..240000ms at seven zooms; no mismatches. Do not blame precision alone or patch a rounding instruction blindly.
- Saved AZ-GRID-WAVEFORM-UPDATE-CONDITIONS.md, full condition/column-blend/fraction disassemblies and scalar report. No new live changes. Next consistent fractional grid coverage experiment plus upstream position freshness; goal remains open.

### Native fractional blend oracle and isolated candidate (2026-09-12)

- Previous goal turn classified progress: traced redraw conditions and distinct grid/waveform paths. Revalidated EP1479262 and launcher9255 alive, no Pi changes this turn.
- Added SHA-guarded libc-free AArch64/QEMU fragment runner.6003 original-code inputs (threezooms,3000negativepositions) confirmed ten fractional coefficient pairs and high-contrast byte-blend formula, zero mismatches. Static contrast gate distinguishes this path from continuous interpolation.
- Opposite255/0 edge test gives encoded-byte sums255..346 across phases. This is not optical brightness or proof of visible wobble; deliberate contrast preservation may be intended. Isolated continuous-weight candidate keeps sums254..255 with zero formula mismatches. Full renderer/branchselection not exercised.
- Saved AZ-WAVEFORM-FRACTION-ORACLE.md, runner, original/candidate numerical reports and samples. Next live branch-hit validation and reversible matched-frame blend test, then fractional grid consistency. No permanent patch; full goal open.

### Live blend branch validation and reversible comparison (2026-09-12)

- Previous goal turn progress: original ARM fractional-blend oracle plus isolated alternative. Revalidated prior launcher/player absent, restarted same fixture; actual EP14711605, launcher11596. Both test tracks loaded and play/pause visually verified.
- Original oracle RGB branch141c not hit. Live provider queryresult1 and high-contrast branch1e026b8 hit; current single-lane zoom<1 path peak-pools source samples then blends. Adapted candidate to four verified branches in this actual path.
- Same-position paused A/B/A: candidate21686 waveformpixels changed, allselectedchannelchanges darker; original-repeat and restored pixel-exact original. No grid/UI changes. Moving sixsec A/B/A:CPU27.60/27.48/27.75%onecore;distinctcrop29.50/29.58/29.67Hz. No FPSfix or subjectivewobbleresolution claimed.
- Added guardedpi-blend-comparison.py, correcttimebase summarizer, screenshots/rawchecksums/logs and AZ-LIVE-BLEND-COMPARISON.md. All originalinstructionsrestored; TracerPid0,55.65°C. AZleftplaying baseline. Nextfractionalgridcoverage/sourcepositioncadence; fullgoalopen.

### Separate LocalPlayer timer unlocks measured 59 Hz waveform content (2026-09-12)

- Traced live waveform source through PlayerStateWithUpdate and a conditional breakpoint to LocalPlayer callback 0x1e27790, called by JUCE dispatcher 0x239dd54. Four LocalPlayer timers use interval 33 ms at object+0x10. The four-deck polling callback is the already known main display callback, not the separate limiter.
- Six-second read-only sample: upstream raw position 344.51 changes/sec, LocalPlayer copy 29.67, render cache 29.50, no negative steps. The upstream address belongs to a snapshot buffer and must not be hardcoded as a bypass.
- Guarded original/provider-only/combined/restored experiment: 16 ms LocalPlayer intervals alone increase source freshness to 59.26 Hz, but cached/drawn content stays around 30. Combined with previous seven-instruction repaint candidate, repaint/source/cache all reach 59.27 Hz and native waveform crop 59.12 Hz. Restoring returns crop to 29.56 Hz. CPU rose from 30.49 to 48.98 percent of one core; combined playback-position progression 1000.004 units/sec. This is one moving deck, four-second samples; no audio, optical wobble or sustained two-deck claim.
- User needed playback during inspection. Loaded Estara on deck 1, sent native ERP Play, verified position advancing. Deck 2 paused in benchmark. All interval/instruction candidates restored after comparison; TracerPid 0, final temperature 57.85 C. No permanent firmware modification.
- Saved pi-provider-repaint-experiment.py, az-provider-repaint artifacts, and AZ-POSITION-TIMER-BREAKTHROUGH.md. Next lifecycle-safe integration and physical evaluation, plus integer-grid shimmer investigation. Broad firmware goal remains open.

### Restartable 59 Hz scrolling experiment verified with two decks (2026-09-12)

- Previous goal turn was progress: combined timer changes produced 59 Hz content. Traced startup frequency through configuration default 0x1e262e8 (30 Hz), LocalPlayer factory, and JUCE integer 1000/Hz helper. Changing the scoped default to 60 creates 16 ms intervals while preserving disabled-timer checks.
- Added az_scroll_overlay.py: SHA/ELF/byte-guarded temporary copy, eight instruction changes, original untouched. Native Pi and interactive launchers accept LAB_AZ_SMOOTH_SCROLL=1 with LAB_VSYNC_HZ=59.24. Tested exact byte scope, unknown-image rejection, generated disassembly and cleanup.
- Restarted verified old session, fresh launcher 13300/player 13308. All four LocalPlayer timers automatically 16 ms; running overlay SHA 137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c. Two playing tracks: 30 seconds at repaint 59.236 Hz, source positions 59.203 Hz, 999.812 units/sec and zero negative steps. Native crops 58.84/58.83 distinct Hz, median ~16.67 ms, occasional gaps 33–38 ms. CPU 42.66% one core includes overlapping captures and differs from earlier workload.
- Both decks paused with exactly stable source positions, then resumed. Left experimental overlay playing for user inspection. Original file SHA unchanged, TracerPid 0, final temperature 58.4 C. Still paced null audio; no audio or physical-wobble fix claim.
- Evidence and enable/disable instructions in AZ-SCROLL-STARTUP-EXPERIMENT.md. Pending: grid shimmer and physical presentation, longer runs, seek/loops, controller and full DSP/audio integration. Broad goal remains open.

### User confirms smoother motion; remaining grid stepping recorded (2026-09-12)

- Previous turn was progress: restartable 59 Hz setting and two-deck checks. User now confirms smoother but residual wobble. Live player 13308 revalidated; no new renderer/timing changes.
- Full compositor/native recording could not keep up (133/370 frames), so these were rejected as representative smoothness clips. Downloaded wf-recorder/dependency into private lab directory without installing system packages.
- Delivered 10-second native waveform detail clip: 600 actual captured frames, 60 fps, no interpolation. Saved /home/subsect/Downloads/AZ-waveform-59Hz-detail.mp4; open request queued. Lossless analysis master retained. Grid row has 371 exact -1 and two -2 pixel shifts, no backward/ambiguous matches; median pixel-position hold 33 ms while waveform rows change 583 times. This supports integer stepping as a contributor, not proof of optical flicker's complete cause.
- Evidence and limits in analysis/scroll-recordings/README.md. Experimental 59 Hz setting remains enabled. Fractional grid rendering and physical presentation remain next targets; full firmware/DSP/native-control goal open.

### Native fractional grid drawing verified (2026-09-12)

- Previous turn was progress: delivered a valid 60 fps detail recording and confirmed integer grid steps. Traced final grid drawing to JUCE software renderer 0x23fb5b0 -> 0x23fad60. Live grid uses quality 1, identity image transform and context translation (-5,0).
- Found fractional translation shortcut: fixed-point low-bit mask 0xe0 can round small offsets back to integer positions. New pinned ARM/QEMU gate oracle matched 24,582 positive/negative/quality/Y-offset cases with zero discrepancies; full pixel filtering not part of oracle.
- Stationary live baseline/-0.5px/restored grid draw: half-pixel transform changed only 502 pixels in top grid strip. Gray166 split83/83, red255 split128/128. Baseline/restored pixel-exact. No persistent fields or code changed; debugger detached. This proves native fractional coverage, not smooth motion.
- Saved AZ-FRACTIONAL-GRID-DRAWING.md, probe, numerical reports, screenshots and breakpoint logs. Next per-grid fractional correction from the same waveform position, with scoped handling of integer shortcut. Existing 59 Hz overlay remains enabled; broader goal open.

### Continuous fractional grid experiment measured on the Pi (2026-09-12)

- Previous turn was progress: returned the user from Utility to Waveform and verified native playback advancement. Revalidated launcher 14534/player 14542 and exact scrolling-overlay SHA before current experiments.
- Built opt-in ARM64 fractional-grid preload: records the real position/zoom at the Blue grid maker, corrects both grid draws, and scopes the integer-shortcut override with a thread-local flag. Four call-site/branch guards and temporary veneers; original firmware untouched. Native launchers require explicit fractional-grid and smooth-scroll flags. Coordinate formula passed 1,687,007 ASAN/UBSAN checks; this is not full native renderer coverage.
- Added guarded pi-fractional-grid-compare.py. Paused A/B/A at two zoom settings restored exact baseline pixels and left source positions unchanged. Differences were only intended grid strips plus a separate overview indicator. Three-second captures with the switch held on and off each showed six indicator flashes, resolving the apparent off-target change as independent blinking.
- First motion comparison reached track end and is rejected as a complete benchmark. Valid repeated same-process A/B/A, one moving deck: grid changes37.11/57.33/37.27Hz; displacement standard deviation0.495/0.179/0.490pixels; no backward or ambiguous tracked pairs. CPU without recorder40.24/45.99/39.24%onecore. No physical-wobble or audio-fidelity claim; source advance44,039..44,093samples/sec. Lossless clips and coverage-centroid analyzer retained.
- Returned zoom counter1, verified one paused overview seek, resumed both decks and verified five advancing source samples. Final recorded56.75C,TracerPid0; hook enabled, zero comparison fallbacks. Video /home/subsect/Downloads/AZ-fractional-grid-test.mp4; open request queued. Physical feedback requested asynchronously.
- Detailed scope, rollback, hashes, measurements and pending work in AZ-FRACTIONAL-GRID-DRAWING.md and analysis/fractional-grid-live/. Still pending waveform-color/presentation behavior, wider transport/variant validation, controller and complete DSP/audio integration. Full firmware goal remains open.

### Further waveform contrast experiment (2026-09-12)

- User tentatively favors previous B (fractional grid) but still sees wobble. Independently measured gray ticks: same37.105/57.329/37.272 changes/sec as red in prior valid A/B/A, no backward steps; issue is not limited to red.
- Retested continuous linear waveform blend with fractional grid and59Hz source: only waveform pixels darken, CPU essentially unchanged. Preserved this alternative without choosing it.
- Recovered ten native contrast coefficient pairs; new320-byte ARM stub interpolates their transitions instead of removing contrast. Original-code oracle6003 samples, zero mismatches. Paused full-player A/B/A:8594 waveform pixels changed, exact restoration, grid unchanged. Two moving decks:CPU46.985/47.235/47.242%onecore, normalsourceprogression, nativegrid57.7..58.6changes/sec, no backwardssteps. This verifies execution and scope, not perceptual success.
- New offline comparison `/home/subsect/Downloads/AZ-waveform-contrast-comparison.html` defaults left to previouslypreferredB, right to newcurve. Originalcomparisonpreserved. EmbeddedvideosdecodedandJSsyntax/defaultsverified; browserfunctionalchecknotcompleted. Originalwaveformrestored, fractionalgridretained,TracerPid0,58.95C. Candidate not startup-integrated.
- See analysis/AZ-WAVEFORM-CONTRAST-SMOOTHING.md for exactguards, reproduction, evidence and limits. Next physicalcomparison and remaining waveform/presentation behavior. Overall firmware/nativecontrols/DSP goal remains open.

### Waveform position and motion follow-up (2026-09-12)

- Previous goal turn was progress (new native curve candidate, verified A/B/A, offline comparison). Revalidated player14542 alive before offline work. Later launcher/player absent after3600-second limit and fresh end-of-run first-display.png; consistent with scheduled teardown, exit code unavailable. No restart or Pi changes this pass; do not claim an active player.
- Extended original ARM oracle to explicit input matrices.30,030 cases over ten zooms, negative positions and long tracks: original/candidate selected blend formulas pass, position base/fraction identical, scaled-position error<=5.56e-17px and no backwards arithmetic steps. Default6003 records remain exactly unchanged. Scope is code fragments, not complete renderer/timing/audio.
- New independent waveform image-registration analyzer, calibrated on synthetic translations. All real pairs accepted across sigma0.5/1/2; no inferred rightward step>0.05px. Candidate p95 waveform/grid residual smaller at all scales (sigma1:0.1360/0.1016/0.1315px preferred/candidate/restored). Sequential different song sections mean this is supportive, not a controlled perceptual verdict. Full traces and plot saved.
- Synthetic edge-centroid analysis likewise supports remaining coverage/contrast effects; display-transfer models are hypothetical, not panel calibration. See AZ-WAVEFORM-CONTRAST-SMOOTHING.md. Next native-cue matched-passage replay and physical comparison; overall firmware/controller/DSP goal remains open.

### User reports blank screen; viewing session restored

- User steering interrupted offline presentation research. Confirmed prior timed launcher/player absent and Pi backlight24/31. Restarted preferred smooth-scroll+fractional-grid configuration, then added explicit LAB_KEEP_OPEN=1 to run-az-interactive.py to avoid the one-hour viewing cutoff. Default bounded probes remain bounded; keep-open rejects time-limited routing/navigation/feedback helpers. No new waveform/presentation patch enabled.
- First restart17221 terminated deliberately and confirmed session6660 exited143 after capture. Final launch session33764 reports keep_open=true, bwrap17715, actualEP14717718, Xwayland17711. Native local library selection, both DeadWrong tracks loaded, ERP play controls and overview seek used to restore visible waveforms. Session-specific source pointers from14542 are stale.
- Separate recording analysis found split row bands at nativey161 in candidate and restored clips; next frame catches up. This is confirmed in recordings only. Draft ximage-present.c compiles but untested/undeployed. Do not substitute it for verified ximage-fast24. Broader goal remains open.

### Image presentation verified and performance assessment (2026-09-12)

- Supersedes the draft status above: ximage-present.c is now opt-in tested and deployed after ximage-fast24. Native900x162 uploads split at72rows, matching independently observed boundaryy161. Staging in a private pixmap and one destination copy prevents exposing intermediate upload strips within that rectangle; this is not whole-frame/vblank synchronization.
- Host/Pi differential tests each matched18,172,784 pixels over320 cases and generated no extra events. Independent two-connection private-pixmap stress tests observed mixed generations with the original path and zero in the staged samples. Native paused A/B/A screenshots were exactly equal.
- Current kept-open native session uses EP14718499, Xwayland18492, original waveform contrast, fractional grid,59Hz timing and staged upload enabled. Firmware original unchanged. Correct Pi shim uses no standard-library linkage to avoid GLIBC_2.34 dependency. Player alive at latest check; no claim that end-of-track transport remains moving.
- Same-cue dense-passage original/staged/restored: combined player+Xwayland CPU69.50/54.25/68.00%onecore, red-grid updates55.55/58.15/55.45Hz, targeted complementary split pairs2/0/2. Source rates normal. Dense lossless clips copied and SHA256 verified before analysis. Recorder off during short CPU samples; paced null audio does not validate audible fidelity. See analysis/AZ-XIMAGE-PRESENTATION.md.
- Latest RSS950.7MiB, anonymous897.9MiB, no process swap. Memory reduction not yet demonstrated. Earlier BiteDJ main-waveform benchmark was lighter but had different display/audio paths. Saved qualified comparison and next allocation-profiling targets in analysis/AZ-BITEDJ-PERFORMANCE-ASSESSMENT.md. Physical display feedback, sustained profiling, full controller/audio/DSP and wider firmware work remain open.

### Live allocator attribution (2026-09-12)

- Previous turn was progress: verified upload and CPU comparison. Added opt-in allocator-snapshot.c and guarded pi-allocator-snapshot.py; collects on an ordinary drawing thread only when requested, no allocator policy changes or debugger function calls. Host/Pi controlled64MiB allocation/free tests pass; host forwarding320cases/18,172,784pixels exact. Native collection ~3ms; do not sample during frame benchmarks.
- Explicit single restart after confirming prior player/display stopped. Current kept-open exec session47961, EP14719797, Xwayland19790. Same staged upload/fractional grid/original waveform contrast/59Hz options. Loaded both DeadWrong decks and separately verified ~43,958sourceunits/sec on both. Later end-of-track should not be mistaken for a rendering stall. New sources in analysis/az-allocator-live/transport.json; prior process pointers invalid.
- Startup already contains five112MiB size-class allocations (560MiB capacity), plus substantial smaller allocations. Object purpose is not yet traced. Live allocator-allocated1497MiB before tracks versus actualRSS932MiB; after loading1509MiB allocated/RSS963MiB, settlingRSS950MiB. Dirty pages settle to2.81MiB, tcache26.27MiB. No evidence for hundreds of MiB of simple purge savings.
- Replacement jemalloc5.2.1 internalpage64KiB versus actualkernel16KiB confirmed. Alternate16KiB allocator build is a test lead, not a demonstrated optimization. Coarse100MiB MOVZ candidate scan includes unrelated/configuration values; not an allocation call map.
- See analysis/AZ-ALLOCATOR-SNAPSHOTS.md, raw snapshots and reconciled az-allocator-size-summary.json. Idle-page request timed out because no drawing happened; next ordinary selection serviced it. No restart on observation timeout. Next caller/size attribution and controlled allocator build comparison; full goal remains active.

### Startup raw-file cache attribution (2026-09-12)

- Previous turn was progress (live allocator snapshots). Current turn adds tested C++ and main-C allocation tracing and identifies the largest startup group. Kernel user-space probes unavailable (CONFIG_UPROBE_EVENTS unset); host LD_AUDIT attempt rejected for staticTLS and removed without Pi deployment.
- large-new-trace.c records five10MiB new[] calls at0x12c2ba4/return0x12c2ba8. Static RTTI/data flow attributes those to music_library::ListCacheCollector backing pools, separate from the largest group. Host/Pi forwarding, failure, exception-unwind and free tests pass.
- main-allocation-trace.c forwards three main-executable malloc/calloc/realloc imports after resolving originals; preserves import-page permissions. Host/Pi PIE and full-RELRO tests pass. First native loader rejected C23 sscanf import; explicit legacy alias fixed compatibility, retested and booted successfully. Diagnostic flags only; no allocator policy changes.
- Live C trace confirms five distinct malloc requests105,044,016bytes at0xe97040/return0xe97044. Constructor formula `(6400+2)*16408` is exactly100MiB payload in16KiB blocks plus metadata/guards. RTTI and data flow identify input_stream::RawFileDataCache; buffer-pool owner stored atcache+0x2e8. Allocator rounds these into112MiB classes. No evidence yet assigning each instance to a specific consumer.
- Saved analysis/AZ-STARTUP-CACHE-ATTRIBUTION.md, main-allocation-live/raw-cache-contract.json, raw traces/disassembly and list-cache owner types. Cache-size reduction must change constructor configuration and block counts together, never truncate malloc alone. Smaller capacity effects on storage reads/seeks remain to test; no memory saving claimed.
- Current kept-open exec6982, EP14721258, Xwayland21251. Retains original contrast/fractional grid/staged uploads/59Hz; both tracks reloaded and main waveform screenshot verified. LatestRSS951.4MiB with diagnostics. Previous21255 bwrap attempt exited127 for missing symbol; previous20580 and19797 deliberately stopped. Full firmware, controls, DSP and physical-display goal remains active.

### File-cache capacity trial (2026-09-12)

- Located shared16-byte FileCacheConfig `(100,2048,5,1024)` at0x25fa6e0, verified normal/fallback load references and indirect factory data flow. Added optional temporary32/64/100 MiB variants, preserving count and constructor arithmetic; original firmware unchanged. Diagnostic readers accept explicit pinned capacity variants.
- Native32 MiB EP14721885 confirmed five33,636,400-byte allocations. Two DeadWrong decks loaded and advanced44,133.6 units/sec across10sec; paced null audio only. Allocator allocated fell~360MiB, but startupRSS922.61/loaded963.22MiB essentially matches earlier100MiB922.38/962.64MiB. This does not establish physical RAM savings; prior baseline has fewer diagnostic traces. 64MiB not run; eviction/seek stress not tested.
- Restored100MiB default afterward; kept-open launcher session36205, actualEP14722519. Prior32MiB session1930 deliberately stopped. Rendering improvements retained. See analysis/AZ-FILE-CACHE-CAPACITY.md and cache-capacity-live. No reduction enabled by default, no publish. Full goal remains open.

### Resident allocation attribution and small-bin lead (2026-09-12)

- Previous turn was progress (capacity trial); this turn confirms residency rather than repeating cache reservations. Added guarded read-only pagemap scanner, host/Pi untouched-versus-written page tests pass. Historical raw-cache ranges total4.52MiB present, all traced C/C++ ranges union174.75MiB. Largest anonymous VMA545.56MiB present, semantic ownership unknown; no heap payload/PFN output.
- Extended ordinary-thread allocator JSON to include merged small bins;64MiB allocation/free, bounds, no-op and missing-stats tests pass. Startup33,930 regions in14,336-byte class account463.89MiB; after track loading463.82MiB. Bin summary reconciles exactly. This is an attribution target, not a proven recoverable RAM amount. Eleven immediate-allocation candidates saved; computed/wrapper requests not covered.
- Current kept-open exec29218, actualEP14723202. Deliberately stopped22519 to load updated diagnostic shim; no cache/rendering policy change. BothDeadWrong decks restored, normal44,109.7 sourceunits/sec, main screenshot verified, RSS964.45MiB. User says looks good. Paced null audio remains a limitation. Next target caller attribution for12,289–14,336-byte requests. See analysis/AZ-ALLOCATION-RESIDENCY.md and allocation-residency-live. Full goal active.

### PCM pool caller identified; real USB exposed (2026-09-12)

- Previous goal turn was progress (resident ranges and small-bin accounting). Added compile-time opt-in fixed aggregate counts for12,289–14,336-byte C/C++ requests, separate symbols perDSO. Four-thread400-call tests and prior forwarding/failure/permission tests pass. Native23902:33,850 successful14128-byte Cmalloc calls at0x777afc/return0x777b00; no overflow. RTTI and construction data flow identify pcmbuf::pagebuf::PageBufferSystemUnit and PageBuffer. Exact configured page count expression33850 traced through0x765d00; consumers/capacity semantics remain open. No memory-policy reduction. See analysis/AZ-PCM-POOL-ATTRIBUTION.md.
- User asks why USB cannot be read/OneLibrary warning. Confirmed actual231.1GiB FAT USB COS_2025084 at/media/pompu_5/COS_2025084, PIONEER/rekordbox contains export.pdb7290880bytes and exportExt.pdb73728bytes only. Prior session intentionally exposed just benchmark-usb twoMP3s. Restarted with actual USB root read-only bound at/media/usb/lab; kept-open exec77250, actualEP14724479. Renderer/100MiB cache settings preserved; diagnostic bin aggregation remains enabled.23902 deliberately stopped.
- Native AZ still warns OneLibrary not found, then successfully browses actual Contents/Music and artist folders. Screenshot analysis/small-bin-live/az-real-usb-browser.png verifies it. It is now on the real USB folder browser, no tracks loaded. This proves folder access, not old export.pdb playlist import or OneLibrary compatibility. No USB database/data altered. Broader goal active.

### Live PCM ownership and occupancy (2026-09-12)

- Previous turn progress: actual USB exposed and PCM dominant caller named. This turn follows the owning PageBuffer vector, confirms33,850distinct wrappers/1764-element data regions,16AF/EFguard samples, stable ownership. Backing page union462.8125MiB all present/no swap: the large PCM pool is now directly tied to resident pages, beyond size-class accounting. Read-only tools save no PCM payload.
- Live config `[1764,50,30000,37,33850,677,50,600,1500000,88200]`; free queue33850idle,30648afterEstara load,30378earlyplay,24331afterusertrackchanges. No safe reduction inferred from these limited states. Factory explicitly44.1kHz, integer division25 yields1764samples/40ms; Page::write diagnostics identifyFloat2. Same policy96 copied into scheduler+0x35c; semantics still to trace before smaller-pool experiment.
- Loaded Estara from actualUSB on bothdecks; verified95BPM nativewaveforms and44,113sourceunits/sec then. User later selectedBASED BLOX and transport changed; latestread showsdeck1paused/deck2atend, not bothplaying. User askedSUBSECT then cancelled;125matchingfilesfound, none claimedloaded. User sayscontinuefrommemorylead; no furtherUIcontrols/restart. Native24479/session77250 remain, actualUSBread-only, rendererunchanged. Poolptr0x7ffec4121200 onlyvalidthisPID/startidentity.
- analysis/AZ-PCM-POOL-ATTRIBUTION.md and pcm-pool-live contain results, newpi-pcm-pool.py andpi-pcm-pages.py. Next trace scheduler+0x35c policy/consumers and reclamation invariants. Fullgoalactive, nochangeinmemorypolicyyet.


### PCM policy tracing: protected ranges, not spare cache

- Resolved policy96 to LockedRangeList::regNewRange maximum. Native failure
  path returns -1 when registration would exceed it.
- Read-only live scheduler inspection: 88/96 registered range objects,
  five parallel buffering units, unchanged 33850-page PCM pool with 9519
  pages outside free queue. Registered ranges do not equal active pins.
- Added analysis/pi-pcm-policy.py; corrected base-vtable discovery to final
  BufferingScheduler vtable; repeated direct metadata inspection passed.
- Preserved PID24479, real USB session, UI selections and rendering fixes.
  No memory reduction deployed. Continue tracing reclamation/range owners;
  do not reduce96 to32/64 as a supposed harmless cache tweak.
- Full evidence: analysis/AZ-PCM-POOL-ATTRIBUTION.md, final section.


### PCM ownership and a tested storage direction (2026-09-13)

- Previous turn was progress: resolved96range limit and verified88registered.
- Current native24479 revalidated; retained scheduler/pool pointers verified.
- All88IDs found in44CuePropertyWithBufferLock objects, two licenses each.
  Stable current state has2nonempty ranges/221unique page coordinates;
  this is not a safe minimum memory-capacity claim.
- Added read-only range/owner tools and saved disassembly/runtime evidence.
- Standalone Pi COW guarded-template test passes:512aliases/8MiB mapped,
  only18KiB PSS increase before payload writes;128writtenaliases add2MiB;
  recycling restores template and guards. Identical guard rewrites consume
  all8MiB again, verifying coordinated guard-store handling is necessary.
- No player restart, no UI controls, no deployed AZ memory-policy change.
  Next: full-capacity mapping overhead and allocator ownership/release path
  before optional guarded-template integration. Do not blindly shrink96.
- Details: analysis/AZ-PCM-TEMPLATE-EXPERIMENT.md and updated pool-attribution
  document. Full native controls/DSP/audio goal remains active.


### User requested playback (2026-09-13)

Revalidated native24479 and both sources stopped. Screenshot confirms deck1 BASEDBLOX (ID EDIT) (BAFRAF SPESH), deck2 Estara at end. Returned deck2 to cue and sent native ERP play on both. Ten-second read-only verification: both advance44141.7 source units/sec. Saved pcm-pool-live/az-user-two-tracks-playing.json. Both now playing, selections retained; no restart. Paced NULL audio output still in use, not an audible-output verification.


### Full template scale and user play-screen request (2026-09-13)

- Prior turn progress: user playback started and source advancement verified.
- Full33850view synthetic test passed,9519privatewrites and recycle verified.
  Mapping limit1048576; VMA33866 and additionalPTE256KiB. Empty views18KiB
  PSSdelta;9519writtenviews152322KiBdelta; fullyrewritten guards541602KiB.
  Native player untouched. See AZ-PCM-TEMPLATE-EXPERIMENT.md new section.
- User was recording and requested return from Settings to Play. Screenshot
  confirmed UTILITY network page. First native Browse pulse returned to folder,
  second returned to WAVEFORM. Preserved rotarycounter and transport; no
  playback toggle/restart. Final screenshot az-play-return.png confirms
  BASEDBLOX and Estara waveforms, both advancing since prior capture.
- Leave display/transport alone during user's recording. Continue offline
  release-path tracing before integrating any different PCM memory owner.


### Original PCM cleanup code executed (2026-09-13)

- Previous turn progress: full template test plus requested play-screen return.
- Traced both PageBuffer destructors and owner-array partial-construction
  helper; raw payload frees use data-8, wrappers separately sizeddelete16.
- Added probe-pcm-destructor.py.18nativeinstruction QEMU tests pass:normal,
  damagedfront/backguards,nullpayload,zerocount,emptyvector across3paths.
  Guard logging and allocator effects are intercepted, not actual shutdown.
- Evidence: AZ-PCM-BUFFER-LIFETIME.md and pcm-pool-live/destructor-oracle.json.
- User clarified recording was already finished. No new UI/transport operation
  or player restart this pass. Next implement/test explicit raw-pointer
  ownership dispatch and preserve guard checks before template integration.

### Standalone PCM ownership implementation (2026-09-13)

- Previous final-only acknowledgement was no progress. Revalidated current
  sources and Pi PID24479, then implemented the next storage prerequisite.
- Added explicitly initialized pcm-template-store.c/.h, with raw/interior
  pointer classification, atomic slot retirement and quiescent final cleanup.
  No hook or change to the running player; release does not recycle pages.
- Found main executable free GOT0x3b25690 from original ELF relocation table.
- Host ASan/UBSan and native Pi16KiB tests pass: four concurrent allocating
  threads,512 isolated payloads, guards, invalid/external pointers, double
  release race, live-destruction rejection, and partial mapping rollback with
  unchanged VMA/fd counts. Native DSO builds and firmware libc exports checked.
- Evidence: analysis/AZ-PCM-STORE-OWNERSHIP.md and
  analysis/pcm-pool-live/store-ownership-tests.json.
- Next: exercise native cleanup with actual owned mappings and dispatch;
  coordinate allocation-call-site and guard-store paths before opt-in AZ
  integration. No AZ physical-memory reduction or audio improvement claimed.

### Native cleanup plus real mapped ownership (2026-09-13)

- Previous goal turn was progress: implemented and tested standalone storage.
- Added test-pcm-native-cleanup.c and run-pcm-native-cleanup.py. Executed
  SHA-pinned original destructor/helper instructions in separate Pi processes,
  with actual mapped slots, malloc fallback payloads and real wrapper frees.
- All21 cases pass across3native paths: normal,mixed,null,zero,empty,front/back
  guard damage. Exact deallocation order/ownership verified in successful
  cases; damaged guards intercept detection and exit42, not original logging.
- Source/firmware hashes and outputs saved in native-store-cleanup-tests.json.
  Private temporary instruction/build copies removed. Player untouched.
- Inspected constructor0x777afc allocation and0x777b40/44guard stores. Next
  implement/test coupled allocation and guard initialization with fallback
  handling before activation. Full shutdown/unwind and audio remain unverified.

### Coupled allocation integrated; startup PSS halved (2026-09-13)

- Prior turn progress:21native cleanup tests. Implemented guarded allocation
  helper and10native constructor/cleanup cases, confirming guard-store omission
  preserves file-backed sharing and normal fallback remains valid.
- Added opt-in pcm-template-hook.c and launcher flags. Full-capacity33850store,
  main malloc/free/realloc dispatch, coupled guard-store replacement, startup
  checks and helper-executable exclusion. Native realloc fallback tests pass.
- Corrected invalid staging symlinks and tmpfs scratch ENOSPC; those runs are
  excluded. Final isolated headless runs reached SOURCE screen and completed:
  baseline921.37MiB PSS, template461.48MiB, saving459.89MiB/49.91%, no swap.
  Template PID27680, baseline28074,33850slots retained, init error0.
- Visible PID24479 was not restarted or modified. This is startup only;
  loaded/audio/latency/shutdown/reclaim testing remains before rollout.
- Evidence: analysis/AZ-PCM-TEMPLATE-INTEGRATION.md and pcm-pool-live artifacts.
- User explicitly requested CDJ subagent. Bounded report completed in
  analysis/cdj-render-compare/REPORT.md:3000X50Hz LocalPlayer and less restrictive
  upload scheduling versus original AZ30Hz; same generic fractional gate.
  No original3000 proprietary application found; do not conflate models.
- Next continue actual loaded PCM behavior/performance and native full mixer
  integration. User asked to finish memory work before switching focus.

### Two real tracks through template PCM (2026-09-13)

- Previous goal turn progress: native startup memory reduction. Continued in
  isolated headless stage, leaving visible24479 unchanged.
- Template28634 and baseline29398 loaded Estara/DeadWrong through native inputs.
  Initial sidebar-focus load failed; corrected focus before verified samples.
- Both transports advance near44100units/sec; native Cue restores2058/4704,
  stays paused, then both resume. Two20second playback samples per version.
- PSS baseline977.70/978.41MiB vs template615.03/644.11MiB, saving362.67/334.30.
  CPU45.79/44.64%baseline vs46.07/45.02%template(onecore). No majorfault delta
  or swap in the measured windows; this does not establish audio/RT fidelity.
- Pagemap:9268private present PCM slots at snapshot; full33850logical pool,
  zero init errors or mapped reallocations. No free-queue reclamation yet;
  written pages persist, so longer-session savings remain uncertain.
- Added explicit-stage native input/sequence tools and optional memory/fault
  fields in pi-cache-motion.py. Evidence: AZ-PCM-LOADED-PLAYBACK.md and
  loaded-pss-comparison.json plus screenshots/raw captures of metrics.
- Next digital audio comparison, repeated loading/seeking/loops, and synchronized
  PCM reclamation tracing before visible-session rollout. Full goal stays active.

### Template digital audio matches baseline (2026-09-13)

- Completed isolated native baseline30028 and template30460 captures with Estara
  and Dead Wrong. Both bounded launches exit0; template hook/full33850pool verified.
- Compared30seconds of44.1kHz ten-channel float32 output: both stereo decks have
  zero differing samples, zero peak/RMS error, and zero relative frame offset.
  Whole cropped streams have identical SHA256; all samples finite and unused
  channels silent. Comparator offset/change self-tests passed.
- This is decoded ALSA file output with paced null sink, not hardware audio or
  long-session/FX validation. Full raw captures hashed then removed; cropped
  evidence retained privately. Visible24479 unchanged.
- Saved analysis/AZ-PCM-TEMPLATE-AUDIO.md and pcm-pool-live audio evidence.
- New static lead: Pool<Page>::push at0x7734d0, nine direct BL callers saved.
  Caller locking and payload lifetime remain unproven; no reclaim installed.
- Next repeated loads/seeks/loops and safe return-to-pool lifetime tracing.
  Broader firmware goal remains unfinished.

### PCM return paths and overnight Pi pause (2026-09-13)

- Previous turn made progress: exact decoded audio comparison passed.
- Offline code inspection distinguishes retained reservation pages from rejected
  pages, verifies PageBuffer pool+0x30 on completion/error paths, and finds cluster
  detachment releases its exclusive state before draining pages. Caller/reader
  synchronization remains unresolved; no reclamation patch installed.
- Evidence and corrected function entry: analysis/AZ-PCM-RETURN-PATH-NOTES.md.
- User is turning off Pi for the night. No Pi tests/SSH/runtime changes started
  this turn; leave it alone and continue offline until available.

### Offline original-instruction return tests (2026-09-13)

- Previous turn made progress by mapping return/retention paths. Added local
  QEMU oracle executing original AZ pool/cluster/track instructions:14cases pass,
  including node rollover and map growth. Whole synthetic fixture compared;
  nonzero PCM payloads/guards unchanged. Allocator, memmove and range publication
  are harness substitutes, so this is not concurrency/full-player validation.
- Stale identity/generation Track::Reservation calls leave the isolated fixture
  unchanged; do not infer either safe reclaim or an application leak from this.
- RTTI and builder code identify onPageFilled's AsyncTaskBox task, execute thunk,
  160-byte task construction and separate inline/queued completion routes.
  Receiver/thread/queue cancellation and locking remain to be resolved.
- Evidence: analysis/AZ-PCM-RETURN-ORACLE.md, probe-pcm-return.py,
  collect-pcm-return-dispatch.py and pcm-pool-live return artifacts.
- No Pi contact or deployment. Continue offline ownership/synchronization work;
  live tests wait for the user to make the Pi available. Full goal remains active.

### PCM scheduler receiver and thread predicate resolved (2026-09-13)

- Previous turn made progress:14return-path cases and task RTTI. Continued offline.
- Constructor proves commander+0x20 receives scheduler+0x20, whose table25f9d70
  selects predicate68f0e8 and submission22093b0. No conflation with HUI manager.
- Six original-instruction QEMU predicate cases pass: compares full64bit current
  identity to acquire-loaded scheduler+0x70; same thread inline, different queued.
- Connected thread-run thunk2210a40 to22107b0 and embedded queue consumption via
  generic2210050. Pending byte is not a submission-success acknowledgement;
  outer wait/periodic callback behavior is not a measured latency guarantee.
- Evidence: analysis/AZ-PCM-SCHEDULER-DISPATCH.md and thread-predicate-oracle.json.
- No Pi contact or reclaim deployment. Next reader lifetime/cluster detach,
  cancellation and remaining pool callers; full goal stays active.

### PCM reader protection executed offline (2026-09-13)

- Previous turn progress: scheduler dispatch linked and6predicate tests passed.
- Found Track::readFromBlocks781d60: increments block+16shared count, reloads
  block+8cluster pointer, copies payload, releases via684480. Writer7745f8 needs
  state0->-1 before detach; contention path retries then exits without draining.
-15local original-reader cases pass:scalar/vector copies, boundaries, missing
  pages/clusters, held writer, existing readers, EOF and controlled detach before
  lock acquisition. Full fixtures/output checked; no real concurrency claim.
- Initial beyond-range test exposed incomplete harness code extraction; extended
  through782058, reran successfully and removed the test core. Not an AZ crash.
- Evidence: analysis/AZ-PCM-READER-LIFETIME.md, probe-pcm-block-reader.py,
  pcm-pool-live/block-reader-oracle.json and updated disassembly collection.
- Next execute writer contention/detach; audit other readers/return callers and
  cancellation before reclaim. No Pi access or deployment; full goal active.

### Cluster writer retirement executed offline (2026-09-13)

- Revalidated private GitHub snapshot; resumed the unfinished writer harness.
  Fixed linker assignment syntax and executed 14 original-instruction QEMU cases.
- Held readers/writer prevent retirement; releasing the last holder enables it.
  Releasing only one of two readers leaves the cluster attached. Ten wait calls
  exhaust contention; absent clusters return without waiting regardless of lock.
- Observers verify detach before unlock and unlock before page enqueue. Entire
  128 KiB fixtures match, including nonzero payloads/guards and metadata-call args.
- Important remaining constraint: writer caches cluster before acquiring lock.
  Outer writer serialization still needs proof; this is not safe-reclaim approval.
- Two direct caller sites found, both with preliminary nonzero-lock skip checks.
  Evidence: analysis/AZ-PCM-CLUSTER-WRITER.md and cluster-writer-oracle.json.
- No Pi access or deployment. Continue caller ownership/cancellation tracing;
  broader firmware goal remains active.

### Cleaner callbacks and synchronous allocation triggers (2026-09-13)

- Previous goal turn progress: 14 writer cases verified and pushed privately.
- Linked both direct retirement callers through freeSomeClusters7750f8 and its
  freePartsOfTrack7748d0 call. Constructor binds7750f8 to scheduler+378 twice,
  installing callbacks at PageBuffer+120 (cluster pool) and+98 (page pool).
- Resolved binding builder/manager/invoker. Empty or unusable pool entry invokes
  cleanup synchronously from commander785b10 or its track reservation77c778;
  each retries the deque after cleanup returns. No dispatch occurs in invoker.
- This narrows but does not prove writer serialization: resolve commander table
  25f9f88 slot+10 callers next. Completion dispatch alone is insufficient.
- Evidence: analysis/AZ-PCM-CLEANER-CALLBACKS.md and new hash-pinned collector.
  No Pi access, reclaim patch or runtime memory-saving claim. Full goal active.

### Completion-driven refill ownership chain (2026-09-13)

- Previous goal turn progress: cleaner registration and synchronous triggers mapped.
- RTTI/constructor stores identify RangeBufferingTask and AroundBufferingTask;
  both call commander slot+10, through range77c070 or strategy779278 respectively.
  Their execution slot is+18, unlike AsyncTaskBox completion's+10.
- Constructor installs scheduler+10 as commander+28 listener. onPageFilled
  success/missing-track calls listener+10; error returns page then calls+18.
- Listener completion/failure loops synchronously invoke buffering-task+18 and
  can reach allocation/cleanup. Normal completion-driven refill therefore stays
  on the scheduler execution path previously resolved for the completion closure.
- This is not all-entry-point serialization proof: initial/refill requests,
  cancellation/shutdown and remaining return callers still need review.
- Evidence: analysis/AZ-PCM-REFILL-DISPATCH.md and expanded collector/artifacts.
  No Pi access, runtime patch or new benchmark. Broad firmware goal stays active.

### Reader-cache detach path and 12 offline clear cases (2026-09-13)

- Previous goal turn progress: completion-driven refill ownership chain mapped.
- RTTI identifies77aa80 as detachFiles, not initial refill. Its task walks units
  and requests PageFiller::clearReaderCache through inline/async-promise routes.
  Promise construction/submission is not a verified worker-completion barrier.
- Original clear77e260 has a thread-owner diagnostic, not a mutex; if diagnostic
  helpers return, the mismatch path continues. Policy can retain matching entries.
-12original-instruction QEMU cases pass for no-policy clear: eight selection
  masks, first-use thread binding, empty caches and null shared control blocks.
  Whole32KiB fixtures, reverse visits, compaction and destruction-call order match.
- Evidence: analysis/AZ-READER-CACHE-DETACH.md, collector and clear oracle.
  No Pi access or reclaim deployment. Initial requests, full cancellation/drain,
  policy retention and remaining PCM-return ownership still open; full goal active.

### detachFiles does not join its queued worker clear (2026-09-13)

- Previous goal turn progress:12reader-cache clear cases and detach task mapped.
- Identified plain promise State_baseV2/control/result tables. Queued worker owns
  moved promise; caller normal tail releases its local future reference and moves
  to the next unit without reading ready/result state or joining the worker.
- Resolved PLT symbols:4240c0 is futex notify-all,426f40 wait-until. Cleanup helper
  builds abandoned-promise error/marks ready/notifies; it is not a future wait.
  Inspected plain-state disposal also contains no worker join.
- Evidence: analysis/AZ-DETACH-PROMISE-LIFETIME.md, expanded detach collector.
  No claim that all helpers are nonblocking or that external barriers are absent.
- No Pi access or reclaim deployment. Need explicit worker/callback drain ordering
  plus initial requests and remaining pool-return ownership. Full goal active.

### Scheduler/worker stop ordering and forced-stop semantics (2026-09-13)

- Previous goal turn progress: detached worker future is released without join.
- Scheduler destructor signals itself/all units, waits up to requested3000ms,
  then destroys units. PageFiller destructor requests8000ms stop before readers.
-8original stop/cancel helper QEMU cases pass with simulated OS/wait events.
  Stop trusts observed handle state rather than wait return. Forced path requests
  pthread_cancel, clears both handle fields even on cancel error, and returnsfalse.
- Handlezero alone is not a drain proof. Destructor diagnostics fall through
  if their helpers return; normal worker exit publication still needs tracing.
- Evidence: analysis/AZ-PCM-SHUTDOWN.md, stop oracle and shutdown collector.
  No Pi access, real cancellation or reclaim deployment. Full goal stays active.

### Normal worker exit and pending-task disposal (2026-09-13)

- Previous goal turn made progress: shutdown research/tests committed and verified
  on private GitHub main. This turn remained PC-only; Pi stays off.
- Traced pthread entry: successful-start run returns before handle clearing;
  failed startup wait skips run but still clears handles. Optional self-deletion
  and registry-owner release occur after clearing, before trampoline return.
- Seven original-entry/TLS-lookup QEMU cases pass, checking full fixtures and
  callback-time live/zero handles with controlled OS/owner/destructor substitutes.
- Scheduler/PageFiller exit callbacks are bare returns; exit can skip queued work.
  Later queue destruction invokes task destructor, not execute. Pending reader
  cache-clear destruction reaches abandoned-promise cleanup, not clear fulfillment.
- Evidence: analysis/AZ-PCM-WORKER-EXIT.md, expanded shutdown collector and oracle.
  Next: captured onPageFilled destructor759260 and remaining initial/return paths.
  No live cancellation or reclamation claim; full firmware goal remains active.

### Discarded completion separates source reference from PCM ownership (2026-09-13)

- Previous goal turn progress: normal exit/task disposal traced, seven original
  instruction cases passed and private commit ed01cff verified on GitHub.
- Identified captured destructor759260 as PositionWithSourceInfo via RTTI/string.
  It releases task+48 source reference; raw PCM wrapper sits separately at+60.
- Eight original destructor/source-decrement QEMU cases pass. Retained/null source
  paths do not return PCM; last-source disposal arguments observed, not executed.
- Submission's zero-return path also disposes the task without explicit PCM
  return. Actual enqueue rejection conditions remain unproven; no observed leak.
- PageBuffer's independent owner array still explains eventual allocation cleanup
  separately from reusable free-deque capacity. No global lifecycle guarantee.
- Evidence: analysis/AZ-DISCARDED-COMPLETION-OWNERSHIP.md and collector/oracle.
  Next queue rejection and last-source disposal; no Pi contact or reclaim enabled.

### Queue reserve exhaustion is growth, not normal rejection (2026-09-13)

- Previous goal turn progress: captured source/PCM ownership separated, eight
  destructor cases passed and private commit133ca6f verified remotely.
- Resolved queue vtable2e67ac8 enqueue220c820 / inner22122d0. Empty spare list
  calls new(64), then appends; no ordinary queue-full false-return branch.
- Wrapper returns64-bit task ID. Synthetic IDzero still enqueues but returnszero;
  this is an injection contract edge, not observed application failure.
- Nine original wrapper/push cases pass with full fixtures, including spare
  exhaustion, tail helping, tag wrap, high/zero IDs and null task.
- Scheduler and workers request1024 reserve; constructor allocates1025 nodes
  including sentinel,65,600raw bytes/queue. Not the large PCM memory target.
- Evidence: analysis/AZ-TASK-QUEUE-CAPACITY.md. Ordinary queue-full page loss
  hypothesis deprioritized; last-source disposal/initial paths remain. Pi untouched.

### Source disposal and usage checkpoint (2026-09-13)

- Previous turn progress: dynamic task-queue growth verified, nine cases passed,
  private commitb1b1afb pushed. Queue-full-loss hypothesis deprioritized.
- Last-source helper22043f0 identified as TrashBox::push. Active lifetime guard
  queues source for later deletion; absent/negative gate invokes deleting virtual
  method immediately. Reference zero is not a universal completed-deletion barrier.
- Eight original TrashBox/gate cases pass, full fixture/global comparisons.
  Concrete source destructor, deferred consumer and concurrent shutdown still open.
- User checked in at23% remaining; account tool confirms77% used. Recommended
  diminishing speculative research and prioritizing next native Pi validation.
- Performance checkpoint: measured visual-content cadence about29.6→58.8Hz;
  short-run PCM experiment saves~460MiB startup/~334–363MiB two-track PSS, CPU
  roughly unchanged. Memory experiment is isolated, not promoted to visible build;
  long-session sustained savings and full controller/mixer operation remain open.
- Evidence: analysis/AZ-SOURCE-DISPOSAL.md and source-disposal oracle/artifacts.
  Pi untouched; full firmware objective remains incomplete.

### Native long-session test preparation (2026-09-13)

- Previous goal turn progress: TrashBox lifetime gate traced/tested and checkpoint
  saved privately at45eede1; user confirmed interest in value at23% remaining.
- Added read-only explicit-PID session recorder for PSS/RSS/swap, CPU and paging.
  Rejects wrong identity, preserves partial evidence, never overwrites output,
  starts/stops nothing and does not access target memory or SSH.
- Five local tests passed, including early exit and identity mismatch. These are
  recorder checks, not new AZ performance measurements.
- Documented matched baseline/template long-session protocol, separating resource
  evidence from transport/audio/controller/rendering checks. Workload automation
  and native execution are explicitly not claimed complete. Pi still off.
- Evidence: analysis/AZ-LONG-SESSION-VALIDATION.md, record-process-session.py,
  test-process-session-recorder.py and session-recorder-selftest.json.

### User prioritizes complete controls and effects (2026-09-13)

- User clarified letacy's RX3 suggestion was a lead, not an automatic priority
  switch; explained AZ remains target and RX3 helps fill hardware-DSP gaps.
- User authorized full effects/controller setup. Prioritize usable basic native
  controls, retain preferred BiteDJ mappings, then finish full effects integration.
- Added XML-driven persistent ERP transport state for decks1/2 Play/Cue/keylock,
  including simultaneous held buttons and disconnect release snapshot. Five
  offline tests passed; existing navigation checks pass. Not delivered to hardware.
- Identified explicit native Pi NATIVE_NAVIGATION rejection still in launchers;
  copied QEMU discovery is not a ready Pi controller bridge. Deck3/4 transport
  selection, jogs, continuous delivery and physical controls remain unverified.
- Evidence/acceptance plan: analysis/FLX6-AZ-COMPLETION-PLAN.md and
  flx6_transport.py / test_flx6_transport.py / flx6-transport-tests.json.
