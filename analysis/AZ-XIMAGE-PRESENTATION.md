# AZ image-upload presentation experiment

2026-09-12. Previous goal turn made progress on native position math and isolated split waveform bands in lossless recordings, then restored the user's screen after the timed viewing launcher exited. This pass investigates image-upload atomicity while retaining the preferred fractional grid and original waveform contrast.

## Evidence for a split upload

The native AZ fallback calls XPutImage at0x24faca0. An eight-call breakpoint sample in the live player showed each Blue waveform rectangle uploaded at900×162, destination(170,89) or(170,294), from a packed24 image. The existing ximage-fast24 shim expands its pixels to the server's32bpp format. The X server reports maximum request length65535 four-byte words.

The [Xlib PutImage implementation](https://raw.githubusercontent.com/mirror/libX11/master/src/PutImage.c) splits oversized transfers into row chunks after subtracting the24-byte request header. For a900px-wide32bpp rectangle, `(65535*4-24)//3600 = 72` rows fit. Thus the first boundary is89+72=161, exactly the boundary independently observed in two recordings. The second deck's equivalent boundary is366. This is strong evidence for the recorded split-update mechanism; it does not by itself prove what the physical panel presents.

## Separate offscreen tests

`shims/ximage-present.c` stages a supported image rectangle into a private server pixmap, then submits one XCopyArea to its destination. Upload requests can be split while the destination remains unchanged. Presentation preserves raster function, plane mask, clipping including server-side rectangles, and subwindow mode. A private presentation GC disables extra exposure events without modifying the caller's GC. Resources are per-call; no persistent cross-display cache or firmware file edits.

`test-ximage-present.c` creates only private pixmaps, no windows or desktop readback.320 cases cover24/32bpp, source crops, destination offsets, clip rectangles/origins, all16 raster functions, plane masks, and16 large1280×800 images. Host and Pi each matched18,172,784 server pixels to native XPutImage, with no extra events.

`probe-ximage-partial.c` uses independent X connections: one writes uniform changing image generations, another reads a vertical strip from the test pixmap.240 full1280×800 uploads per phase:

| Platform | Original mixed/reads | Staged mixed/reads | Original restored mixed/reads |
|---|---:|---:|---:|
| PC Xwayland |3071/4032|0/3445|3553/4471|
| Pi Xwayland |3052/4423|0/5459|5212/6831|

These are a synthetic stress test, not normal-frame flicker counts. The Pi's staged test took4.24sec versus2.89/3.45sec; therefore no general speedup is implied. Actual player cost is measured separately. A900×162 PC variant is saved too.

## Compatibility and live verification

The first Pi build linked against system GLIBC_2.34 and the older firmware loader rejected it before player startup. Rebuilt as an unversioned preload with no standard-library linkage and inline AArch64 atomics:

```sh
cc -nostdlib -shared -fPIC -O2 -mno-outline-atomics -fno-stack-protector -Wall -Wextra -Werror shims/ximage-present.c -o shims/ximage-present.so
```

The firmware already loads the required Xlib/libc/dlsym interfaces. `readelf -V` confirms no version requirements. Current live EP14718499/Xwayland18492 uses this build; it successfully boots, loads both tracks and accepts native transport. Do not use the rejected system-linked build in the firmware namespace.

Launchers accept explicit `LAB_XIMAGE_PRESENT=1`, requiring existing `XIMAGE_FAST24=1` and offline preload mode. `LAB_KEEP_OPEN=1` keeps interactive viewing sessions open; timed routing/navigation/feedback helpers are rejected in that mode. The new upload switch `lab_present_enabled` can be toggled only with threads stopped; unsetting the environment option and restarting removes the preload. Waveform contrast interpolation is NOT enabled in this run.

`pi-present-compare.py` guards the overlay hash, process start identity, mapped shim and its hash, and current source-object identities. It obtains two matching complete snapshots of the dynamically reordered JUCE timer registry to find the four LocalPlayers; an initial unguarded single snapshot was rejected and changed to this bounded stable discovery. It records source progress, upload/fallback counters, player and Xwayland CPU separately. All switch changes occur under GDB and initial switch is restored in finally.

Paused native A/B/A: all pixels exactly equal across three full screenshots, stable source positions, no fallback events. In the first moving12-second sequence:

| Measurement | Original upload | Staged upload | Original restored |
|---|---:|---:|---:|
| Player CPU % of one core, recorder off |46.75|41.75|47.25|
| Xwayland CPU % of one core, recorder off |15.00|11.75|15.25|
| Source samples/sec |44082.54|44075.30|44111.82|
| Captured frames |720|720|718|
| Red grid changes/sec |58.25|58.50|57.83|
| Complementary split waveform pairs detected |0|0|1|

Candidate sample contains no detected split, but baseline also contains none in that window: these short recordings alone cannot establish elimination. `analyze-upload-bands.py` detects the previously observed complementary upper/lower row pattern. Its raw top/bottom red-row difference count is NOT a partial-frame count because row-specific labels/clipping also differ. Image-registration p95 remains around0.13..0.14px, so rectangle staging does not eliminate the original contrast-related small movement variation.

The first moving sections are sequential/different content. Two subsequent native-cue replay experiments completed, one near the intro and one around130seconds. Every phase returned to the same saved cue; capture startup gives slightly different first sampled positions. Playback is paced NULL audio, so no audible fidelity claim. Initial player switch is1 and restored to1 after each test; retain physical feedback as a separate requirement.

Dense-passage20-second recordings, original/staged/original-restored:

| Measurement | Original upload | Staged upload | Original restored |
|---|---:|---:|---:|
| Player CPU % of one core, recorder off |52.75|42.00|51.50|
| Xwayland CPU % of one core, recorder off |16.75|12.25|16.50|
| Source samples/sec |44103.44|44095.85|44086.75|
| Captured frames |1184|1200|1187|
| Red grid changes/sec |55.55|58.15|55.45|
| Complementary split waveform pairs detected |2|0|2|

Lossless dense clips were copied completely and local/remoteSHA256 matched before analysis. The intro replay detected2/0/0 complementary split pairs. Both replay experiments support the new upload mechanism; small event counts and X11 readback still do not prove all physical-display flicker is eliminated. Latest player memory snapshot is950.7MiB RSS,897.9MiB anonymous, no swap. Memory savings are not established; see AZ-BITEDJ-PERFORMANCE-ASSESSMENT.md.

## Artifacts and remaining work

- `az-upload-rectangles.log/.json`: guarded native call sample.
- `ximage-present-pixels-{host,pi}.json`, `ximage-partial-{host,pi}.jsonl`: independent verification.
- `present-live/az-present-paused/`, `present-live/az-present-motion/`: native screenshots, lossless videos, source/CPU/counter logs and analyses.
- Source originals and private firmware remain unchanged; nothing was published.

Still needed: sustained usage/memory checks, direct physical-display comparison, interaction with optional contrast smoothing, and separate dirty-rectangle versus full-frame presentation. XCopyArea staging is rectangle-level; it is not physical-vblank synchronization and does not make all separate dirty rectangles one frame. Complete audio/DSP/controller work and the wider firmware goal remain open.
