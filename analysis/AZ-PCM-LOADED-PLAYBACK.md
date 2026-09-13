# Template-backed PCM with two real tracks

2026-09-13. Native Pi tests in the isolated headless PCM lab. **Paced NULL
audio: transport/waveforms verified, digital audio fidelity and physical output
not measured.** Visible player24479 was left unchanged.

## Workload and controls

Read-only existing benchmark fixture contains01-Estara.mp3 and02-Dead-Wrong.mp3.
Native source/browser/encoder/load/ERP controls loaded Estara on deck1 and
Dead Wrong on deck2. Screenshots show distinct waveforms,95.0 and168.7BPM,
zero tempo adjustment, both on the same two-deck waveform layout.

An initial load attempt occurred while the folder sidebar retained focus; it
loaded nothing. After moving focus into the blue track row, both loads succeeded.
No failed/unfinished-load sample is counted as playback. The repeatable helper
pi-pcm-two-track-sequence.py includes four initial Enter pulses and verifies
both source positions are loaded and paused before sending Play.

Both runs use the original100MiB raw-file cache setting, the eight timing
patches, fractional grid and stagedXImage path. No main-allocation tracer or
recording ran during the20-second CPU/memory samples. Screenshots were taken
outside those windows. Test launches used the same isolated disk-backed
scratch directory; the template run lasted300seconds and baseline180seconds.
Time since startup/loading and analysis/cache warmup are not exactly matched.

## Observed samples

PSS is process proportional memory, not total system/kernel footprint.
CPU percentages use one complete CPU core as100%.

|20-second sample|Baseline PSS|Template PSS|Saving|Baseline CPU|Template CPU|
|---|---:|---:|---:|---:|---:|
|First playback|977.70MiB|615.03MiB|362.67MiB|45.79%|46.07%|
|After cue/restart|978.41MiB|644.11MiB|334.30MiB|44.64%|45.02%|

Both source rates stayed near44100units/sec:44091.1–44091.2 baseline and
44114.5–44115.4 template. These are bounded transport observations under the
paced fixture, not an audio clock accuracy or sync-drift certification.
All four playback windows reported zero major-fault delta and zero process
swap. Minor faults were1690/1860 for baseline/template first playback, and
784/1003 after restart. This does not isolate COW-fault latency or prove absence
of individual stalls/underruns. Earlier startup/loading did incur major faults.

Native Cue returned both to positions2058 and4704. Two-second samples confirmed
those exact positions remained paused. Native Play then advanced both normally
in another20-second sample. This verifies cue/restart; it is not arbitrary
seek, loops, reverse, scratch, beat-sync or hot-cue coverage.

## Buffer state

During template playback, the hook reported33850allocations,33850live slots,
zero storage-init error, and zero mapped-pointer reallocations. All33850views
remained mapped. Pagemap showed9268present private anonymous template pages,
zero present file-backed aliases and zero swapped pages at that snapshot.
The other views were not resident. Native data writes had privately backed
9268slots, about144.81MiB, without shrinking logical capacity.

Slot lifetime is distinct from the firmware's free-page queue: live33850 does
not mean all pages are pinned or currently contain needed audio. The current
storage implementation does not recycle written backing when pages return to
that queue. The template PSS rose about29MiB between sampled playback phases;
this increase is not attributed solely to Cue, as decoding/cache state also
progressed. Longer sessions may erode the saving. If every slot is written,
dedicated16KiBviews have higher backing cost than the original14KiBallocator
class. Safe synchronized reclamation remains necessary research.

## Evidence and limits

`analysis/pcm-pool-live/loaded-pss-comparison.json` summarizes the paired data.
Raw baseline/template-two-playing.json, -two-paused.json, -after-cue.json and
-cue-restart.json retain source positions, CPU ticks, fault counters and smaps.
template-playing-pcm-pages.json records hook ownership and pagemap counts.
baseline-two-playing.png and template-two-playing.png show the loaded views.

Template PID28634 and baseline29398 were separate native instances. This is
evidence for a substantial short-run memory reduction with similar measured
CPU demand. It is not a production-ready performance claim or proof of identical
PCM output. Next: capture and compare decoded audio, repeat loading/seek/loop
workloads, and trace a synchronized reclamation point. Do not promote the
experiment to the user's visible session solely on these short tests.
