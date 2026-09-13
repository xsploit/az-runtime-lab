# AZ v1.30 display scheduling map

Evidence applies to EP147 SHA256
736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6.
Addresses are ELF virtual addresses, not file offsets. Runtime object addresses
in probe results are process-specific and must not be reused after restart.

The main timer constructor (0x212f768) stores `1000 / requested_hz` at +0x58.
The factory caller at 0x2101dd8 supplies 59.24 Hz (double at 0x2e33a40).
Live memory confirmed period 16.88048615800135 ms.

| Field | Observed role |
|---|---|
| +0x30..+0x48 | std::function callback storage/manager/invoker |
| +0x50 | X11-side timer object |
| +0x58 | nominal display period in milliseconds |
| +0x60 | vsync file path storage |
| +0x68 | last synthetic/hardware vsync, converted from nanoseconds to ms |
| +0x70 | current CLOCK_MONOTONIC time in ms |
| +0x78 | timestamp updated after repaint callback/rescheduling |
| +0x80 | timestamp recorded by onImageBlit |

The main callback at 0x212fb40 computes the difference between floor-divided
current and previous repaint times relative to the latest vsync. If that
count is <=1 it waits instead of invoking its callback. After invoking, it
reserves the X11 timer for the next boundary and itself for another period
beyond that. This is a two-stage policy, not a simple 59.24Hz repaint loop.

The std::function invoker at 0x1986a78 calls its captured object's virtual
slot +0x10. Live resolution led to 0x1987038. The second word in the small
function storage is NOT necessarily a callable address.

The X11 timer callback is 0x24fb350. It first registers its timer through
0x21b59d0 and asks the display hook for a remaining delay through0x21b59b0.
A nonzero result causes rescheduling at 0x24fb478, before upload work.
This hook lives in the global at0x3bd6708. Live vtable0x2e41590 resolves:

- slot0 ->0x212f608: onImageBlit adjustment thunk.
- slot8 ->0x212f3c8: timing-delay adjustment thunk to0x212f300.
- slot16 ->0x212fce0: store the X11 timer into enclosing object+0x50.

The delay calculator0x212f300 applies another >1 tick test, relative to the
previous blit timestamp+0x80. It returns zero if the threshold has passed;
otherwise it computes an integer delay to the relevant future boundary.

The X11 timer checks pending events/dirty regions, then0x24fa6f0 performs
paint/upload work. The shared-memory branch calls XShmPutImage at0x24fabc4;
the fallback calls XPutImage at0x24faca0. Following upload,0x21b5990 dispatches
onImageBlit through hook slot0. This denotes an X11 upload notification,
not proof that a complete frame has reached the physical panel.

Eight seconds of read-only live field sampling found approximately32repaint
updates/sec and24blit updates/sec, with repaint median32.83ms and blit
median37.13ms/p9554.54ms. This was without a screenshot capture workload;
playback state was not separately verified for that sample.

The packed24 conversion shim removes a demonstrated CPU hotspot but did not
improve the initial waveform capture (~20Hz changes). Investigate scheduling
separately. A short original-vs-half-period runtime experiment is reversible
and must restore the original field in finally; no firmware bytes are patched.

A moving A/B/A sequence now supports the scheduling hypothesis: original19.25Hz, half-period28.60Hz, restored20Hz sampled waveform changes. See az-period-aba-results.json for limits. Original period was restored after testing; no permanent scheduler change is enabled.

## Synthetic clock experiment

`SyntheticVsync` in `display_timing.py` uses rational Hz and monotonic integer
nanoseconds. It calculates the latest elapsed tick from an epoch and skips
missed ticks. The next deadline is rounded up, so it is always future; the
published timestamp is rounded down and never future. This simulates timing,
it does not track physical vblank.

For a bounded live comparison the launcher process alone can be stopped while
its AZ/Xwayland children continue, letting exactly one temporary writer supply
the timing file. Stop the temporary writer before resuming the launcher. Always
resume on exception/signals and verify the launcher is running afterwards.
This is a lab experiment, not a production lifecycle design. Compare stationary
and moving captures explicitly; ended tracks are not valid waveform benchmarks.

The clock-only A/B/A produced20.125Hz ->29.595Hz ->19.875Hz pixel changes with native period unchanged. Absolute59.24Hz reduced sampled maximum gap from100ms to41.789ms. Optional LAB_VSYNC_HZ=59.24 now selects the epoch-anchored publisher in PC/Pi launchers; omission preserves legacyrelative60Hz for comparisons. This does not connect to compositor vblank.
