# Portable paths and research tools

Start with [PI-SETUP.md](PI-SETUP.md) for normal playback. Its JSON config owns
firmware, cabinet, persistent state, USB, cache, allocator and controller mapping
locations. You can clone the repository anywhere, including paths with spaces.

The research tools now resolve checkout assets through `az_paths.py` instead of
personal home directories or a sibling RX3 checkout. The FLX6 XML ships in `pi/`.
This cleanup does not change firmware addresses, effect algorithms or recordings.

## Research path inputs

For tools using the shared resolver, set `AZ_CONFIG` to the absolute filename of
your existing session JSON. Explicit environment values take precedence:

| Environment | JSON field | Default if neither supplied |
|---|---|---|
| `AZ_LAB_ROOT` | — | Checkout containing az_paths.py |
| `AZ_ROOTFS` | `rootfs` | `<checkout>/xdjaz/rootfs` |
| `AZ_CABINET` | `cabinet` | `<checkout>/private/cabinet-extracted` |
| `AZ_STATE` | `state` | `<checkout>/xdjaz/state` |
| `AZ_MAPPING` | `mapping` | Included `pi/Pioneer-DDJ-FLX6.midi.xml` |
| `LAB_PI_JEMALLOC` | `jemalloc` | Required; no machine-specific fallback |
| `USB_FIXTURE_PATH` | `usb` | Required for benchmark USB input |

`AZ_LAB_ROOT` supports a separately staged research checkout. Copy az_paths.py
alongside the root-level modules when staging. Nested launcher snapshots now
resolve the checkout root rather than expecting to be manually copied there.
Some isolated allocation/audio tests explicitly run from their own staged cwd;
read their docstrings before running them. Historical evidence JSON/Markdown
still records the original paths as evidence, not instructions to recreate them.

The two SSH allocation/cleanup tests require `AZ_SSH_HOST` (an SSH config alias
or user@host). They use your normal OpenSSH config and agent. Optional absolute
`AZ_SSH_KEY` and `AZ_SSH_KNOWN_HOSTS` override the key and known-hosts file.
Host verification is strict. There is no default hostname, IP or private key.
These tests contact the selected machine; local path tests do not.

Desktop probes inherit `XDG_RUNTIME_DIR` and `WAYLAND_DISPLAY` from the caller's
actual desktop. Sway probes use `SWAYSOCK` or exactly one socket found inside that
runtime directory. No UID 1000, fixed Sway PID or Wayland display name is assumed.
When running through sudo, preserve the intended desktop environment explicitly.
The compositor-filter probe takes `--az`, `--xwayland`, `--sway` and
`--output-name`; it does not guess which display/process to change.

## Shell experiments

Shell launch recipes resolve their checkout from their own script location.
They require the indicated environment variables **before** stopping or starting
anything. Supply `LAB_PI_JEMALLOC`, `USB_FIXTURE_PATH`, `XDG_RUNTIME_DIR` and
`WAYLAND_DISPLAY` to AZ comparison launchers. Shell recipes use these explicit
environment variables rather than parsing the session JSON.

BiteDJ/AZ comparison recipes additionally require `BITE_SUPERVISOR` (absolute
executable path) and the current `BITE_SUPERVISOR_PID`. The BiteDJ benchmark also
requires `BITE_BINARY`, `BITE_SETTINGS`, `BITE_RESOURCES`, `BITE_TRACK_ONE`,
`BITE_TRACK_TWO` and `SWAYSOCK`. These are specialized comparison recipes with
fixed historical UI actions, not universal BiteDJ installers. Inspect them first.
Never run them alongside a session you intend to leave untouched.

The obsolete period experiment and earlier `.reference.py` session recipes exit
without acting: their old process IDs/pointers are historical evidence. A changed
path alone cannot make an old memory address safe to replay. Current rendering
probes accept the target PID and verify the expected binary/hook state.

## Video builders

No Downloads folder is assumed. Original recordings stay outside Git.

```sh
python3 video-comparison/build.py \
  --original '/path/to/original.mp4' --fractional '/path/to/fractional.mp4' \
  --restored '/path/to/restored.mp4' --earlier '/path/to/earlier.mp4' \
  --output '/path/to/comparison.html'
python3 video-comparison/build-waveform.py \
  --clips '/path/to/contrast-clips' --output '/path/to/contrast.html'
```

The contrast folder must contain `grid-only.mp4`, `grid-and-smooth-curve.mp4` and
`grid-only-restored.mp4`. The rendered explanatory text describes the original
experiment; replacing clips with another experiment requires updating that text.

## Regression checks and limits

```sh
python3 tests/native-performance/test_paths.py
python3 tests/native-performance/test_setup.py
```

The path suite checks tracked runnable source for personal home/mount paths,
fixed numeric desktop runtime directories, private SSH defaults and sibling
RX3 mapping dependencies. It also tests relocated imports, configuration precedence,
missing-input failures, quoted shell paths and video-builder arguments.
Standard Linux paths (`/proc`, `/dev`, `/tmp`, `/usr/bin`) and paths the firmware
requires **inside its sandbox** remain literal. They are OS/runtime interfaces,
not references to the author's machine.

Validation for this cleanup is local: Python parsing, shell syntax, helper/CLI
and regression tests. No Pi connection or live experiment was performed for it.
This does not imply every historical experiment or hardware combination has been
retested. The new launcher previously passed the documented native Pi test;
re-run that test before promoting this revision to a device startup service.
