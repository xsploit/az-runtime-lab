## 2026-09-13 Pi powered down for move

Saved a further display fix: normal native launchers now keep the refresh timestamp in tmpfs, avoiding measured disk-publication stalls. Linear scaling remains persisted. Native real-display-clock candidate passed a two-minute /7251-event no-skip test but remains opt-in pending physical comparison; original59.24Hz restored before shutdown. User requested moving the Pi; clean poweroff accepted. See analysis/drm-display-clock/RESULT.md. Fresh process IDs and temporary paths must be discovered on restart. Standard updated launcher still needs its first boot validation.

## 2026-09-13 display regression recovered

The Pi reboot lost the session-only Sway linear filter. User confirmed the picture improved after restoring it. `/etc/sway/pflx.conf` now persists `output DSI-2 scale_filter linear`; original backed up and updated config validates. Native smooth-scroll, fractional-grid and staged-upload fixes were already active. Check the **compositor output filter**, not just X11 screenshots, after future launches. Use `analysis/panel-rate-test/audit-fixes.py` with freshly discovered PID/source file; it fails if linear filtering is missing. See `analysis/panel-rate-test/RESULT.md` for current evidence and limits.

Three performance candidates tested: four-byte conversion slower on Pi; scratch reuse no useful benefit; nominal 60.018 Hz timing not promoted. Established 59.24 Hz timing retained. Two loaded fixtures use paced NULL audio. No claim of completed audio/controller support. BiteDJ remains stopped in the current session.

# Local firmware runtime checkpoint — 2026-09-12

## Verified

- Native Master Tempo verified in captured audio: at+5.10%, pitch-preserving mode stays440Hz while duration is9.516sec; other toggle state462.44Hz. Seven interior windows each. See analysis/az-master-tempo-long-segments.json. This does not establish music quality or Pi performance.

- Native deck1 tempo changes verified via deck-ucom fixture: +5.10%/157.7BPM and -5.15%/142.3BPM from150. See analysis/TEMPO-CONTROL.md and xdjaz/tempo-positive.png. Physical controller and pitch audio quality remain untested.

- All four AZ decks decoded concurrently in PC emulation: full10sec tone per stereo pair,6.843515sec common overlap; analysis/az-four-deck-overlap.json, xdjaz/four-playing.png. This is raw deck output, not a completed software mixer or Pi performance test.

- Deck3/4 concurrent playback verified on output pairs5/6 and7/8; full10-second tones overlap9.36seconds. Native secondary/primary deck selection and four-deck waveform view verified. See analysis/az-dual34-overlap.json and xdjaz/dual34-four-deck-view.png. Four simultaneous decks subsequently verified above; physical mixer remains untested.

- Concurrent deck1/2 decode verified: simultaneous10-second tone on separate stereo pairs, unchanged amplitude; analysis/az-dual-deck-overlap.json. Same-tone test does not establish crosstalk rejection.

- Deck2 native load/play and decoded440Hz audio on channels3/4 verified independently; other channels silent. Evidence analysis/az-audio-deck2-tone-verification.json, xdjaz/deck2-play.png. Concurrent deck1/2 testing is recorded above.

- Decoded audio confirmed:10-second440Hz fixture reaches output channels1/2 identically; other8 channels silent. Numeric evidence analysis/az-audio-tone-verification.json, preview xdjaz/decoded-tone-preview.wav. No physical output or realtime-performance claim.

- AZ deck1 play and cue verified through ERP fixture packets: remaining time00:10.000 ->00:01.589; cue returns00:10.000. Screenshots erp-loaded.png, erp-play.png, erp-cue.png. Decoded audio was subsequently verified; physical audibility remains unverified.

- AZ native deck1 load confirmed through synthetic mixer input: LAB-TONE-440Hz.wav,00:10, waveform page; screenshot xdjaz/mixer-fixture-after.png. Native request0xa6c808 and controller closure0xa318a0 observed. Subsequent playback/audio verification is recorded above.

- Preserved supplied XDJ-AZ 1.30 and CDJ-3000X 1.40 ISOs and extracted runtimes.
- Preserved identical cabinet downloads privately; extracted encryption directory into private/cabinet-extracted (restricted permissions). No key values published.
- AZ EP147 runs under qemu-aarch64-static in an isolated bubblewrap root with private Xvfb. Network is isolated; no Pi connection or firmware flashing.
- AZ progressed to its real SOURCE / NO DEVICE UI with both deck displays. Evidence: xdjaz/source-screen.png and source-screen.log. Process survived the 20-second probe, then launcher stopped it deliberately.

## Startup changes

- Supply /tmp/mlan0Addr = 00:00:00:00:00:00, matching the firmware wlan-monitor.sh offline path. Prior trace showed startup repeatedly waiting for this file.
- Bind cabinet read-only at /home/root/settings/cabinet.
- Supply offline fw_printenv fixtures with model/version/boot settings. Device identities and auth tickets are not implemented; no cloud login tested.
- Diagnostic ARM64 offline-midi.so returns no sequencer devices/events instead of allowing calls on a null ALSA sequencer. Includes dlsym interception for dynamically resolved functions. This is not FLX6 support.
- Fake thermal readings and vsync timestamp file remain experimental.

## Reproduce

From the workspace root:

    OFFLINE_MIDI=1 python runtime-lab/run-az-probe.py
    PLAYER=cdj3000x OFFLINE_MIDI=1 python runtime-lab/run-az-probe.py

Requires the already preserved local rootfs, private cabinet extraction, cross-built shim, qemu, bubblewrap and local Xvfb. Not yet a portable installer. Launcher stops each probe after its screenshot.

## Still missing

- Working soundcard, deck audio capture, mixing, cue and effects.
- Subucom hardware interfaces and controller input.
- USB/library test, playback, waveform performance, streaming and authentication.
- Actual Pi measurements.

Both binaries reference ALSA PCM. AZ additionally contains mixer_control_ucom format names and four subucom device paths; 3000X references one and plughw:1,0. These are interface leads, not proof that all DSP is portable or present in the player. Details: audio-interface-leads.json.

## CDJ-3000X follow-up

The same offline shim and startup fixtures also reached CDJ-3000X 1.40's actual SOURCE / NO DEVICE screen. Screenshot inspected: cdj3000x/source-screen.png. Process survived the 20-second probe and was stopped by the launcher. No audio or input claim.

Letacy supplied additional leads: reuse RX3/PrimeGo framework knowledge, investigate scheduling and Xorg, and investigate external hardware mixing. AZ apl_start.sh does pin X and SPI workers to CPU index 5, supporting a six-logical-CPU deployment assumption in stock scripts. This does not prove a six-core minimum for the app or establish the cause of RX3 flicker. Stock host-tuning scripts were not executed.

## Paced audio diagnostics

Opt-in `NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 PROFILE=1` now runs clocked dummy output. Both AZ and CDJ-3000X survived bounded probes. AZ accepted44100Hz; CDJ accepted96000Hz stereo. These are silent diagnostic sinks, not working soundcard/mixer integration. See [audio checkpoint](analysis/PACED-AUDIO.md) for evidence and limitations.

## Synthetic local source

`USB_FIXTURE=1` with paced/offline/null audio binds only the generated tone fixture. AZ recognizes USB1 and Local Library: [screenshot](xdjaz/usb-fixture-source.png). Track loading and playback are still unverified.

## Local file browsing verified

AZ now browses the read-only synthetic USB and displays LAB-TONE-440Hz.wav with its correct00:10 duration. [Browser screenshot](xdjaz/usb-library-double-click.png). Ordinary mouse navigation worked after inspecting the ready screen. Deck loading/playback remain to be tested.

## Latest bounded browser probe

The 120-second AZ probe remained alive at final capture (screenshot exit 0), then the launcher ended the probe. The generated tone can be selected; double-clicking the row and tapping the deck panel did not load a deck. A transient OneLibrary export warning preceded successful folder browsing. See `xdjaz/tone-browser-ready.png`, `xdjaz/tone-load-attempt.png`, and `xdjaz/tone-deck-click.png`. Dedicated `loadDeck1` through `loadDeck4` observer diagnostic references were located; next investigate their HUI event IDs and handlers using `analysis/az-load-deck-xrefs.json`. No playback claim.

Contact preference: only ask letacy (Discord ID 1171184826615869463) for concrete blockers; do not repeatedly message or chase responses. No message or reply automation has been created.

### Deck 3 playback verified on PC
ERP secondary group0 selects deck3, group1 selects deck4 (screenshots deck3-select-play.png and deck34-selected.png). Group1 registrations confirmed at 0x2145848/+32 and 0x2145880/+40, IDs ending 01. Deck3 loaded after reselecting the browser row and repeating load3; earlier immediate injections did not load. Playback was requested after the loaded view was ready. Screenshot deck3-playing.png shows 00:09.659 and native waveform. Captured channels5/6 contain the complete 10-second 440Hz tone, identical L/R, other channels zero; report az-audio-deck3-tone-verification.json and archive first-deck3-output.f32le.gz. Deck4 playback remains unverified (load4 was sent after load3 changed page). Primary-selection return attempt occurred after scheduled120sec teardown, so it is NOT a runtime verification. Next run should load3/4 together from a ready selected row, await load readiness, then play both. No Pi performance or hardware mixer verification.

Latest fader experiment: AZ deck1 PCM level stayed constant while four raw mixer faders alternated minimum/maximum. Reports: analysis/az-fader-output-comparison.json. This supports external mixing but lacks observer acknowledgement; see HARDWARE-MIXER.md for scope. Software master/headphone mixing remains unfinished.

Follow-up: FADER_TRACE verifies all four native fader decoder calls receive0/1023 and reach notification processing; simultaneous deck PCM remains unchanged. analysis/az-fader-dispatch-trace.json. Downstream observers and complete mixer modes remain unmapped.

Identified a live AZ fader notification receiver: domain::onair::OnAirManager, callback0x101d2b0; see analysis/az-fader-receivers.json. Deferred handler and on-air rules still need mapping.

Original OnAirManager deferred fader task verified in125 guarded cases: stores latest per-channel32bit value without gain/threshold processing. analysis/az-onair-cache-execution.json. Decision logic remains downstream.

On-air control has a separate mixer IChannelListener boolean input (manager+816), distinct from fader observer+824. Mapped static channel-state cache path; next trace its mixer packet producer. analysis/az-onair-input-paths.json.

Mapped on-air RX packet byte94 bits7..4 to channel0..3 listener notifications. Decoder updated; live on-air behavior remains to verify.

Verified native on-air packet path for all4 channels:28 decoded states,18 expected change notifications delivered to OnAirManager. analysis/az-onair-runtime.json. UI/network effects and software mixer still unfinished.

Native deck1 red ON AIR badge verified on/off from byte94 while paused and playing. Screenshots onair-ui-*.png; analysis/az-onair-ui-verification.json. On-air indication is independent of actual audio audibility.

Original software mixer kernel now routes AZ four-deck PCM to separate master/headphone pairs. Distinct-input routing tests pass;108.768sec archived capture processed with zero clipping and zero reference mismatch. mixer/README.md; xdjaz/mixed-master-cue.json. Offline only: live transport, smoothing, EQ/effects and FLX6 output mapping still unfinished.

Mixer control smoothing implemented: per-sample coefficient ramps, mid-ramp retargeting, block-size-independent progression; numeric tests and64 settled-routing comparisons pass. Live audio transport and listening verification remain pending. mixer/test_ramp.c.

Live AZ-to-host-mixer FIFO path verified: complete10sec tone, correct separate master/cue ratio and440Hz pitch; revised100sec run survived, mixer shutdown0. Initial startup crash remains unresolved. MIX_STREAM=1; analysis/az-live-mixer-verification.json. Physical output/latency and live control delivery remain unfinished.

Live mixer control delivery added: private Unix datagram full snapshots, bounded block-boundary processing, smoothed gains/crossfader/cue routing, and applied-frame logging. Synthetic streaming verifies64-frame fade, independent headphone cue, cue switch and invalid-message rejection; reconnect regression passes. Launcher emits socket path; mixer/send_controls.py supplies snapshots. Native AZ playback with changing controls and physical FLX6 remain to verify.

Native AZ live control experiment verified: fader-down zeros master while pre-fader cue continues; cue-off zeros headphones while master continues; restoring both restores exact2:1 demo gain ratio. Four sample windows measured in analysis/az-live-controls-verification.json; archived PCM and control log in xdjaz/live-controls-*. Launcher ended143 without normal teardown report, cause unresolved; this is routing evidence, not stability evidence. Next: shared FLX6/native state and physical output.

Saved BiteDJ FLX6 XML now drives a persistent host mixer state/replay adapter: all4 14-bit faders, cue press/release toggles, headphone blend and cross position. Tests passed against saved bindings; source hash/inventory retained. Cross assignments remain bypass and physical MIDI/input/LED/native UI integration is unfinished. No BiteDJ files modified.

Native AZ browse encoder input traced further: signed16 cumulative count at34/35, first-packet baseline, subsequent32-bit subtraction plus packet31 bit0 through0x21597a8. Nearby raw button routes inventoried; physical names still unresolved. Packet builder preserves other controls and rejects unverified counter wrap. Native browser movement remains to test.

Native browse scrolling verified in running AZ: focused track list moves next/previous on counter+1/-1, with screenshots. Initial sidebar focus did not move track selection. Track focus was established by pointer; native enter/back/view remains unresolved. analysis/az-browser-live-verification.json.

Named native Back and Browse inputs resolved via matching constructor IDs, dispatch offsets and explicit firmware diagnostic strings: Back33:7, Browse32:6. Additional named navigation controls in analysis/az-browser-named-buttons.json. Static mapping only; next live verify Browse focus and Back behavior for FLX6 VIEW/BACK.

Native Browse/Back behavior now visually verified: Browse toggles browser/waveform, Back returns focused track list to sidebar. FLX6 preferred VIEW is always-open-Browse, so direct toggle mapping is insufficient; need page state or idempotent native navigation. Enter/source selection still unresolved. analysis/az-native-navigation-verification.json.

Native encoder press identified and full pointer-free path verified: USB1→Local Library→track list→scroll to660Hz track→load deck1. Packet31 bit0 is press state in tested contexts. Load helper now accepts --counter to avoid resetting browse selection. analysis/az-native-enter-verification.json. Physical FLX6 and state-aware View remain pending.

Persistent FLX6 native navigation adapter implemented/tested: shared encoder/press/load state, preferred View/Back logic gated by explicit page visibility. Physical transport and automatic page readback remain missing; no production-ready claim. analysis/flx6_navigation.py.

Candidate automatic Browse readback found: TX byte26 bits4..5=2 on Browse/focused Folder,1 on Source/Waveform/TagList in six stable page checks.25592 captured frames CRC-valid, run ended normally. Static LED binding and fresh-frame/transition behavior still needed before View integration. analysis/az-browser-page-field.json.

Browse readback static chain confirmed: TX26 bits4..5→LED ID0195b2ef924ef657→selector6→view-name group including BrowseView. Second group entry unresolved. Raw BrowseViewGroup decoder added;13 packet tests pass. Still need fresh-stream readback and transition handling before automatic View integration.

Browse indicator second name resolved: PcControlView alongside BrowseView. Automatic View must distinguish these contexts. Diagnostic freshness reader and failure-path tests added/passed; live integration remains pending. analysis/az_tx_freshness.py.

Live saved-XML FLX6 adapter test: View opens AZ Browse from Waveform; repeated View remains Browse, screenshots inspected. Fresh TX group1→2→2 agrees. Explicit scripted visibility, not automatic universal readback. Initial Enter/Back focus transition did not occur visibly; investigate startup timing. analysis/az-flx6-navigation-live.json.

Real MP3 playback verified on AZ PC emulation: Dead Wrong acapella (183.344sec MP3 source), advancing playhead and native waveform/overview, nonzero finite stereo master/cue capture with exact demo2:1 ratio. Native BPM changed86→168.7 during analysis, so initial86 was provisional. Physical audio/full-track/stability still unverified; current300sec run PID179634. analysis/az-real-mp3-playback.json.

MP3 waveform cadence baseline:6sec Xvfb raw crop at60Hz,360samples,98adjacent changes (~16.33 changes/sec). Most inter-change gaps3samples(~50ms), some6/7. This is visible crop-change cadence under QEMU/Xvfb, not native display FPS or Pi prediction. analysis/az-mp3-waveform-cadence.json.

AZ guest main affinity14-17, ALSA18 observed; host faster CPUs0-11. Five-sec thread sample~94% one-core-equivalent total, main44.5%, ALSA18.4%. Temporary main affinity experiment after cue/replay: original19 vs faster-core24.75 visible changes/sec over4sec each. Preliminary sequential different-position comparison, not proven fix. Original affinity restored. Initial attempt invalid because track had ended. analysis/az-mp3-replay-affinity.json.

MP3 probe300sec ended normally, mixer exit0. AZ contains direct affinity helper232dc70 taking32bit mask, pthread_self→pthread_setaffinity_np(128-byte set)→sched_yield, return ignored. Direct callers222067c/2347430. Stock postboot script excludes audioCPU4 (3f→2f); launcher does not run script. Actual host14-19 mask construction still to trace. analysis/az-affinity-helper.asm.

Native affinity requests verified by opt-in pass-through interposer:246calls, allreturn0; mainmask3c000(CPU14-17), commonbc000(14-17,19), audio40000(18). These masks are requested inside EP147 before libc, not invented by QEMU. Construction of masks remains to trace. AFFINITY_TRACE=1; analysis/az-affinity-live.txt.

CPU-information path found:2353ef0 queries/probes /proc/cpuinfo, parses processor+1 into object0; cpu cores and physical id into object4. Exact lookup selection and affinity-mask producer remain unresolved. sysconf direct callers found for page-size/other queries, no demonstrated affinity count chain. analysis/az-cpuinfo-parser.asm.

Affinity reversal confirmed by16384 executions of original scalar helper instructions (CPU-count call substituted): output bit i=input bit N-1-i, counts4/6/20/21. AtN20 source3c→3c000,3d→bc000,02→40000. Runtime source masks/enable flag still to capture, but transformation explains candidate high-core mapping. analysis/az-affinity-reversal-verified.json.

Runtime confirms reversal=1, CPUcount20 in affinity interposer. Static literal1 stores at1865ae8/1882b3c/18cea30. This25sec probe crashed139: core195259 Shutdown thread SIGSEGV SI_USER, same broad signature as earlier intermittent lab failures; cause not established. Memory available~15Gi. Diagnostic evidence valid but run unstable. analysis/az-affinity-enabled-live.json.

Recovered211-entry native thread table2988ad0 stride48. Masks2(one),3c(17),3d(190),1d(two),d(one) map exactly to all observed runtime mask classes after20-bit reversal. Names, raw scheduling fields and Fifo/RR/Other labels preserved. analysis/az-thread-config-table.json. Priority field semantics and successful realtime scheduling not yet verified.

Scheduling probe confirms realtime FIFO/RR pthread_setschedparam requests returnEPERM in unprivileged lab; normal/idle mostly succeed. Native helper maps level1..10 across min..max-1 (FIFO audiolevel10→98, HUIlevel9→87). This is a concrete hardware/emulator difference, not yet causal FPS proof. analysis/az-scheduling-live.json.

Prepared same-cue alternating affinity probe, but baseline startup201277 crashed before loading. No new FPS comparison. Crash occurred without AFFINITY_TRACE, so extra hook is not required for failure. Shutdown SIGSEGV SI_USER repeats. SemaphoreEACCES appears in failed log and older source-screen/null-audio logs; cannot infer causal connection. analysis/az-repeat-startup-failure*, probe-affinity-repeat.py.

Repeated same-cue affinity comparison succeeded guest203793: original18.67/18.5 vs fast29.83/30.17 visible waveformchanges/sec. All4screenshots reviewed near02:55remaining; firstpair duringanalysis86BPM, secondpair after168.7. Original mask restored. Stronger PC-specific evidence; no Pi/compositorFPS/physicalaudio claim. analysis/az-affinity-repeat.json.

Added opt-in MAIN_CPU_LIST for offlineAZ main-thread requests. Live startup208465 verifies selectedmaincores, nativeALSA18/HUI15-17,19/Indicator14-17. Initialworkerinheritance can differ from post-start experiment; playback with startupoption pending. Omitoptionrestoresnative. analysis/MAIN-AFFINITY.md.

MAIN_CPU_LIST startup option verified with MP3+MIX_STREAM guest210182:29visiblechanges/sec over6sec, stereo masterRMS~.0302/cue~.0604, finite/peaks<1 in3sec tail. Screenshot02:38.417remaining/BPM168.7 confirms progress. Physicaloutput/longstability pending. analysis/az-startup-option-playback.json.

CDJ-3000X MP3 load verified: same USB shim mounts localfixture, touchscreen LocalLibrary→MP3→LOAD yields title,03:03.227duration,waveform. Paused only, no transport/audio claim. cdj3000x/mp3-load.png; analysis/cdj3000x-mp3-load.json. AZ main-affinity MIX_STREAM90sec run completednormal,mixer0.

3000X ERP receive mapped viaRTTI/vtable3038420→225b460→validator225f800. Validatorrequires64bytes, unlikeAZ128fixture. Checksum/buttonfields pending; do not reuseAZpacket. analysis/cdj3000x-erp-layout.json.

### CDJ-3000X control checksum verified against native instructions
The 64-byte ERP packet CRC covers bytes 0–61 and is stored little-endian at 62–63. Extracted ARM64 instructions 0x225f958..0x225fae8 matched an independent bitwise implementation for 10,000 deterministic generated packets under QEMU. The harness supplies the original vector constants and register inputs; this tests CRC generation, not the complete validator or live transport. Reproduce with `python runtime-lab/analysis/test-cdj-crc.py`.

Dispatch at 0x225ae40 passes packet+8 into 0x22579a8, so that callee's byte 6 means full packet byte 14. Initial anonymous boolean fields are saved in cdj3000x-erp-layout.json; names still require tracing member initialization. Do not label these Play/Cue yet. No live control packets sent.

AZ microphone label formatter0x1ceaf18 resolved:0=MIC1,1=MIC2,2=MIC1+2, updates utility row20. Caller0x1cefa00 has direct and allocated-closure queue paths, so callback injection must preserve ownership/threading. Row agrees with typed MicSelect UI listener; exact registration relation remains unverified. Evidence analysis/az-mic-label-binding.json and az-mic-label-selection.asm.

Typed microphone label chain now verified: MixerItemTableController MicSelect listener+144/vtable2c8a220 slot2=1cf3d08 forwards unchanged enum to1ceaf18. Thus MIC1 setting0→TX16=1, MIC2 setting1→TX16=2, MIC1+2 setting2→TX16=0. Static mapping only; microphone audio routing and safe injection API remain unverified.

Native BeatFxMicWidgetController action0x19ebcc0 maps three stored IDs at3b86458/460/468 to enum0/1/2 and calls setting submission0x19ebd70. Unlike raw state callbacks, this path validates0..2 (optimized validator850e38) before constructing update payload. Full submission queue and ID initialization remain to trace. analysis/az-mic-widget-native-action.json. No direct UI state mutation performed.

Mic setting submission traced to typed Setting::updateItem async task vtable2636300. Queued execute89dcb0 adjusts+24 then calls89d878, same helper as direct path. Invalid enum uses setting+40 fallback (not simple rejection); corrected action record. Scheduler predicate/concrete ownership and notification semantics still pending. DSP agent saved DSP-PORT-PLAN.md and begins isolated native IIR comparison next.

Mic update fanout89d600 resolved: skip excluded listener, virtual slot2 receives identifier/value, with optimized cached-setting callback864950. Existing unchanged value returns before fanout; changed writes then notifies when identifier nonempty. This constrains adapter echo suppression and refresh assumptions. Evidence analysis/az-mic-setting-notification-contract.json. Missing-item insertion and collection/reentrancy ownership still pending.

Mic widget action identifiers resolved at static initializer543940: mic1Button, mic2Button, micBothButton constructed via2344a50 into3b86458/460/468. These named identifiers must not be confused with numeric HUI EasyIDs or hardcoded runtime pointer values. Full named button→validated setting→queued/direct handler→listener mapping saved; live object discovery/invocation remains pending.

First live mic-controller observation succeeded in bounded30sec guest262658(normal teardown): constructor19eb298 executes at startup, this preserved into setting lookup, returned storage x8=this+40 verified from CPU trace. MIC_CONTROL_TRACE opt-in added; no guest state writes. Evidence analysis/az-mic-controller-live.json/log. Actual invocation/object memory validation still pending. DSP IIR oracle independently reported bit-exact tests; full CFX Filter work continues.

Live GDB observation succeeded guest265596: breakpoint after ctor, both expected vtables29f22c0/29f2308, nonnull setting+40, and mic1Button/mic2Button/micBothButton runtime strings verified. Detached without action submission. LAB_GDB opt-in Unix socket added; no TCP exposure. See analysis/az-mic-controller-gdb.json/log and observe-mic-controller.gdb. Not performance evidence.

GDB probe265596 later exited137 before normal bounded teardown. Observation remains valid; run stability not established. Memory~15Gi available afterward; semaphore errors in log not established cause.

Native MIC2 action verified guest270522: guarded post-constructor GDB call19ebcc0 with mic2Button; setting vtable2633fd0 and initialcache2(Both) recorded. Call returned, CRC-valid TX16 transitioned0→2(MIC2). No simulated touch. Saved analysis/az-mic-native-action-verified.json and rawcapture. Physical mic/DSP routing and generic adapter pending. Lab setting nowMIC2.

Native action probe270522 completed normal bounded teardown. Added CRC-gated named beat_fx_mic_target decoder, preserving raw bytes and returningNone for unknown/corrupt. Fifteen packet tests pass including256 values+badCRC; archived native action capture decodes Both→MIC2. analysis/az-mic-target-decoder-check.json. Mixer audio routing not yet wired.

Live native BeatFx state readback succeeded guest276782 at9960f8: validated application+setting vtables, ChannelSelect=7 Master and MicSelect=1 MIC2. Prior MIC2 action remains next startup. Establishes direct source for distinct target/mic state, not continuous observer. analysis/az-beatfx-state-live.json.

Readback probe276782 later exited139; successful snapshot is not stability evidence. Core metadata query saved analysis/az-beatfx-readback-core.txt.

AZ DSP song probe297825: native encoder pulses selected Local Library, counter2 selected MP3, deck1 Load and ERP Play; no pointer input. Screenshot dsp-song-playing.png shows02:53.887 remaining and populated waveforms. Dry/Filter 132288-frame windows finite/nonzero with exact2:1 cue/master lab routing; F1 accepted atframe2563776. Saved compressed windows and analysis/az-dsp-song-verification.json. Windows are different song segments: do not infer frequency response from RMS ratio. Synthetic matched-input Filter test remains effect-behavior evidence. Pi/physical listening/native UI-to-effect sync unverified.
