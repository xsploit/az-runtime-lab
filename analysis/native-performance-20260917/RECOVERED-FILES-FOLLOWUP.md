# Recovered files: follow-up, 2026-09-18

Offline inspection only. No new Pi performance result or deployment.

## What the key added

The local `work/private-piopack/az-v130` extraction (in the separate `so`
workspace) contains kernel, initramfs/rootfs, update tools, bootloader images
and peripheral firmware, not only EP147. The manifest inventories update
payloads including DECK and ErP images. These provide system configuration and
hardware-interface evidence; they are not a substitute Pi kernel or mixer.
Do not commit private payloads or keys.

## Important correction to the test queue

Real DRM timing is NOT an untouched idea. Read
`analysis/drm-display-clock/RESULT.md` before proposing another clock experiment.
Its prior native trial recorded approximately 60.0155 Hz on DSI-2/CRTC36,
7251/7251 events over two minutes, and no publisher skips. The recorded A/B/A
player CPU was 48.36/53.50/48.36 %core; Xwayland 15.37/18.25/15.25.
Upload phase tightened, but physical presentation and subjective improvement
were not established. Default reverted to 59.24 Hz. This is a smoothness/cost
tradeoff candidate, not an untested CPU-saving proposal. Current device mode
must be rediscovered, not hardcoded from this historical CRTC number.

`display_timing.py` already provides atomic tmpfs timestamp publication.
Preserve that improvement in any Xorg launch experiment.

## Display evidence from the actual extracted files

`rootfs/home/root/scripts/apl_start.sh` explicitly rotates DSI-1 left with
xrandr. `rootfs/etc/X11/xorg.conf.d/20-modesetting.conf` selects EXA, DRI2 and
FlipFB; the extracted Xorg module directory contains libexa.so. Thus even the
stock "bare Xorg" configuration includes a hardware-specific acceleration and
rotation path. It is not proof that unaccelerated Xorg on Pi is equivalent.

A Pi trial must record actual Xorg driver/acceleration from its log, display
mode/rotation, pixel depth and scaling. The existing path scales 1280x800 to
1920x1200 with linear filtering; matching that output matters. Removing the
compositor while silently removing scaling is not an apples-to-apples result.
No GL/EGL direct imports in EP147 alone do not prove absence of downstream
server acceleration. Don't transplant Rockchip modules/options to vc4.

## Audio evidence and limits

Recovered `etc/asound.conf` combines D810 device0's eight channels and device1's
two channels. This establishes channel wiring, not the implementation/location
of every individual effect. Presence of MIXER_CONT firmware alone does not
identify which DSP calculations run on that controller versus other hardware.

Our `pi/session.py` explicitly launches aplay at 44.1kHz, FLOAT_LE, four
channels, requested 80ms buffer/10ms period. Those are requested buffer values,
not measured end-to-end latency. `mixer/mix_stream.c` uses blocking output writes;
FIFO backpressure therefore belongs in the pacing investigation. Do not credit
the null ALSA slave alone with real-time pacing without tracing the deployed
configuration and producer/consumer blocking. Replacing aplay with direct ALSA
must preserve pacing, short-write/error handling, cue channels and recovery.

## Next bounded work

1. Restore authorized SSH access (temporary private key remains absent).
2. Run the hardened waveform-gap capture on unchanged configuration with two
   verified advancing sources; inspect all recorder errors/results.
3. Separately trial bare Xorg, preserving visible geometry, scaling, clock and
   audio. Record actual acceleration and compare CPU/frame intervals/audio.
4. Only then revisit shared IPC. Keep direct ALSA and DSP vectorization separate.

No recovered file inspected here justifies removing the mixer, controller
adapters, or copying stock realtime priorities onto the four-core Pi.
