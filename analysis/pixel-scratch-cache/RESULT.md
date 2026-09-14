# Native Pi scratch-buffer reuse experiment — not promoted

A bounded 4 MiB scratch-buffer lease replaced per-upload temporary allocation in an isolated candidate. The original pixel converter remained unchanged. Pixel equivalence, page-boundary checks, ASan/UBSan and eight-thread nested-lease/overflow/disabled tests passed.

Seven alternating native timing rounds show essentially unchanged conversion time (~0.99–1.01x across representative rectangles). This does not justify installing the extra state and allocation retention in the live renderer. The active XImage shims were not changed. See benchmark.csv, result.json and test outputs. These conversion-only tests do not measure physical-panel flicker or full-app CPU/RAM savings.
