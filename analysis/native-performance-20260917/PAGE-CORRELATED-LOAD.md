# Page-correlated load diagnostic, 2026-09-17

This supersedes attributing the prior whole-window 286 ms XDamage maximum to
track loading. It does not establish a performance fix or physical scanout FPS.

## Valid run

Native Pi, packaged library session, share_ipc=false. The physical MIDI bridge
was paused during manual injection and resumed in finally. Before measuring,
the guarded native view reader required WAVEFORM and read-only LocalPlayer
source inspection found one-second position deltas [44032,44714,0,0]. This
establishes two advancing sources, unlike PNG byte-size heuristics.

Probe start and input-command timestamps share CLOCK_MONOTONIC. Native page
identity was sampled approximately every 10 ms; these observations are not an
atomic display/presentation trace. No screenshots were taken in this valid
measurement window.

| Event | Seconds from probe start |
|---|---:|
| Browse command begins | 3.8847 |
| Rotate selection command begins | 7.4512 |
| LOAD deck 1 command begins | 10.9667 |
| PLAY deck 1 command begins | 14.5537 |

Largest XDamage gap: **303.695 ms**, from 4.4658 to 4.7695 seconds, entirely on
BROWSE and more than six seconds before LOAD. Further 252.496 and 235.646 ms
gaps also occur in BROWSE before LOAD. A static or less frequently redrawn browser
need not emit updates at waveform cadence; these gaps do not establish stalls.

Near LOAD there was a 184.272 ms BROWSE-to-BROWSE notification interval and a
112.604 ms BROWSE-to-WAVEFORM interval. Their relationship to file loading versus
page construction remains unresolved. Across 1196 intervals whose intervening
page samples were all WAVEFORM, maximum gap was **61.669 ms**, one over 25 ms.
That smaller outlier remains a diagnostic target, not evidence of flawless output.

The session's audio-events log contained only audio_started: no reported aplay
underruns. This is not listening evidence. Final screenshot showed Pirates
(Tokez VIP) and No Stress (Tokez VIP), with waveforms and no file-error dialog.
Controller bridge was resumed and the AZ session was left running.

## Rejected runs and limitations

An earlier exploratory capture reproduced a 285.960 ms gap during browsing,
but lacked an explicit probe epoch. Two follow-ups are rejected as playback
benchmarks: the initial-navigation helper was reused from an invalid starting
state, producing a missing-file dialog in one and unloaded decks in another.
Neither contributes to the valid figures above. Fresh SOURCE plus moving-source
gates were added for the final run. No firmware/scheduling/DSP change was made.

Track-count-only cache checks are insufficient to prove no analysis activity.
This run does not claim fresh analysis. Raw JSON is private in the originating
workspace's local/codex-load-check-4 (events, damage, source-rates, summary).

## Reuse

analysis/probe-xdamage.py now emits start_monotonic. summarize_page_gaps.py
aligns that timestamp with events.json containing native page observations and
command begin timestamps. Its timestamp arithmetic passed a constructed
250 ms waveform-to-browser example; scripts compile and git diff --check passes.

Next: attribute the waveform-only outlier and page-construction transition using
matched navigation-only versus cached-load events, with verified advancing
sources. Do not optimize a browser's absence of redraws as if it were dropped
waveform frames, and do not rerun the rejected shared-IPC A/B/A.

## Steady-state capture, 2026-09-18: no outlier

`capture_waveform_gap.sh` on the pinned baseline, `share_ipc=false`, 60 s with
**no inputs sent**, both decks verified on the two-deck WAVEFORM page by eye
(`Doctor_P_-_Tetris` F#m, `No Stress (Tokez VIP)` Em) with EP147 at 44 %core
and one kiosk shell. The controller bridge was absent for this run, because
the tracks were loaded by the FIFO helpers; nothing was injected during the
window. All recorders shared CLOCK_MONOTONIC.

| Metric | Value |
|---|---|
| XDamage notifications | 4,991 |
| median / p95 / max interval | 15.80 / 17.88 / **20.58 ms** |
| intervals over 25 ms / 40 ms | **0 / 0** |
| page samples during window | WAVEFORM only (5,222 samples) |
| `read_bytes` delta | 0 |
| reported underruns | 0 |
| temperature / throttling | 59.5 °C / 0x0 |

Against a 16.88 ms frame at 59.24 Hz the worst interval is ~1.2 frames; no
interval reached two. **The 61.67 ms waveform-only outlier from the 2026-09-17
run did not reproduce in steady state**, and that run's window contained a
browse-and-load sequence, so the outlier is best treated as part of the load
transition rather than a playback stall.

In the largest ~20 ms intervals the main thread held the CPU for only about a
quarter of the window (5 of ~20 expected samples at 997 Hz) and otherwise sat
in `poll_schedule_timeout` (state S) or was preempted; no `block_rq_issue`
occurred anywhere in the 60 s. Over the window the main thread took 53,829
voluntary and 113,875 involuntary context switches (≈2,800/s). Its kernel
priority in the sched trace is 98, i.e. realtime priority 1, below the host
mixer (RR 8) and `aplay` (RR 10). Whether that preemption pattern matters for
the load transition is the next question; it does not produce a visible gap
in steady state.

Instrumentation note: the first attribution pass counted every sched_switch
that *named* `EP147` on the outgoing side, which also matches unnamed firmware
threads that inherit the process comm, and it widened each window by 10 ms.
It now matches `prev_pid` of the main thread inside the gap only.

## Load-spanning capture, 2026-09-18: the stall is renderer preemption

Separate run from the steady-state capture above, same pinned baseline,
`share_ipc=false`, fresh launch, `Doctor_P_-_Tetris` and `No Stress (Tokez
VIP)` playing on the two-deck WAVEFORM page (44 %core, one kiosk shell, frame
verified by eye). During the 60 s window the FIFO helpers issued `browse`
(−9.14 s), `rotate 3` (−4.55 s), **`LOAD deck 1` (t=0)** and `PLAY` (+6.59 s),
each stamped on CLOCK_MONOTONIC. Afterwards deck 1 showed `Pirates (Tokez VIP)`
Fm playing while deck 2 had kept playing throughout — so this measures a load
onto one deck with the other deck already playing. No bridge was present;
nothing else was injected. `attribute_load_span.py` splits every interval by
the page kinds sampled inside it.

| Bucket | n | max | >25 ms | >40 ms | where |
|---|---|---|---|---|---|
| BROWSE only | 395 | **287.5 ms** | 22 | 18 | all before LOAD (−8.4, −4.9, −4.0, −1.0, −0.5 s) |
| transition | 1 | 33.5 ms | 1 | 0 | +0.375 s, browse→waveform page construction |
| WAVEFORM only | 3048 | **53.7 ms** | 3 | 1 | **+0.582, +0.739, +0.980 s after LOAD** |
| unsampled | 1173 | — | — | — | no 10 ms page sample fell inside; excluded |

The browser gaps are idle, not stalls: across the 287 ms intervals the main
thread was on-CPU 12–14 of ~286 expected samples (~5%) and its switch-outs
were 52% `S` (sleeping) — a static list that is not repainting, as Codex
concluded. The load itself produced one 33.5 ms page-construction interval and
then a **cluster of 53.7 / 30.6 / 25.1 / 23.2 ms intervals within the first
second on the WAVEFORM page** — that is the hitch the user sees, ~3 frames at
its worst, while the other deck is playing. No reported underrun.

### What the renderer was doing in the 53.7 ms gap: nothing — it was preempted

Main thread switch-outs in that window: 110, of which **95 were `R`/`R+`
(runnable, preempted)**, 8 `S`, 7 `D`. It held the CPU for 5 of ~53 samples.
Who took it, from `sched_switch next_comm` (kernel prio in parentheses;
kernel 98 = RT 1, lower number = higher priority):

| took the CPU | times | thread | RT priority | ours? |
|---|---|---|---|---|
| `irq/111-1f00080000.i2c` | **38** | touchscreen I²C IRQ thread | 50 | kernel |
| `PageFiller0` | 24 | AZ load/page thread | 11 | firmware |
| `JUCE Timer` | 14 | firmware | 33 | firmware |
| `mix-stream` | 4 | host mixer | 8 | ours |
| `Xwayland` | 4 | X server | 1 | ours |
| `BufferingSched` | 3 | firmware | 44 | firmware |

Four `block_rq_issue` reads (512 KB, 1 MB readahead on `sda`, the USB) were
issued by `FileDataCache` in the same window — the new track being read — but
the main thread's own `read_bytes` stayed 0. The 30.6 ms gap is the same
pattern with `PageFiller0` first (53) and the IRQ thread second (29).

The same preemption happens in steady state (a 54 ms control window at +30 s
shows 177 switch-outs, IRQ thread 45×, Xwayland 40×) and produces no dropped
frame; the difference at load is `PageFiller0`, `BufferingSched` and
`FileDataCache` bursting at the same moment.

### Why it can starve: priority and affinity map (live session)

| thread | CPU mask | policy |
|---|---|---|
| **EP147 main (renderer)** | `3` (CPUs 0–1) | **RR 1 — lowest RT priority in the process** |
| FileDataCache ×5 | `3` | RR 1 |
| JUCE Timer | `3` | RR 33 |
| PageFiller0 | `b` (0,1,3) | RR 11 |
| BufferingSched | `b` | RR 44 |
| JUCE ALSA (audio callback) | `4` (CPU 2 alone) | RR 89 |
| `aplay` (ours) | `3` | RR 10 |
| `mix-stream` (ours) | — | RR 8 |
| `irq/111` I²C thread | ran on CPUs 0 and 1 in the window | RT 50 |

The renderer is confined to CPUs 0–1 at the lowest realtime priority, and
those two cores are shared with the ~6 kHz touchscreen IRQ thread at RT 50, the
firmware's load-time threads, and our own RT audio processes. The stock device
has six cores with X on its own core; the firmware's masks were not written
for four. The earlier "unexplained 6,000 interrupts/s on the I²C line" now has
a measured consequence: that IRQ thread is the single largest preemptor of the
renderer during the stall, and it is not part of AZ at all.

### Candidate, one knob, reversible

Move the I²C IRQ (`/proc/irq/111/smp_affinity`) off CPUs 0–1 onto CPU 3, where
only `PageFiller0`/`BufferingSched` occasionally run. Runtime-only, reverts on
reboot, SSH unaffected. Test as its own A/B/A with this exact load-span
harness, comparing the post-LOAD WAVEFORM cluster (max, >25 ms count) and the
steady-state distribution, with underrun logs. Not applied yet. Widening the
renderer's mask or touching firmware thread priorities is a separate, later
experiment.

**Limits:** XDamage intervals are notification gaps, not scanout; 1,173
intervals had no page sample and are excluded; one run, no repeats; listening
not assessed. `next_comm` attribution counts who ran on the same CPU after the
renderer was switched out, which is direct for `R`/`R+` preemption but says
nothing about the 15 wakeups or the `D` states.
