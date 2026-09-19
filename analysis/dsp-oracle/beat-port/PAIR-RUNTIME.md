# Experimental shared BeatFX runtime

2026-09-19. This is an offline integration boundary for the native-tested
Off/Delay/Echo manager, not a replacement deployed in mixer/ or the launcher.

Run from any directory:

    python3 /path/to/runtime-lab/analysis/dsp-oracle/run_pair_runtime.py

The runner builds normal and ASAN/UBSAN binaries in a temporary directory,
records exit status and source hashes in pair-runtime-results.json, and fails
if either executable fails. Tests exercise commands, deck/master routing,
delayed impulse output, independent histories, source changes, same-deck grid
replacement, snapshot retirement and reset. Both builds pass. No listening,
Pi timing, FIFO transport or native constructor equivalence is claimed.

## Integration contract

- Allocate PairRuntime outside the audio callback (5,645,744 bytes on the tested
  host). Both rings are owned by the instance. Grid snapshots are caller-owned.
- Fixed 44.1 kHz, 64 stereo frames per target. Call begin once, then offer targets
  0..4 once each (four decks, then master). Exactly one target is processed per
  round, including when a transition changes target mid-round.
- E1 type target beat depth and P1 source bpm100 time tempo loaded quantize use
  the current mixer command grammar. RX3 type IDs 0/1/5 mean Off/Delay/Echo;
  this does not establish AZ selector mapping. Invalid commands are atomic.
  The offline parser is deliberately stricter than production sscanf parsing.
- Serialize commands and grid swaps between blocks. This API is not thread-safe.
  Text parsing is a control-thread adapter, not a realtime callback guarantee.
- Grid preparation/destruction is off the audio thread; swapping returns the
  retired snapshot. Both quantizers invalidate on replacement, even when source
  deck is unchanged. Changing sources disables the old deck's grid; returning
  to the bound source restores it. Reset retains the current binding.
- Reset clears both rings and retains requested selection/player state. Run only
  with audio stopped/on the control owner. This is lab policy, not RX3 reset parity.

## Important selection behavior

The native switch restores the destination's remembered beat setting. Sending
E1 with a new type and beat does not guarantee that beat survives the switch.
Do not change beat_pair_switch merely to hide this behavior: its current state
and audio match the native oracle. A production adapter needs an explicit policy
and tests for applying the requested beat after switching, or reporting the
restored beat to the UI. Current impulse tests deliberately allow the initial
500 ms delay. Accepted manager beat IDs also do not imply every effect supports
all of them (Delay/Echo clamp to their recovered maximum).

## Remaining production gate

The deployed mixer has consolidated Echo-only headers and LabBeatFx integration.
Do not simply add these sources to its build: reconcile types/build lists, add a
shared snapshot interface, preserve graph ordering and command semantics, then
run the existing FIFO/master/cue regressions with Delay enabled. Add native
fixtures for more player/grid histories before claiming broad parity. This work
covers two Beat FX, not all RX3/AZ DSP.
