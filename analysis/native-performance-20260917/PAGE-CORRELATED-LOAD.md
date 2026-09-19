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

## One-knob A/B/A, 2026-09-18: irq 111 off the renderer's cores

Only change between arms: `/proc/irq/111/smp_affinity` = `3` (CPUs 0–1, the
PiFLX default) versus `8` (CPU 3). Everything else as the load-spanning run
above: fresh launch per arm, the same two tracks verified playing on the
WAVEFORM page (44 %core, one kiosk shell, frame checked), `LOAD deck 1` at
~12 s with deck 2 playing, `share_ipc=false`. Affinity was restored to `3` on
every exit path and confirmed afterwards. Per-CPU interrupt counters prove
the move took effect: ~920k hits on CPU 0 in the control arms, ~907k on CPU 3
and **zero** on CPU 0 in arm B.

| Arm | irq 111 on | worst post-LOAD WAVEFORM gap | >25 ms | >40 ms | renderer preempted by irq/111 in the 1.5 s after LOAD | underruns |
|---|---|---|---|---|---|---|
| A1 | CPUs 0–1 | **72.0 ms** (+0.555 s) | 3 | 1 | 564× | 0 |
| B | CPU 3 | **42.4 ms** (+0.531 s) | 2 | 1 | **0×** | 0 |
| A2 | CPUs 0–1 | **51.1 ms** (+0.553 s) | 3 | 1 | 455× | 0 |
| (earlier run) | CPUs 0–1 | 53.7 ms (+0.582 s) | 3 | 1 | 38× in the 54 ms gap | 0 |

Mechanism confirmed: with the IRQ on CPU 3 the touchscreen thread never
preempts the renderer again, and the largest post-load gap fell below the
whole control range (51–72 ms → 42 ms) with one fewer interval over 25 ms.
Temperatures 59–60 °C throughout.

What it does **not** do: the dominant preemptor in every arm is the
firmware's own `PageFiller0` (RR 11; 660–777 switch-ins during the 1.5 s
after LOAD), followed by `Xwayland`, `BufferingSched` (RR 44) and `JUCE
Timer` (RR 33); in arm B `mix-stream` (ours, RR 8) moved up the list. Those
share the renderer's two cores and outrank its RR 1, so the ~40 ms residue
remains. The knob removes one contributor; it does not fix the load.

### Verdict

Direction consistent on every metric, magnitude ~10–30 ms off the worst gap,
**one B trial** against a control spread of 51–72 ms. That is a promising
candidate, not repeated-trial proof, and is **not applied**: the affinity is
back to `3`. Before promoting: B/A/B repeats with the same harness, a check
that touch input latency is unaffected with the IRQ on CPU 3, and a look at
whether `pflx-tune`/`BACKGROUND_CPUS=0,1` should own this setting so it
survives reboot and applies to BiteDJ consistently.

Next candidate, separate experiment: relieve the renderer of `PageFiller0`
and our RT audio processes — either widen the renderer's mask to include CPU 3
or move `mix-stream`/`aplay` off CPUs 0–1 — one knob at a time, with recovery.
Firmware thread priorities stay untouched.

Housekeeping: each session leaves a `/run/user/1000/az-display-clock-*` and a
`/tmp/az-live-mixer-*` directory behind; the launcher should remove its own on
exit. Dead-session leftovers were cleaned by hand after this run.

## One-knob A/B/A, 2026-09-18: our RT audio processes off the renderer's cores

Only change: `mix-stream` (RR 8) and `aplay` (RR 10) pinned to CPU 3 (mask
`8`) in arm B versus their default mask `3` (CPUs 0–1). irq 111 stayed at `3`.
Same harness and gates as above; the pin was applied to each arm's fresh
processes before the window and verified after.

| Arm | audio on | worst post-LOAD WAVEFORM gap | >25 ms | >40 ms | renderer preempted by `mix-stream` in the 1.5 s after LOAD | underruns |
|---|---|---|---|---|---|---|
| A1 | CPUs 0–1 | 59.5 ms (+0.551 s) | 6 | 1 | 264× | 0 |
| B | CPU 3 | **69.9 ms** (+0.548 s) | 1 | 1 | **0×** (gone from the list) | 0 |
| A2 | CPUs 0–1 | 50.0 ms (+0.533 s) | 3 | 1 | 270× | 0 |

**No benefit.** The mechanism worked — our mixer no longer preempts the
renderer — and the worst gap did not move (69.9 inside a control spread of
50–72 ms across all runs today). The >25 ms count fell, but it varies 3–6
between control arms, so it is not evidence. Zero underruns with the audio
processes on CPU 3.

Across all seven load-span arms today the worst post-LOAD gap always sits at
+0.53…+0.58 s and always shows the same shape: renderer runnable-but-preempted
for ~90% of the window, `PageFiller0` first (600–780 switch-ins per 1.5 s),
then `Xwayland`, `BufferingSched`, `JUCE Timer`. Removing the IRQ thread or our
audio changes who is second; it does not change who is first.

### Where this leaves the load hitch

The floor (~40–50 ms) is set by the firmware's own load-time threads
outranking its own renderer on the two cores the firmware confines it to.
The remaining levers touch firmware-chosen scheduling and are a separate
decision, not a launcher tweak: widen the renderer's affinity to CPU 3, or
raise its RR priority above `PageFiller0`'s 11. Both are runtime-only via
`taskset`/`chrt` on the live thread, reversible, and testable with this
harness — but they change how Pioneer's threads share the machine, so they
should be tried one at a time with the exit gesture and SSH confirmed first.
Not attempted today.

Everything was restored: irq `3`, audio masks `3`, kiosk files, a normal
bridge session left running.

## One-knob A/B/A, 2026-09-18: renderer raised above `PageFiller0`

Only change: the EP147 main thread set to **RR 12** (arm B) versus the
firmware's RR 1, via `chrt` on the live thread right after launch; `PageFiller0`
is RR 11, so in arm B the renderer outranks it. Audio untouched (JUCE ALSA is
RR 89 on CPU 2). Same harness and gates; priority verified per arm and back to
1 afterwards.

| Arm | renderer | worst post-LOAD WAVEFORM gap | >25 ms | >40 ms | `PageFiller0` preempting renderer, 1.5 s after LOAD | underruns |
|---|---|---|---|---|---|---|
| A1 | RR 1 | 39.0 ms (+0.553 s) | 2 | 0 | 627× | **1** |
| B | **RR 12** | **59.1 ms** (+0.514 s) | 5 | 1 | **0×** | 0 |
| A2 | RR 1 | 49.9 ms (+0.561 s) | 3 | 2 | 606× | 0 |

**The diagnosis was half right.** Outranking `PageFiller0` removes it from the
renderer's preemptors completely — and the gap does not shrink. In arm B's
worst window the renderer's switch-outs shifted from `R`/`R+` toward `S` and
`D` (10 `S`, 1 `D` of 46): it was no longer being starved, it was **waiting**.
What ran after it was `Xwayland` (RT 1, which cannot preempt RR 12), i.e. the
renderer *yielded*. So during the first ~0.55 s after LOAD the renderer
synchronously depends on the load work — a lock, condition or queue owned by
the loader — and giving it CPU priority only makes it wait with more priority.

Scheduling is therefore **not the root cause** of the load hitch. Three
scheduling knobs were tested individually today (irq 111 affinity, our audio
processes' affinity, renderer priority); each removed its target from the
preemptor list as intended, and none moved the worst gap out of the 39–72 ms
range seen across all ten load-span arms. The dependency sits inside the
firmware's load path and is a reversal question: what does the renderer block
on between LOAD and ~+0.6 s, and can the page be presented before that work
completes.

Arm A1 logged the only `aplay` underrun of the day, at the firmware's default
priority. Single event, ~40 s of playback each side, cause not established;
noted rather than interpreted.

Everything restored: renderer RR 1, irq `3`, audio masks `3`, kiosk files, a
normal bridge session left running.
