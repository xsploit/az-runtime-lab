# Pi DSP benchmark — 2026-09-12

Actual Pi 5, native ARM64 compilation. BiteDJ stayed running. Each case used four channels of the same CFX and master Echo, 1,000 warmup blocks and 12,000 measured 64-frame blocks at 44.1 kHz. Active processor identities were asserted after warmup.

| CFX | One core equivalent | Block p99 | Maximum observed |
|---|---:|---:|---:|
| Off | 6.1% | 95.9 µs | 178.2 µs |
| Filter | 10.0% | 155.9 µs | 208.4 µs |
| Noise | 8.4% | 149.3 µs | 184.6 µs |
| Sweep | 11.5% | 193.6 µs | 362.6 µs |
| Dub Echo | 16.7% | 295.7 µs | 331.9 µs |
| Space | 6.8% | 125.9 µs | 235.7 µs |
| Crush | 9.1% | 162.1 µs | 194.1 µs |

The block audio duration is 1,451.2 µs. These are unpaced computation timings, including ordinary scheduling interruptions, not proof of meeting live audio deadlines. Graph plus Echo allocation totals 6,567,376 bytes. No AZ UI/decoder, EQ/isolator, or native headphone DSP was included. Only one setting per CFX was measured; this is not a worst-case bound.

Evidence: `pi-dsp-benchmark-verified.jsonl`, `pi-dsp-benchmark-system.txt`, `pi-dsp-benchmark-report.json`; source `../mixer/bench_pi_graph.c`. Remote files: `/home/pompu_5/az-dsp-bench-20260912`. No persistent services or audio routing were changed.
