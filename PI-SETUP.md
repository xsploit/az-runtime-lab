# Native Raspberry Pi setup (experimental)

Use **pi/session.py** for the supported native AZ session. Historical scripts in
`analysis/` and older launchers are research probes, not installation steps: some
still contain experiment-specific paths, PIDs or other-device assumptions.
Do not run them indiscriminately. This guide does not install or flash firmware.

## What you need

Tested: Raspberry Pi 5, 4 GB, Debian AArch64, 16 KiB kernel pages, Sway/Wayland,
1920×1200 touch display, FLX6, and a mounted USB with a PIONEER directory.
Other boards, compositors, displays and controllers have not been validated.
Run as your desktop user, with sudo available for audio priorities and the
controller's native-process inspection. Do not run the whole player as root.

Supply these **locally**; they are not in Git:

- An extracted XDJ-AZ 1.30 root filesystem. `home/root/pdj/EP147` must have SHA256
  `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.
  An ISO or CPIO filename alone is not a root filesystem. Preserve the extracted
  directories, symlinks and executable bits. Your user needs write access to
  create empty bind-mount destinations; the running guest sees a read-only root.
- Your extracted cabinet directory. This launcher uses an offline environment
  fixture; including cabinet files does **not** enable or prove cloud login.
- An ARM64 `libjemalloc.so.2` compatible with both the guest libraries and your
  kernel page size. The stock firmware allocator does not work unchanged on the
  tested Pi's 16 KiB pages. A current Debian library may require newer glibc than
  the firmware provides. The presence check cannot certify ABI compatibility.
- Music on a mounted USB; keep a backup. The player reads songs from that USB.
  Analysis writes go to a persistent local metadata overlay, not the USB.

**Allocator preparation remains a prerequisite, not an automated build in this
repo.** If you do not already have a compatible allocator/rootfs/cabinet, stop
here; this is not a one-command installation from an empty SD card. No firmware,
keys, cabinet, music or proprietary binaries are supplied by this repository.

On Debian, install host dependencies:

```sh
sudo apt install git python3 build-essential binutils bubblewrap xwayland \
  alsa-utils fuse-overlayfs util-linux ffmpeg libx11-dev
```

Use a working Wayland desktop. This does not configure boot, screen rotation,
brightness, autostart or replace your OS. Stop other DJ applications/audio owners.

## Get this checkpoint

The repository is private: collaborators must be invited with their GitHub
account before cloning. This branch contains the setup described here:

```sh
git clone --branch feat/native-performance-and-setup-20260914 \
  https://github.com/xsploit/az-runtime-lab.git
cd az-runtime-lab
```

Use a Linux PC (or suitable Linux environment) for the tested cross-compiler.
Copy the checkout to the Pi before launching; configure paths for the Pi, not
the build PC. Normal Git authentication is required for this private repository.

## Build the six guest shims

Build on your PC or Pi using an **AArch64 compiler with a guest-compatible older
glibc sysroot**, not an arbitrary current native compiler. The tested toolchain
was Linaro GCC 6.3.1 (2017.05). Set its actual path yourself:

```sh
python3 pi/build-shims.py --cc '/absolute/path/to/aarch64-linux-gnu-gcc'
```

Alternatively set `AZ_CC`. Use `--x11-headers '/path/to/include/X11'` when the
headers are elsewhere. The script stages X11 headers without accidentally
including host glibc headers. It rejects a non-AArch64 compiler and dependencies
newer than GLIBC 2.29; the live test remains necessary even after this check.
It writes six `.so` files plus `shims/native-build.json`, all untracked.
If building on a PC, transfer those six files **and the manifest together** into
the Pi checkout's `shims/`. Stop the session before replacing its build.

## Configure your paths

From any location where you cloned this repo:

```sh
mkdir -p local
cp pi/session.example.json local/session.json
```

Edit `local/session.json`. Every filesystem value is an **absolute path on the
machine running AZ**. No username, Pi hostname or Windows mount is assumed.

| Field | Value |
|---|---|
| `rootfs` | Extracted filesystem containing `home/root/pdj/EP147` |
| `cabinet` | Extracted cabinet directory, not cabinet.img |
| `state` | Writable persistent runtime state; omit to use this checkout's `local/state` |
| `usb` | USB mount root containing `PIONEER` and your music folders |
| `cache` | Local persistent analysis cache, separate from the USB; one per USB filesystem UUID |
| `jemalloc` | Compatible ARM64 allocator file |
| `audio_device` | ALSA name from `aplay -L`, tested `plughw:CARD=DDJFLX6,DEV=0` |
| `mapping` | Optional absolute XML path; defaults to the included FLX6 XML beside the launcher |
| `fx_bpm` | Manual host-effect tempo, 40–300 BPM; default 140, not automatic track tempo |

Paths with spaces are passed as separate arguments. Do not use `~` or shell
variables inside JSON; write their expanded absolute paths. Commas, colons,
backslashes and newlines in **USB/cache** paths are rejected because the overlay
mount-option grammar would misinterpret them. Rename/remount at a simpler path.
The guest's fixed `/home/root`, `/tmp` and `/media/usb/lab` paths are firmware
interfaces inside its sandbox; they are not folders you must recreate on your PC.

Never reuse one state directory for simultaneous sessions. A cache is tied to
its USB filesystem UUID and preserved between launches. Do not delete it to
"fix" reanalysis. Original USB songs remain read-only in the sandbox.

## Start, use and stop

Run from a terminal **inside the Pi's Wayland desktop**, so `WAYLAND_DISPLAY`
and `XDG_RUNTIME_DIR` belong to your login session:

```sh
python3 pi/session.py local/session.json --check
python3 pi/session.py local/session.json
```

The launcher checks inputs, refuses an existing AZ player, mounts the metadata
cache, starts audio/player/mixer, then starts one FLX6 bridge. No manually copied
PID or socket address is needed. Keep the terminal open. **Ctrl+C** stops this
session's processes. No boot service is installed. Startup and shutdown failures
are recorded under `local/session-YYYYMMDD-HHMMSS/`.

FLX6 MIDI discovery uses its ALSA card identity, not a fixed `midiC2D0` number.
Multiple matching controllers are rejected. A disconnected controller can be
reconnected; consult `controls.log` for device events. This bridge consumes the
included XML's bindings; it does not execute the Mixxx JavaScript files named in
that XML. The XML credits Robert904 and comes from the user's BiteDJ mapping.
Other controller XMLs are not automatically equivalent hardware integrations.

- Browse/press, Back and View navigate the native player; Shift+Browse changes zoom.
- Deck 1/2 load, play/cue, jog/tempo and pad/control paths are present. Not all
  modes or four-deck switching have physical acceptance tests.
- Audio uses four-channel FLOAT_LE, 44.1 kHz, 80 ms buffer and 10 ms period.
  FLX6 master and headphone cue routing were tested earlier; turn on a channel
  cue and turn the headphone mix toward CUE when checking headphones.
- Filters and host Beat FX are reconstructed mixer implementations. Do not expect
  every Rekordbox Pad FX preset, native effect or UI indication to match.
  Host effect tempo is currently the configured manual `fx_bpm`.
- A legacy export may show **OneLibrary not found**. Use Folder to reach the
  actual files. This does not convert the old library or import all its metadata.
  Fresh files still need analysis; later loads use the overlay cache.

`--no-controller` is a diagnostic mode for a *single* external test driver; it
intentionally starts no FLX6 bridge. Never inject test FIFO packets while the
physical bridge owns those inputs.

## Rendering and troubleshooting

The tested profile retains a 59.24 Hz synthetic display clock, smooth-scroll
patches, fractional grid alignment, fast pixel conversion/presentation and an
exact NEON grid-span implementation. On the tested Sway output, linear scaling
from 1280×800 to 1920×1200 reduced nearest-neighbor shimmer. Check your compositor's
output scaling/filter settings; the launcher does not edit them.

- **GLIBC_x.y not found / allocator page-size error:** use guest-compatible builds;
  do not overwrite guest libc with host libc.
- **Missing Xlib.h:** install libx11-dev or set `--x11-headers`. This shim build
  does not compile the older DRM experiments requiring xf86drm.h/libdrm-dev.
- **Missing Wayland variables / blank window:** run in the logged-in desktop;
  inspect `launcher.log`, `xvfb.log`, `display-launch.log`. Do not guess display IDs.
- **No audio/device busy:** check `aplay -L`, the configured card and other audio
  applications. Do not start a second aplay consumer on the same FIFO.
- **Cache UUID mismatch:** point to that USB's own cache; do not force another
  drive's identity. The FUSE mount may remain after the session for cache reuse.
- **Keys/cloud errors:** this offline profile has no authenticated cloud setup.
- **Build manifest mismatch:** rebuild/transfer the matching libraries and manifest.
- **Permission error:** normal sudo authentication is needed on machines without
  passwordless sudo. The runner doesn't install or loosen sudo rules.

## Evidence and remaining work

See [native performance results](analysis/native-performance-20260914/RESULTS.md)
for scope, test counts, timing definitions and the earlier isolated audio underrun.
The packaged launcher has been tested in a relocated checkout containing spaces,
with explicit external firmware/state/cache paths. This is not fresh-OS coverage.
Long sessions, broad track formats, full controller modes, native FX parity,
cloud services and complete cold-boot setup remain unfinished.
