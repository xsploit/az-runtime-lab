# Stereo IIR native oracle

This is the first isolated numeric component for the RX3 DSP port. It is **not** a completed CFX Filter, EQ or BeatFX implementation, and it is not connected to the live mixer.

## Result

`results.json` records **6,525 calls, 603,488 stereo frames, and 1,259,176 compared float values including input/output history**, with **zero bit differences** between the extracted RX3 instructions and independently written C recurrence. Both ARM32 scalar C under QEMU and native x86-64 C replay pass. A third x86-64 replay passes AddressSanitizer and UndefinedBehaviorSanitizer without diagnostics. Guard checks pass.

This is exact agreement on this finite deterministic corpus, with no numeric tolerance used for pass/fail. It is not a proof for arbitrary coefficients, NaN/Inf, all floating-point modes, other instruction sets, or all possible inputs.

## What was recovered and checked

- Original RX3 kernel: VA `0xb5788` through exclusive `0xb5934`, 428 bytes, ARM32 NEON. No instruction patches, relocated branches or substituted callees are needed: this routine is self-contained. `run.py` checks the complete source binary hash before extraction and records the instruction hash.
- Five stereo coefficients ordered b0, b1, b2, a1, a2. Two input and two output history frames, ordered older/newer. Independent L/R coefficients and samples are exercised.
- Native first-two-frame arithmetic subtracts the two feedback products separately. Subsequent frames add feedback products before subtraction. The new C intentionally follows this order with FP contraction disabled.
- Native NEON processing flushes tiny operands/results to signed zero in these experiments. Scalar IEEE gradual underflow initially produced 6,812 differences, maximum absolute error `2.1664081264953994e-38`. The untouched initial report is `results-gradual-underflow.json`. Explicit per-operation operand/result flushing in C removes every discrepancy in the tested corpus. This is a processing semantic; it is not an audible-performance claim.
- The original kernel reads one extra stereo frame beyond the useful input for blocks of at least three frames. Its oracle input is padded by exactly one frame. The reconstructed C receives an exact-size input allocation, and the sanitized replay confirms no equivalent overread for tested sizes. Neither API supports overlapping input and output.
- Native processing is not strictly bit invariant under block partition changes. One 1,024-frame block versus 1,024 one-frame blocks differs in 610 scalar samples, maximum absolute difference `5.9604644775390625e-08`. Each reconstructed run agrees exactly with its corresponding native partition. Do not mislabel this native arithmetic characteristic as state-continuity failure.

## Coverage

250 deterministic trials across frame counts 0, 1, 2, 3, 4, 7, 16, 31, 32, 63, 64, 65, 127, 128, 129, 256, 511, and 512. This includes random stereo signals, sparse impulses, silence/tails, zero/nonzero histories, and independently varied stable coefficients. Another 1,000 calls keep state continuously across varying block sizes, empty blocks and coefficient changes. The final block-partition comparison uses 1,024 frames.

Each call compares every output sample and all four stereo history records; zero-length calls consequently verify unchanged state. Native output/state buffers have canaries; input preservation is checked. No audio device, Pi, GUI player, network or privileged execution is involved.

## Reproduce

From the workspace root:

```sh
python runtime-lab/analysis/dsp-oracle/run.py
```

Requires the preserved private `rx3-research/pi-runtime/rbp`, the locally extracted ARM cross-compiler at `rx3-human-delegation/scratch/debbin/arm-linux-gnueabi-gcc`, QEMU user-mode ARM, host C compiler and sanitizer runtime. Script paths resolve from its own directory; the compiler wrapper itself remains specific to this machine. This is a local research harness, not a universal installer.

`compare-arm` invokes the original extracted routine and reconstructed scalar C, writing a deterministic native PCM/state corpus. `compare-host` regenerates identical inputs and replays that corpus against host C. `compare-host-asan` repeats the host comparison with memory/undefined-behavior checks. `-DRX3_NEON_FZ` enables explicit subnormal flushing; removing it reproduces the earlier gradual-underflow discrepancy.

Keep `native-iir.bin`, `compare-arm`, and `native-records.bin` private; the directory's ignore file excludes generated artifacts. No proprietary runtime was uploaded or published.

## Next boundary

The IIR recurrence is ready as a **candidate verified primitive**. Next recover/test the RX3 CFX Filter coefficient generation (`0xce154`), initialization (`0xce680`), blend/smoother state and sample-rate assumptions (`0xce720`) before proposing live mixer integration. Coefficient values and control mappings are not supplied by this kernel. Do not substitute arbitrary textbook coefficients and describe the result as faithful RX3 Filter.
