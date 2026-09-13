# AZ grid versus waveform update conditions

2026-09-12. Static analysis of pinned EP1471.30 SHA256736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6. No new firmware patches or restart. User cannot hear this run; no inference of audible sync drift.

## Does it constantly rebuild lines?

Within accepted DetailedWaveformWidget updates, `0x1b97984` calls grid maker `0x1dffe10`. With a valid incoming grid-data reference, `0x1dffe90..9c` resets descriptor end to begin and the loop reconstructs visible descriptors. `0x1dfff14..58` tests image dimensions. The matching-width branch `0x1e003fc..40c` checks height, then rejoins rasterization at`0x1dfff80`: matching dimensions avoid reallocating the image, **not redrawing it**.

The raster loop fills background and writes single-pixel descriptors into a row, then copies rows. This alone does not mean a blank frame is presented between clear and draw; no evidence of such an intermediate presentation was found. Earlier caller code checks rectangle intersections, but the exact visibility/occlusion semantics remain unnamed. Thus this is not a claim that the maker runs on every compositor frame or while fully obscured.

## Exact difference between scrolling paths

Grid scroll offset at`0x1b9792c..5c` uses float32:

    gridOffset = trunc(float32(float32(position) * float32(0.15)) * zoom) - anchorX

Each visible grid line calculates its own absolute scaled coordinate, truncates it, and subtracts gridOffset at`0x1e006d0..6f0`. Descriptor x is integer; the raster writes a hard one-pixel-wide line.

The waveform helper `0x1e00dd0`, called at`0x1b97ac0`, receives the **same position reference** (x26 forwarded to x5), but computes double-precision `position *150 /1000 *zoom`. It retains the fractional remainder at stack+0x130 (`0x1e00e98..eac`). Minimum effective zoom0.01 is enforced by`0x1e01884`; negative-position handling is separate.

The fraction is actually consumed: `0x1e01254..12b8` loads it, converts to Q15, computes complementary weight32768-fraction, blends channel bytes from adjacent column records, shifts right15, and clamps. Other branches choose packed coefficients at fractional thresholds including0.1,0.2,0.3,0.5,0.6,0.7 etc. Their full visual transfer function is not reconstructed; do not label all branches ordinary linear interpolation. Artifacts preserve these branches for further reconstruction.

This confirms that waveform pixel colors may change **within** the interval during which the grid remains on one integer coordinate. It explains why an exact-color whole-row translation matcher rejects waveform changes even while accepting grid movement. It is a concrete candidate for relative edge shimmer, not proof of the user's perceived backward motion on the physical panel.

## Rejected shortcut

Scalar reproduction compared grid and waveform base-coordinate expressions for positive integer positions0..240000ms at zoom0.0625,0.125,0.25,0.5,1,2,4. No base-coordinate disagreements were found. `az-grid-waveform-float-comparison.json` retains scope and results. This is a host mathematical reproduction, not a native oracle, and does not cover every state; nevertheless there is no current support for claiming float32 versus float64 alone causes a one-pixel oscillation here.

## Next actionable experiment

Reconstruct the grid's fractional pixel coverage and compare it with the existing waveform fraction before a reversible display-only patch. Both must use a consistent scrolling origin; changing truncation to rounding keeps integer stepping and may only move the discontinuity. Preserve the existing position provider and audio state. Separate source rendering from physical presentation timing in any visual test. The known30Hz cached position bottleneck also remains unresolved.
