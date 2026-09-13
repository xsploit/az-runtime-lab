# AZ native control probes

These are local research tools for the preserved EP147 with SHA256
`736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.
The launcher verifies that identity before starting debugger/control traces.
Addresses are not portable to another firmware version.

Start one isolated process from the workspace root:

```sh
NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 LAB_GDB=1 LAB_DURATION_SECONDS=70 python runtime-lab/run-az-probe.py
```

It waits for a debugger through the Unix socket printed by the launcher. No TCP
listener is created. In another terminal, choose one probe:

```sh
gdb -q -nx -batch -x runtime-lab/analysis/observe-beatfx-state.gdb
```

`observe-beatfx-state.gdb` validates the native BeatFx/setting vtables and reads
ChannelSelect and MicSelect. `observe-mic-controller.gdb` observes the widget
controller. `invoke-mic2.gdb` calls the actual mic2Button action; it changes the
private lab setting and may persist across launches. Add MIXER_TX_CAPTURE=1 to
the launcher when checking the resulting mixer command. No physical microphone
audio is exercised. The scripts use paths relative to this workspace root.

The two observation scripts and action script check the expected breakpoint
before using registers. On an unexpected stop they capture registers/stacks and
detach. The action additionally checks controller vtables before invocation.
Do not reuse printed heap addresses after the process ends or owner replacement.
Debugger pauses invalidate performance measurements.

Verified evidence:
- az-mic-native-action-verified.json: native MIC2 action returns; outgoing
  CRC-valid TX16 changes from 0 (both) to 2 (MIC2).
- az-beatfx-state-live.json: ChannelSelect7 (Master), MicSelect1 (MIC2).
- az-fx-target-labels.json: complete static target names. TX18 alone is ambiguous
  for Ch1 versus microphone choices; do not reconstruct the full target from it.

Some runs faulted or exited early. az-startup-fault-analysis.json records one
DeckState dereference fault. The later bounded diagnostic did not reproduce it;
that is not a fix. Always inspect process completion alongside probe output.

Still required: continuous observer registration/lifetime, production control
transport, full effects state, hardware input/audio, and sustained stability.

## Verified routing actions and software bridge

All addresses below apply only to the existing SHA-pinned AZ1.30 EP147. These
are guarded debugger probes at controller construction, not general production
APIs or numeric HUI EasyIDs. The scripts verify controller/listener/setting
vtables and runtime JUCE identifier names before calling a native UI action.

| Setting | Post-constructor stop | Native action | Setting update | TX field |
|---|---|---|---|---|
| Channel0 crossfader assignment | `0x19f4e7c`, controller x20 | `0x19f3b10` | `0x19f3ff8` | TX6bits6..7 |
| Headphone stereo/mono | `0x19c2fe4`, controller x20 | `0x1a03a70` | `0xaef448` | TX8bits6..7 |
| BeatFX mic selection | `0x1a16c68`, controller x20 | `0x19ebcc0` | `0x19ebd70` | TX16 |

Crossfader A/B/THRU identifiers are `0x3b864e8/0x3b864f0/0x3b864f8`;
setting enums0/2/1 become hardware1/2/0. Headphone MonoSplit/Stereo identifiers
are `0x3b86630/0x3b86638`, setting/hardware1/0. Do not pass a string pointer in
place of the identifier object. Details and initialization disassembly:
`az-routing-native-buttons.json` and `az-routing-button-name-init.asm`.

Use `invoke-crossfader-a.gdb` or `invoke-crossfader-thru.gdb`, and
`invoke-headphone-mono.gdb` or `invoke-headphone-stereo.gdb`, after starting a
fresh `LAB_GDB=1` run. The action changes persistent **private lab settings**.
A probe must reach its expected stop; crashes/layout mismatches cancel mutation.

For the full native-assignment-to-software-mixer chain, use:

```sh
NULL_AUDIO=1 OFFLINE_MIDI=1 PACED_AUDIO=1 USB_FIXTURE=1 MIXER_FIXTURE=1 ERP_FIXTURE=1 MIX_STREAM=1 DSP_GRAPH=1 NATIVE_ROUTING=1 NATIVE_ROUTING_STREAM=1 MIXER_TX_CAPTURE=1 LAB_GDB=1 LAB_DURATION_SECONDS=50 python runtime-lab/run-az-probe.py
```

In another terminal from workspace root:

```sh
gdb -q -batch -x runtime-lab/analysis/invoke-crossfader-a.gdb
```

`native-routing.log` records accepted state snapshots; `mixer-stream.log` records
the audio frame at which M1 is applied. The live bridge owns M1 state; route
complete FLX6-format MIDI through its reported midi_socket instead of running
another M1 writer. CRC-invalid/unknown assignments preserve the existing state.
Snapshots travel via nonblocking Unix datagrams, so saturation may drop updates;
the next snapshot refreshes routing. This is not a lossless button-event channel.

Native headphone mode has live setting/TX confirmation, including restart
persistence, and the optional software headphone stage now implements stereo and split modes.
Link Volume labels are known; its precise signal path and audio behavior remain
unverified. Equal-power crossfade is still lab behavior, not recovered AZ curve
selection. Physical FLX6/Pi performance and production-safe native injection
outside these construction stops remain open requirements.


## Integrated native headphone control

Add `HEADPHONE_DSP=1`, `LAB_HEADPHONE_TABLES` pointing to the private 3104-byte
lookup file and an explicit `LAB_HEADPHONE_SCALE` to the DSP_GRAPH launcher.
This compiles the recovered headphone module and enables H1 delivery in the
native routing bridge. Scale is a host-output choice, not a firmware setting.
For digital-only testing, the reciprocal of original multiplier0xc0eff755
cancels the original hardware gain/polarity; physical calibration is unverified.
Do not treat silent startup PCM as proof of audible song playback.
