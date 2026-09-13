# AZ waveform position input path

Pinned EP147 v1.30 SHA256736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6. This investigation follows the observation that the seven-instruction timing candidate doubles scheduler callbacks but not distinct waveform images.

Confirmed static direct call chain:

- `0x1b942e8` retrieves a position through owner vtable slot+0x50 at`0x1b94380`, stores the returned64-bit value at stack+0x68.
- `0x1b94430` passes a reference to that stack value into`0x1b93a28`.
- Blue variant branch calls`0x1b976f0` at`0x1b93cc0`, forwarding the reference as x6.
- `0x1b976f0` saves x6 to x26; grid drawing later reads its value to calculate integer offset.

At the first live breakpoint, widget0x7fff0981c0a0 had zoom0.0625 and a stack position reference0x7ffff32a76a8 containing183334. That stack address is temporary and MUST NOT be sampled as persistent playback state after the call. GDB unwinding failed (no correct executable symbols), so incidental stack words were not accepted as a call chain. The separate direct-BL scan and disassembly establish the chain above.

Live slot+0x50 resolved to`0x1b8e580`, owner0x7fff0981c010, vtable0x2b6f208. The getter's observed branches read:

| Branch | Source relative to owner | Returned field |
| --- | --- | --- |
| Default | pointer at+0x19808 | pointee+0xf8 |
| Mode1 | pointer at+0x19848 | pointee+0xe0 |
| Mode2 | pointer at+0x19848 | pointee+0x108 |
| Special branch | lookup via pointer+0x19828, key9 | lookup result+0x30 |

Mode is read from the+0x19848 pointee at+0x1c8; special branch additionally checks lookup type/flag and the+0x19858 pointee's byte+0x150. Their user-facing meanings are not yet identified.

A second live breakpoint at the branch loads confirmed the default branch (`0x1b8e5f0`) for this state, pointee0x7fff3e694f10, persistent field0x7fff3e695008 containing183334. These are PID9262 session addresses only. Playback was at end-of-track by these observations: this establishes source ownership, not its update cadence or a timing cap. Units look consistent with milliseconds but must be verified during known moving playback before treating that as proven.

Next: reload/verify motion, sample the default position field along with scheduler timestamps, then compare under original and candidate schedules. This separates input freshness from renderer invocation rate without high-frequency stop/start breakpoints. If the field is stale, trace its writer; if it is fresh, inspect widget update selection and final image upload. Do not modify playback position merely to make animation look faster.

Artifacts: `az-waveform-update-entry.asm`, `az-waveform-update-caller.asm`, `az-waveform-position-source.asm`, `az-position-getter.asm`, `az-waveform-update-callchain.json`, `pi-az-waveform-input.txt`, `pi-az-position-getter.txt`, `pi-az-position-storage.txt`. `find-direct-callers.py` is a reusable ELF64/AArch64 BL scanner; it does not find indirect calls.

## Position cadence measured during playback

After reloading and waiting for the helper to finish, `pi-position-rate-experiment.py` ran original/candidate/restored six-second samples. It retains the timing experiment's executable/byte/starttime guards, validates the owner vtable and default-mode selector, rereads its persistent pointee, and samples position with repaint/blit fields every~1ms. Owner address remains session-specific. No ffmpeg capture overhead in this test.

| Phase | Repaint changes/sec | Position changes/sec | Median position increment |
| --- | --- | --- | --- |
| Original | 29.692 | 29.692 | 34 |
| 59Hz candidate | 59.275 | 29.721 | 34 |
| Restored | 29.725 | 29.725 | 34 |

Position progressed26869→32879,33302→39312,39752→45774 across the three phases, about1002–1006 units/sec. This strongly supports millisecond units at normal speed, with endpoint/sample phase explaining slight excess; absolute unit definition still comes from the accessor conversion. Reports `az-position-rate-fields-*.json`/`az-position-rate-summary.json`; summarizer preserves observed versus native timestamp distinctions. Original scheduling instructions restored.

The field did NOT double its freshness under the faster scheduler. It is a real upstream limitation for drawing from this cached position, without establishing that the engine's underlying audio position is also limited to30Hz.

## Hardware watchpoint identified the cache writer

A short GDB hardware watchpoint hit the position write at`0x1fbd8ec` (reported PC immediately afterward`0x1fbd8f0`) on main thread. It copies object+0xe0 into+0xf8. Current pointee0x7fff3e694f10, storage0x7fff3e695008; value83269→83289 during the debugger observation. That single perturbed interval is NOT a cadence measurement.

The enclosing snapshot routine starts`0x1fbd680`. At`0x1fbd6d4` it calls`0x1493718` with its incoming x1 object, stores returnedposition in+0xe0, and later publishes it in+0xf8. `0x1493718` normally reads source+0xe8 and multiplies by a double at source+0x20, with sentinel/rounding logic and an alternate branch selected by source bytes+0x31/+0x32. Units and alternate semantics need further tracing. The snapshot function's sole static directBL caller is`0x1fc9b00`; indirect callers remain possible.

Saved `pi-az-position-writer.txt`, `az-position-snapshot-writer.asm`, `az-player-position-accessor.asm`, `az-position-snapshot-callers.json`. Next resolve source-object ownership and the snapshot caller's update scheduling; do not replace real player state with invented position interpolation before accounting for pause, seek, reverse, loops and tempo changes.

## Snapshot dispatch chain and zoom demonstration

Static BL tracing extends the chain: `0x198728c` calls `0x1fcc4f0`, which walks four 16-byte entries and calls `0x1fc9b70` at `0x1fcc508`. The latter obtains a source via virtual methods and calls `0x1fc9a80` at `0x1fc9bcc`; that routine updates multiple snapshot components including position at `0x1fc9b00`. This establishes the four-entry polling path, not its scheduling frequency or source freshness. See `az-snapshot-dispatch-callers.json`, `az-four-deck-poll-callers.json`, and corresponding disassemblies.

During PID9262, mixer encoder counter sequence 3,4,3,2,1 with five-second holds demonstrated zoom in/out. Final screenshot `az-zoom-demo-end.png` confirms restored 32/64/96 labels; earlier counter2 screenshot had16/32/48. Playback-position sampling afterward advanced4994 units over4.99712 seconds (999.38/sec), with zero negative steps. No audio-output measurement was made.

User reports improvement with linear scaling but residual apparent red-grid and possibly waveform wobble. Six-second native X11 crop620x82 at420,89 produced719 samples. `analyze-wobble-rows.py` found113 grid changes, all exact one-pixel left translations, no rejected grid matches. Three waveform rows changed178 times each, but none met the95% exact-color translation threshold. Thus waveform translation is **inconclusive** with this matcher, not evidence of reverse motion or absence of wobble. Native grid results do not rule out physical display/scaling artifacts. Summary `az-wobble-rows.json`; temporary raw capture `/tmp/az-wobble.nut`. No additional timing patches enabled.

## Resolved: separate LocalPlayer refresh timer

See [AZ-POSITION-TIMER-BREAKTHROUGH.md](AZ-POSITION-TIMER-BREAKTHROUGH.md). The four-deck poll belongs to the known main display callback; the independent 33 ms limiter sits upstream in LocalPlayer's JUCE timer. Changing that interval to 16 ms together with the main repaint candidate produced 59.12 distinct native waveform crop updates/sec, versus approximately 30 before and after restoration. This does not establish physical wobble or audio correctness. All experimental values were restored.
