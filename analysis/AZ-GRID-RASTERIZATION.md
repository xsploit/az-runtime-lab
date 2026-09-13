# AZ detailed waveform grid rasterization

Examined EP147 SHA256 `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6` on 2026-09-12. Addresses below are ELF virtual addresses. The retained disassembly's nearest exported C++ symbol labels are misleading; use addresses, not those labels, to identify these stripped functions.

## Confirmed image-generation path

The `DetailedWaveformWidget::update` diagnostic leads to call `0x1b97984` → `0x1dffe10`. The returned image wrapper is assigned at widget-relative `+0x110`. See `az-grid-maker-call.asm`, `az-grid-maker-entry.asm`, and `az-grid-maker-tail.asm`.

The grid maker's observed layout is:

| Offset | Observed role |
| --- | --- |
| `+0x00` | Image width |
| `+0x0c` | Four background pixel bytes |
| `+0x10`, `+0x18` | Begin/end of 12-byte descriptor vector |
| `+0x28` | Cached image wrapper |
| `+0x30` | Writable image pixel pointer |
| `+0x3c` | Byte stride between rows |
| `+0x44`, `+0x48` | Writable image width/height metadata |

A descriptor has signed integer x at `+0`, four pixel bytes at `+4`, and a flag at `+8`. Pixel channel order is not established here.

At `0x1e006d0..0x1e006f0`, a position is converted through float division, multiplication by 150.0 and zoom, truncation toward zero, and subtraction of an integer offset. The upstream position/denominator units remain unverified.

## Rasterization is a direct pixel write

At `0x1dfffa0..0x1e00018`, the routine constructs the first row:

1. Read each descriptor's integer x (`0x1dfffb8`).
2. Fill intervening pixels with the background bytes (`0x1dfffd8..0x1dffff0`).
3. Copy exactly one 32-bit descriptor pixel to the row (`0x1e00000..0x1e00008`).
4. Advance to the next 12-byte descriptor and next pixel.
5. Fill the remainder of the row with the background.

This path does not distribute fractional coverage across neighboring pixels. A descriptor contributes a single pixel to the base row. The exceptional overlapping/out-of-order descriptor path (`0x1e003c4`) uses the current row cursor as its destination; a reconstruction must preserve this behavior rather than assume a simple indexed scatter.

With the incoming w5 flag clear, the completed first row is copied into subsequent rows using `memcpy(width * 4)` at `0x1e00340..0x1e00388`. This produces one-source-pixel-wide vertical lines, with no horizontal filtering in this routine.

With that flag set, the upper rows still copy the initial row (`0x1e000e8..0x1e00118`). A lower-row variant uses the descriptor flag at `+8` to select its color or the background (`0x1e00198..0x1e001b8`, `0x1e003bc`). It is then copied down (`0x1e00280..0x1e002cc`). The UI meaning of this flag is not yet established.

## What this means—and what it does not prove

We now have evidence of integer rasterization in the actual cached grid image, beyond merely finding integer descriptors. Its horizontal motion advances in whole source pixels. This is a plausible contributor to visible stepping at the measured roughly 30 image changes/sec.

It does not prove that downstream image compositing or Xwayland/Sway scaling performs no filtering, nor that this alone explains the user's flicker. Constant fractional scaling, variable frame intervals, line/background contrast, and display response must be separated experimentally. No RX2 binary has been examined here, so the user's RX2 observation does not establish an identical implementation.

## Next experiments

- Trace the cached `+0x110` image into the widget paint/composite path and identify its transform and sampling settings.
- Capture consecutive native-resolution frames during verified playback; measure line positions and intensities separately from whole-crop hash changes.
- Compare a genuinely unscaled Xwayland startup against fullscreen 1.5× output. Resizing the existing fullscreen surface previously cropped it and is not a valid scaling comparison.
- Only then evaluate a reversible grid rasterization/filtering experiment. Changing truncation to rounding alone would still produce whole-pixel motion and is not a subpixel rendering fix.

No firmware patch or live display change was made for this analysis.

## Widget paint transform traced

RTTI-derived primary vtables associate the three waveform variants with these slot-4 methods:

| Variant | Vtable address point | Paint-path method | First grid draw call |
| --- | --- | --- | --- |
| Blue | `0x2b66d98` | `0x1b857b0` | `0x1b857e8` |
| RGB | `0x2b67408` | `0x1b85630` | `0x1b85668` |
| 3Band | `0x2b67a78` | `0x1b854b0` | `0x1b854e8` |

All three load the cached grid image at widget `+0x110`, then call `0x23b05e0` with x=0, y=0, flag=0. That helper converts the two integer coordinates to floats and explicitly builds six float words `[1, 0, x, 0, 1, y]`. It forwards this translation-only affine transform to `0x23b04e0`. For the first grid draw this is identity: no scale or fractional translation is introduced at this call.

The flag-zero branch in `0x23b04e0` dispatches image plus transform to graphics backend vtable slot `+0xc8` at `0x23b05bc..0x23b05c8`. An earlier backend slot `+0x68` check may skip drawing. Backend ownership, existing graphics-context transforms and sampling behavior are not yet resolved. Identity at this boundary does NOT prove identity all the way to the physical panel.

The same grid image is reused lower in the widget. The ordinary branch supplies integer y = fields `+0x88` + `+0x8c`. An alternate branch constructs coefficients consistent with vertical reflection `[1, 0, 0, 0, -1, 2*h1+h2]`; this is separate from horizontal scrolling and introduces no horizontal scaling. The mode flag selecting that branch is not yet named.

Artifacts: `map-detailed-waveform-vtables.py`, `az-detailed-waveform-vtables.json`, `az-waveform-paint-variants.asm`, `az-grid-image-draw.asm`. Static vtable candidates are explicitly labeled; execution of each variant has not been separately demonstrated. Next resolve the live backend and its context transform before proposing a filtering patch.

## Live backend and context verified

Two brief GDB attaches to running Pi EP147 PID9262 hit the Blue paint method and its first grid draw. Both detached; `/proc/9262/status` reported `TracerPid: 0` afterward. Logs are `pi-az-grid-backend.txt` and `pi-az-grid-state.txt`. These are session-specific addresses, not reusable pointer constants. Debugger namespace/symbol-load warnings occurred; raw ELF-address breakpoints and memory reads succeeded.

The actual backend vtable is `0x3142bc0`, with image slot `+0xc8` → `0x23fb5b0`. Its RTTI typeinfo at `0x3142390`, name at `0x3142360`, resolves to **juce::LowLevelGraphicsSoftwareRenderer** in the retained RTTI index. This is observed execution, not just a candidate backend in the binary.

The slot loads saved state from backend+8, checks a clip pointer and opacity byte, then tails to `0x23fad60`. That function combines the supplied affine transform with the saved graphics transform. Its integer-translation shortcut is controlled by state+0x28. At the live first-grid call:

- Supplied x/y/flag were 0/0/0.
- State+0x28 = 1 (integer-translation branch).
- State+0x20/+0x24 = -5/0 (integer x/y translation).
- Stored affine coefficients at state+8 were `[1,0,0,0,1,0]`.
- Opacity byte+0x33 = 255.
- Sampling-quality-related field+0x60 = 1; its enum name has not been established.

In this sample the backend therefore adds only integer translation, with no scale. `0x23fadf8..0x23fae30` converts translation to 8-bit-fraction fixed-point, checks fractional bits for the alternate path, then rounds to integer coordinates. An integer translation passes that check even with field+0x60 nonzero. Raising a sampling-quality flag alone would not create subpixel positions already discarded upstream. The eventual clip renderer/pixel blending remains to be inspected if changing compositing itself.

This confirms the observed grid image stays on integer coordinates through widget and backend transform selection. It does not establish the sampling policy of Xwayland/Sway or physical-panel response, and software rendering by itself is not proof of a CPU bottleneck. No persistent patch was made.

## Native red-grid motion sample

Captured six seconds from X11 `:0+420,100`, 620×1 pixels, requested120Hz, after reloading and verifying nonzero remaining times/white play cursors. Both decks contained Dead Wrong acapella at168.7BPM, unchanged expanded waveform view. Previous tracks had ended and were unsuitable for motion testing. This is a zoom/view-specific observation, not a universal grid speed.

`az-grid-strip.nut` retains raw RGB24 frames and NUT timestamps. `analyze-grid-strip.py` decodes with FPS passthrough and matches red-line sets over ±12 pixels, excluding boundaries. Initial analysis correctly rejected a timestamp/frame-count mismatch from ffmpeg's default output synchronization; using passthrough preserved all720 original samples. The script asserts exact frame count and rejects ambiguous shifts instead of selecting arbitrary matches.

Results in `az-grid-strip.json`:720 samples over5.991667sec,113 accepted changes, all exactly -1 native pixel, zero ambiguous/imperfect transitions. All16735 observed red runs were one pixel wide and exactly RGB(255,0,0). Inter-change intervals rounded to milliseconds:67ms×57,33ms×42,75ms×8,42ms×3,25ms×2. Median66.666ms, maximum75ms. Repeated-frame intervals include pixel quantization holds and must not be reported as application frame rate.

In this strip there is no observed brightness modulation or partial interior grid disappearance: its motion is whole-pixel stepping with uneven holds. That is consistent with integer position quantization sampled by the roughly30Hz update path. It does not measure physical-panel flicker, white/gray grid styles, other zoom levels or Xwayland/Sway enlargement. We should compare pixel trajectory across zoom/scale before altering the native renderer.

## Matched compositor enlargement sample

Frozen the verified EP1479262 briefly with SIGSTOP, captured native X11 and grim output, then SIGCONT in finally. Returned process state R confirmed resumed. Files `az-scale-native.png` (1280×800) and `az-scale-panel.png` (1920×1200) preserve the same image. This did not restart the app or modify its settings.

`analyze-scale-pair.py` compares red grid lines at native y100/x420..1040 and corresponding compositor y150/x630..1560. The same20 lines were all one pixel wide at source; output widths were one pixel for12 lines and two pixels for8. The output remains hard red pixels in this sample rather than a uniform1.5-pixel coverage representation. As source lines advance, their output width can therefore depend on pixel phase: a plausible additional contributor to shimmer. This single frozen frame is spatial evidence, not a measured temporal width sequence or optical panel flicker.

Simple floor/center nearest-neighbor predictions were close but NOT exact (189/231 mismatches of19530 tested pixels). Do not assert an exact scaler implementation based on this comparison. Saved full line lists and colors in `az-scale-comparison.json`. Next compare a reversible compositor filtering option or true unscaled startup, preserving a rollback and checking touch geometry.

## Reversible Sway filter experiment

Live `get_outputs` confirmed DSI-2 scale1.0, transform90, scale_filter=nearest, physical1200×1920 at60018mHz. Local Sway manual describes linear/nearest/smart controls. Despite output scale1, this filter affects the enlarged rootful Xwayland surface in our setup.

With EP147 stopped briefly, runtime-only filter A/B/A nearest→linear→nearest produced `az-filter-before.png`, `az-filter-linear.png`, `az-filter-restored.png`. Before/restored SHA256 match exactly (`6682480cb9c9abdba3fae503a5133e2560d82b016aaa7940cb41d0df5e8cb84c`); linear differs. Finally restored originalfilter and resumedEP147. Tracks had ended by this test: valid static rendering comparison, invalid motion/performance comparison. Initial crop was empty; inspected image and used actual remaining grid atx270..445,y150.

Original/restored red-grid strip contains only black and fullred255. Linear contains red intensities42,43,127,128,212,213, distributing edge coverage across pixels. Saved `az-filter-comparison.json`. Visual inspection shows softer text as well as softened grid/waveform edges. This confirms controllable output filtering, not eliminated temporal shimmer or higherFPS.

After rollback verification, intentionally enabled **linear for the active session** via `swaymsg output DSI-2 scale_filter linear`; command success confirmed. No configfile edited, no AZrestart needed because this changes compositor state immediately. User informed of trial and softness tradeoff. Rollback: same command with `nearest`. Next evaluate moving playback and overhead, then decide whether any launcher integration is warranted.

## Playback filtering A/B/A and CPU check

`pi-filter-playback-probe.py` is explicitly session-specific: asserts EP1479262, Xwayland9256 and sway1143 identities and verifies their starttimes remain unchanged. It restores the pre-experiment output filter in finally. Ran three six-second native X11 captures during two loaded DeadWrong tracks, linear→nearest→linear; screenshots after each sample show advancing times and the same expanded view/zoom (64/128/192 labels). This zoom differs from the earlier grid-motion sample, so do not combine their speeds.

| Filter | Native changes/sec | AZ CPU % of one core | Xwayland CPU % | Sway CPU % |
| --- | --- | --- | --- | --- |
| Linear before | 29.833 | 31.43 | 21.17 | 2.73 |
| Nearest | 29.500 | 31.59 | 21.65 | 3.05 |
| Linear after | 29.500 | 31.75 | 21.01 | 3.05 |

All sample interval medians33.333ms,p95/max41.667ms. Each captured719–720 samples across6sec. CPU snapshots include ffmpeg capture's effect on these processes, exclude ffmpeg's own CPU, and do not quantify GPU utilization. Samples are sequential musical positions, not exact-position repeats. No meaningful additional CPU load or native-update regression appears in this short test; this is not a prolonged stability or optical smoothness result. Audio remains pacedNULL, so this is not an audible underrun test.

Reports `az-filter-playback-results.json`, `az-filter-play-*.framemd5/.json`; matching screenshots retained and inspected. Linear was restored as intended and remains active for visual trial. No renderer or timing patch introduced here.
