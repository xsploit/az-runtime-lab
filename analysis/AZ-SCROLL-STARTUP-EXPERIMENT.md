# Restartable AZ scrolling experiment

2026-09-12. This extends the live memory experiment documented in
[AZ-POSITION-TIMER-BREAKTHROUGH.md](AZ-POSITION-TIMER-BREAKTHROUGH.md).

## Startup configuration traced

`0x1e262e0` builds the player-info configuration. Instruction `0x1e262e8`
loads 30 into w1, then `0x1e26310` stores it at configuration+8. The collection
factory forwards it through stack+0x58 into w5 at `0x1e1b554` or `0x1e1b7ac`.
LocalPlayer factory `0x1e23438` saves w5 at stack+0x9c, reloads it into w1 at
`0x1e236e0`, and calls `0x239d2e0` at `0x1e23700` when positive. That JUCE
helper calculates integer `1000 / Hz` and tail-calls startTimer.

Thus the default 30 Hz request produces 33 ms; changing the request to 60 Hz
produces 16 ms. The enabled/disabled branch is preserved. This change is scoped
to this player-info configuration, not the common timer implementation.

## Implementation

`runtime-lab/az_scroll_overlay.py` creates a private temporary executable from
the exact pinned original. It validates the full input SHA256, maps virtual
addresses through executable ELF load segments, checks all eight original
instructions, and changes the startup frequency plus the seven established
display-policy instructions. The input is never written. No device keys,
firmware image or proprietary binary are included in this module.

`run-az-pi-probe.py` and `run-az-interactive.py` accept the explicit experiment:

```
LAB_AZ_SMOOTH_SCROLL=1 LAB_VSYNC_HZ=59.24
```

These supplement the existing launcher settings; they are not a standalone
launch command. The launcher read-only bind-mounts the temporary executable over
the original path inside the player's namespace. The temporary-directory owner
is retained for the launch and cleaned up by Python on normal shutdown. Abrupt
termination can leave a private temporary directory; it does not change the
source firmware. To disable the experiment, restart with LAB_AZ_SMOOTH_SCROLL
unset. Existing address-based probes that require the original running SHA will
correctly reject this overlay until explicitly adapted.

Overlay SHA256:
`137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c`.
Original SHA256:
`736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.

## Validation

- Local build changed exactly 18 bytes within eight specified instruction words.
  All other bytes and the original input were unchanged. Disassembly confirms
  the new startup instruction is `mov w1, #60`. Unknown input was rejected, and
  explicit temporary cleanup removed the generated executable.
- Fresh Pi launch: launcher PID 13300, actual EP147 PID 13308. All four freshly
  constructed LocalPlayer objects had interval 16 ms without a debugger or
  session-address patch. `/proc/13308/exe` matched the overlay SHA.
- With Estara and Dead Wrong acapella playing, a 30-second memory sample measured
  repaint 59.236 Hz, both source positions 59.203 Hz, and both positions advancing
  999.812 units/sec with no negative steps. Player CPU averaged 42.66% of one
  core. Two six-second capture processes overlapped part of that memory sample;
  this CPU value is not directly comparable with the previous single-deck test.
- Simultaneous native waveform crop captures yielded 721 samples each and
  58.84/58.83 distinct changes/sec. Median intervals were 16.669/16.666 ms;
  maximum gaps were 33.441/38.047 ms. This is not perfectly uniform presentation.

- Native ERP pause/resume check: both source positions remained exactly unchanged
  for two seconds while paused, then advanced after resume. Both decks were left
  playing. Original source hash rechecked unchanged, TracerPid 0, temperature
  58.4 C at final check. See `az-scroll-pause-resume.json`.

Artifacts: `az-scroll-overlay-manifest.json`, `az-scroll-startup-timers.json`,
`az-scroll-two-deck-memory.json`, `az-scroll-two-deck-pixels.json`,
`az-scroll-deck{1,2}.framemd5`, and startup/frequency disassemblies.

The current fixture still uses paced null audio. These checks establish visual
content and source-position cadence, not audible output, sync accuracy or
controller readiness. Optical evaluation, integer-grid shimmer, longer-load
tests, seek/loop behavior and full mixer integration remain open. The original
firmware remains untouched; the experimental overlay is running for inspection.
