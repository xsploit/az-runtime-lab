# AZ four-deck PC reproduction

Use the preserved local firmware and existing launcher dependencies. Run from workspace root:

```sh
NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 ERP_FIXTURE=1 AUDIO_CAPTURE=1 LAB_DURATION_SECONDS=120 python runtime-lab/run-az-probe.py
```

Observe the private display reported by the launcher. Wait for SOURCE. Click Local Library (750,190 at1280x800), wait for the transient OneLibrary warning to disappear, then select the tone row(330,155). Do not inject loads while the warning is displayed. Send:

```sh
python runtime-lab/analysis/send-mixer-load.py --deck 1 --deck 2 --deck 3 --deck 4
```

Wait until all four decks show the loaded track and10-second duration. Initial primary groups address decks1/2. Send play group0, play group1, secondary group0, secondary group1, then play group0 and play group1 again using `send-erp-button.py --button NAME --group N`. Each command emits baseline/press/release to the private ERP FIFO. This sequence starts decks at different times. Four-deck display is selected using the native top4-DECK tab(343,34); setting persists in lab state.

After tracks finish, run `check-az-four-decks.py` for stereo-pair active overlap; `check-az-tone-capture.py --channel N --label NAME` checks tone fidelity on pairs beginning1,3,5,7. Preserve state/tmp/az-output.raw before another run overwrites it. Format44100Hz, float32LE,10 interleaved channels. FIFO injection fails once scheduled teardown closes the reader; this is expected and not a firmware crash.

Verified capture: first-four-deck-output.f32le.gz, four-playing.png, az-four-deck-overlap.json. Each deck produced9.999977seconds, shared overlap6.843515seconds. Identical source tone means this is not a distinct-track isolation test. Next acceptance gates are distinct signals, software master/cue routing, real controller audio, and Pi scheduling/performance.


Native ON AIR indication can now be exercised after loading:

```sh
python runtime-lab/analysis/send-mixer-onair.py --mask 8
python runtime-lab/analysis/send-mixer-onair.py --mask 0
```

Masks use bit3 for internal channel0, bit2 for1, bit1 for2, bit0 for3; the sender moves them to packet byte94's upper nibble. Deck1 red badge was visually verified both paused and playing. This is a diagnostic sender: every other packet field is zero, so it is not suitable for simultaneous live controls. A production bridge needs a single shared full mixer-state packet to avoid one control update clearing another. Setting ON AIR does not make the deck audible or implement headphone cue routing.
