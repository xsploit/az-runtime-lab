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
