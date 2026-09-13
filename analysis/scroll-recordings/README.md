# AZ waveform recording and remaining grid stepping

2026-09-12. User reports the restartable 59 Hz update is smoother but the lines still wobble. Running player PID 13308, experimental startup overlay from AZ-SCROLL-STARTUP-EXPERIMENT.md. No rendering or timing changes were made during this recording turn.

The full compositor recording (wf-recorder, 1200x1920 raw output orientation, RGB lossless) captured only 133 frames over 11.614 seconds. The full native 1280x800 RGB recording captured 370 frames over 9.967 seconds. Neither is suitable evidence of normal display smoothness: recording could not keep up. The panel recording remains at /tmp/az-panel-master.mkv on the Pi and is not the delivered clip. wf-recorder 0.5.0-2 and its missing libpipewire dependency were downloaded from the configured Debian repository and extracted privately under tools/wf-recorder; no system packages were installed.

## Delivered detail clip

- Lossless master: az-waveform-detail.mkv, native X11 crop 640x190 at x420,y290, ten seconds sampled at 60 Hz. It includes deck 2's waveform and upper/lower beat grids, before compositor scaling. Reloaded tracks and verified moving playback before capture.
- Capture: 600 frames, timestamps spanning 9.983 seconds; median gap 17 ms, max 17 ms at the Matroska millisecond timestamp resolution. MP4 delivers all 600 frames over 10.000 seconds at 60 fps, with no interpolation or upscaling.
- User copy: /home/subsect/Downloads/AZ-waveform-59Hz-detail.mp4. H.264/YUV420 encoding may soften colored one-pixel edges, so measurements use the RGB lossless master. Codex open request returned queued, not confirmed visible.

## Native grid result

Row y10 within the crop changed 373 times. Exact-color translation matching accepted every change: 371 shifts of -1 pixel and two shifts of -2 pixels. No rightward shifts or ambiguous matches occurred. The line pattern changes around 37.36 times/second at this scroll speed, despite 60 Hz sampling. Holds were 16/17, 33/34, or 50 ms. Median hold 33 ms. This is pixel-position quantization, not a measurement of application frame rate.

Waveform rows y60 and y75 changed 583 times each, but exact-color translation matching rejected them: fractional color changes mean that method cannot establish their movement direction. Row y40 was blank and unchanged. Do not describe the waveform matcher as proof of backward motion or its absence.

The grid and waveform thus visibly update differently in the software image. Integer stepping is a supported contributor to relative shimmer; this recording does not measure final compositor scaling, panel response, backlight behavior, or the user's complete perceived wobble.

Reports: detail-cadence.json, grid-holds.json, az-waveform-detail.rows.json. Analysis uses analyze-wobble-rows.py. The faster startup setting remains enabled. Next: fractional grid coverage/translation and presentation timing, while retaining broader DSP/native control work.
