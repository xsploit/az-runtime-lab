# AZ one-tick scheduling experiment

Pinned EP147 SHA256: 736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6.

This is an experimental in-memory scheduling change, not an installed fix. `pi-one-tick-experiment.py PID` uses GDB to stop the process while changing four instructions, runs short original/candidate/restored samples and restores original bytes in finally. It checks executable hash, instruction values and process starttime. SIGINT/SIGTERM trigger cleanup; SIGKILL or host loss cannot run cleanup. Restarting the original executable clears the changes. No firmware file is modified. GDB's ptrace code writes are used rather than plain process-memory writes for instruction-cache handling.

| Address | Original word | Candidate word | Intent |
| --- | --- | --- | --- |
| 0x212fb94 | 0x7100041f | 0x7100001f | Main redraw eligibility: elapsed ticks >0 instead of >1 |
| 0x212f344 | 0x7100041f | 0x7100001f | X11 upload delay eligibility: elapsed ticks >0 instead of >1 |
| 0x212f974 | 0x11000673 | 0x52800033 | Request repaint/upload after1ms rather than computed next boundary delay |
| 0x212f9ac | 0x11000673 | 0x52800033 | Same for the alternate rounding branch |

Encodings verified with llvm-mc for AArch64. This is not a complete removal of every two-stage policy: the main callback's post-callback scheduling and its ineligible-tick fallback remain intact. The hypothesis is that prompt upload followed by the existing onImageBlit next-boundary scheduling can shorten the cycle. A negative result does not prove a firmware-wide immutable30Hz cap.

First six-second sample sequence: original29.460, candidate29.627, restored29.460 native pixel changes/sec; medians33.33ms,p95/max~41.67ms. No useful improvement. The original sample was started before the reload helper's process completion had been collected, so exclude that first baseline from a strict controlled claim. Candidate and restored samples both show ongoing pixel changes; they alone show no gain. Exact instruction restoration verified. Files `az-one-tick-*.framemd5/.json` and apply/restore logs.

`--timer-fields` measures actual timer+0x78/+0x80 changes without ffmpeg, automatically discovers the timer through the verified hook, and writes separate records. This distinguishes scheduler callback/notification behavior from changes to rendered waveform pixels. This follow-up does not itself prove playback state or physical frame presentation.

Follow-up timer-field A/B/A (six seconds each, no ffmpeg): all three phases observed177 repaint-field changes and178 blit-field changes. Repaint median33.730/33.745/33.786ms; blit median33.732/33.696/33.770ms. Candidate did not speed up the internal schedule itself, so this experiment does not point to an upstream waveform-data limit. Remaining post-callback extra-period and ineligible-tick fallback scheduling must be accounted for before drawing that conclusion. `az-one-tick-field-summary.json` and raw field files retain evidence. Final instructions restored by script; process sleeping normally with TracerPid0.
