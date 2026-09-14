# Pi AZ display timing and recovered scaling setting — 2026-09-13

## User-visible regression found and restored

User reported that the previous drawing fixes appeared to be missing. Native audit confirmed the eight smooth-scroll patches, the fractional-grid branch/veneer destinations, grid switch 1 (41,536 updates / 83,020 draws / zero fallbacks at audit), and staged upload switch 1 (177,409 uploads / zero fallbacks). Current original waveform contrast matches the last retained baseline; optional waveform-contrast interpolation was previously tested and reverted.

The missing setting was **Sway output filtering**. Last night's tested session retained `linear` (see AZ-GRID-RASTERIZATION.md), but after reboot DSI-2 reported `nearest`. The native 1280x800 X11 surface is enlarged to the 1920x1200 panel; nearest scaling can change apparent thin-line width as positions move. X11-only screenshots and captures cannot see this final filter.

Restored `swaymsg output DSI-2 scale_filter linear` and confirmed get_outputs reports linear. Saved the same output rule in `/etc/sway/pflx.conf`, after a successful headless Sway configuration validation. Backup: `/etc/sway/pflx.conf.before-az-linear-20260913`. Config SHA256 after change: 1f4a5bc99db821e92cb16cb79257e4b3d3f6b21f278a9a30ad41d58928d4af8f. No live Sway restart or reboot. User confirmed “Yup better” after restoration. A compositor-output screenshot is saved as panel-linear-restored.png. The read-only audit now fails if the active DSI-2 filter is not linear, in addition to checking native drawing patches.

The first config validation attempt without WLR_BACKENDS=headless failed to obtain a VT; the successful validation used WLR_BACKENDS=headless WLR_RENDERER=pixman. The existing compositor was not restarted.

## Bounded timing experiment — baseline retained

Hardware reports 60.018 Hz, while the native main display timer and synthetic publisher use 59.24 Hz. compare.py checks process identity, exact executable hash, timer vtable and supported old periods; writes the timer's +0x58 double only while GDB has threads stopped, and adjusts the test launcher's publisher alongside it. Each phase replays both decks from the same native cue. The finalizer restores 16.88048615800135 ms and rate.txt=59.24. Original firmware files and installed renderer libraries are unchanged.

At baseline/candidate/restored, an eight-second read-only sample measured repaint 59.24/60.00/59.24 Hz. Player CPU was 48.87/49.12/48.74 percent of one core; Xwayland 14.62/16.12/14.50. RSS remained approximately 964 MiB. This is no CPU or memory win. Native upload p95 was 18.41/18.65/18.27 ms, so no clear improvement there.

Ten-second X11 recordings requested at 60 fps show bottom red-row updates 57.40/60.00/58.10 Hz, 26/0/19 stationary frame pairs, and no backward pairs. This is strongly dependent on sampling rate. The 120 fps repeat delivered fewer than the requested 1,200 frames, showing 58.85/59.24/58.85 changes/sec and no backward pairs; do not compare its raw stationary-pair counts as physical-panel stalls. Both tests verify two advancing 44.1kHz source positions. Capture startup creates slightly different first sample positions despite matched cue resets.

A synthetic clock matched to the mode is still **not compositor/vblank synchronization**. The apparent 60 fps capture improvement cannot establish physical flicker reduction. These tests also ran before restoring linear output filtering, so they do not represent the complete preferred physical display setup. Keep the established 59.24 baseline while evaluating the recovered filter.

All playback uses paced NULL audio; these results say nothing about audible quality, audio underruns or the controller/DSP completion status. Original caches and normal allocator remain; experimental PCM sharing is not silently promoted.

## Current session / reproduction

Native player PID 1885, Xwayland 1876, launcher run-az-timing-test.py. These PIDs are this session only. Both Estara and Dead Wrong were loaded through native FIFO controls. Original installed run-az-interactive.py is unchanged; launch.sh documents the exact test flags. The archived launcher must be copied to the lab root to run because its base path is relative to __file__. The timing rate file remains baseline. Do not launch a second player over the active session.

Audit helper is read-only. Recordings and raw timing files live in aba/ and aba120/. Counter/memory results describe this session only. BiteDJ remains stopped. Pi was approximately 57–59 C in these short samples, with about 2.47 GiB MemAvailable before the final filter restoration.
