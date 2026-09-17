# PiFLX mode chooser

Boot into a menu and pick one performance application, instead of BiteDJ being
the only thing this device can start.

```
pflx-session.service -> start-pflx-session (DRM/env) -> sway (/etc/sway/pflx.conf)
                                                         `-> start-pflx-kiosk
                                                              |-> pflx-mode-menu
                                                              |-> pflx-bitedj-supervisor
                                                              `-> pflx-az-session
```

`start-pflx-kiosk` loops: show the chooser, run the chosen mode, and show the
chooser again when that mode exits. Nothing is installed as a new service and
the boot unit itself is untouched.

## Getting back to the menu

| From | Gesture |
|---|---|
| XDJ-AZ | Hold **both MERGE FX buttons** for 2 seconds |
| BiteDJ | Quit Mixxx normally |

AZ's exit is handled by the FLX6 control bridge, which already owns the
controller. Merge FX is mapped in the FLX6 XML but no AZ module reads it, so the
hold costs no player function. Requiring both sides is deliberate: one leaned-on
button must never end a set. Configure it per session with `exit_hold` and
`exit_hold_seconds` in the launcher JSON, or `"exit_hold": []` to disable.

BiteDJ only returns to the menu when the supervisor is started with
`PFLX_BITEDJ_ONCE=1`, which `start-pflx-kiosk` sets. A crash still gets the
existing restart-and-recover behaviour rather than dumping the DJ to a menu.

## Install and roll back

```sh
sh pi/pflx-os/install.sh
sudo systemctl restart pflx-session   # ends whatever is playing
```

`install.sh` backs up every file it replaces to a timestamped directory under
`/usr/local/share/` and prints the one-line `cp` that restores them.

If `pflx-mode-menu` or `pflx-az-session` is missing or the chooser fails,
`start-pflx-kiosk` runs BiteDJ exactly as it did before. That fallback is the
reason this is safe to install on a device you gig with.

## Two things the device made us find out

The kiosk login session carries ambient capabilities an SSH shell does not, and
bwrap refuses to start with them: `Unexpected capabilities but not setuid, old
file caps config?`. AZ launched fine over SSH and died instantly from the menu
until `pflx-az-session` started dropping all three capability sets with
`setpriv`. AZ needs none of them.

`pflx-boot-screen` stays on top of whatever maps after it and only exits on its
own after a long delay, so the chooser was invisible behind a splash that read
`STARTING DISPLAY` — indistinguishable from a hung boot. `start-pflx-kiosk` now
stops the splash before showing the chooser.

## Paths

`pflx-az-session` takes `PFLX_AZ_LAB` (default `$HOME/az-native-lab`) and
`PFLX_AZ_CONFIG` (default `$PFLX_AZ_LAB/local/session-library.json`). No
username is compiled in.
