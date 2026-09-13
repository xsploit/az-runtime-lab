# AZ waveform position timer and measured 59 Hz content

2026-09-12, native Pi session EP147 PID 11605. Pinned AZ 1.30 binary SHA256:
`736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.

## Result

The missing limiter is the LocalPlayer state-refresh timer, configured to 33 ms.
Changing it to 16 ms **together with** the previously tested seven-instruction
main repaint policy produced about 59 distinct waveform crop updates per second.
Either change alone leaves a roughly 30 Hz bottleneck elsewhere in the chain.
All changes were temporary and were restored after the comparison.

| Phase | LocalPlayer interval | Repaint Hz | Source position Hz | Render cache Hz | Distinct waveform crop Hz | Player CPU, % of one core |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Original | 33 ms | 29.76 | 29.51 | 29.76 | 30.06 | 30.49 |
| Provider only | 16 ms | 29.50 | 59.26 | 29.50 | 30.56 | 30.96 |
| Combined | 16 ms | 59.27 | 59.27 | 59.27 | 59.12 | 48.98 |
| Restored | 33 ms | 29.51 | 29.76 | 29.51 | 29.56 | 30.73 |

Each phase sampled memory for four seconds, then captured a native X11 waveform
crop for four seconds at a requested 120 Hz. Captures yielded 479–480 samples.
The parser uses each file's actual time base. CPU was measured during the memory
sample, not during capture. These are short sequential sections of Estara on
deck 1, not matched-position optical comparisons. Deck 2 was paused. Combined
cached position progressed 1000.004 units/second; no negative steps were found
in these phase samples. This does not measure audio output, sync accuracy,
physical presentation, perceived wobble, or sustained two-deck performance.

## Newly traced ownership and publication

The four-deck polling callback at `0x198728c` belongs to the already mapped
`gui::DisplayRefreshCycleTimer` callback `0x1987038`. It is **not itself** a new
independent scheduler. The separate timer was found further upstream:

1. `0x1fc9bc4` receives a `dj_player::PlayerStateWithUpdate` source object from
   `gui::player_info::PlayerCollection`. Its normal raw position is at +0xe8;
   the conversion coefficient at +0x20 was consistent with 1000/44100.
2. A hardware watchpoint caught `0x14989ec` copying raw position from x1+0x18
   into destination x20+0xd0, equivalent to the source object's +0xe8.
3. This is part of snapshot copier `0x14983e8`, reached via `0x14983b0` and a
   virtual call. The latter refresh helper has many callers. An unrestricted
   breakpoint first hit PlayNotify on a **different** object; that was not
   accepted as the waveform source path.
4. A breakpoint conditioned on the actual waveform source instead resolved
   caller `0x1e277c0` in `gui::player_info::LocalPlayer` callback `0x1e27790`.
   Its source is stored at LocalPlayer+0xb0.
5. The callback is invoked through virtual slot +0x10 at `0x239dd54` by the
   JUCE timer dispatcher. The dispatcher reloads the interval from object+0x10
   at `0x239dcac` and uses it to reschedule. The live interval was **33**.
   Start-timer code `0x239cda0` independently confirms that interval field.

The timer registry pointer is stored at `0x3bd7830`; its entries span
registry+0x1a0 through +0x1a8, with 16-byte entries holding object pointers.
Four objects with LocalPlayer timer vtable `0x2da1c28` were found, all at 33 ms.
The experimental tool changes only these verified objects, not every JUCE timer.

The earlier six-second read-only upstream sample observed 344.51 changes/sec
in the raw backing field (median 128 units), 29.67 in the LocalPlayer copy
(median 1472 units), and 29.50 in the render cache (median 34 units). None
decreased. This establishes fresher upstream information, not audible output
quality. The backing field is in a snapshot buffer; its address is session and
buffer dependent and is not suitable for a permanent hardcoded bypass.

## Reproduction and limits

`pi-provider-repaint-experiment.py` discovers all four LocalPlayer timers,
checks the executable SHA, process start time, vtables, interval values and
instruction bytes, and requires moving playback before testing. Source and
cache addresses must be freshly discovered for the running process. GDB writes
occur while stopped; original values are restored in `finally` and on handled
SIGINT/SIGTERM. SIGKILL, host failure or power loss cannot run that cleanup;
restarting the original player clears memory-only changes. Firmware files are
never modified.

Artifacts:
- `az-provider-repaint/results.json`, phase memory samples, frame hashes, GDB
  scripts and apply/restore logs.
- `az-source-cadence.json`, discovery/watchpoint/conditional breakpoint logs,
  `az-source-publication.asm`, and `az-local-timer-exact.log`.
- Prior grid and blend findings remain in `AZ-GRID-WAVEFORM-UPDATE-CONDITIONS.md`
  and `AZ-LIVE-BLEND-COMPARISON.md`.

This removes the demonstrated 30 Hz content bottleneck in a bounded test. It
does not fix the grid's integer pixel stepping or establish that all perceived
wobble is gone. A production implementation still needs lifecycle-safe timer
configuration, pause/seek/loop checks, two-deck and controller/audio validation,
and physical-screen evaluation. No permanent candidate is enabled yet.
