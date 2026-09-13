# AZ tempo slider trace

EP147 AZ1.30; addresses refer to the preserved executable.

Consumer0x6cda28..6cda44 constructs ID `ce526aad3c48b600` and links a slider observer; failure branches to0x6cde1c, whose diagnostic at0x6cde70 names `linkToObserver<IHuiSlider> (Deck::tempoSlider(), this)`. Second group ID ends01, candidate consumer0x6d02d8 (register survival still to check there).

Group0 registration0x213b6c4..b6dc constructs the same ID;0x213b740 constructs its HuiSlider and0x213b748 stores it at container+88. The dispatcher constructor forms container at dispatcher+16 (0x2137c94), so this is dispatcher+104. Decoder0x2137880 loads exactly dispatcher+104 at0x2137898. This closes the named control-to-packet chain for group0.

Decoder input values:

- `a = packet[16] | ((packet[17] & 3) << 8)`
- `b = packet[18] | ((packet[19] & 3) << 8)`
- event storage: byte0=1, word+4=`b << 6`, word+8=`a << 6`.

Do not yet label a/b current/reference/min/max: event adapter consumption must establish their roles. Constructor initializes adapter with -1.0/+1.0 float bounds (0x213b6fc..b724), but that does not establish final tempo percentage, direction or calibration. Caller0x2137bc0..bc8 passes the packet base unchanged, unlike the separate status decoder passed packet+2.

Tempo runs through deck-ucom, not ERP. The lab currently emulates only mixer and ERP fds; therefore this mapping alone does not permit a tempo injection. Next verify deck transport path, packet validator/CRC, and slider event conversion before adding a dedicated private FIFO. No runtime tempo change claimed.

Evidence scanners: tempo-diagnostic-xrefs.py / az-tempo-diagnostic-xrefs.json and tempo-id-xrefs.py / az-tempo-id-xrefs.json. Candidate scans need manual instruction validation; group0 chain above was inspected directly.

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

Probe survived120sec until scheduled teardown; final screenshot succeeded. Full audio preserved: xdjaz/first-tempo-audio-output.f32le.gz.

## Master Tempo button mapped; first test hit startup crash
Named link IDa6b7444dca1b6d00 at6ccb98..6ccbb4, diagnostic masterTempo at6ccc14. ERP registration2145268 places button at group+152; decoder2143214..2143220 maps this to group byte0 bit3. Added --button mastertempo (packet8+8*group,mask8) to private ERP sender. Group0 static chain confirmed; runtime toggle remains unverified.

Attempt PID80154/guest80156 exited before UI with a core: SIGSEGV SI_USER, host thread Shutdown, unsymbolized QEMU stack. coredumpctl report az-master-tempo-startup-crash.txt. Memory15Gi available, no kernel OOM entries in ten-minute window. No input was sent to the guest before the crash, so no evidence implicates the new button mapping. Cause not established; no firmware/mixer fix claimed. Prior successful captures preserved. Next retry after launcher cleanup, then inspect actual Master Tempo toggle and audio.

## Master Tempo retry: no pitch-preservation result yet
RetryPID84026 survived120sec with successful final screenshot. First mastertempo packet was sent immediately after load/tempo actions; full playback still measured462.440075Hz/9.514853sec, identical to ordinary speed change. Thus button mapping/runtime state is not yet confirmed. A second toggle after playback plus cue returned native UI to00:10.000, but second play occurred at scheduled teardown; do not treat it as a complete pitch-preservation trial. Evidence az-master-tempo-audio-verification.json (first playback), az-master-tempo-attempt-segments.json, xdjaz/first-master-tempo-attempt.f32le.gz. Next inspect button callback gating/actual master-tempo state and retry with time reserved after fully loaded UI. No claim of unavailable DSP based on this failed activation attempt.

## Master Tempo pitch preservation verified
Extended bounded launcher maximum to300sec; actual probe180sec PID87919 to allow both comparison playbacks. Loaded deck1 completely, set+5.10%, toggled mastertempo, played. First pass9.514852608sec with seven interior1sec windows462.43998..462.44008Hz. Toggled again after completion, cue then play; second pass9.515804989sec with seven windows439.99991..440.00013Hz. Source440Hz/10sec. This directly confirms both button-controlled rate-changing and pitch-preserving modes in native AZ audio under PC emulation. Initial toggle state must not be assumed across runs: fixture settings persist, and prior activation attempts did not establish state.

Evidence az-master-tempo-long-segments.json, check-tone-segments.py, xdjaz/mt-long-loaded.png and mt-long-second.png. Sine fixture does not establish transient/music quality, four simultaneous stretched decks, realtime Pi capacity, or FLX6 output. Next music/impulse tests and multi-deck cost, while continuing mixer implementation.
