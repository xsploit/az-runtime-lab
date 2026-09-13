# Native waveform fraction and contrast-blend experiment

2026-09-12. Pinned AZ1.30 EP147, SHA256736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6.

## Method

`probe-az-waveform-fraction.py` loads the original code and required literal pages into a temporary standalone AArch64 executable. Clang and lld build a libc-free syscall harness; qemu-aarch64-static executes it. Entry0x1e00e44 bypasses the unrelated virtual provider query. Exit0x1e00ed4 is redirected after fraction/coefficient setup; a second isolated entry0x1e0141c executes the original high-contrast RGB blending, exiting0x1e01480 before alpha/column traversal. The hash is checked before extraction. Proprietary code remains temporary and is not embedded in this source.

6003 samples cover integer positions-1000..1000 at zoom0.125,0.5,1.0;3000 have negative positions. These are constructed inputs, not live playback frames. Caller branch selection, waveform sample retrieval, alpha/height processing, image rasterization and presentation are NOT executed. Therefore this is an oracle for the selected fragments, not a full-renderer equivalence test.

Native selection yielded ten coefficient pairs. The high-contrast blend for each byte is:

    min(max(a,b), (weightA*a + weightB*b) >> 15)

All6003 selected native executions matched this reconstruction for independent channel cases(100,100),(255,0),(0,255). Negative position handling and exact fractional thresholds are preserved by original instructions.

## Findings

| Fraction | Native weights | Outputs for opposite255/0 edges | Sum of byte intensities |
|---|---|---|---|
|0.00|32768,0|255,0|255|
|0.15|31129,8847|242,68|310|
|0.30|26214,16056|203,124|327|
|0.50|22282,22282|173,173|346|
|0.90|8847,31129|68,242|310|

Weights are selected in fractional intervals rather than varying continuously. The sum in this isolated edge experiment changes255..346 (35.7% above255 at maximum). This is a **sum of encoded pixel bytes**, not measured optical brightness, display gamma, or an actual captured waveform feature. Do not translate it into a claim that the user's screen brightness pulses36%.

Static branch selection at0x1e013ac..141c constructs a weighted channel measure using coefficients98,504,257 plus16000. Strong contrast (ratio comparisons at44% and222.2%, with integer divisions) selects the preset-weight path; the other branch uses continuous complementary Q15 weights from the actual fraction. Exact byte channel names remain unspecified here. This looks like deliberate contrast treatment and may preserve visibility; intent and perceptual benefit are unproven. A brightness-normalized alternative could look dimmer or softer.

This helps explain why waveform colors change between integer grid steps and establishes a testable potential shimmer mechanism. It does not prove backward motion or that this branch dominates the live view.

## Isolated candidate

`--linear-coefficients` replaces only the setup weights in the harness with complementary Q15 weights based on the same native fraction, then executes the original high-contrast RGB blend. Across the same6003 inputs, all formulas match and opposite-edge intensity sums remain254..255 (integer truncation). Flat100 remains100. The coefficient continuity and intensity stability are improvements to the synthetic case, not a verified improvement to the application.

Reports: `az-waveform-fraction-oracle.json` and `.samples.json`; `az-waveform-linear-coefficient-oracle.json` and `.samples.json`. Initial harness linker section ordering and an AArch64 pair-store immediate-range issue were corrected before successful runs. Final runs exited0 with complete record counts.

## Next validation

Verify how often the live Blue renderer selects this branch, then compare matched actual waveform captures using a reversible continuous-blend candidate. Keep the grid fractional-coverage experiment separate so changes can be attributed. No native Pi code was patched or restarted during this turn; no claim of a fixed display. The30Hz source-position update bottleneck remains open, along with broader DSP/controller integration work.
