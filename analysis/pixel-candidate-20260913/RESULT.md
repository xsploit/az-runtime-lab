# Pi pixel-conversion candidate: rejected on native benchmark

2026-09-13. SSH succeeded. Initial active session was BiteDJ; AZ was stopped. User then requested stopping BiteDJ; supervisor and child terminated cleanly, compositor left alone.

Native GCC -O3 build, seven alternating-order rounds. Repeated without BiteDJ after an initial run with it active. Baseline header byte-for-byte matches installed current fast24. Candidate built only in an isolated analysis directory; installed shim unchanged.

| Rectangle | Current ms/call | Candidate ms/call | Candidate/current time |
|---|---:|---:|---:|
| 1280x800 | 0.551286 | 1.208711 | 2.19× |
| 900x162 | 0.047197 | 0.172679 | 3.66× |
| 128x32 | 0.001270 | 0.005001 | 3.94× |
| 1x1 | 0.000043 | 0.000041 | 0.96× |

Correctness, guard-page and ASan/UBSan checks passed. Shared library compiled natively without ELF symbol-version dependencies. The full-screen and waveform-sized conversions regressed materially. No live AZ comparison or candidate deployment was warranted; the source handoff required meaningful native benefit first. This benchmark does not measure presentation cadence, end-to-end FPS or audio xruns. No claim is made about visual/audio changes.

Installed shim SHA-256 remains 3a1ae6be471af007832399ea6e38aff0efecb19f426ebe080de86099f1009863. Final process check found no BiteDJ/RX/AZ player. Pi was around 51°C after the tests. Account reported 14% remaining, preserving the requested 4% reserve.

Raw evidence: benchmark.csv (BiteDJ active), benchmark-idle.csv, result.json, test-result.txt, edge-result.txt, sanitizer-result.txt, abi.txt, final-state.txt.
