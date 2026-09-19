# Pi-side helpers used in the 2026-09-18 investigation

All assume the lab checkout at `$AZ_LAB` (default `$HOME/az-native-lab`) and
are staged to the Pi's `/tmp` before use; they are **state-dependent** and
require `--no-controller` sessions for anything that writes the input FIFOs.
Never inject alongside the live MIDI bridge. `load-two.sh` is valid only from
a fresh launch on the SOURCE page; `view` goes to SOURCE, `browse` opens the
browser. `rollback-watchdog.sh SECS` is an independent timed rollback; arm it
before any scheduling experiment. `analyze-instr.py DIR` reads an
`instrument-arm.sh` capture.
