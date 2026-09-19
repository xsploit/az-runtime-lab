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
(To be precise about timing: the ~40–70 ms gap *occurs* about 0.55 s after
LOAD; nothing freezes for 0.55 s.)

### What it waits on — from the blocked stacks and wake-up sources

`sched.data` was recorded with call chains, so the kernel stack at each
switch-out and the waker's stack at each `sched_wakeup` are available. Two
`perf script` passes (`trace` text and `ip,sym` stacks — `trace` cannot be
combined with `ip` in one pass) merged on timestamp+event:

| | arm B, RR 12, 59.1 ms window | control A2, RR 1, 49.9 ms window |
|---|---|---|
| renderer switch-outs | 46: 25 `R`, 10 `R+`, 10 `S`, 1 `D` | 134: 94 `R`, 24 `R+`, 10 `S`, 6 `D` |
| preempted by | (higher-RT only) | `PageFiller0` 73, `BufferingSched` 24, `JUCE Timer` 8, `mix-stream` 6 |
| blocked stacks (`S`/`D`) | **9× `poll_schedule_timeout ← do_sys_poll`**, 1× `futex_wait`, 1× `poll_freewait` rtlock | **9× `poll_schedule_timeout ← do_sys_poll`**, 6× `poll_freewait` rtlock, 1× `futex_wait` |
| wakers of the renderer | **5× `sock_def_readable ← unix_stream_sendmsg`**, **4× `unix_write_space ← sock_wfree`**, 1× `futex_wake` | **12× `unix_write_space ← sock_wfree`** (6 direct, 6 via `rt_mutex_slowunlock`), 3× `sock_def_readable`, 1× `futex_wake` |

Every blocked wait but one is `poll()` on a Unix-domain socket, and the wakers
are that socket becoming **readable** (the peer wrote a reply/event) or,
more often, regaining **write space** (the peer drained the renderer's
outgoing bytes). The renderer's only Unix socket of consequence is its X
connection. So in the gap the renderer is **blocked on the X transport to
Xwayland** — its request stream (uploads and the surrounding protocol) backs
up until the server consumes it, and it waits for replies. Xwayland runs at
RT 1 on the same two cores and is itself preempted by the load-burst threads,
which is why raising only the renderer moved the choke point rather than
removing it. The single `futex` wait/wake per window is a mutex handoff and
is not the dominant term.

This is evidence for "the renderer waits on the X server during the load
burst"; it is **not** evidence of a lock or queue owned by the loader — an
earlier revision of this section asserted that without the stacks, and it was
wrong. It is also not yet proof of *what* Xwayland was doing in those
milliseconds; that needs the same treatment applied to Xwayland's thread.

Scheduling of the *renderer alone* is therefore not the lever. That does not rule out scheduling: a renderer blocked on an X server that is itself starved of CPU is still a scheduling problem, one hop away — which is what the joint renderer+Xwayland test must establish. Three
knobs were tested individually today (irq 111 affinity, our audio processes'
affinity, renderer priority); each removed its target from the preemptor list
as intended, and none moved the worst gap out of the 39–72 ms range seen
across all ten load-span arms. What remains is the renderer ↔ Xwayland link
during the load burst: the renderer waits for X to drain and reply while X is
starved by the same threads. That points back at the audit's first item — the
compositor path (bare Xorg, or at minimum scheduling the X server together
with the renderer) — and at the firmware question of whether the page-fill
work can be deferred so the current waveform keeps drawing. Both remain
untested; the steady-playback build is untouched.

Arm A1 logged the only `aplay` underrun of the day, at the firmware's default
priority. Single event, ~40 s of playback each side, cause not established;
noted rather than interpreted.

Everything restored: renderer RR 1, irq `3`, audio masks `3`, kiosk files, a
normal bridge session left running.

### Quantified: the gap is blocked time, not preemption

Reconstructing the renderer's state through each worst window from its own
switch-outs (`prev_pid`) and switch-ins (`next_pid`), which the filter
recorded on both sides:

| window | running | blocked (`S`/`D`) | runnable / preempted |
|---|---|---|---|
| arm B, renderer RR 12, 59.1 ms | 4.3 ms (7%) | **54.5 ms (92%)** | 0.2 ms (0%) |
| control A2, renderer RR 1, 49.9 ms | 5.9 ms (12%) | **41.4 ms (83%)** | 2.5 ms (5%) |

The earlier sections counted switch-*outs*, and by count the control arm was
dominated by preemption (118 of 134). By *time* it is not: preemption cost
2.5 ms of a 49.9 ms gap. The renderer spends 83–92% of the gap blocked, at
either priority — which is why three scheduling changes to the renderer's
side moved nothing. "Blocked" here runs from a `S`/`D` switch-out to the next
switch-in and so includes wake-to-run latency; at RR 12 that latency is
negligible and the figure is still 92%, so the waiting is real.

### What is proven and what is not

- **Proven:** the renderer blocks in `poll()` on a Unix *stream* socket and is
  woken by that socket regaining write space or becoming readable.
- **Circumstantial, not proven:** that the socket is the X connection to
  Xwayland. Neither `ss` nor `lsof` is installed on the Pi and
  `/proc/net/unix` names only bound endpoints, so the peer inode could not be
  matched. The renderer's only external stream socket is the bind-mounted
  `/tmp/.X11-unix/X0` (its mixer control socket is datagram), which is why it
  is the leading explanation. To prove it: install `iproute2` (`ss -xe`) or
  `lsof`, or attribute the blocking `poll`/`write` to an fd with `strace -f
  -e trace=poll,write,writev -p MAIN` for a few seconds across a load, then
  `readlink /proc/MAIN/fd/N`.
- **Not recorded:** Xwayland's own scheduling. The capture filtered
  `sched_switch` to `prev_pid==MAIN || next_pid==MAIN`; `-a` does not lift
  that filter, so Xwayland's switches appear only when the renderer was the
  other party. A joint capture needs the filter widened to both PIDs.

### Next experiment

1. Prove the peer (above), and in the same capture widen the `sched_switch`
   filter to the renderer **and** Xwayland so Xwayland's blocked stacks and
   wakers are available for the same window.
2. **Schedule the renderer and Xwayland together** — same RR priority above
   `PageFiller0`, or both given CPU 3 — as one A/B/A with this harness. If the
   renderer's blocked share drops, the X server was the starved link.
3. Bare Xorg stays a **separate** experiment (audit item 1).
Keep the steady-playback build and all scheduling defaults as they are now.

### Socket attribution via strace (steady state, 6 s attach)

`strace -f -tt -e trace=poll,ppoll,write,writev,sendmsg -p MAIN` for 6 s on
the live session, then `readlink /proc/MAIN/fd/N`:

- The main thread's `poll()` covers exactly two fds every iteration, 1,198
  iterations in 6 s (~200 Hz): **fd 4 = `socket:[114354]`**, whose partner
  fd 3 = `socket:[114353]` is the adjacent inode — an internal socketpair used
  as a wakeup channel — and **fd 20 = `socket:[115999]`**.
- Xwayland's fd table holds `socket:[116000]`, the inode immediately after
  115999. Unix stream connections allocate their two endpoint inodes
  consecutively, so fd 20 ↔ Xwayland's accepted socket. fd 20 is also the only
  external stream socket the renderer polls; the mixer control socket is
  datagram and the audio path is a FIFO (fd 18, `/tmp/az-decks.fifo`, written
  by another thread at 1.63 MB/s — exactly 10 ch × 4 B × 44.1 kHz).
- Working identification, **not proof**: adjacent inode numbers do not
  establish that two sockets are peers, and a trace taken later does not
  identify the fd involved in an earlier capture. `ss -xe` (installed after
  this) reports `peer 0` for both ends because the renderer's socket lives in
  its `--unshare-net` namespace. The test that settles it is dynamic: sample
  both sockets' Recv-Q/Send-Q across a real load and look for lockstep.
- Gap in the trace: no `write`/`writev`/`sendmsg` from the main thread in 6 s
  of scrolling playback, so the image uploads leave through a syscall not in
  the set (`send`/`sendto` are the likely ones). Add them before using strace
  to size the upload stream.

The firmware also logs `HuiProcessor::epoll_wait() failed` repeatedly on a
side thread; unrelated to the renderer's wait, noted only.

## Instrumentation arm, 2026-09-18/19: what the wait is, on both ends

One load-span run with three extra recorders attached (so **not a benchmark**:
`strace` alone shows up as a CPU consumer and the worst gap was 133 ms). The
`sched_switch`/`sched_wakeup` filters included Xwayland (`extra_pid` in
`meta.txt`); an strace of the renderer with `send/sendto/recv*` in the set;
a queue sampler on both sockets. The Pi was later rebooted by its hardware
watchdog when the first analysis pass loaded a 918 MB stack file into RAM;
the analysis now streams. Results:

- **The X socket was fd 18 in this launch** (fd 20 in the earlier one). fd
  numbers are per-launch; the earlier strace attribution to "fd 20" was only
  valid for its own session, as the review said. The X fd is now derived from
  the trace: the fd the main thread polls that also carries its outbound
  bytes — **237.7 MB out in 45 s** through it, so the uploads are visible once
  `send`/`sendto` are traced.
- **Write backpressure, not readability.** Over the whole trace the main
  thread polled that fd 6,813 times, requesting `POLLIN|POLLOUT` 6,424 times
  and plain `POLLIN` 389 times; revents were `POLLOUT` 2,642 and *nothing*
  4,171 (timed-out waits). xcb only asks for `POLLOUT` when it has bytes it
  could not write. This is the syscall-level counterpart of the
  `unix_write_space` wakeups: the renderer is mostly waiting for Xwayland to
  drain its request stream. (Whole-trace figures; strace wall-clock stamps
  were not aligned to the gap window.)
- **Xwayland in the worst gap: preempted, not idle.** 29 switch-outs, 22 of
  them `R`/`R+`, the CPU going to `irq/111` (6), `strace` (4), `ktimers`,
  `kworker/u16`, `sway` (3). Six were idle `epoll_wait` and **one was a `D`
  wait in `rpi_firmware_property ← clk_prepare`** — a VC4 firmware-mailbox
  round trip on the X server's path. One occurrence; noted as a candidate
  latency source on this SoC, not a finding.
- **Queue lockstep test failed to sample:** the sampler forked python three
  times per sample and produced one sample inside the gap. Rewritten
  fork-free; the peer proof still has to be re-run.

Taken together with the earlier blocked-time reconstruction: the renderer
spends the gap waiting for write space on its connection to an X server that
is itself runnable-but-preempted on the same two cores. That is scheduling
one hop away — the review's point — and the joint renderer+Xwayland A/B/A is
the direct test. Whether the socket is Xwayland's is still inferred; the
lockstep run is the proof.

## Joint A/B/A, 2026-09-19: renderer **and** Xwayland at RR 12

Only change in arm B: both the EP147 main thread and Xwayland set to RR 12
via `chrt` on the live processes as each arm's fresh instances appeared
(`tools/scheduling-aba.sh joint`); A arms at their defaults (renderer RR 1,
Xwayland normal policy). Same harness and gates. Two limits of this run: the
capture in these arms did **not** include Xwayland in the sched filters (my
script passed a no-op variable instead of `EXTRA_PID`), and the arm report
did not echo Xwayland's priority, so its application is inferred from the
hook's design, not printed proof.

| Arm | worst post-LOAD gap | >25 ms | >40 ms | next largest | renderer in worst gap: running / blocked / preempted | underruns |
|---|---|---|---|---|---|---|
| A1 | 58.9 ms (+0.550 s) | 4 | 1 | 35.1, 30.0 | 7% / **90%** / 3% | 0 |
| B | 56.1 ms (+0.531 s) | **1** | 1 | 21.1, 20.9 | 18% / **80%** / 1% | 1 |
| A2 | 60.5 ms (+0.581 s) | 4 | 1 | 31.5, 29.8 | 7% / **89%** / 4% | 1 |

Prioritising the pair gives the renderer more CPU (running 7% → 18%) and
removes the secondary >25 ms intervals (4 → 1), but the ~56–60 ms gap at
+0.55 s is unchanged and the renderer is still blocked for 80% of it. So
Xwayland's CPU share was part of the residue, not the core of it: with both
ends outranking the load-burst threads, the renderer still waits on an X
server that still is not draining. In the instrumentation arm Xwayland's own
blocked states were idle `epoll_wait` — waiting on **sway** over its Wayland
connection — and one `D` wait in `rpi_firmware_property ← clk_prepare`.
The compositor is the next hop, and neither it nor DRM was in this test.

Single underruns appeared in two arms (one each, in B and A2). Cause not
established; three so far in the session, all single events, at both
priorities.

**Verdict:** not promoted. Scheduling the renderer+X pair is a partial
lever (secondary cluster), not the fix. Next: (1) the peer/lockstep proof
with the fork-free sampler and **no strace**, filters widened to Xwayland
**and sway**, so the wait can be followed one more hop; (2) then bare Xorg
as its own experiment, since it removes the sway hop entirely. All settings
restored to defaults; a normal bridge session is running.

## Clean instrumentation arm, 2026-09-19: the peer is proven, and X is starved

Same load-span harness, **no strace**, `sched_switch`/`sched_wakeup` filters
covering the renderer, Xwayland **and sway**, fork-free queue sampler. Worst
post-LOAD WAVEFORM gap **58.3 ms at +0.571 s** — the twelfth run in a row to
land in 39–72 ms at +0.53…0.58 s.

**Who wakes the renderer inside the gap** (`sched_wakeup` records the waker;
`perf script -F comm,pid,…`): **Xwayland, pid 8624, 12 times**, from
`unix_write_space` (6) and its rt-lock form `rt_mutex_slowunlock` (6) — the
X server freeing the renderer's send buffer. Two more wakeups came from AZ's
own threads via `futex_wake`. That is direct evidence, independent of inode
numbers or a later strace: the socket the renderer blocks on is its
connection to Xwayland, and the wait is write backpressure.

**What Xwayland is doing at that moment:** 235 switch-outs in the 58 ms
window, **232 of them `R`/`R+` — runnable, preempted** — and it gave the CPU
to `FileDataCache` (55), `PageFiller0` (50), `TrackFileCache` (35),
`PageFiller(BG)` (27), `irq/111` (21). Only 2 `S` (`epoll_wait`) and 1 `D`.
Xwayland runs at normal CFS policy; the firmware's load threads are realtime
(`FileDataCache` RR 1, `PageFiller0` RR 11) and always win. **sway is not in
the chain**: 6 switch-outs, mostly idle in `epoll_wait`.

So the load hitch is: renderer → blocked on write space → Xwayland → starved
of CPU by the firmware's own realtime load burst on the same two cores. This
is scheduling one hop away, as the review predicted.

**Consequence for the joint A/B/A above:** its null result is not yet
trustworthy. Those arms never printed Xwayland's priority and did not record
Xwayland's switches, so whether Xwayland actually ran at RR 12 is unknown.
The corrected run must print both priorities and keep Xwayland and sway in
the filters.

**Queue sampler:** 606 samples at ~13/s, all `0 0` on both sides, none inside
the gap. Two `sudo nsenter ss` invocations per sample cost ~75 ms; and fd 20
was assumed to be the X socket, which the previous launch showed is not
stable. The waker evidence supersedes it; the sampler is retired.

## Corrected joint A/B/A, 2026-09-19 — and a second harness fault

Priorities were printed this time: arm B renderer 12, Xwayland 12.

| Arm | worst post-LOAD gap | >25 ms | >40 ms | renderer running / blocked / preempted |
|---|---|---|---|---|
| A1 | 32.4 ms (+0.529 s) | 6 | 0 | 15% / 83% / 2% |
| B | 33.5 ms (+0.548 s) | **1** | 0 | 20% / 79% / 1% |
| A2 | 50.6 ms (+0.535 s) | 7 | 1 | 9% / 88% / 2% |

Same shape as the first joint run: the secondary cluster collapses (6→1→7,
earlier 4→1→4), the primary gap at +0.53–0.55 s does not move. In arm B all
13 of the renderer's blocked switch-outs in that gap were `S` in
`poll_schedule_timeout ← do_sys_poll` — waiting on the socket, no `D`.

**But the Xwayland in the sched filters was stale.** The previous session's
Xwayland lingers ~50 s after its `session.py` is killed; `pgrep -x Xwayland |
head -1` returned it for the filter (0 switch-outs recorded for that PID) and
for the "applied" line. The priority hook sets every PID it sees, so the live
Xwayland was very likely at RR 12 as well — but its own states in the gap are
unrecorded and its priority unprinted, so **this run does not yet prove
whether a prioritised X server still fails to drain**. Harness fixed: the
relaunch now waits for the old Xwayland to exit, the filter and hook use the
newest PID, and the arm prints the live PID's priority.

## Joint A/B/A, third run, 2026-09-19 — verified, and the chain closes

The stale-Xwayland fault fixed: each arm waits for the previous session's X
server to exit, uses the newest PID for both the priority hook and the sched
filter, and prints the live PID's priority. Arm B: renderer RR 12, Xwayland
pid 26134 RR 12, one Xwayland alive, same PID in the filter.

| Arm | worst post-LOAD gap | >25 ms | >40 ms | renderer running / blocked / preempted | Xwayland switch-outs in the gap |
|---|---|---|---|---|---|
| A1 | 45.8 ms (+0.817 s) | 7 | 1 | 13% / 81% / 7% | **279, all `R`/`R+`** — to `PageFiller0` 130, `FileDataCache` 37, `TrackFileCache` 25, `irq/111` 19, `BufferingSched` 15 |
| B | 36.0 ms (+0.585 s) | **2** | 0 | 17% / 82% / 1% | **42: `R`/`R+` 25, `S` 10, `D` 7** — to `irq/111` 9, `SendManager`, `sway`, `HuiProcessor` |
| A2 | 40.2 ms (+0.587 s) | 5 | 1 | 2% / 98% / 0% | **147, all `R`/`R+`** — to `PageFiller0` 54, `FileDataCache` 23, `TrackFileCache` 16, `irq/111` 10 |

Three joint runs now agree: prioritising the pair removes the secondary
cluster every time (4→1→4, 6→1→7, 7→2→5) and leaves the primary gap inside
the run-to-run spread.

### What the X server is doing once it is no longer starved

At default priority Xwayland is runnable-but-preempted for the entire gap by
the firmware's realtime load threads — the scheduling hop, confirmed with the
live PID. At RR 12 those preemptors are gone and its remaining waits are:

| Xwayland blocked stack (arm B gap) | n |
|---|---|
| `do_epoll_wait` (idle, waiting for a client/compositor event) | 9 `S` |
| **`usleep_range ← v3d_mmu_flush_all_locked ← v3d_mmu_insert_ptes ← v3d_bo_create_finish ← v3d_create_bo_ioctl`** | 3 `D` |
| `rt_spin_lock` inside `do_epoll_wait` | 2 `D` |
| `dma_fence_default_wait ← drm_gem_dma_resv_wait ← v3d_wait_bo_ioctl` | 1 `S` |
| `rt_spin_lock ← folio_lruvec_lock_irqsave ← folio_add_lru` (page allocation) | 1 `D` |

Its wakers in the gap: **EP147 6×** via `sock_def_readable ← unix_stream_sendmsg`
(the renderer's requests arriving), sway 4×, `irq/163-v3d_core` 1× (a GPU job
completing), timers. And the renderer's wakers: **Xwayland 6× via
`unix_write_space ← sock_wfree`** — the same socket, the same backpressure.

The V3D buffer-object creation is **load-specific**: binning Xwayland's
blocked switch-outs by second relative to LOAD, `v3d_create_bo_ioctl` appears
5 times in the [0,1) s bin and nowhere else in the 60 s; GPU fence waits show
5 in that bin, 3 at PLAY (+7 s), and 1–2 scattered. The page change makes the
X server allocate fresh GPU buffers (glamor pixmaps) and sleep on the V3D MMU
flush while doing it.

### The chain, with evidence at every link

renderer `poll()` for write space → its X socket → Xwayland, which at default
priority is **preempted by `PageFiller0`/`FileDataCache`/`TrackFileCache`**
(scheduling, one hop away) and, once prioritised, is **allocating V3D GPU
buffers and waiting on GPU fences** for the new page. The stock device has
neither hop: bare Xorg with EXA on the display, no compositor, no GL.

### What follows

- Joint priority is a real partial lever (secondary cluster) with a known
  trade-off (Xwayland at RR 12 competes with audio processes); it stays
  unapplied pending a touch-latency and long-session check.
- The primary residual is the X server's GPU buffer path, not CPU. The
  experiment that targets it is an X server without glamor/V3D on the
  presentation path: bare Xorg (`modesetting`, or `fbdev`-class accel off) —
  requires packages the user has not approved — or, if this Xwayland build
  exposes a glamor-off switch, that first, since it needs no packages.
- Three `D` waits in `folio_add_lru`/rtlock are page-allocation contention on
  the PREEMPT_RT kernel; noted, not pursued.

## Glamor-off A/B/A, 2026-09-19: Xwayland without V3D buffers, default priorities

`xwayland_glamor=off` (Xwayland 24.1.6 `-glamor off`, software rendering, no
V3D buffer objects on the presentation path) against the default config, all
scheduling defaults, three fresh sessions via the kiosk loop, cached-track
load inside the 60 s window. Arm B's X server was verified from its command
line (`-glamor off`); the A arms ran the default one. Captures:
`local/load-span-20260919T1006*`–`1013*` on the Pi.

| arm | Xwayland | n | max ms | >25 ms | >40 ms | primary gap (t after LOAD) |
|-----|----------|---|--------|--------|--------|----------------------------|
| A1  | default  | 3052 | 68.6 | 4 | 1 | 68.6 ms @ +0.519 s |
| B   | -glamor off | 3081 | 55.7 | 5 | 1 | 55.7 ms @ +0.554 s |
| A2  | default  | 3065 | 29.5 | 3 | 0 | 29.5 ms @ +0.630 s |

The primary +0.5–0.6 s gap is present in all three arms and arm B sits
inside the A-arm spread (the two A arms differ by 39 ms between themselves).
Underruns: A1 1, B 0, A2 0. No effect attributable to glamor at default
priorities. This does not yet answer the narrower question — the V3D waits
were observed only once X was *prioritised* — which the `jointnoglamor`
knob below tests with joint RR 12 in every arm.

Three faults preceded this run, in sequence. First the launcher patch
itself: the Pi copy had the Xwayland `Popen` outside its `with` block
(HANDOFF-20260918.md), which broke every launch until it was re-indented.
Then, with the launcher fixed, an `aplay` orphaned mid-launch (still opening the FIFO, `wchan
wait_for_partner`, reparented to PID 1) held the FLX6 PCM so every session
died with "audio open error: Device or resource busy"; after that, `/tmp`
(2 GB tmpfs) was full — perf script dumps of my own plus fourteen leaked
`/tmp/az-scroll-*` dirs (the 56 MB patched executable; the launcher dies in
place on SIGTERM and never reaches its `finally`) — so `az_scroll_overlay`
hit ENOSPC. Both are now guarded in `pi/session.py` (stale-overlay sweep
when no player is alive; children registered with stop signals blocked; the
aplay error text surfaces in the exception) and the launcher unwinds on
SIGTERM.

## Glamor-off on the prioritised baseline (`jointnoglamor`), 2026-09-19

Same protocol, but EP147 main **and** Xwayland at RR 12 in every arm (the
condition under which X's residual waits were V3D buffer creation and GPU
fence waits); arm B additionally `-glamor off`. All three X command lines
verified. Captures `local/load-span-20260919T1016*`–`1024*`.

| arm | Xwayland | n | max ms | >25 ms | >40 ms | primary gap (t after LOAD) |
|-----|----------|---|--------|--------|--------|----------------------------|
| A1  | RR 12, default | 2959 | 29.6 | 2 | 0 | 29.6 ms @ +0.378 s |
| B   | RR 12, -glamor off | 2873 | 38.6 | 2 | 0 | 38.6 ms @ +0.536 s |
| A2  | RR 12, default | 2963 | 23.1 | 0 | 0 | 23.1 ms @ +0.891 s |

Glamor off is the worst of the three arms; across six arms in two runs it
showed no consistent benefit, so it is a poor candidate to enable and
`xwayland_glamor` stays an opt-in key at `null`. That is all these runs
show: they do not prove the GPU waits seen in the prioritised X server are
irrelevant to the gap, only that taking the V3D path out of Xwayland did not
move it in three loads.

The prioritised A arms are consistent with the earlier joint runs: over
six arms at RR 12 across three runs the >25 ms count on load is 0–2 per arm
versus 3–7 at defaults, and A2 here is the first capture with no gap over
25 ms across the load. That is promising, not validated: every arm is one
load in one fresh session, and A1 logged 2 underruns at session start
(Xwayland at RR 12 competes with the audio processes) with no matched
count for normal startups yet. Before it can change a default it needs
repeated loads per arm inside one session, a startup-underrun comparison
against defaults, and a touch-response measurement.

Housekeeping verified in the same runs: with the launcher unwinding on
SIGTERM, `/tmp/az-scroll-*` held exactly one directory (the live session's)
across four session stops, and no `aplay` survived a stop.

## Joint priority over repeated loads, 2026-09-19 (validation, not one load)

`tools/multi-load-capture.sh` (`CAPTURE=` on `scheduling-aba.sh joint`,
`LOADS=6`): one fresh session per arm, two decks playing, then six
browse → rotate 1 → LOAD deck 1 → PLAY cycles 18 s apart, damage and page
samplers only. Priorities re-asserted every 0.5 s for the whole arm and
verified after it (an earlier attempt lost the race with the firmware's own
`sched_setscheduler` on its main thread and was discarded). Per-load figures
are waveform-page XDamage gaps in the 2.5 s after the page returns to the
waveform; the browser→waveform switch is reported separately as latency.
Captures `local/multi-load-20260919T1046*`–`1056*`.

| arm | priorities | per-load >25 ms (sum of 6) | per-load max | whole-capture >25 / >40 | browse→browser | LOAD→waveform | underruns |
|-----|-----------|---|---|---|---|---|---|
| A1 | defaults | 10 | 58.0 ms | 14 / 2 | 237–262 ms | 355–419 ms | 0 |
| B  | EP147 main + Xwayland RR 12 | 5 | 62.8 ms | 10 / 1 | 226–279 ms | 360–392 ms | 0 |
| A2 | defaults | 8 | 55.6 ms | 12 / 2 | 225–271 ms | 382–423 ms | 0 |
| (A, earlier, discarded run's valid default arm) | defaults | 10 | 58.0 ms | 14 / 1 | 218–286 ms | 361–412 ms | 0 |

Per load, arm B had 0–1 intervals over 25 ms on every load; the default
arms had 1–5. That is the same direction as the four single-load runs, now
over six loads each: joint priority roughly halves the number of long
damage intervals across a load. It does **not** remove the largest per-load
spike: load 5 hit 55–63 ms in every arm (same track in the same position
each arm, which suggests track-related work without showing its cause),
and load 3 was 48–56 ms in both default arms and 24.8 ms in B. Page-response
latencies (browser opening, waveform returning after LOAD) are unchanged
within run-to-run spread. No underruns in any arm (sessions of ~4 min with
six loads); the earlier "2 underruns" on a joint arm were at 161 s, during
the harness's post-capture `perf script`, and no session in either
condition has had one in its first 30 s.

Status: joint priority is a consistent, modest lever (fewer secondary gaps),
still not a default. Missing: a long session (the 4-minute arms say nothing
about an hour), a real touch measurement (Ilitek `11-0041 ili_v3`, evdev
timestamps against page changes, needs a person tapping), and the
track-dependent primary spike, which priority does not touch and which the
bare-Xorg arm below is the next test for.

## Bare Xorg arm, 2026-09-19: no compositor, no glamor, no V3D in the X path

Packages approved by the user and installed: `xserver-xorg-core`
(modesetting is built in on this Debian 13 image) and
`xserver-xorg-input-libinput`. Xwayland untouched (24.1.6). The panel is a
DSI display on its own KMS device (`drm-rp1-dsi`, card1), separate from V3D
(card0) and the HDMI vc4 device (card2). `tools/bare-xorg/xorg-bare.conf`
binds modesetting to card1 with `AccelMethod none`, `ShadowFB`, `AutoAddGPU
off`; the log confirms "glamor disabled", "ShadowFB enabled", "Output DSI-2".
`bare-xorg-arm.sh start` stops the sway session unit, starts `Xorg :1`, and
starts an AZ `--no-controller` session attached to it through the new
`external_display` key (launcher writes the display number into its own
handshake pipe instead of spawning Xwayland). Same six-load protocol as the
joint-priority validation above, `FRESH=1 NO_KIOSK=1 AZ_DISPLAY=:1`.
Capture `local/multi-load-20260919T040112Z`.

| arm | X server | per-load >25 ms (sum of 6) | per-load max | whole >25 / >40 | browse→browser | LOAD→waveform | EP147 %core | underruns |
|-----|----------|---|---|---|---|---|---|---|
| Xwayland defaults (three arms today) | Xwayland under sway | 10, 8, 10 | 55.6–58.0 ms | 12–14 / 1–2 | 218–286 ms | 355–423 ms | 44–45 | 0 |
| **bare Xorg** defaults | Xorg, DSI KMS, software | **6** (1 per load) | 49.6 ms | 10 / 2 | 222–246 ms | 375–419 ms | **39** | 0 |
| Xwayland defaults, bracketing arm after Xorg (A2) | Xwayland under sway | 9 | 59.2 ms | 15 / 2 | 237–252 ms | 360–420 ms | 45 | 0 |
| Xwayland, joint RR 12 | Xwayland under sway | 5 | 62.8 ms | 10 / 1 | 226–279 ms | 360–392 ms | 45 | 0 |

Read, with the bracketing arm in (`local/multi-load-20260919T041910Z`):
four Xwayland default arms today had 8–10 XDamage intervals over 25 ms
across six loads with a per-load spread of 1–5; the one bare-Xorg arm had 6,
exactly one per load, with no load above 1. (These are long intervals
between damage notifications, not a count of dropped frames.) That puts a compositor-free, GPU-free X
server at about the joint-priority level at default priorities, with the
renderer at 39 %core against 44–45 (a 12–13 % relative reduction; the
likely mechanism is the missing compositor-facing copy, not shown) and Xorg
itself averaging ~2 % CPU. The spikes on loads 3 and 5 recur on the same
tracks under every condition (46 and 50 ms against 48–63 ms); that points
at track-related work rather than the X server, but does not show what that
work is;
page-response latencies are unchanged. One B arm: the direction is
consistent across all four A arms, the size is modest, and a second Xorg
arm plus a long session are needed before it is more than that.

Traps hit on the way, now in the script: a kiosk shell orphaned from the
session unit survives `systemctl stop` and keeps relaunching sessions with
no compositor; Xorg on vt7 leaves VT7 active and sway then restart-loops
("Timeout waiting session to become active") until `chvt 1`; the mode menu
falls to BiteDJ after its countdown, so "kill the menu" only launches AZ if
the stub menu is installed before the countdown ends.
