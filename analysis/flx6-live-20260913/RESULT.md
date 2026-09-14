# Physical FLX6 + real USB + headphone audio checkpoint

2026-09-13. User confirmed jog/tempo respond, then explicitly confirmed hearing Estara through the FLX6 headphones. Estara was loaded from the mounted Lexar USB, not benchmark-usb. Screenshot real-usb-playing.png shows moving deck1 at03:42remaining with native95BPM.

## Current live setup

- Launcher2792, EP1472811, X display:2, aplay2791. IDs are ephemeral.
- USB fixture is read-only `/media/pompu_5/COS_2025084`, exposed as `/media/usb/lab`.
- Standard launcher flags retain smooth scroll, fractional grid, fast24, staged presentation,59.24Hz and memory-backed timing. Linear Sway filtering remains persisted.
- Added DECK_FIXTURE=1 and MIX_STREAM=1. Mixer input is az-decks.fifo, ten float channels at44100Hz. Dry software mixer produces master L/R and headphones L/R into mixed-output.raw, which is now a FIFO (not an accumulating recording).
- aplay consumes float32LE x4 using plughw:CARD=DDJFLX6,DEV=0,44100Hz,40ms buffer/10ms period. Hardware supports4channels S16_LE or S24_3LE; ALSA plug performs conversion. Active PCM status RUNNING. One underrun of at least1.940ms appeared after about9minutes; this is not yet gig-ready stability. Applied SCHED_RR10 to aplay and SCHED_RR8 to mixer PID2808 without restarting audio; observation continues. Hardware actual S24_3LE,441-frame periods,1764-frame buffer. Not a long-run/latency certification.
- Mixer socket `/tmp/az-live-mixer-9kod8p44/control.sock`. Controller owner uses PYTHONPATH=.:analysis:mixer and the saved XML at analysis/Pioneer-DDJ-FLX6.midi.xml. Current log analysis/drm-display-clock/flx6-audio-controls3.log.
- Beat/Color FX and EQ DSP are NOT enabled in this dry audio session. Crossfader assignments provisional A/B/A/B, headphone/master software gains0.5/0.25. Physical headMix/faders/cue update full snapshots. Cue LEDs get local state feedback, not full native playback LEDs.

## Implemented control scope

Native deck1/2 Play/Cue/MT, provisional jog touch/rotation/bend and tempo. Added Sync/Master, Loop In/Out, Reloop, Slip/Slip Reverse, tempo-range cycle,4/8beat loops and hotcue1..8 activate through traced native ERP fields. Shift+Browse (including saved waveformZoom MIDI address) routes rotation on waveform view; plain Browse opens library. Shift does not inject AZ Shift globally, preserving room to implement BiteDJ's distinct shifted grid/loop behavior later.

Per-button physical QA remains pending; user confirmed general jog/tempo response. Zoom/Browse question pending. Hotcue delete/other pad modes, full deck3/4 selection, EQ/FX, memory-call-as-loop-size preference, shifted grid jog and most LEDs remain incomplete. There is no claim of complete FLX6 mapping.

## USB library result

USB has PIONEER/rekordbox/export.pdb and exportExt.pdb. Native AZ displays 'rekordbox OneLibrary (Device Library Plus) not found' and falls back to Folder. Real track directories and files load/play; old prepared playlists/database are not imported. No files/database changed on USB. OneLibrary conversion or compatible re-export still needed for full native library, or a separately implemented importer. Cabinet keys do not themselves translate an old database.

## Validation and lifecycle

Original jog converter10,000 tests passed on Pi. Stream parser, deck-state/CRC/wrap/idle/touch tests, transport tests, saved mixer bindings and live mixer ramp/cue/isolation tests passed. Active host and installed Pi bridge versions differ only by later cleanup/docstring/checkpoint-atomicity changes until next safe bridge refresh; do not restart the player just to apply those.

Bridge must be the sole FIFO writer. It saves counts/tempo/encoder against PID+startticks on clean exit so a same-session restart does not reset the jog counter. Stop bridge before manual pulse scripts. If manual rotation changes the counter, update checkpoint to the observed value before resume. Current aplay was launched externally; stop it after stopping the player/mixer and do not start a second output owner. No autostart/service installed.
