# Native channel EQ and isolator port

## Verified in this pass

`run_eq_control.py` compares the original ARM EQ and isolator volume callbacks with `eq_control.c`: 48,000 setter pairs across three bands, including 1,549 repeated targets and independent mid-ramp states. ARM, x86 replay, and ASAN/UBSAN each report zero mismatches across 9,792,000 state bytes.

`run_equalizer.py` and `run_isolator.py` each compare 8,000 original composite audio blocks (195,389 frames), sizes 1, 2, 3, 7, 31, 63 and 64. Each includes controls, repeated history resets, silence, asymmetric stereo input and block continuity. Output, every filter coefficient/history, all scratch storage and complete control ramps match bit-for-bit on ARM, x86 replay and ASAN/UBSAN. EQ additionally compares cached coefficient indices. Reports are `eq-control-results.json`, `equalizer-results.json` and `isolator-results.json`.

The original processor and setters execute in the oracle; virtual filter calls invoke the original verified ARM stereo IIR. Host implementations use the independently reconstructed recurrence. Test fixtures include two extra input/scratch frames for the original SIMD read-ahead. The subsequent constructor and channel tests below extend this boundary. JUCE string bookkeeping is replaced by no-op hooks, while original DSP constructors and resource initializers execute with tracked allocations.

The verified routines are now landed in `mixer/channel_eq.c/.h` and the opt-in `dsp_graph.c/.h` attachment. **Stream command delivery, native AZ EQ control synchronization and Pi validation remain pending.** Constructor, channel mode transition and CFX reset timing now have native oracle coverage as detailed below. An attached graph now distinguishes pre-EQ Noise/Sweep, post-EQ Filter/Crush and post-fader Dub Echo/Space. Existing unattached behavior is preserved.

## Actual native processing

Addresses refer to the private RX3 `rbp`, SHA256 `60bcbd8876116bf09f0d8f747f95d7c7d3081ebd39d6fe14d56005a22f7f3b09`.

| Behavior | Address | Evidence |
|---|---|---|
| EQ execute | `0xb97c8` | Three cascaded IIR stages; change-point segmentation using previous cached indices |
| EQ reset | `0xb9d14` | Clears three IIR histories, preserves controls and smoothing |
| EQ knob mapping | `0xb9d88` | `uint16(uint32(.5 + value*255))`; repeated target does not restart ramp |
| EQ constructor | `0xba068` | All cached indices 127; index smoothers initially 0/done, step magnitude 1, timing 14 samples |
| Isolator reset | `0xba450` | Clears eight IIR histories, preserves gains |
| Isolator execute | `0xba518` | Parallel high/mid/low branches with 2/4/2 cascaded IIR stages, then stereo gain sum |
| Isolator knob mapping | `0xba758` | Gain lookup; retarget step computed from `current + old_step` |
| Isolator constructor | `0xba978` | Gain initial bits `0x3eb5a965`; ramp length truncates rate*3.3/1000, minimum 1 |
| Isolator gain lookup | `0xbae24` | Integer `.5 + value*255`, no generic gain law |
| Channel EQ setter | `0x9ecdc` | Stores and converts every band value in both processors, including inactive mode |
| Channel mode setter | `0x9ed58` | Valid modes 0/1; repeated request no-op, changed request begins mute ramp |

EQ coefficient banks are three contiguous 256-by-5-float tables at `0x425650`, `0x426a50`, `0x427e50`: 15,360 bytes total. Native processing updates smoother state once per sample but applies coefficients in runs of equal cached indices. The final segment intentionally uses the previous cached index before updating it. A generic per-sample coefficient update would differ. The oracle includes the initial cached/current disagreement.

Isolator gain lookup is `0x42a2f8..0x42a6f8`, not the dB display table. Four fixed coefficient sets at `0x42a6f8`, `0x42a70c`, `0x42a720`, `0x42a734` feed filters in pairs. The high and low branches use two stages each. The mid branch uses the middle two pairs. Each sample is `(high*gain0 + mid*gain1) + low*gain2`; then the three gain ramps advance. Stereo SIMD arithmetic flushes subnormals, preserved by the reconstruction.

The test scripts extract these private fixture files from the verified local ELF. Native instruction/table blobs and binary replay records are ignored, and are not public source content. A future production loader can use one immutable startup-loaded table object shared across four channel instances, with all mutable histories/ramp/scratch state per channel and no audio-thread allocation.

## Constructor and channel composition verification

`run_eq_ctor.py` executes 320 original EQ/isolator constructors (160 in direct snapshots and 160 owned by channel construction) and resource initializations across eight sample rates (1, 1,000, 12,345, 32,000, 44,100, 48,000, 96,000, 192,000). Original second-order IIR construction and coefficient setters also execute. Canonical DSP state, coefficients, histories, smoothers and buffers match the reconstructed setup on ARM/x86/ASAN with zero differences. Original string bookkeeping is stubbed, and all allocations are tracked/freed. The original MixerChannel constructor additionally supplies 80 mode-state snapshots: requested/active mode, pending bit and full gain ramp. InputChannel, GPIO, route registration and CFX constructor bookkeeping are stubbed for that mode-only constructor check; no unrelated platform behavior is claimed.

`run_eq_channel.py` combines original channel updateFilter, mode and volume setters with the actual original EQ/isolator constructors, audio and reset callbacks. Eight thousand blocks / 195,389 frames, 55 EQ resets and 55 isolator resets all match output and full canonical processor/mode state on ARM/x86/ASAN. CFX and BeatFX are explicitly disabled in that suite; mode initialization follows the verified native constructor: zero current/target/step, done=true and pending=true. Mode ramp length is trunc(rate*2.9/1000), minimum one sample: 127 at 44.1 kHz. This differs from the isolator knob ramp of 3.3 ms. The first block remains muted, then resets the selected EQ and begins its fade-up.

`run_eq_cfx_channel.py` adds the actual native CFX manager and original channel insertion logic, with identity Filter/Sweep algorithm callbacks deliberately isolating lifecycle/reset placement. Both audio and complete manager/EQ/mode state match for 8,000 blocks / 195,389 frames: 78 CFX reset events amid concurrent mode switches; 88 total EQ and 106 total isolator reset callbacks. This verifies event ordering, not a new full CFX-algorithm composite; the actual CFX algorithms have their separate full-state native tests. BeatFX remains disabled here.

Band indices are **0 HIGH, 1 MID, 2 LOW**. The original constructor strings at `0x429aa8`, `0x429ab4`, `0x429ac0` are `EqHighGain`, `EqMidGain`, `EqLowGain`; isolator strings at `0x42a7c8`, `0x42a7dc`, `0x42a7ec` confirm the same order. An interface presenting LOW/MID/HIGH must explicitly reorder values.

`eq-channel.asm` contains `MixerChannel::changeEqualizerMode` and `updateFilter` through `0x9e890`.

Mode 0 selects EQ, mode 1 isolator. Changing the active processor clears that processor's IIR history. A normal `setEqualizerMode` request stores requested mode at channel+432, sets pending byte+436, and ramps channel+440's stereo gain toward zero. Like the isolator setter, the next step derives from current+old_step.

`updateFilter` first runs the active EQ across the block. If a transition is pending or the ramp is unfinished, `0x9e67c..0x9e6dc` advances the mode ramp **before** multiplying each sample. When the fade-down has completed, at block end it retargets the ramp toward one, clears pending, selects the newly requested processor and resets it. Thus a completed mode switch affects the next block's EQ, not an arbitrary sample mid-block. Retargeting during both fades, repeated requests and invalid mode values are included in the native channel composite cases.

## Insertion and remaining integration

Native channel order in `eq-channel.asm`:

1. CFX position 0 (Noise/Sweep), corresponding BeatFX position 0.
2. Active EQ/isolator and its mode-switch gain.
3. CFX position 1 (Filter/Crush), corresponding BeatFX position 1.
4. Channel fader.
5. CFX position 2 (Dub Echo/Space), corresponding BeatFX position 2.

The existing graph's four channel buffers can support this order, but the raw input and processed output must be separate because the verified IIR contract requires distinct buffers. Preserve graph default dry behavior until explicit EQ attachment/configuration. Both EQ processors receive each knob value; only the selected processor processes samples. Reset only the selected history for the Filter-to-Sweep event, at the actual manager callback point, rather than clearing both processors indiscriminately.

Still required: map native AZ control values and startup knob snapshot delivery; implement private fixture loader and opt-in graph API; consume `eq_reset_requests` with the verified ordering; test all four independent channels and full CFX cross-mode transitions in production FIFO. Parent owns `mix_stream`, commands, launcher source list, and native UI bridge. Shared files have now landed and been released to the parent after verification.


## Running the oracle sequence

From the workspace root, run these scripts under `runtime-lab/analysis/dsp-oracle/`: `run_eq_control.py`, `run_isolator.py`, `run_equalizer.py`, `run_eq_ctor.py`, `run_eq_channel.py`, then `run_eq_cfx_channel.py`. Later scripts use instruction/fixture assemblies generated by earlier ones; they additionally require the established original `native.S` IIR and `manager-native.S` CFX oracle fixtures. Binary fixtures remain ignored. These scripts verify this exact private RX3 ELF hash and do not download or redistribute firmware.


## Shared integration API (landed)

One immutable `LabEqTables` startup fixture contains `coefficients[3][256][5]`, `isolator_gain[256]` and `isolator_coefficients[4][5]` (16,464 bytes). It is borrowed for the graph lifetime, like the private headphone tables; no coefficient bytes are embedded in the public module. One `LabChannelEq` per logical deck owns every history/ramp/scratch buffer. The shared module is `channel_eq.c/.h`, with private internal equivalents of the verified `eq_control`, `equalizer`, and `isolator` routines.

Graph attachment: `lab_dsp_graph_attach_eq(graph, tables)`, opt-in only. Native state initialization is preserved; initial AZ knob snapshots should arrive explicitly rather than silently constructing neutral coefficient histories. Control snapshot: `lab_dsp_graph_set_eq(graph, channel, mode, high, mid, low)` validates the whole finite normalized input before mutation and returns accepted/invalid. Mode setters natively accept retargeting, so there is no artificial busy rejection. The caller's snapshot is sent to both active and inactive EQ processors.

Per block, capture CFX insertion position before processing; run position-0 CFX and consume its reset event, process active EQ plus mode ramp, then run position-1 CFX and consume its reset event; retain existing post-fader effects and BeatFX routing. A reset event clears only the processor selected at the event point. The combined original-channel oracle proves consuming the counter immediately after the CFX manager returns gives the same EQ state and output as the native callback, including when a mode switch completes earlier in that block.

Parent owns stream command parsing, launcher source list and UI bridge. Graph and module edits are complete; parent retains stream/launcher/control ownership.


Shared graph evidence: `eq-shared-results.json` and `eq-graph-results.json`. Four-channel differential testing covered 153,600 frames, 132 CFX requests and 21 selected-history resets, exactly matching isolated EQ reference state/audio and actual CFX processors. Host and sanitizers pass. Separate EQ+Dub Echo/Space tests preserve cue and EQ state while tails survive fader closure; existing no-EQ graph/native Filter replay passes. Shared graph size is 3,763,992 bytes on the tested 64-bit build without headphone macro.

A ready **private, ignored** startup fixture is `native-channel-eq-tables.bin`: concatenate `native-equalizer-tables.bin` (15,360 bytes) followed by `native-isolator-gain.bin` (1,104 bytes). It matches the `LabEqTables` layout exactly. This is a local testing artifact, not public source content.
