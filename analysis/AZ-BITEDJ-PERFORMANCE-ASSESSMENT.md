# AZ and BiteDJ performance assessment

2026-09-12. This compares the experimental native AZ firmware player on the Pi with earlier BiteDJ measurements. It is not a benchmark of desktop rekordbox or stock AZ hardware.

## Evidence

The corrected earlier two-track, main-waveform application-only benchmark measured BiteDJ at 1280x800 using 11.95% of one CPU core and 581.4 MiB RSS; AZ used 44.70% and 990.6 MiB. BiteDJ's normal 1920x1200 view used 13.70% and 607.9 MiB. See PI-TWO-TRACK-COMPARISON.md. These runs used different display and audio paths, and excluded companion processes/GPU work. They establish a difference in the measured configuration, not an equal-output efficiency ratio. AZ's complete software mixer/effects were not attached.

The new dense-passage native-cue upload comparison measured original/staged/original-restored player CPU at 52.75/42.00/51.50% of one core and Xwayland at 16.75/12.25/16.50%. Combined, that is 69.50/54.25/68.00%, about 21% lower than the mean of the original phases. Same player, source cue and drawing content; no recorder during the four-second CPU samples. These are short samples, not a sustained performance guarantee. Both source positions advanced at approximately 44,100 samples/sec. Playback uses paced null audio and does not validate audible output or underruns.

The latest memory breakdown is 973,504 KiB RSS (950.7 MiB), with 919,424 KiB anonymous memory (897.9 MiB) and no process swap. Roughly 94% is anonymous working allocation. The snapshot cannot identify how much is live buffers, caches, allocator retention or thread stacks, nor demonstrate a leak. Removing mapped libraries would not address most of this footprint. The separately captured system snapshot showed about 1.64 GiB available and Xwayland around 95 MiB RSS.

## Interpretation and next targets

Visible UI complexity alone is not a sufficient explanation. The compatibility path includes CPU image conversion and X11 uploads. We have also independently found mismatched position/repaint timing and split image uploads; average CPU usage alone does not describe frame pacing. These findings identify specific overhead and presentation problems in this setup, not a verdict that the vendor's entire engine is poorly engineered.

CPU reduction is already demonstrated for the upload experiment without simplifying the image. Memory reduction remains unproven. Next useful memory work is attributing anonymous allocations to live versus retained allocator memory, then testing bounded cache/arena changes while checking load latency and playback. Do not indiscriminately remove worker threads or shrink audio buffers; either can exchange lower resource usage for stalls or underruns.

Current conclusion: BiteDJ is lighter in the measured configuration; AZ has recoverable presentation overhead. Matching BiteDJ's total footprint and smoothness remains an open question.

Follow-up cache experiment: reducing five raw-file caches from100 to32 MiB lowered allocator allocated accounting by about360 MiB, but startup/loaded RSS stayed approximately922/963 MiB. Both decks advanced at normal source speed; null audio and short tracks only. Restored100 MiB defaults. This is not a demonstrated physical RAM optimization. See AZ-FILE-CACHE-CAPACITY.md.
