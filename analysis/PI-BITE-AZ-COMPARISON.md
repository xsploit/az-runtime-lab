# Quick BiteDJ / AZ Pi comparison

Sequential 20-second samples on the actual 4GB Pi5. CPU is percentage of one
core; RSS is resident application memory, including shared pages.

| Application | CPU, one core | RSS at end | Threads |
|---|---:|---:|---:|
| BiteDJ | 0.55% | 512.7 MiB | 40 |
| AZ | 8.25% | 921.3 MiB | 235 |

BiteDJ used its existing normal display/session. AZ ran natively on a private
1280×800 Xvfb display with paced null audio, USB fixture, empty decks, and no
software mixer attached. Compositor, Xvfb, launcher and companion CPU/RAM are
excluded. These are baseline process measurements, not equal playback workloads
or an FPS comparison. AZ appears heavier at this baseline, but the ratio must
not be extrapolated to playback or total system performance.

AZ initially aborted after its bundled jemalloc rejected the Pi's16KiB page
size. A private bind of Debian libjemalloc2 5.2.1-3 arm64 allowed native startup
and45-second survival. No firmware binary or Pi kernel was modified. Package
provenance/hash are in pi-bite-az-comparison.json; license is retained under
tools/pi-allocator. bubblewrap and xvfb were installed on the Pi for isolation.

BiteDJ was restored (PID2261), AZ/Xvfb exited, no throttling flags afterward.
Screen: ../xdjaz/pi-native-first-display.png, visually confirmed SOURCE with
both decks empty. Raw samples: pi-bitedj-idle-benchmark.json and
pi-az-idle-benchmark.json. Full metadata: pi-bite-az-comparison.json.
