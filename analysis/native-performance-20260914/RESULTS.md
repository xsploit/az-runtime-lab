# Native AZ performance and portable setup — 2026-09-14

## What changed

This branch packages the exact horizontal NEON grid span, a guarded semaphore
creation fix, a compatible-shim build command and one configurable native
player/audio/controller session command. It preserves the existing smooth-scroll,
fractional geometry, pixel upload and software mixer work. The opt-in PCM memory
experiment remains separate and is **not enabled** by the packaged profile.

## Grid arithmetic: controlled native Pi comparison

Pi 5 4 GB, Debian, 16 KiB pages; native EP147, no QEMU. One uninterrupted player,
two decks playing the same cached Help7 / 9MM file. A calls the original span via
its trampoline; B enables the NEON calculation. Everything else remains fixed.
Each phase resets decks, starts playback sequentially, settles five seconds and
samples. 100% CPU means one core, not the whole four-core machine.

| Window | Span | Seconds | Player CPU | Player + Xwayland + Sway | Player RSS MiB |
|---|---|---:|---:|---:|---:|
| A1 | Original | 62.0 | 49.14% | 65.79% | 989.5 |
| B1 | NEON | 61.9 | 42.91% | 59.51% | 989.1 |
| A2 | Original | 62.0 | 48.24% | 64.88% | 988.8 |
| B2 | NEON | 123.7 | 42.89% | 59.50% | 988.9 |
| A3 | Original | 123.9 | 48.16% | 64.73% | 988.6 |

Long pair: 10.9% relative reduction in player CPU; 8.1% in the three-process sum.
No meaningful RAM saving and no refresh-rate change from this arithmetic patch.
Five windows, about seven measured minutes, no reported aplay underruns. Paused
full-frame A/B/A images were pixel-identical at tested positions and zoom settings.
This is not a moving-screen flicker or physical scanout acceptance test.

Original-instruction tests cover 110,000 cases per variant (scalar, Clang NEON,
old-GCC NEON, hook/trampoline). Zero positive-test errors; altered rounding is a
negative control and causes 8,265 mismatches. ASan/UBSan covers 18,432 edge cases.
See ../../tests/native-performance for the portable harness. Private firmware is
required for the original-instruction oracle; it is not embedded in the repo.

## Fresh loads exposed a real semaphore defect

Before the fix, the private SysV semaphore had mode 0000. The firmware created it
with IPC_CREAT but no owner bits; native initialization and lock operations failed
with EACCES, producing repeated cipher_lock/cipher_unlock error messages.

The new interposer changes **only** semget calls from three instruction-verified
AZ sites, requiring one semaphore and exactly IPC_CREAT. It adds owner-only 0600
permissions. Native SETVAL, locking and unlocking remain native. It does not
change existing objects, keys, initialization values, host IPC or credentials.
Both full executable hash and callsite instructions guard the patch.

A standalone native Pi test covers five creation/permission/lock cases. Ordinary
untargeted calls are unchanged. In the player the semaphore now has mode 0600,
value 1, successful operation timestamps and no repeating cipher permission errors.

The new continuous-audio session covered three first loads and three browser
reloads. A reference deck played during each new load; sampled resources for 27s,
XDamage for 28s, load at ~3s, play second deck at ~5s. Display gaps below cover
seconds 1–24 after LOAD, excluding the immediate page transition. XDamage measures
window updates, **not physical display FPS**. No video recording during samples.

| Track/test | Peak player CPU | Max measured display gap | Log growth | Audio underruns |
| gdubz-first | 143.27% | 23.33 ms | 3977 B | 0 |
| libra-first | 147.37% | 20.19 ms | 4237 B | 0 |
| red40-first | 145.27% | 19.59 ms | 4232 B | 0 |
| gdubz-browser-reload | 48.11% | 19.22 ms | 3902 B | 0 |
| libra-browser-reload | 48.16% | 18.87 ms | 3902 B | 0 |
| red40-browser-reload | 48.23% | 18.81 ms | 3902 B | 0 |

Fresh: GDubz Levels WAV, IDHS Libra MP3, IDHS Red40 MP3. Three analysis files
created per fresh track; subsequent reloads did not change analysis files.
[Structured summary](load-summary.json) preserves the measured values. Continuous
aplay stderr monitoring covered preparation and between-window gaps too, with no
reported underruns throughout that session. This does not exclude glitches inside
the player or replace listening and long-duration testing.

The earlier pre-fix run used different fresh tracks (Oni, DUMOUT, Brought Her Back):
59.5–74 ms worst post-load XDamage gaps, several MiB of errors per window. It also
had one 325.621 ms aplay underrun **between** measured windows; cause unresolved.
Do not hide that event or infer an exact causal hitch-reduction percentage from
these different-song cohorts. The permission defect is confirmed and fixed;
analysis CPU spikes still exist (about 145% of one core at peak).

## Packaged launcher verification

Six shims built together using caller-specified Linaro AArch64 GCC 6.3.1 and a
GLIBC <=2.29 dependency check. The build manifest is local, not a redistributed
binary bundle. The native semaphore test also passed against this packaged build.

Tested a separate Pi checkout named `AZ portable test` (spaces), with a JSON
filename containing spaces, externally configured rootfs, cabinet, allocator,
USB, metadata cache and state. The player reached SOURCE and loaded Estara on
both decks; play-screen waveforms/progression were observed. No aplay underruns
were reported during that short diagnostic session. SIGTERM to the session
supervisor removed its player, mixer and audio processes; restart then connected
the FLX6 and logged mapped hardware messages. Stopping that controller-enabled
session also removed its controller, player and audio processes. The same package
was then installed in the established lab directory with previous files backed up.
This is relocation on an existing
configured Pi, not installation onto a fresh OS.

## Kept deliberately separate

No shader rewrite, physical-panel FPS measurement, analysis scheduler redesign,
cloud authentication, complete native FX parity, new stems support, firmware
flashing or startup-service change. Host effects still use manual configured BPM.
The cabinet/private runtime inputs, music, raw captures and generated binaries
remain outside Git. Follow ../../PI-SETUP.md; historical probes are not installers.
