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

## Main-thread profile: the cost is our own conversion shim

`perf record -F 997 -g --call-graph fp` on EP147's main thread, 25 s spanning a
cached deck-2 load with deck 1 playing, symbolized against the patched overlay.
Addresses are raw: the firmware is stripped.

Cost by object, exclusive self time on that one thread:

| Self | Object |
|---|---|
| 42.54% | EP147 |
| 28.46% | kernel |
| 10.43% | `ximage-fast24.so` (ours) |
| 8.56% | libc |
| 2.73% | libjemalloc |
| 2.00% | libpthread |
| 1.83% | libX11 |
| 1.19% | `fractional-grid.so` (ours) |

The single largest non-firmware leaf is **`XPutImage` at 10.40%, inside
`ximage-fast24.so`** — our own packed-24 conversion shim, not Xlib. The real
Xlib entry point is `XPutImage@plt` at 0.04%, and libX11 totals 1.83% across
all symbols. No `XShm`, `shmat` or `shmget` symbols were sampled.

So the expensive part of presentation here is the **pixel format conversion we
added**, not the transport. Our two rendering shims together are ~11.6% of
main-thread self time.

### The MIT-SHM question, corrected

An earlier draft of this section claimed ~14.7% of main-thread self time was
"moving pixels over the X socket" and that MIT-SHM could return 3-4 %core. That
was wrong in three ways, and the corrected position is weaker:

- The 10.40% is our conversion shim. MIT-SHM changes how converted pixels reach
  the server; it does not remove the conversion, so that 10.40% would largely
  remain.
- Only **2.81%** of the 4.31% `__arch_copy_from_user` sat under
  `unix_stream_sendmsg`. The rest is other user copies and must not be
  attributed to image upload.
- `ipcs -m` was run in the wrong namespace. EP147 has its own IPC namespace
  (`ipc:[4026532670]` versus the shell's `ipc:[4026531839]`), and inside it
  there **is** a shared memory segment: key `0x1402edc9`, 832 bytes, nattch 2.
  That is far too small to be a 1280x800 frame, so it is not image transfer,
  but the earlier "zero shared memory segments" statement was simply not a
  measurement of EP147's namespace.

A realistic ceiling for removing the socket write is therefore the 2.81% kernel
copy plus some part of libX11's 1.83%, on a thread that is 25.1 %core: **well
under 1 %core**. Throughput is not the reason to try it.

What remains genuinely open, and is the only reason the A/B is still worth
running: a per-frame synchronous socket write is a plausible source of frame
delivery *jitter*, and jitter is what the load hitch actually is. This profile
measures where cycles go, not when frames land, so it can neither support nor
refute that.

Also unestablished: that the active presentation path can use MIT-SHM at all.
`ximage-present.so` and `ximage-fast24.so` both export `XPutImage` and sit in
front of Xlib, so whether an IPC-shared namespace would actually produce
`XShmAttach`/`XShmPutImage` calls through that stack is untested. The binary
referencing `XShmPutImage` does not establish it, and MIT-SHM avoids sending
pixel data through the socket without necessarily being zero-copy end to end.

### Bounded A/B/A plan, if run

Use the existing `az-opus-performance` `LAB_SHARE_IPC=1` candidate. Before
measuring anything, verify the X server advertises MIT-SHM and confirm real
`XShmAttach`/`XShmPutImage` calls occur with IPC sharing enabled; if they do
not, stop, because there is nothing to measure. Hold tracks, zoom level, audio
device, controller and every rendering setting fixed across arms. Compare CPU,
frame gaps and continuously monitored underrun logs, not spot checks. Preserve
rollback. Do not promote it unless it measurably helps with no regression.
Listening stays separate user acceptance.

Sharing the IPC namespace also weakens the isolation `--unshare-all` provides.

## MIT-SHM candidate: bounded A/B/A, idle only

`share_ipc` toggled off/on/off with everything else held fixed: same build,
config, USB, library stage, mapping, audio device, vsync, no tracks loaded in
any arm. Each arm restarted AZ, settled 15 s, then sampled 30 s.

| Arm | share_ipc | EP147 | machine busy | underruns |
|---|---|---|---|---|
| A1 | off | 14.4 %core | 33 %core | 0 |
| B | **on** | **10.6 %core** | **30 %core** | 0 |
| A2 | off | 14.6 %core | 34 %core | 0 |

The two control arms agree (14.4, 14.6) and bracket the candidate, so the
~3.9 %core reduction in EP147 is repeatable rather than drift. `mix-stream` was
unchanged at 11.1-11.2 %core across all three, as expected.

### What made the difference, verified

The discriminator is **`nattch`, not the presence of a segment**. A 4,096,000
byte segment exists in *both* conditions, because `shmget` succeeds in a
private namespace too:

- `share_ipc=false`: segment present, **nattch 1** — EP147 allocated it, the X
  server never attached, so `XShmAttach` failed and the packed-24 path was used.
- `share_ipc=true`: same segment, **nattch 2** — the X server attached it.

An earlier note in this session claimed the 4 MB segment's presence proved
MIT-SHM use. It does not; only the attach count does.

### Corrections to earlier claims in this report

- "`ximage-fast24.so` vanished from the profile with shared IPC" was **invalid**.
  It compared a *loaded* profile against an *idle* one. Sampling idle in both
  arms shows fast24 absent either way: it only appears when frames are actually
  changing. Whether shared IPC removes it from the hot path is untested.
- The idle DSO percentages shift wildly with workload (kernel 65% in a 12 s
  idle sample versus 28% under load), so DSO share must never be compared
  across different workloads.

### Not established

Every arm was **idle with no tracks loaded**, so this does not measure playback,
and it is the load hitch that motivated the work. Specifically untested:

- CPU under two-deck playback with shared IPC.
- **Frame gaps / jitter**, which is the only reason the review considered this
  worth running. Nothing here measures when frames land.
- Continuous underrun monitoring across a real set; zero underruns in three
  30 s idle windows is weak evidence.
- Listening. That remains separate user acceptance.

`share_ipc` therefore stays **default false**, and is not promoted on this
evidence. Sharing the IPC namespace still weakens the isolation `--unshare-all`
provides, which is a separate judgement from the CPU number.

## Unresolved: blank output during repeated restarts

A `--no-controller` session produced an all-black 1920x1200 `grim` capture
while `LiveView` reported `kind: browse` and `DSI-2` was active with
`dpms: true`. An earlier revision of this section called that a `grim` artifact
on the strength of the user reporting the panel was not black. That was wrong
twice over: the user was describing the screen at that moment, not the A/B/A
arms, and they later confirmed directly that the screen **was** blank during a
`--no-controller` session. `grim` was reporting accurately throughout: 6791
bytes is a blank frame, 51662 a rendered one.

The cause is not established. Tested and **refuted**:

- Launch path. Blank occurred both when AZ was started directly over SSH and
  when it was started through the kiosk.
- The controller bridge. Blank persisted with the bridge confirmed running
  (`session.json` bridge pid live, process present).

What correlates is only that blankness appeared after AZ was restarted
repeatedly outside the normal kiosk flow, and cleared on a clean kiosk restart,
which restored a 51662-byte rendered capture.

**Consequence for the A/B/A above: its arms each restarted AZ the same way and
none was captured, so whether they were presenting remains unknown.** The
14.4 / 10.6 / 14.6 %core result is therefore still unverified and must not be
promoted on this evidence. Any rerun must capture a frame per arm and assert it
is non-blank, and should prefer XDamage notification activity, which observes
drawing directly and is the display-gap measurement the loaded test needs.

## MIT-SHM candidate: bounded A/B/A, idle only

`share_ipc` toggled off/on/off with everything else held fixed: same build,
config, USB, library stage, mapping, audio device, vsync, no tracks loaded in
any arm. Each arm restarted AZ, settled 15 s, then sampled 30 s.

| Arm | share_ipc | EP147 | machine busy | underruns |
|---|---|---|---|---|
| A1 | off | 14.4 %core | 33 %core | 0 |
| B | **on** | **10.6 %core** | **30 %core** | 0 |
| A2 | off | 14.6 %core | 34 %core | 0 |

The two control arms agree (14.4, 14.6) and bracket the candidate, so the
~3.9 %core reduction in EP147 is repeatable rather than drift. `mix-stream` was
unchanged at 11.1-11.2 %core across all three, as expected.

### What made the difference, verified

The discriminator is **`nattch`, not the presence of a segment**. A 4,096,000
byte segment exists in *both* conditions, because `shmget` succeeds in a
private namespace too:

- `share_ipc=false`: segment present, **nattch 1** — EP147 allocated it, the X
  server never attached, so `XShmAttach` failed and the packed-24 path was used.
- `share_ipc=true`: same segment, **nattch 2** — the X server attached it.

An earlier note in this session claimed the 4 MB segment's presence proved
MIT-SHM use. It does not; only the attach count does.

### Corrections to earlier claims in this report

- "`ximage-fast24.so` vanished from the profile with shared IPC" was **invalid**.
  It compared a *loaded* profile against an *idle* one. Sampling idle in both
  arms shows fast24 absent either way: it only appears when frames are actually
  changing. Whether shared IPC removes it from the hot path is untested.
- The idle DSO percentages shift wildly with workload (kernel 65% in a 12 s
  idle sample versus 28% under load), so DSO share must never be compared
  across different workloads.

### Not established

Every arm was **idle with no tracks loaded**, so this does not measure playback,
and it is the load hitch that motivated the work. Specifically untested:

- CPU under two-deck playback with shared IPC.
- **Frame gaps / jitter**, which is the only reason the review considered this
  worth running. Nothing here measures when frames land.
- Continuous underrun monitoring across a real set; zero underruns in three
  30 s idle windows is weak evidence.
- Listening. That remains separate user acceptance.

`share_ipc` therefore stays **default false**, and is not promoted on this
evidence. Sharing the IPC namespace still weakens the isolation `--unshare-all`
provides, which is a separate judgement from the CPU number.

## Resolved: the blank capture was a grim artifact, not a blank screen

A `--no-controller` pilot produced an all-black 1920x1200 `grim` capture while
`LiveView` reported `kind: browse`, the `Xwayland on :0` window existed and
`DSI-2` was active with `dpms: true`. That looked like AZ running without
presenting, which would have invalidated the A/B/A, since none of its arms were
screenshotted either.

**The user, watching the physical panel throughout, reports the screen was not
black.** AZ was presenting normally. The A/B/A arms therefore were doing the
upload work the candidate changes, and the 14.4 / 10.6 / 14.6 %core result
stands, subject to its other stated limits (idle only, single trial).

Consequence for method: `grim` is not a reliable presentation check on this
setup. Earlier captures in this session did show AZ content, so it is
intermittent, and its cause is unexplained. Use XDamage notification activity
as the presentation check instead — it observes drawing directly, and it is
already the measurement the loaded test needs.


## The blank screen was duplicate kiosks, not an AZ fault

Hours of "AZ runs but does not paint" resolved to operator error, not a bug in
AZ, the launcher or the candidate.

`ps -eo pid,ppid` showed **two `start-pflx-kiosk` shells**, both orphaned to
PPID 1, each running its own mode. One had launched BiteDJ and the other AZ, so
two fullscreen applications were live at once with mixxx also holding the audio
device. The screen was not blank because AZ failed to render; it was showing a
contended compositor.

Cause: `systemctl restart pflx-session` was issued while a previous kiosk was
still alive. sway `exec`s the kiosk, so the old shell survived the unit restart
and was reparented to init rather than killed with the unit. Repeating that
during the A/B/A stacked more instances.

Hypotheses tested and refuted along the way, each requiring a restart that made
the situation worse: the `LAB_SHARE_IPC` launcher patch (reverted, still
blank), the controller bridge (blank with it confirmed running), the launch
path (blank via both SSH and kiosk), a stale X server (Xwayland was fresh),
the synthetic vsync clock (ticking), accumulated per-session state (survived a
reboot), and AZ's saved `SETTINGS.DAT` (reset, still blank).

Fix: stop everything, confirm zero survivors, then start one session. A reboot
achieves the same and is faster to trust. After a clean boot: one kiosk shell,
one menu, no stray mixxx, and a 51662-byte rendered capture.

### Consequences

- `grim` was accurate the whole time. 6791 bytes really was a blank frame.
- **The A/B/A ran while duplicate kiosks may already have existed.** Its arms
  were never captured, so whether they were presenting is still unknown, and
  the 14.4 / 10.6 / 14.6 %core figures remain unverified and unpromoted.
- Restarting AZ repeatedly outside the normal flow is not safe on this device
  without asserting a single kiosk first. Any future harness must check
  `ps -eo args | grep -c start-pflx-kiosk` equals one before recording numbers,
  and assert a non-blank frame per arm.

`SETTINGS.DAT` was reset during the search. The original is preserved at
`local/settings-backup-20260917T001006Z/SETTINGS.DAT`; restore it if any AZ
preference is missed.

## Loaded A/B/A: the MIT-SHM candidate does not help. Do not promote.

Run with the native load/play controls, not by hand. Each arm launches AZ
fresh, then drives the identical input sequence to the identical state: the
same two tracks (`Doctor_P_-_Tetris` F#m and `No Stress (Tokez VIP)` Em, both
140.0 BPM) from the same `Abstract-ALL` list position, both playing, on the
two-deck WAVEFORM page at default zoom, same mixer and same audio device.

Guards, added after the duplicate-kiosk incident, asserted per arm before any
number was recorded: exactly one kiosk shell, and a captured frame over
300 KB proving the two-deck WAVEFORM page was actually up. An earlier run of
this harness is discarded because that assertion did not exist: it used the
wrong control to return to the browser (`view` goes to SOURCE, `browse` opens
the browser), so deck 2 never loaded and it measured a near-static page at
16.4 %core.

| Arm | share_ipc | EP147 | mix-stream | machine | damage n | median | p95 | max | >25 ms | underruns |
|---|---|---|---|---|---|---|---|---|---|---|
| A1 | off | 44.7 | 8.0 | 83 | 2429 | 16.1 ms | 17.7 | 18.9 | 0 | 0 |
| B | **on** | **45.7** | 8.0 | 85 | 1778 | 16.9 ms | 17.8 | 19.2 | 0 | 0 |
| A2 | off | 44.9 | 8.0 | 83 | 2428 | 16.1 ms | 17.7 | 18.9 | 0 | 0 |

The controls agree (44.7, 44.9) and bracket the candidate at 45.7, which is
**slightly worse, not better**. `mix-stream` is identical across all arms. The
idle result of 14.4 / 10.6 / 14.6 %core recorded earlier does not reproduce
under load and should not be cited.

### MIT-SHM was genuinely engaged, verified

The candidate is not failing to switch on:

- EP147's IPC namespace equals the host's, and the live 4,096,000-byte frame
  segment shows **nattch 2** — the X server attached it.
- `libXext` `XShmGetEventBase` appears in the profile.
- **`ximage-fast24.so` disappears from the hot path entirely** (10.43% of
  main-thread self time when unshared, absent when shared), while EP147 itself
  rises to 84.70% of thread samples.

The sampled shim cost disappears without a measured total CPU reduction.
This does not identify which firmware/X-server functions replace that work;
function-level attribution remains necessary.

**Correction to the A/B/A table's own instrumentation:** it reported
`nattch=0` for arm B. That was a measurement bug. Sessions leak 4 MB segments,
so three existed; `awk` matched the first, an orphan at nattch 0, not the live
one at nattch 2. Segment *identity* matters, not just size.

### The load hitch, measured, and unaffected

Steady two-deck playback is clean: median 16.1-16.9 ms against a 16.88 ms
frame at 59.24 Hz, worst 18.9 ms, **zero gaps over 25 ms** in these notification
samples. Physical scanout jitter and audio fidelity are not measured here.

Loading a third track while another deck plays is where the cost is, and it is
far larger than the "one dropped frame" claimed earlier in this session:

| share_ipc | median | p95 | max | >25 ms | >40 ms | underruns | new cache files |
|---|---|---|---|---|---|---|---|
| off | 16.2 ms | 17.9 | **286.3 ms** | 18 | 11 | 0 | 0 |
| on | 16.8 ms | 18.0 | **403.7 ms** | 15 | 9 | 0 | 0 |

These are XDamage notification gaps, not counted dropped display frames. The
script also includes browser navigation and selection before LOAD, so the
largest gap has not yet been attributed to LOAD rather than a page transition.
No aplay underrun was reported. With shared IPC the worst gap was larger, though a single max is
noisy and the over-25/over-40 counts moved the other way, so the honest reading
is **no demonstrated improvement**, not proof of equivalence or a regression.

`cache files before=1 after=1` in both runs shows an unchanged file count in the
scanned location. That alone cannot exclude overwrites or activity elsewhere.
These runs do not establish a fresh-analysis workload.

### Verdict

`share_ipc` stays **opt-in and default false**. It is verified to work, and it
buys nothing measurable on CPU or on frame delivery under real two-deck use,
while weakening the isolation `--unshare-all` provides. The remaining
investigation target is the ~286 ms notification gap across navigation/load;
its exact event and blocking component remain unassigned.

Still outstanding: listening and visible-smoothness acceptance, which are the
user's to give and were not assessed here.

## Correction to the per-component baseline, 2026-09-19: AZ's Wi-Fi setting

While validating the X-server priority a fresh renderer baseline came in at
57 %core instead of the 44–45 measured all day. Cause: `settings/wifi.json`
in the lab state directory had acquired `"start": "true"` (the player's own
Wi-Fi switch, most likely toggled by automated navigation that landed on
the settings screen), and with it every session's `WifiSetting` thread
spawned `sh -c wpa_cli …` at ~180 forks/s (490 forks/s system-wide, load
average 4) because `wpa_supplicant` cannot start in the sandbox (no
`mlan0`). Switching the setting back to `false` returned a fresh session to
13 forks/s and the usual CPU. `pi/session.py` now forces the setting off at
every start (AZ's Wi-Fi is meaningless on the Pi; the host owns the radio).
Runs between ~23:06 and ~23:20 UTC on 2026-09-19 (the first
`xonly-validation` attempt) ran under this condition and were discarded.
If the renderer ever reads well above 45 %core with two decks playing,
check `xdjaz/state/settings/wifi.json` and the fork rate first.
