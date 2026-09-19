# Compatibility layers versus the recovered AZ runtime

Audit of every layer the packaged session (`pi/session.py`) puts between the
XDJ-AZ 1.30 firmware and the Pi 5, checked against what the recovered runtime
actually does on stock hardware. Sources: the 1.30 initramfs (which *is* the
device root filesystem: `etc/systemd/system/*`, `home/root/scripts/*`,
`etc/asound.conf`, `etc/X11/xorg.conf.d/20-modesetting.conf`), `readelf` and
`strings` on the recovered `EP147`, the ISO's peripheral firmware list, and the
measurements already recorded in this directory and `native-performance-20260914`.

Baseline all figures refer to: the build pinned in `RESULTS.md` (kernel
`6.18.48-pflx-rt+`, shim manifest `e065e9f0…`, `LAB_VSYNC_HZ=59.24`,
`share_ipc=false`). **%core** throughout: one busy core = 100.

**No replacement has been tested yet.** The device was unreachable while this
was written (the temporary SSH key did not survive a PC reboot), so the last
column is a plan, not a result.

## What the real device does

- **Display:** bare Xorg (`usr/bin/Xorg`) on Rockchip DRM, `modesetting` driver,
  `AccelMethod exa`, `DRI 2`, `FlipFB always`, DPMS and blanking off, no window
  manager, no compositor. `x11-only.sh` pins X to CPU 5; `apl_start.sh` gives
  it `chrt -r 49` and pins its InputThread. EP147 imports `XShmAttach`,
  `XShmCreateImage`, `XShmPutImage` and also plain `XPutImage`; it links
  **no GL/EGL**. It is a CPU software renderer whose only transport is X images.
- **Timing:** EP147's `device_adapter::VsyncTime` reads the literal path
  `/sys/module/rockchipdrm/parameters/vsync_time` and feeds
  `meow::vsync_helper::setRepaintTimer`. That is a Rockchip vendor kernel
  parameter. EP147 lists `libdrm.so.2` as NEEDED but imports no `drm*` symbol.
- **Audio:** `etc/asound.conf` defines `outs` as a `type multi` device binding
  `hw:ALPHATHETAD810,0` (8 ch) and `hw:ALPHATHETAD810,1` (2 ch) into one
  10-channel card. EP147 opens it with `snd_pcm_hw_params_set_period_size_near`
  / `set_periods_near`. Mixing, EQ, filters and effects happen in the D810
  hardware and the `MIXER_CONT_UCOM` MCU, not in software.
- **Peripherals:** the ISO ships four MCU firmwares — `DECK_UCOM`, `ErP_UCOM`,
  `MIXER_CONT_UCOM`, `MPNL_UCOM` — the deck/jog, effects panel, mixer control
  and main panel controllers that EP147 talks to over its private protocols.
- **System tuning (`apl_start.sh`, `fix-clock.sh`, `affinity_setting.sh`):**
  `kernel.sched_rt_runtime_us=-1`, transparent hugepages `never`,
  `vm.stat_interval=120`, performance governors for CPU/DDR/GPU, kswapd pinned,
  SPI threads at `chrt -r 99` on CPU 5, default task affinity mask `2f`
  (everything off CPU 4), IRQ affinity script.
- **Boot/storage:** U-Boot environment via `fw_printenv` on `/dev/mmcblk1`,
  eMMC data partition, cabinet image mounted under `/home/root/settings/cabinet`.

## Layer by layer

Classification: **E** = essential hardware emulation (the thing it replaces does
not exist on a Pi), **W** = workaround for a choice we made, **X** = enhancement
we added on purpose (not a compatibility layer, listed because it costs CPU).

### Graphics transport (priority 1)

| Layer | Replaces | Why it exists | Measured overhead | Recovered alternative on Pi? | Class |
|---|---|---|---|---|---|
| **sway + rootful Xwayland** (`Xwayland -geometry 1280x800 -fullscreen`, sway `scale_filter linear` to 1920x1200) | bare Xorg on DRM with `FlipFB` | PiFLX is a Wayland kiosk (menu, BiteDJ); AZ needs an X server | **Xwayland+sway ≈ 16.6 %core** (0914 A/B: player+Xwayland+sway 59.50 vs player 42.89). 0917 table shows sway 3.8 but never broke out Xwayland | **Yes, structurally**: Xorg with the `modesetting` driver runs on vc4/v3d. The Rockchip `xorg.conf` itself is not portable (EXA/DRI2 options are driver-specific), but "bare X server, one fullscreen client, no compositor" is. Conflicts with the Wayland kiosk: would need a mode switch that stops sway | **W** |
| **`--unshare-all` IPC isolation → MIT-SHM fallback → `ximage-fast24` + `ximage-present`** | the firmware's own `XShmPutImage` path | sandboxing chose `--unshare-all`; fast24 then rescues the resulting packed-24 `XPutImage` fallback; present makes multi-request uploads rectangle-atomic | fast24 = **10.43% of main-thread self time** (≈2.6 %core); present not measured separately | **Tested (this directory):** `share_ipc=true` makes XShm engage (frame segment `nattch 2`, `XShmGetEventBase` sampled, fast24 leaves the hot path) and EP147 lands at **45.7 vs 44.7/44.9 %core — no gain**. The native path is cost-neutral *under Xwayland*. Whether it wins under bare Xorg is untested and is the interesting combination | **W**, but cost-neutral |
| **`fractional-grid` / `fractional-grid-span` (NEON)** | nothing — patches AZ's own Blue-waveform grid drawing | speed | **−10.9% relative player CPU** (0914 long pair 48.16→42.89); 1.19% self | n/a; pure gain, pixel-identical paused images | **X** keep |
| **smooth-scroll binary patches** (repaint 30→59 Hz) | nothing — changes firmware behaviour | the user wants 59 Hz scrolling | ~30% → ~49% of one core in a single-deck phase (az-opus summary) | n/a; this *is* the requested behaviour | **X** keep, biggest deliberate cost |

### Timing (priority 2)

| Layer | Replaces | Why | Overhead | Alternative | Class |
|---|---|---|---|---|---|
| **synthetic vsync** (`display_timing.SyntheticVsync` publishing `vsync_time` into a bind-mounted fake `/sys/module/rockchipdrm/parameters/`) | the Rockchip kernel's vblank-stamped module parameter | EP147 hard-codes that path; vc4 has no such parameter | lives inside `run-az-interactive.py` = **3.2 %core** total for that process (publisher + supervision; not separated) | **No recovered equivalent** — it is a vendor kernel feature. Improvement is possible without the recovered runtime: derive the stamp from real vc4 vblank events instead of a phase-locked free-running clock. That changes accuracy, not CPU | **E** |
| **`LAB_VSYNC_HZ=59.24`** | the panel's real refresh | measured lab value; the launcher refuses smooth-scroll at any other rate | none | n/a | **E** (parameter of the above) |

### Audio buffering (priority 3)

| Layer | Replaces | Why | Overhead | Alternative | Class |
|---|---|---|---|---|---|
| **`asound-stream.conf`** (`type file` → `/tmp/az-decks.fifo`, null slave) | `type multi` onto the ALPHATHETAD810 card | no D810; EP147 must still open `outs` | unmeasured; the null slave clocks AZ's period timing in software | none — hardware absent | **E** |
| **`mix-stream`** (10 ch float in → EQ/filters/Beat FX/Sound Color/cue → 4 ch out) | the D810 hardware mixer + `MIXER_CONT_UCOM` | no hardware mixer | **11.9 %core** (0917 loaded), 8.0 in the later A/B/A; scalar (0 SIMD arithmetic in the binary); full native FX parity **not** established | none — this is the hardware AZ relies on. NEON build is a separate candidate (reference tests must stay unchanged) | **E** |
| **`aplay -D plughw:CARD=DDJFLX6` 4 ch FLOAT_LE, 80 ms buffer / 10 ms period, fed by a second FIFO** | the D810 card's own DMA | the FLX6 is the only audio hardware | 0.6 %core, plus one extra FIFO hop; **end-to-end latency has never been measured** (no report claims a latency bound) | Partly: `mix-stream` could open ALSA directly and drop `aplay` + one FIFO; buffer could shrink below 80 ms. Testable with a loopback measurement | **W** |
| **`offline-mixer-fixture` / `offline-usb-fixture` / ERP and deck FIFOs + FLX6 control bridge** | `DECK_UCOM`, `ErP_UCOM`, `MIXER_CONT_UCOM`, `MPNL_UCOM` | those MCUs are not present; the FLX6 is the physical surface | bridge 0.3 %core; `edb_streamd` 0.0 | none — hardware absent | **E** |

### Everything else

| Layer | Replaces | Why | Overhead | Alternative | Class |
|---|---|---|---|---|---|
| **`sem-owner`** | correct SysV semaphore ownership | inside the sandbox the player's private semaphore was created mode 0000 by the non-root user → `semop EACCES` storm (MBs of log per load, measured pre-fix) | ≈0; storm verified gone (0 `semop`/`EACCES` in current logs) | Might be unnecessary once IPC is shared and ownership matches; **test by removing it under `share_ipc=true`** | **W** |
| **compatible ARM64 `libjemalloc`** bind | the firmware's own jemalloc | Pi kernel uses 16 KiB pages; the firmware allocator's assumptions do not | 2.73% of main-thread self time under load (0917) | recovered `libjemalloc` is the one being replaced; keep | **E** |
| **`fw_printenv` fixture** | U-Boot env on `/dev/mmcblk1` | no U-Boot, no eMMC; `apl_start.sh` gates on `release`/`bootcmd`/`aplstart` | ≈0 | none | **E** |
| **cabinet extraction, settings/state binds, USB overlay + staged library** | eMMC partitions, cabinet mount, real USB | no eMMC; persistent analysis cache; legacy Device Library | overlay: 0 new analysis written (verified) | none | **E** |
| **the per-session leaks** (`az-display-clock-*`, `az-live-mixer-*`, 4 MB shm segments at `nattch 0`) | nothing | launcher never cleans up | 14+14 dirs and several 4 MB segments after a session of restarts | n/a — bug; clean only segments positively owned by our stopped sessions | fix |

### Tuning the real device does that we do not

Not a layer, but the recovered start scripts are a checklist of things stock AZ
sets that the Pi session may not: `sched_rt_runtime_us=-1`, THP `never`,
performance governors (CPU, DDR, GPU), X server at `chrt -r 49` on a dedicated
core, input thread pinned, kswapd pinned off the hot cores, `vm.stat_interval`
raised. Some of this may already be in `pflx-tune.service`; that was not
checked. Each is cheap and individually testable.

## Verdict

Essential and staying: the timing publisher, the whole audio emulation chain
(`asound-stream.conf`, `mix-stream`, fixtures, bridge), jemalloc, fw_printenv,
storage binds. There is no recovered alternative for any of them because they
stand in for hardware the Pi does not have.

Avoidable, and worth testing individually against the baseline, in this order:

1. **Bare Xorg instead of sway + Xwayland.** The ~16.6 %core is what the
   current compositor path *costs*, not what a replacement *saves*: a bare X
   server still spends CPU on the same uploads and scanout. The saving is the
   measured difference between the two, and could be small. It is exactly how
   the recovered runtime presents. Needs a kiosk mode switch that stops sway.
2. **Native XShm under bare Xorg.** Cost-neutral under Xwayland; retest once
   (1) exists, since the neutral result may be Xwayland's doing.
3. **The real device's system tuning**, item by item — never wholesale.
   `sched_rt_runtime_us=-1` removes the kernel's realtime throttle, and RT
   priorities plus CPU pinning can starve the audio path or the compositor on a
   4-core Pi that is not the 6-core RK3399 those scripts assume. One knob per
   trial, with the controller-exit gesture and SSH confirmed working first so
   a bad setting can be undone.
4. **Direct ALSA from `mix-stream`, smaller buffer**, with a measured latency
   before and after — the current 80 ms figure has never been justified.
5. **Remove `sem-owner` under shared IPC** to confirm it is only compensating
   for the sandbox.
6. **NEON `mix-stream`** as a separate build, reference tests unchanged.

Keep the waveform-gap capture (`capture_waveform_gap.sh`) and the bare-Xorg
experiment as **separate runs on the unchanged baseline**. Attributing the
61.7 ms outlier and measuring a transport change at the same time would leave
no way to say which one moved a number.

Each test: one change, the pinned baseline as control, A/B/A, the guards from
`RESULTS.md` (one kiosk shell, non-blank frame, verified loaded state), CPU by
component, XDamage intervals and continuous underrun logs.
