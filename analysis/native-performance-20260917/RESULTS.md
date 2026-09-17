# Where AZ's CPU actually goes, 2026-09-17

First per-component measurement of the packaged session under real two-deck
playback, taken to settle which component to optimize. Earlier numbers in this
session were idle-only and understated playback by roughly four times.

Scripts here reproduce it: `measure_components.py SECONDS`,
`measure_ep147_threads.py PID SECONDS`, `measure_memory_regions.py PID`.

## Scale

Every figure is **%core**, where one fully busy core is 100% and this Pi 5 has
400% available. The user's previously reported "AZ 45%, BiteDJ 15%" is the same
scale, so those numbers are comparable to the table below. `%machine` (all cores
= 100%) is reported alongside by the script; mixing the two scales is the usual
way such comparisons stop meaning anything.

## Two decks playing, 30 s sample

| Component | %core | Notes |
|---|---|---|
| EP147 | 44.3 | the AZ firmware itself |
| mix-stream | 11.9 | our host mixer; 10.9 at idle, so largely a fixed cost |
| sway | 3.8 | compositor |
| irq/111 i2c | 3.8 | kernel IRQ thread, 1f00080000.i2c |
| run-az-interactive | 3.2 | launcher/display supervision |
| aplay | 0.6 | |
| flx6-controls | 0.3 | |
| **machine busy** | **84** | of 400 available |

EP147 is 53% of all CPU in use. Idle for comparison: EP147 10.0, mix-stream 10.9,
whole machine 7%machine.

## Inside EP147, 20 s sample

236 threads exist; 41 used any CPU under load, 13 at idle.

| Thread | %core | Share of EP147 |
|---|---|---|
| EP147 (main) | 25.1 | 57.6% |
| JUCE ALSA | 5.8 | 13.4% |
| IndicatorCtrl | 2.1 | 4.9% |
| HuiProcessor | 1.9 | 4.5% |
| PreviewMixer | 1.1 | 2.4% |
| 36 others | 7.6 | 17% |

The main thread alone is 30% of all CPU in use on the machine. The existing
rendering work (smooth scroll, fast pixel conversion/presentation, fractional
grid, NEON grid spans) targets that thread, so that effort was aimed correctly.
EP147 is not ours to recompile; only the patch/shim route applies.

## Memory

EP147 resident 958 MB of 4049 MB, 880 MB anonymous, **one 465 MB mapping** is
half the footprint and is essentially fully touched (465 of 467 MB resident).
Virtual size 13.9 GB is reserved arenas, not a real cost. 2.4 GB stayed
available throughout, so memory was not a constraint in this test. What
allocates the 465 MB region is not established.

## mix-stream is scalar, verified on the binary

`run-az-interactive.py` builds the DSP with `-O2 -fno-tree-vectorize
-ffp-contract=off`, which restricts compiler auto-vectorization but does not by
itself prove the DSP is scalar. Disassembling the **running** binary settles it:

```
total instructions      11963
scalar float arithmetic   710
SIMD vector arithmetic      0
```

(143 `ldp/stp q` are 128-bit block moves, not vector arithmetic.) There are also
no NEON intrinsics anywhere under `mixer/`; the repo's only `arm_neon.h` is
`shims/grid_span.c`, which is rendering, not DSP. The restrictive flags are
presumably there for bit-exact agreement with the DSP oracle.

A vectorized candidate is therefore worth measuring, as a **separate build**
compared on CPU, audio output and underruns. The reference tests must not be
weakened to make it pass. Note the ceiling: mix-stream is 11.9 %core on a
machine that is 79% idle.

## Health and limits of this evidence

- Zero underruns in `audio-events.jsonl` across the session, 56 °C,
  `vcgencmd get_throttled` = 0x0, no swap.
- Audio was reported by the user as "sounded right". That is an informal
  single-listener impression, not a controlled listening test, and no latency
  or routing measurement was made.
- **Loading a previously unanalyzed track was NOT exercised**, so the analysis
  and cache-write path is untested here.
- One session, one USB, one library, one mapping. No repeat runs, so no
  variance figure.
- The 3.8 %core i2c IRQ thread is measured CPU cost. The separately observed
  ~6000 interrupts/sec with nobody touching the screen is an unexplained
  counter reading, not a diagnosis: the device, driver behaviour and what those
  interrupts represent on that bus were not established. It is ~4.5% of CPU in
  use and is not where AZ's time goes.
- No capacity problem appears in this measurement: 21% of the machine, no
  underruns, no throttling. If a felt symptom exists, it is not visible here.
