# AZ waveform contrast interpolation experiment

2026-09-12. User tentatively preferred B (fractional grid) but still saw wobble. This pass isolates waveform contrast while preserving B’s grid and 59 Hz source/repaint changes. It does not establish that all physical flicker is fixed.

## Recovered behavior and candidate

The native zoom<1 waveform path selects ten Q15 coefficient pairs, one per tenth of fractional pixel position. The recovered values are retained in `../shims/waveform-coefficients.inc`. The new experiment interpolates between adjacent pairs and adds the endpoint (0,32768). This retains the contrast curve rather than replacing it with complementary linear weights. Display gamma compensation may explain the original curve, but intent is unconfirmed.

The earlier continuous linear-blend candidate was also retested with the fractional grid: 16,884 paused waveform pixels changed, all 50,652 changed color channels darker. CPU 47.49/46.99/47.24% of one core in before/candidate/restored runs. It is retained as an alternative, not selected as an improvement.

## Validation

- Original AArch64 fragment oracle: 6,003 phase/zoom samples including 3,000 negative positions; interpolated weights and high-contrast byte formula matched with zero mismatches. Flat value 100 preserved. Opposing 255/0 edge sums range 255..346 in encoded bytes; not optical luminance.
- Paused full-player A/B/A: stable source positions, baseline/restored images pixel-exact. Candidate changed 8,594 pixels solely in waveform rows (128..211 and 369..380 in these particular tracks/positions). 12,800 channels darker, 12,976 brighter. Grid/UI pixels unchanged.
- Two decks moving, four-second CPU windows without recorder, then eight-second native lossless RGB crops:

| Measurement | Preferred B | Interpolated curve | B restored |
|---|---:|---:|---:|
| CPU % of one core | 46.985 | 47.235 | 47.242 |
| Source samples/sec | 44046.59 | 44095.55 | 44076.17 |
| Captured frames | 479 | 480 | 479 |
| Red and gray grid changes/sec | 58.625 | 57.873 | 57.748 |
| Backward grid steps | 0 | 0 | 0 |

All motion windows valid; no end-of-track or seek during capture. Sequential song sections, not identical content. Grid measurements do not measure waveform shimmer. Paced NULL audio, no audible quality claim. Original waveform restored after both runs; fractional grid retained. End check: process14542, TracerPid0,58.95C.

## Reproduction and rollback

Pinned running overlay SHA: `137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c`. Original firmware remains untouched. The existing fractional-grid veneer page is required.

Build the stub from the lab directory:

```sh
clang --target=aarch64-linux-gnu -I shims -c shims/waveform-coefficients.S -o /tmp/az-waveform-coefficients.o
ld.lld -Ttext=0x5000400 --defsym=native_resume=0x1e00ed8 -e lab_waveform_coefficients /tmp/az-waveform-coefficients.o -o /tmp/az-waveform-coefficients.elf
llvm-objcopy -O binary --only-section=.text /tmp/az-waveform-coefficients.elf analysis/grid-waveform-blend/waveform-coefficients.bin
```

Current 320-byte stub is linked for 0x5000400 only. If grid veneer allocation changes, relink and provide the matching address; never reuse stale object/player addresses. Runner guards binary hash, process start time, veneer ownership/mapping, branch bytes and stub content before writes under GDB with threads stopped. Hook at0x1e00ed4 replaces `scvtf d9,w19`, executes coefficient interpolation, replays that instruction and branches to0x1e00ed8. Scratch registers, flags, FPSR and stack are preserved. Original four per-pixel contrast branches remain unchanged.

`pi-grid-waveform-blend.py PID --players CURRENT_PLAYERS_JSON --output OUTPUT --smooth-stub STUB --stub-address 0x5000400` performs paused A/B/A; add `--motion` only after verified playback. It always attempts rollback in finally. Restore source branch only: do not erase stub memory while any thread may still execute inside it. A restart discards private memory changes. This candidate is not integrated into startup.

## Evidence and comparison

- `grid-waveform-blend/az-grid-curve-paused/`: full screenshots, exact pixel comparison, GDB logs and source stability.
- `grid-waveform-blend/az-grid-curve-motion/`: results, lossless masters, red/gray centroid reports, MP4 previews.
- `az-waveform-smooth-coefficient-oracle.json` and `.samples.json`: numerical evidence.
- `../video-comparison/build-waveform.py`: offline comparison builder, reusing existing player controls.
- `/home/subsect/Downloads/AZ-waveform-contrast-comparison.html`: left defaults to previous preferred B, right adds interpolated waveform contrast. Old comparison unchanged. All embedded MP4s fully decoded, JavaScript syntax checked, defaults matched to clip IDs. Browser functional QA not completed because automatic file navigation was blocked earlier; no alternate access workaround used.

Remaining: physical/user comparison, matched-position moving waveform metric, alternate zoom/color paths, tempo/seek/loop stress, long-run and audible/controller integration. No claim that gray/red optical shimmer is eliminated.

## Follow-up: position arithmetic and inferred waveform motion

The prior pass was progress: a verified native contrast candidate plus recorded comparison. This pass revalidated player14542 alive at56:58 before offline analysis. At the later check launcher14534/player14542 were absent after their3600-second limit; first-display.png was freshly written at21:55:41 by the launcher's end-of-run capture path. This is consistent with scheduled teardown; an exit code was not recovered. No restart or additional Pi mutation was performed, and no current running-player claim should be made.

Extended the original AArch64 oracle with an explicit `--inputs` JSON matrix, preserving all6003 default records exactly. The30,030-case matrix contains ten constructed zoom values0.005..4 (not a claim that every value is a UI preset), positions around zero, one hour and24hours, plus deterministic samples including negative positions. Both original and smooth-contrast modes passed the selected RGB formula checks. `check-waveform-position.py` independently reconstructs scaled position from native base+fraction: zero backward steps, maximum error5.56e-17px for this matrix, and identical position fields between modes. This rules out a backward jump in the tested arithmetic fragment; it does not validate the full provider/scheduler or every possible position.

Added `analyze-waveform-motion.py`: independently estimates translation from the native waveform body (crop rows43..126, excluding grid strips), using a Gaussian-smoothed column-intensity profile and normalized image registration. It compares that estimate with measured grid-centroid displacement. Known synthetic translations with an intensity gain/offset calibrate sign and subpixel estimation to1.6e-6px; this calibration is not firmware validation. All real frame pairs exceeded0.98correlation at the tested smoothing values. No estimated rightward step exceeded0.05px.

| Profile smoothing sigma | Preferred B p95 absolute residual | Smooth curve | B restored |
|---|---:|---:|---:|
|0.5px|0.1125px|0.0662px|0.1093px|
|1px|0.1360px|0.1016px|0.1315px|
|2px|0.1488px|0.1184px|0.1445px|

The candidate has lower residual in these clips across all three smoothing scales. This is a modest positive signal, not a controlled same-content comparison: different song sections and altered contrast/shape can bias registration. Native timing remains a separate source of repeated/skipped frame intervals. Plot and full per-frame results are in `grid-waveform-blend/az-grid-curve-motion/`; `plot-waveform-motion.py` regenerates the plot.

`contrast-edge-centroid-model.json` examines an isolated synthetic high-contrast edge using the captured original byte outputs. Smoothing lowers maximum encoded-centroid phase error0.2194→0.1211px. Illustrative nonlinear intensity-transfer exponents1.8 and2.2 also give lower error, but these are uncalibrated models, NOT measurements of the Pi panel. This supports investigating edge coverage/contrast as a cause of apparent unevenness; no optical diagnosis is established.

Reproduce the extended arithmetic check from repository root:

```sh
python3 runtime-lab/analysis/probe-az-waveform-fraction.py runtime-lab/xdjaz/rootfs/home/root/pdj/EP147 --inputs runtime-lab/analysis/grid-waveform-blend/extended-position-inputs.json --output runtime-lab/analysis/grid-waveform-blend/extended-position-native.json
python3 runtime-lab/analysis/probe-az-waveform-fraction.py runtime-lab/xdjaz/rootfs/home/root/pdj/EP147 --inputs runtime-lab/analysis/grid-waveform-blend/extended-position-inputs.json --smooth-coefficients --output runtime-lab/analysis/grid-waveform-blend/extended-position-smooth.json
python3 runtime-lab/analysis/check-waveform-position.py runtime-lab/analysis/grid-waveform-blend/extended-position-inputs.json runtime-lab/analysis/grid-waveform-blend/extended-position-native.samples.json runtime-lab/analysis/grid-waveform-blend/extended-position-smooth.samples.json --output runtime-lab/analysis/grid-waveform-blend/extended-position-check.json
```

Next controlled experiment: set a native cue at a verified paused position, play the same passage for each candidate, and use the native cue return to reset to that exact position between recordings. Verify source position before each replay and align comparisons by measured grid phase rather than wall-clock start. Do not directly overwrite audio/source-position memory merely to obtain matched frames. Physical feedback on the existing comparison remains useful; no new candidate selected by these metrics alone.

### Captured split-frame anomaly

Inspecting outliers revealed actual row bands from different updates in two lossless captures: candidate frame14 at0.233s and restored frame12 at0.200s. In each, waveform rows76..126 are exactly unchanged while the upper band moves; the next frame leaves rows43..75 exactly unchanged while the lower band catches up. These are crop-relative coordinates; the boundary is native y161. `check-waveform-frame-bands.py` and `waveform-outlier-bands.json` preserve exact row equality and independent band registrations. Peak residuals reach0.69px; the plot range was widened to show them rather than clipping them. P95 alone does not describe these isolated events.

This proves mixed-update content in the recording, not that the physical display presents it or that the contrast patch causes it (restored native waveform also exhibits it). A recording/readback race and split X11 upload requests remain candidates. Current fast24 shim converts packed24 to32bpp before forwarding XPutImage. XPutImage-to-window staging deserves investigation. Draft `shims/ximage-present.c` uploads to a private pixmap then copies a rectangle with preserved raster/clip GC state; it compiles but HAS NOT passed pixel-equivalence, concurrency, performance or native-Pi tests, and IS NOT DEPLOYED. Do not enable it yet or call it a fix. Next verify native XPutImage rectangle sizes/boundaries and whether pixmap staging removes partial observations without significant cost.
