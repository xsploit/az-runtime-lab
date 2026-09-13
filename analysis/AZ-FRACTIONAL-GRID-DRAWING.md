# Fractional placement of the native AZ grid

2026-09-12. User confirmed the 59 Hz startup experiment is smoother, but grid
wobble remains. This investigation changes neither beat timing nor playback
position. The restartable scrolling overlay remains enabled.

## Final renderer and its shortcut

A live breakpoint at Blue waveform grid draw call `0x1b857e8` resolved its
graphics context to `juce::LowLevelGraphicsSoftwareRenderer`, vtable `0x3142bc0`.
Slot +0xc8 is `0x23fb5b0`, which forwards to image drawing routine `0x23fad60`.
The actual grid call used an identity transform, context translation (-5,0),
quality field 1 at state+0x60, and alpha 255 at state+0x33.

For transforms sufficiently close to unit scale/no shear, the renderer converts
combined translation to signed fixed point with eight fractional bits. With
quality zero it always takes an integer translation path. At nonzero quality,
it tests `(fixedX | fixedY) & 0xe0`: zero takes the rounded integer shortcut;
nonzero takes the filtered-transform path. The shortcut adds 128 and arithmetic
shifts right eight to obtain integer coordinates.

Consequently, supplying fractional offsets alone does not guarantee filtered
drawing throughout a scrolling cycle. For example, at quality 1 and y=0,
x=0.1240234375 snaps to zero, while x=0.125 takes the filtered path. Negative
translations follow the native fixed-point conversion and bitmask behavior;
do not simplify this to a symmetric nearest-integer tolerance.

`probe-az-image-translation-gate.py` executes the original AArch64 gate under
QEMU, with capture exits before pixel drawing. It tested 24,582 combinations:
x=-2..2 in 1/1024 steps, qualities 0/1/2, y=0/0.5. Reconstructed selection and
integer rounding matched all cases. This tests branch selection, **not** the
full filtering algorithm or image output. Source image SHA is pinned; copied
instruction bytes exist only in a temporary directory. See
`az-image-translation-gate.json` and `.samples.json`.

## Live half-pixel draw test

Both source positions were confirmed stationary at track end before testing.
PID 13308, widget `0x7ffe8b6ac0a0`, grid image wrapper `0x7ffe8b6ac1b0` are
session-specific addresses, not reusable constants.

At `0x23fad60`, conditioned on that grid image and y=0, changed the temporary
stack transform x from 0 to -0.5 for **one draw only**. Stopped at the next
matching draw entry and captured the preceding completed native X11 image.
Baseline/half-pixel/restored captures each hit both expected breakpoints; logs
preserve the PCs and image references. No executable instructions or persistent
object fields were changed. Next-call stack setup supplies the original matrix.
All GDB sessions detached successfully.

Results:

- Baseline and restored RGB images were byte-for-byte identical.
- Half-pixel candidate changed 502 pixels, bounded by x175..390, y89..103,
  the tested top grid strip. Other UI and waveform pixels were unchanged.
- At native row 100, an original gray line (166,166,166) became two neighboring
  pixels (83,83,83). A red line (255,0,0) became two pixels (128,0,0), reflecting
  integer color rounding. This demonstrates fractional coverage in the actual
  native backend; encoded channel sums are not optical brightness measurements.

Screenshots, exact comparison, selected pixel lists and GDB logs are retained
under `grid-fraction-live/`. Ad-hoc breakpoint scripts should not be reused:
future automated mutation must guard PC, image identity and expected transform
before writing, including timeout paths. The logs confirm successful breakpoint
hits in this test; no conclusions are drawn from interrupted/timeout registers.

## Next implementation requirement

Use the same position and zoom as the waveform update to calculate a per-image
fractional scrolling correction. Apply it consistently to both grid draws,
preserving clipping and reset/reload behavior. The renderer's integer shortcut
must be accounted for **within the grid path**, rather than changing every image
in the interface. Validate pause, seek, loops and negative positions, and compare
moving frames for line coverage, CPU cost and physical appearance.

This initial stationary test established an available drawing mechanism, not
smooth motion. The continuous experiment below supersedes its implementation
status; the user's complete physical wobble remains unverified.

## Continuous hook, built and running

`shims/fractional-grid.c` is an opt-in ARM64 preload. It requires the exact
SHA-guarded 59 Hz scrolling overlay and validates four original instructions
before installing nearby veneers. It changes process memory, not the firmware
file. The hook is specific to the current Blue DetailedWaveformWidget path:

| Call site | Experiment |
| --- | --- |
| `0x1b97984` | Call original grid maker, then retain its pixel-object identity and the caller's position/zoom under the destination image-wrapper address |
| `0x1b857e8` | Draw the first grid with a fractional X correction |
| `0x1b85840` | Apply the same correction to the second grid |
| `0x23fae18` | Override the integer shortcut only while this thread is inside an experimental grid draw |

The correction is `trunc(float32(float32(position)*0.15f)*zoom) -
position*150.0/1000.0*zoom`. This subtracts the fractional displacement that the
native grid previously discarded, using the waveform's actual source position.
There is no extrapolation or independent transport clock. The normal waveform
image call at `0x1b85800` is untouched. Unknown image identities, contexts,
qualities, and invalid phase values use the original draw path.

The gate bridge preserves the original conditional decision and uses a
thread-local flag for the override. The native function has no live uses of
the scratch registers x16/x17 at this branch. The update bridge preserves the
original return and callee-saved registers. These are pinned-image properties,
not a generic ABI for another firmware.

Host ASAN/UBSAN phase checks: 1,687,007 inputs, seven zoom values and both signs;
maximum coordinate residual 2.38433131017e-8 pixels. Invalid huge positions,
NaN, and zero zoom were rejected. This tests the coordinate formula, not native
reverse-playback or every renderer variant.

Pi build, from the private lab directory:

```bash
gcc -shared -fPIC -O2 -ffp-contract=off -fno-fast-math \
  -Wall -Wextra -Werror shims/fractional-grid.c -lm \
  -o shims/fractional-grid.so
```

Native launchers accept `LAB_AZ_FRACTIONAL_GRID=1`, requiring
`LAB_AZ_SMOOTH_SCROLL=1`, `LAB_VSYNC_HZ=59.24`, and the offline fixture. Other
existing launch settings remain necessary. This flag is opt-in; unset it on
the next launch to remove all fractional-grid hooks while retaining the
separately enabled scrolling overlay. Runtime `lab_grid_enabled=0` restores
the original drawing behavior, but keeps the installed bridges for A/B tests.

Verified session: launcher 14534, player 14542, 16 KiB Pi pages. Original EP147
SHA remains `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`;
running overlay is `137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c`.
Compiled shim SHA is `edeb4c64406e271eeb8f888aa3a6102d03a234ea36004ab914e428ede1bb435d`.
The launchers' original backups and source files remain private.

## Live image scope and unrelated blinking indicator

`pi-fractional-grid-compare.py` discovers the loaded shim symbols, validates
each branch/veneer target, and checks the PID start time. Every switch write
repeats guards inside GDB while all player threads are stopped. The original
switch state is restored in `finally`. It does not change transport itself.

Three paused A/B/A comparisons at two encoder zoom settings had identical
baseline/restored RGB images and exactly unchanged source positions. Apart
from an overview indicator, changed pixels were confined to the four intended
grid strips (native y89..103, 236..250, 294..308, 441..455). In the zoom-2 run,
4,013 grid pixels changed and no other pixels changed outside those strips
and the indicator area. Normal waveform pixels were unchanged.

The 2,340-pixel overview difference at x25..614/y771..774 initially looked like
an unwanted side effect. Separate three-second recordings with the hook held
enabled, then held disabled, both showed six alternating transitions between
gray85 and white255. Thus the indicator blinks independently of the switch;
do not attribute its phase in isolated screenshots to the grid patch. Its
exact native control identity has not been traced.

## Moving grid comparison

The first moving A/B/A reached the track end during its restored phase and is
**rejected as a complete performance comparison**. It is retained as
`fractional-grid-live/az-fractional-motion`. The script now rejects a run whose
source advance does not match the 44.1 kHz zero-pitch fixture.

The valid repeat is `fractional-grid-live/az-fractional-motion2`: deck 1 playing
Dead Wrong acapella, deck 2 loaded with that track but paused, same zoom and
same process. Four seconds of CPU measurement without recording precede each
six-second native RGB capture. The clips cover sequential song positions,
not identical musical content. All phases advanced approximately 44,039 to
44,093 source samples/sec. Audio remained paced NULL, not physical output.

| Measurement | Original grid | Fractional grid | Restored grid |
| --- | ---: | ---: | ---: |
| Actual captured frames | 359 | 360 | 360 |
| Grid-row changes/sec | 37.11 | 57.33 | 37.27 |
| Unchanged grid frame pairs | 136 | 16 | 136 |
| Leftward grid frame pairs | 222 | 343 | 223 |
| Rightward / ambiguous pairs | 0 / 0 | 0 / 0 | 0 / 0 |
| Per-frame displacement standard deviation, pixels | 0.495 | 0.179 | 0.490 |
| CPU, percent of one core, no recorder | 40.24 | 45.99 | 39.24 |
| CPU, percent of one core, recorder active | 42.95 | 50.14 | 42.09 |

`analyze-grid-centroids.py` tracks each red grid line with the centroid of its
encoded red-channel coverage. It handles two-pixel edges; the older exact-RGB
integer shift matcher cannot measure fractional edges correctly. All tracked
line pairs agreed within the analyzer's spread bound. Original coverage was
one pixel/red255; candidate coverage spanned one or two pixels with total
encoded red255..256. These sums are **not optical brightness measurements**.

This is evidence of more even native grid movement at essentially unchanged
scrolling speed. It is not proof that physical wobble is gone, that the
waveform's own contrast blending is smooth, or that audio/controller timing is
correct. Capture is upstream of compositor scaling and panel refresh.

## Current state and remaining checks

Restored encoder counter 1 after the zoom check. An overview seek while paused
moved deck 1 source position from 6,768,959 to 1,823,711 samples and remained
stationary on the next read. This is one verified seek, not loop/reverse
coverage. Both decks were resumed through native ERP inputs; five subsequent
samples verified both advancing. Final recorded temperature 56.75 C,
TracerPid 0, no grid fallback events in the comparisons. Hook remains enabled.

User clip: `/home/subsect/Downloads/AZ-fractional-grid-test.mp4`, six seconds at
60 fps, native detail crop; lossless analysis masters are retained. The MP4
uses YUV420 for playback compatibility and can soften colored edges. The
Codex open request was queued, not confirmed visible.

Pending: user evaluation on the physical panel, long playback and loop/reverse
coverage, other waveform variants, full audio/mixer/controller integration,
and remaining waveform-color/presentation effects. The broad firmware goal
remains open.

## Gray ticks and user feedback

User feedback on the HTML comparison: B looks better, qualified afterward as
tentative; still close but not quite right. Preserve B as the preferred baseline
and retain rollback. Do not label the whole drawing problem fixed.

The analyzer now supports `--color gray`, selecting equal nonzero RGB bytes
independently of red. The same valid three clips yielded 37.11/57.33/37.27 gray
tick changes per second; unchanged pairs 136/16/136; no backward or ambiguous
matched pairs. Candidate per-frame displacement standard deviation 0.1796px,
versus 0.4954 and 0.4901px. Native gray166 coverage became one/two pixels with
encoded sums166..167. This verifies the improvement for gray as well as red
ticks in the tested Blue grid strips. It does not quantify optical flicker or
establish behavior for every grid/renderer elsewhere in the firmware.

The user-requested offline comparison is
`/home/subsect/Downloads/AZ-video-comparison.html`, built from
`runtime-lab/video-comparison/`. Four embedded MP4s passed full decode checks;
JavaScript syntax passed. Automatic file-URL preview was blocked by browser
policy, and no workaround was attempted. The user subsequently opened the
comparison and gave the feedback above.
