# Live AZ waveform blend comparison

2026-09-12. Previous player9262 and launcher9255 were confirmed gone. Restarted the same native fixture configuration, launcher11596, actual EP14711605 (launcher reports namespace-wrapper11602). Absolute synthetic59.24Hz timing and fast24 shim retained. Sway linear filter retained. No BiteDJ process concurrent. Two tracks loaded: Estara95BPM and Dead Wrong acapella168.7BPM, both0%tempo. Paced NULL audio: no audible-output claims.

## Execution path corrected before patching

Initial temporary breakpoint at0x1e0141c did not hit within5seconds, including a verified moving run. Those timeout logs print irrelevant register values after SIGINT; they must not be read as successful samples. GDB detached and TracerPid0 was verified.

Breakpoint0x1e00efc DID hit: provider query result1, fraction0.5125, width1220. This selects the single-lane branch; at zoom below1 it groups source samples and retains a peak for each output column (0x1e02280 onward). Its own high-contrast entry0x1e026b8 also hit. Thus the earlier isolated oracle's exact RGB block is not the current path, but the live branch contains the same preset-coefficient versus continuous-weight choice. `az-waveform-single-lane.asm` and copied breakpoint logs preserve the evidence.

## Temporary candidate

Four conditional branches in the single-lane/zoom<1 path were changed to branch forward24bytes into their existing continuous blend. Targets bypass contrast-ratio selection, not sample gathering, playback position or grid generation:

| Address | Original word | Candidate | Destination |
|---|---|---|---|
|0x1e0246c|0x5400126d|0x14000006|0x1e02484|
|0x1e02548|0x54000f6d|0x14000006|0x1e02560|
|0x1e025f0|0x54001bad|0x14000006|0x1e02608|
|0x1e027d4|0x5400056d|0x14000006|0x1e027ec|

`pi-blend-comparison.py` checks executable SHA, PID starttime and original/candidate bytes; GDB writes with the process stopped, finally restores all four instructions. SIGINT/SIGTERM restore; SIGKILL/host loss cannot guarantee cleanup, and launching original firmware clears changes. No ELF file changes. Address coverage is intentionally this observed path, not all waveform variants/zooms.

## Same-position image test

Both decks paused and red cursors verified. Encoder2->1 rebuilds the same zoom without transport changes. Original and original-repeat were pixel-identical. Candidate changed21686 pixels, bounding boxx170..1069/y126..440, only waveform areas. The restored screenshot exactly matched original RGB SHA2565d3d6f4f53c627b07963c638870476b818f48746cab7215131eb4cc96178e176. Track times stayed2:22.494 and2:18.551. Grid lines and other UI were unaffected.

All changed channel bytes in the selected waveform regions became darker; none brighter. This confirms actual contrast effects, not motion improvement. Screenshots and reports in `az-blend-live/`.

## Moving original/candidate/restored

After resuming both decks, captured sequential six-second620x82 native X11 strips and screenshots, with originals restored afterward:

| Phase | AZ CPU (% one core) | Distinct crop changes/sec | Median interval |
|---|---:|---:|---:|
|Original|27.60|29.50|33.334ms|
|Candidate|27.48|29.58|33.333ms|
|Restored|27.75|29.67|33.334ms|

No meaningful CPU increase or content-rate gain in this short test. Different song sections are sampled sequentially; these metrics do not establish reduced wobble, a statistically significant performance gain, optical panel behavior, or full application stability. Screenshots verify progressing positions and original view restored. No new visual endorsement from the user yet.

The initial ad-hoc cadence calculation incorrectly assumed1/120 timestamps; no claims used those numbers. `summarize-blend-motion.py` now reads each file's actual timebase (1/1000000 or1/240) and asserts a plausible six-second duration. Corrected reports in `az-blend-motion/`.

Final TracerPid0; measured physical thermal sensor55.65°C. All four original words verified restored by the experiment. AZ left playing with baseline code. Next: fractional grid coverage and upstream cached-position freshness; keep a user-visible motion comparison separate from quantitative CPU checks. Full firmware/DSP/controller objective remains incomplete.
