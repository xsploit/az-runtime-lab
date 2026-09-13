# Delay candidate with explicit processing context

`beat_delay_process` takes caller-owned DelayAudio, DelayQuantize, DelayPlayerFixture and ring explicitly. It executes the reconstructed Delay sample loop and the real reconstructed quantize/time sequence without consulting global harness state. There is no allocation or I/O in the processing path. This remains a 44.1 kHz native reconstruction; callers must provide valid time, ring and player/grid bounds and stable grid storage.

`beat_manager_delay.c` here is the isolated Off/Delay manager using that explicit processor. It is not the unified Off/Delay/Echo manager and is not wired into the live mixer.

Verification on 2026-09-12:

- `run_beat_delay_port.py`: native ARM versus candidate, x86 replay and ASAN/UBSAN replay all pass180blocks/11520frames, full manager/effect/quantize/audio/ring comparison. Host compares127051560words; native adds510round-guard words. Global cq/cp are zeroed during C processing and restored from the explicitly passed local context afterward.
- `run_beat_delay_port_initial.py`:72fresh transitions across beat/BPM bounds, allthree runs pass. Reports are beat-delay-port-results.json and beat-delay-port-initial-results.json.

No multi-effect equivalence or physical performance claim follows. Next combine distinct Off, Delay and Echo objects under one manager preserving the native direct-switch ownership and callback order documented in DIRECT-BEAT-SWITCH.md, then compare against the both-native-loop reference before enabling live Delay.
