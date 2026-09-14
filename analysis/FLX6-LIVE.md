# Native Pi FLX6 bridge checkpoint

`run_pi_flx6_controls.py` connects physical raw MIDI to existing guarded native AZ navigation and ERP transport adapters. It uses the saved BiteDJ XML bindings. The original player is untouched; the current smooth-scroll overlay hash is pinned. The bridge exits with that player session.

## Verified

- Physical DDJ-FLX6 detection after Pi reboot and incoming MIDI (including Play/Cue, Back/View/load, encoder messages).
- Native page observer validates the current player and detects the browser; screenshot shows the fixture track list after physical encoder input.
- Stream parser tests cover fragmented/running-status data, realtime bytes, SysEx, note-off, short messages and system-common reset. Existing navigation and transport tests cover held button state and CRCs.
- Linear compositor filtering survives reboot. Standard launcher publishes its clock into tmpfs.

Packet delivery does not prove the user-visible outcome of every mapping. Physical user confirmation remains pending.

## Scope and limits

Browse rotation opens the library before scrolling, avoiding waveform zoom. View and Back follow the saved BiteDJ page behavior through a guarded native page observation. Browse acceleration is not implemented. Load bindings and deck1/2 Play/Cue/keylock are connected. Deck3/4 transport is explicitly rejected. Jogs, pitch, mixer DSP/faders, headphone output and LED feedback are not integrated here. Current AZ session uses paced NULL audio.

## Running

Discover the current EP147 PID and existing encoder counter first. Stop competing FIFO writers. Run from the Pi lab directory with root access for the guarded page observer:

```sh
sudo env PYTHONPATH="$PWD:$PWD/analysis" python3 analysis/run_pi_flx6_controls.py CURRENT_PID --mapping analysis/Pioneer-DDJ-FLX6.midi.xml --state xdjaz/state/tmp --encoder-counter CURRENT_COUNTER
```

Replace both placeholders with observed values. The counter is 1 only immediately after the saved two-track loader; do not assume it after navigation. The bridge logs its final encoder counter on clean termination. SIGTERM releases held inputs. Device disconnection also releases held inputs and discovery retries. No service/autostart installed. A lock prevents a second bridge, but manual pulse scripts do not honor it: never run them concurrently.

Current session log is `analysis/drm-display-clock/flx6-live.log` on Pi; it contains incoming MIDI event evidence, not sound-output validation.
