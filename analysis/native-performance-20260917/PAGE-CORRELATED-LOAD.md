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
