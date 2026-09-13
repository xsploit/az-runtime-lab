# Corrected two-track Pi comparison

Supersedes the Settings-view comparison. Both applications show their main waveforms and play the same two MP3 files, Estara and Dead Wrong acapella, one application at a time. Each application-only sample lasts 20 seconds. CPU is percentage of one core (100% means one full core); memory is RSS.

| Application and view | CPU | RSS at end |
|---|---:|---:|
| BiteDJ PLAY, 1280×800 window | 11.95% | 581.4 MiB |
| AZ WAVEFORM, 1280×800 | 44.70% | 990.6 MiB |
| BiteDJ PLAY, normal 1920×1200 screen | 13.70% | 607.9 MiB |

Before/after screenshots confirm both BiteDJ deck timers and main waveforms advanced. AZ's previous two-waveform run was retained; it was already on the correct page. The earlier BiteDJ Settings result (~6.35%) is not representative of the main waveform workload.

This matches application size and visible waveform workload, but **does not establish a fully apples-to-apples FPS or audio comparison**. BiteDJ uses Wayland and a Network stream clock; AZ uses Xvfb and paced null ALSA. AZ's software mixer/CFX/EQ is not attached. Compositor, companion processes, GPU work, audible playback and underruns are not measured. Both tracks were already loaded before sampling.

Evidence: `pi-two-track-waveform-comparison.json`, `bite-main-before.png`, `bite-main-after.png`, `bite-1280-before.png`, `bite-1280-after.png`, and prior `pi-az-two-before.png` / `pi-az-two-after.png`.

Remote click correction: Sway's deprecated cursor injection did not reliably reach the PLAY button. A virtual pointer via `wlrctl pointer move -5000 -5000`, `wlrctl pointer move 440 28`, a one-second settle, then `wlrctl pointer click` selected PLAY. Visually verify the page before sampling; successful command exit alone is insufficient.
