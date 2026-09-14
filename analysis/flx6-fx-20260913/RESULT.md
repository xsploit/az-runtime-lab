# FLX6 effects + persistent USB analysis — 2026-09-13

## Verified

- User physically confirmed FILTER now audibly works. Previously the live session
  used the dry mixer, with DSP_GRAPH absent. This was a routing/build issue.
- Enabled existing reconstructed CFX/Beat FX graph on native Pi; added missing
  channel_eq.c to launcher DSP build sources. Normal headphone matrix retained.
- Filter and Echo FIFO audio tests passed on host and Pi: 14,080 frames each,
  measured changed effect output with isolated cue unchanged.
- Five controller-state tests cover 14-bit completion/center, pad overlaps and
  releases, unsupported slot rejection, bounded retry and inactive FX-unit routing.
- Existing transport/deck/mixer tests and five RX feedback-owner tests pass.
  Note: old transport test exits at import; run it directly, not unittest discovery.

## Live controls

`--dsp-graph` on the single physical MIDI bridge enables host effects. Uses the
saved BiteDJ XML. Physical addresses agree with the official FLX6 MIDI list:
https://www.pioneerdj.com/-/media/pioneerdj/software-info/controller/ddj-flx6/ddj-flx6_midi_message_list_e1.pdf/

- Four FILTER knobs: native reconstructed Filter. Center deadband is neutral.
- BEAT FX ON/OFF: Echo only. LEVEL/DEPTH: Echo depth. Channel selector: effect target.
- BEAT left/right: 1/8, 1/4, 1/2, 1, 2, 4 beat candidates within native Echo limits.
- PAD FX bank one: pad 2 Sweep; 5 quarter-beat Echo; 6 half-beat Echo.
- PAD FX bank two: pad 2 Crush; 6 Dub Echo; 7 Space.
- Supported pad positions follow BiteDJ defaults, but these are native RX DSP
  voicings, not identical Mixxx parameters. Other slots explicitly reject.
- Pads are momentary and restored on release; latest held Echo pad wins the one
  shared Beat FX engine. Release/unplug clears held effects. No fake substitutes
  for Roll, Flanger, Reverb, Trans, brake/backspin or release-Echo slots.
- Channel Echo is post-fader. Cue headphones alone hear pre-fader CFX, not channel
  Echo: listen toward MASTER for Beat FX. Echo/pads still need user audible QA.
- Settled Q1 Echo timing can update native RX UI through the existing verified
  feedback owner, sharing the one FIFO writer with navigation; no touch injection.
  UI touch changes are not wired back into host FX yet. Off retains last timing.

IMPORTANT: live Echo BPM is MANUAL 95 for Estara (`--fx-bpm 95`). It does not follow
new tracks or tempo yet; no fake beatgrid or claim of quantized native sync.
FX SELECT does not cycle unsupported algorithms. Full controller mapping remains
unfinished (EQ integration, several pads, deck layers 3/4, automatic BPM, feedback).

## Repeated analysis finding and fix

The real USB has export.pdb/exportExt.pdb, no OneLibrary database. Native AZ warns
and uses folder browsing. Its 4.6 GiB of USBANLZ export data is still present.

Confirmed repeated failures in native log:
`mkdir /media/usb/lab/PIONEER/USBANLZ/P031/0002EE3B: Read-only file system`.
The whole USB bind was read-only AND mount notification advertised protect:1.

Added `USB_PIONEER_CACHE`: only a verified mounted overlay can replace PIONEER as
writable; all music paths remain original read-only direct USB mounts. Kernel
OverlayFS rejected this FAT lower filesystem; installed Debian fuse-overlayfs
(40.9 kB download) and mounted a metadata-only copy-on-write overlay instead.
`analysis/prepare_usb_cache.py USB CACHE` creates/checks UUID identity and remounts
it after reboot. Never combine a cache from a different USB.

Shim advertises protect:0 only with explicit LAB_USB_WRITE_METADATA. Launcher sets
that only for cache mode. The native shim MUST use the old Linaro toolchain; Pi's
modern gcc produced GLIBC_2.34 requirements and failed to launch the old firmware.
Corrected build uses GLIBC_2.17 and is now running. Saved pre-cache shim for rollback.

Observed three successful Pi-side files for Estara:
- ANLZ0000.2EX: 117554 bytes
- ANLZ0000.DAT: 5626 bytes
- ANLZ0000.EXT: 122040 bytes

Loaded Estara on deck 2 while deck 1 played: waveform and 95 BPM visible within
2 seconds; all three sizes/mtimes unchanged afterwards. Exactly one cloud-analysis
attempt in this session (first load), no second one. This supports warm reuse.
Cold-start cache reuse and loading a different uncached song remain unbenchmarked.
Old library/playlists have NOT been converted to OneLibrary by this change.

## Current session / recovery

Pi lab `/home/pompu_5/az-native-lab`. Actual EP147 PID6579 (launcher returned bwrap
PID6576; always discover actual EP147 and verify executable SHA). Launcher6526,
mixer6575, aplay6525, X display :5, mixer socket
`/tmp/az-live-mixer-4qdtkzr3/control.sock`. IDs are historical observations, not a
launch API. Single controller owner; never run competing native FIFO writers.

`session-profile.json` records the exact launcher flags, including prior drawing
fixes and the metadata overlay. Does not itself start/remount anything.
Pi cache `usb-cache/COS_2025084/{upper,work,merged}`: upper contains persistent
writes, merged is the FUSE mount. Original USB unchanged. No fstab/autostart edits.

ALSA FLOAT_LE 44100, four-channel output to plughw:CARD=DDJFLX6,DEV=0.
Buffer increased 40 to 80 ms after two ~13 ms load/startup underruns in the earlier
cache session; period remains10 ms. Current session no underruns at verification.
Mixer uses RR8, aplay RR10. No long DJ stress test; buffer increase trades latency
for headroom. Temperature58.4 C at last check. DSP mixer RSS about8 MiB.
