# RX3 Noise CFX port in AZ

Actual native manager enum2 Noise is now reconstructed, verified and integrated as F1 type2. The AZ native UI bridge is separate; local F1 delivery alone does not establish native UI synchronization.

## Native evidence and result

Unstripped `SoundColorFxNoise` constructor0xbc940 creates a112-byte object with native placement0 (pre-EQ), unlike Filter/Crush placement1 (post-EQ). Both currently share AZ's pre-fader channel stage because the host graph has no EQ yet; retain this distinction when adding EQ.

Native methods: color0xbc848, parameter callback0xbc86c (no-op), white-noise generator0xbca98, coefficient builder0xbcafc, parameter calculator0xbcc74, initialize0xbd050, execute0xbd12c. `noise.asm` preserves the inspected disassembly. The filter calls use original stereo IIR machine code under explicit coefficient/history fixtures; pointer containers and fixed preallocated scratch are test fixtures, not a claim to reproduce the original allocator.

`run_noise.py`: all256 coefficient indices plus8000 persistent audio calls,420272stereo frames,1217824 state/audio/coefficient words, zero differences ARM/x86/ASAN. An initial coefficient mismatch above index116 revealed that the resonance branch changes the frequency scale as well; that was corrected from the instructions and all tests now match.

`run_cfx_noise.py`: original CFX manager with real native Filter/IIR/Crush/Noise compared against shared AZ sources.18000calls,374000frames,2998000 numeric comparisons plus full manager snapshots, zero differences ARM/x86/sanitized. Explicit completed transitions: Filter→Noise56, Noise→Filter28, Crush→Noise25, Noise→Crush32, Off→Noise44, Noise→Off65. Existing direct Filter/Crush transitions remain covered.1825 busy requests exercised. Native Off copy/init and unrelated Sweep detector are fixtures.

## Algorithm and lifecycle

The generator carries two32-bit seeds, initially0x67452301/0xefcdab89. Each output uses the old signed second seed times2^-31, then performs XOR and wrapping addition. Consecutive values fill L/R. This is the actual recurrence, not a replacement RNG. Initialize clears feedback/filter/level state but does not reseed during effect reselection.

Color maps to integer floor-like steps through truncate(color*1023) then arithmetic shift2. The current step moves at most3 toward target each calculator call; execute may recalculate at each half block. Crossing the center clears IIR history. Coefficients, resonance and effect blend follow the exact native piecewise curves and arithmetic order.

Noise is processed through a feedback IIR. Separate parameter chasers update resonance and mix; the level ramp advances during the first half of the block and stays at its reached value during the second. Noise is added to input, so an enabled generator can produce output with silent source PCM. The Noise-specific CFX fade-in increments its own constant0x3cba2e8c toward one; it does not use the ordinary191-frame Filter/Crush fade-in. Direct transitions preserve this actual manager behavior.

The original execution splits n into two floor(n/2) halves; odd n leaves the final destination frame untouched. The general composite oracle includes those original semantics, but production graph always calls exactly64 frames at44100Hz. Do not expose arbitrary odd blocks as supported playback.

## Integration and limits

`mixer/cfx_noise.*` stores state per channel/instance and uses bounded local scratch. There is no audio-path allocation, shared random global or I/O. Shared CFX manager and F1 now support0 Off,1 Filter,2 Noise,6 Crush. Public setter validation rejects other IDs and invalid controls atomically; busy requests preserve accepted state.

`mixer/test_noise_stream.py` drives14080frames through F1 Filter→Crush→Noise→Filter with cue on a different channel. Noise master difference RMS0.005080981815323516; maximum cue error3.714e-9; commands/busy rejection pass. Existing graph/Filter replay and recovered-headphone stream tests also pass. These are PC synthetic/firmware-oracle tests, not Pi/FLX6 performance measurements.

Remaining CFX algorithms: Sweep3, DubEcho4, Space5. BeatFX Echo/Off is separately integrated;13 other BeatFX remain unported. Native AZ UI controls, EQ placement and physical mic/controller routes remain separate work.
