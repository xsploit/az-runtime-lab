# Real Pi display-clock experiment (private lab)

Read-only DRM discovery identified /dev/dri/card0, connected DSI-2, CRTC 36 on this Pi boot. These identifiers must be rediscovered on another machine/boot. No mode setting, DRM master acquisition, framebuffer mapping, credentials or firmware keys are involved.

`probe.c` checks DRM_CAP_TIMESTAMP_MONOTONIC, enumerates active CRTCs, and samples their sequence/timestamp. The recorded 181 samples span approximately 60.0155 Hz, rather than AZ's original 59.24 Hz. This is kernel display timing; it does not prove that any specific application image reached the panel.

`publish.c` waits for DRM_CRTC_SEQUENCE events on its own file descriptor, then atomically publishes the actual event timestamp. It validates event type/size/tag, sequence progression, freshness, and output errors. It does not busy-poll. SIGINT/SIGTERM closes the helper. The output file is readable (0644), and the helper is run as the Pi user. Never replace the user's clock with a root-only temporary file.

Native compile:

```sh
cc -O2 -Wall -Wextra -Werror $(pkg-config --cflags libdrm) publish.c -o /tmp/az-drm-publish $(pkg-config --libs libdrm)
```

The standalone three-second event probe received 181 events, skipped zero sequences, and had maximum observed event-delivery lateness 1.394 ms. That is not frame-render latency or a prolonged load test.

`compare-native.py` uses the existing guarded AZ timer comparison and native cue/transport interface. It checks that linear panel filtering remains active. The temporary experiment stops **only** the known launcher process, allowing AZ and Xwayland to continue; exactly one helper then publishes real timestamps. The native main period changes alongside the clock. Finalization terminates the helper before resuming the original launcher and restores the original main period/rate. PID/start identity, executable hash, native timer type and supported values are guarded. SIGKILL/power loss cannot run Python cleanup. Do not deploy this test lifecycle as a normal application launcher.

The earlier polling prototype `compare.py` is invalid as a physical-clock performance comparison: it wrote root-owned mode-0600 timing files while the player runs as the Pi user, and its Python thread also skipped published sequences. It was reverted. It is retained as diagnostic history only; do not use its performance numbers as evidence for the real-clock candidate.

Measurements use paced NULL audio. They do not validate audible playback, controller latency, streaming, analysis, all display modes or optical flicker. Native upload timestamps do not identify the eventual compositor present event.
