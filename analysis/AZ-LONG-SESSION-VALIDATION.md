# Next native AZ memory experiment: long-session validation

Prepared 2026-09-13 while the Pi is off. This is a test protocol and verified
Linux resource recorder, not a completed Pi benchmark or promotion of the PCM
memory experiment. No player was launched, patched, contacted or stopped.

## Decision to make

The isolated template allocator saved roughly 334–363 MiB during short two-track
playback, but written private mappings accumulate. Determine whether that saving
survives repeated use before enabling it in the visible build. Keep all existing
rendering settings identical in baseline and template tests.

Compare baseline/template in the isolated PCM stage, using the same tracks,
startup sequence, file-cache setting, analysis/cache preparation and control
sequence. Record startup/loading time as well as playback; do not silently count
settings screens or paused transports as two-track playback. Record visible app
activity separately from resources. A PSS rise can include file/decoder/UI caches
and is not automatically attributable to PCM pages.

A practical first session is 30 minutes per mode, followed by a baseline repeat
if the comparison reveals unexplained differences. It must include:

1. Load and play both known fixture tracks, verify advancing transports.
2. Repeat the same load/cue/restart sequence at recorded times in both modes,
   ensuring neither deck sits at end-of-track unnoticed. Use verified native
   controls; do not assume loops already work because they would simplify the test.
3. Include a separately marked seek/reload phase with the same track order and
   timing. Mark all intentional pauses so they cannot be confused with stalls.
4. Record ending hook state/page residency with the existing isolated metrics
   helper. Pair its private-page counts with PSS; they answer different questions.
5. Repeat digital-output comparison for the exercised sequences. Physical FLX6
   routing, underruns, mixer/FX and controller behavior need their own checks.

This document does not implement the control workload. Existing helpers verify
only bounded load/play/cue sequences; broader automated loops/seek assertions
remain work. Do not declare this whole protocol passed from a resource trace.

## Resource recorder

`record-process-session.py` uses only /proc/stat, /proc/exe metadata and
/proc/smaps_rollup. It does not read or write target memory, send input, invoke
SSH, launch a player, capture its screen or restart it. It records PSS/RSS/swap,
CPU ticks, minor/major faults, thread count and collection time into flushed
JSONL. An existing output file is never overwritten.

First inspect the explicitly selected native player's PID:

```
python3 analysis/record-process-session.py PID --inspect
```

Then use its exact start_ticks and executable hash in the recording command:

```
python3 analysis/record-process-session.py PID \
  --expected-start START_TICKS --exe-sha256 EXECUTABLE_SHA256 \
  --seconds 1800 --interval 5 --output baseline-session.jsonl
```

Replace the uppercase placeholders using the inspection result; they are not
literal runnable values. The template run gets a separately inspected PID and
`template-session.jsonl`. Use the identity from the intended isolated player,
not an arbitrary matching process. Reading smaps may require running as its user
or with existing local privileges. There is no automatic privilege escalation.

The recorder checks the expected start time, executable hash at entry and
executable inode/device plus start time during sampling. It marks an interrupted
or exited process as incomplete and retains earlier samples. It neither resumes
against another PID nor calls an unexpected exit a crash diagnosis. An eight-hour
maximum bounds recordings, with five-second sampling by default.

Summary memory growth is the endpoint change divided by elapsed time, not a
fitted leak slope. The CPU percentage uses one full core as 100%, matching prior
lab reports. OS process samples are not atomic application-state snapshots;
collection duration is recorded to reveal expensive samples. Initial warmup,
intentional phase changes, observer overhead and temperature must be considered
before comparing runs.

## Acceptance evidence

Retain both raw JSONL traces, workload/transport event records, launch settings,
firmware/shim identities and hook-state snapshots. We need sustained memory
benefit across the matched workload, unchanged digital audio, successful
transport operations and no new reproducible stability problem before promotion.
A sustained CPU or paging regression triggers investigation, not an automatic
claim that lower memory is better overall. Keep the rollback launch available.

The resource recorder itself passed five local tests: complex proc comm parsing,
missing PSS rejection, mismatched identity rejection, completed recording/output
preservation and early target exit with partial evidence. These ran against local
Python processes, not AZ or the Pi. Results: session-recorder-selftest.json.
