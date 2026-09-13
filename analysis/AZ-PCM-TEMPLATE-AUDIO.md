# AZ PCM template: decoded audio comparison

2026-09-13. The baseline and template-memory AZ produced **bit-for-bit identical
30-second, ten-channel float32 captures** for Estara and Dead Wrong. Both decks
contained nonzero audio; channels 4–9 were silent in both versions.

## Method and scope

Two separate native Pi launches used the isolated `pcm-startup-test` directory,
its own settings and Xvfb, and the same read-only benchmark USB fixture. Baseline
PID 30028 and template PID 30460 each completed their bounded 75-second launch
with exit 0. Hook-state evidence verifies the template was installed with the
full 33,850-slot pool. Native controls loaded both tracks, confirmed paused
positions, and started both transports; the measured source progression was
approximately 44,100 units per second.

ALSA file capture retained ten channels of 44.1 kHz float32 little-endian decoded
output while using a paced null sink. Each full capture was hashed, then cropped
to 30 seconds beginning 0.1 seconds before its first active sample. The full raw
files were removed after saving their hashes; compressed cropped audio and
metadata remain private in `pcm-pool-live/`.

The comparator rejects nonfinite samples and incomplete frames. It searches for
an independent integer-frame alignment for each stereo deck, with no resampling,
gain adjustment, or time warping. Self-tests recovered offsets of +137 and -97
frames and detected a deliberately changed sample.

## Result

| Measurement | Deck 1 | Deck 2 |
|---|---:|---:|
| Compared frames | 1,323,000 | 1,323,000 |
| Duration | 30 seconds | 30 seconds |
| Candidate offset after capture cropping | 0 frames | 0 frames |
| Differing float32 samples | 0 | 0 |
| Peak absolute / RMS error | 0 / 0 | 0 / 0 |
| Signal RMS | 0.170475 | 0.074149 |

Both complete cropped ten-channel streams have SHA256:
`34e486b707cb1ba7f42b8cd44f9735b166689ab5d15531749dc7643a318adbde`.
All samples were finite. All six unused channels had peak amplitude zero.

This verifies decoded digital output for this short two-track sequence. It does
not establish FLX6 or speaker output, hardware underrun behavior, full mixer/FX
fidelity, or long-session stability. The visible AZ PID 24479 was left unchanged.
Earlier loaded memory measurements are in `AZ-PCM-LOADED-PLAYBACK.md`; this test
does not replace those measurements with a new performance claim.

## Evidence and reproduction

- `pcm-pool-live/{baseline,template}-audio-capture.json`: capture boundaries and hashes.
- `pcm-pool-live/{baseline,template}-audio-hook-state.json`: installed hook and pool state.
- `pcm-pool-live/{baseline,template}-audio-two-{paused,playing}.json`: transport checks.
- `pcm-pool-live/template-audio-comparison.json`: full sample comparison results.
- `pcm-pool-live/audio-comparator-selftest.json`: comparator checks.
- `pi-pcm-audio-run.py`: bounded isolated capture runner.
- `compare-pcm-template-audio.py`: local NumPy/SciPy comparison, accepting baseline
  gzip capture, candidate gzip capture, and output JSON as its three arguments.

## Next memory-lifetime lead

Read-only tracing identified `Pool<Page>::push` at AZ VA `0x7734d0`, supported by
the diagnostic string at `0x25f0920`. Nine direct BL callers were found and saved
in `pcm-pool-live/pool-push-callers.json` and `pool-push-disassembly.txt`.
The short normal path publishes a page pointer into the deque and advances its
finish pointer. It has no lock instruction itself; caller synchronization and
post-return payload use still require tracing. No page reclamation was added.

Reclaiming a returned template page could preserve savings during long sessions,
but only after proving that no reader retains its payload and establishing the
correct synchronization boundary. Existing written mappings remain private;
short-run savings are not a guarantee of sustained savings.
