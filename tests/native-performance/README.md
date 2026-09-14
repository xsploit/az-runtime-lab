# Performance regression checks

From the repository root:

```sh
python3 tests/native-performance/test_setup.py
cc -O2 -DLAB_SCALAR -fsanitize=address,undefined -fno-omit-frame-pointer \
  -Ishims tests/native-performance/sanitize.c shims/grid_span.c -lm \
  -o /tmp/az-grid-sanitize
/tmp/az-grid-sanitize
```

The configuration tests use synthetic inputs, including paths containing spaces,
and reject the wrong model, firmware hash and library manifest. Sanitizer checks
cover 18,432 raster edge cases. Neither runs the player or contacts the Pi.

For the exact original-instruction raster oracle, install Clang, LLD and
qemu-aarch64-static on the **PC**, then supply your own matching executable:

```sh
python3 tests/native-performance/run_oracle.py \
  --firmware '/absolute/path/to/rootfs/home/root/pdj/EP147' \
  --cc '/absolute/path/to/compatible-aarch64-linux-gnu-gcc'
```

`--cc` is optional (or AZ_CC); without it the old-GCC variant is skipped. Each
positive variant tests 110,000 cases; the deliberately altered-rounding negative
control must fail with mismatches. Extracted instructions are used only in a
temporary directory. Results go to ignored `local/grid-oracle/`. An unexpected
failure may preserve a `.private` diagnostic executable there; do not upload it.
QEMU here is for arithmetic equivalence, never Pi performance timing.

On a native AArch64 Pi, after building the shims:

```sh
cc -O2 tests/native-performance/test-sem-owner.c -o /tmp/test-az-sem-owner
LD_PRELOAD=./shims/sem-owner.so /tmp/test-az-sem-owner
```

Run as a normal user from the repo root. Use the relative preload spelling above:
Linux LD_PRELOAD splits absolute paths at spaces even when shell-quoted. The
actual player avoids this by binding shims to `/lab-shims` inside its sandbox.
Five cases cover native permission/initialization/locking and untargeted calls;
no proprietary executable is required for this semaphore test.

These tests do not certify physical audio, touch/controller coverage or long-set
reliability. See the dated native performance report for live-device evidence.
