# Where AZ's CPU actually goes, 2026-09-17

First per-component measurement of the packaged session under real two-deck
playback, taken to settle which component to optimize. Earlier numbers in this
session were idle-only and understated playback by roughly four times.

Scripts here reproduce it: `measure_components.py SECONDS`,
`measure_ep147_threads.py PID SECONDS`, `measure_memory_regions.py PID`.

## Exact build and configuration measured

Reproducing or comparing against this baseline requires the same inputs. These
are the identities of what was actually running, not what the branch contains.

| Input | Identity |
|---|---|
| Kernel | `6.18.48-pflx-rt+`, 16384-byte pages, Pi 5, 4 GB |
| AZ executable | `736bdc9322c00e5770af459c…` (the documented 1.30 EP147) |
| Patched overlay actually executed | `137442868569db41daa2c52b…` |
| Shim manifest | `e065e9f03823ad8d80e9d961…` |
| Shims | fast24 `fe4f2bc28c929f76`, present `4e3b3157eb9c3e25`, fractional-grid `f906e8bb9c538b7d`, grid-span `22871e26886e0d57`, sem-owner `e29cbaf78893ef9d`, mixer-fixture `2342c84d2dde919a` |
| `run-az-interactive.py` | `61c31766fff7139b` |
| `pi/session.py` | `f9a02feb48d96b0b` |
| `run_pi_flx6_controls.py` | `277d270fda472b50` |
| `prepare_usb_cache.py` | `fe669cc17ae7a15c` |
| Mapping | `e58ec496995c3203…` (included FLX6 XML) |
| Display | `LAB_VSYNC_HZ=59.24`, 1280x800 surface, linear-scaled output |
| Audio | `plughw:CARD=DDJFLX6,DEV=0`, 4ch FLOAT_LE, 44100, 80 ms buffer, 10 ms period |
| Library | `library_stage` set, staged legacy Device Library over the cache overlay |
| `fx_bpm` | 140, manual |

The deployed Pi checkout is not a git working tree, so file hashes are the
identity. Its `run-az-interactive.py` is an older variant than this branch's
(it predates the `az_paths` refactor) carrying only the library-mount change.

## This is NOT an AZ-versus-BiteDJ comparison

The 44.3 %core figure is **EP147 alone**. AZ's complete setup also needs
`mix-stream` (11.9), `run-az-interactive` (3.2), `aplay` (0.6) and the control
bridge (0.3) — roughly 60 %core before counting the compositor that both
setups pay. Comparing that 44.3 against a single BiteDJ process understates the
difference.

The existing recorded comparison has the same limitation and says so:
`analysis/PI-TWO-TRACK-COMPARISON.md` measured BiteDJ 11.95 %core / 581.4 MiB
against AZ 44.70 %core / 990.6 MiB on the same two tracks, **application-only,
with the AZ software mixer not attached**, over different audio and display
paths. A genuine comparison needs both complete setups under one identical
workload, and has not been run.

## Earlier benchmarks predate the device library

This baseline ran with `library_stage` set: the 13,646-track adapted library,
reached through an overlay whose lower layers are the stage plus the USB. Every
earlier figure in this repo — the 44.70 %core two-track comparison and the
48.16 -> 42.89 %core NEON A/B — was measured **before** the legacy library
existed, browsing whatever the USB carried through a single-lower overlay.

So those numbers are not a before/after against this one in either direction.
Library size, query cost and the extra overlay layer all changed underneath.
Any claim that the library did or did not cost CPU requires an A/B in one
session, toggling only `library_stage`, which has not been run.

## Averages here do not rule out stutter

Every number below is a mean over a stated interval. Short spikes, blocking,
uneven frame delivery and missed audio deadlines all survive such averaging,
so "21% of the machine, zero underruns" is not evidence of smooth playback.

The already-recorded fresh-load tests make the point concretely: after the
semaphore-owner fix, three fresh loads showed display-update gaps of
19.59–23.33 ms with **peak player CPU of 143–147 %core** — three times the
44.3 %core average here — and zero reported aplay underruns during continuous
monitoring. Pre-fix runs showed 59.5–74 ms gaps and one isolated 325.621 ms
underrun. Those cohorts differ, so no exact before/after percentage should be
claimed, and XDamage gaps are not physical scanout FPS. See
`analysis/native-performance-20260914/RESULTS.md` and
`az-opus-performance/load-analysis/RESULT.md`.

Main-thread CPU share also says nothing about *which functions* spend it. That
profile does not exist yet and is the main gap after this baseline.

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
  variance figure, and means only.
- Fresh analysis was not exercised **in this configuration**. Earlier reports
  tested it, but not with `library_stage` in place, where analysis writes land
  in a different cache overlay whose lower layers now include the stage.
- The 3.8 %core i2c IRQ thread is measured CPU cost. The separately observed
  ~6000 interrupts/sec with nobody touching the screen is an unexplained
  counter reading, not a diagnosis: the device, driver behaviour and what those
  interrupts represent on that bus were not established. It is ~4.5% of CPU in
  use and is not where AZ's time goes.
- No capacity problem appears in this measurement: 21% of the machine, no
  underruns, no throttling. If a felt symptom exists, it is not visible here.
