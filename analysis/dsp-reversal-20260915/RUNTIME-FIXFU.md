# Exact TI runtime match: AZ helper0x1181f460

Compiling TI CGT8.5.0.LTS `lib/src/fixfu.c` for C6740 EABI at optimization2 produces `__c6xabi_fixfu`. Its entire0xa0-byte .text region matches AZ0x1181f460–1181f4fff, including compact encodings, relative branches, fetch headers and padding. All160 bytes are covered and identical. The similar signed helper `fixfi.c` does not match. This establishes this helper's compiled implementation, not the compiler provenance of the whole firmware.

The corresponding source includes `fixfy_i.h`, whose `Wrap_Around` option is enabled. Its binary32-to-unsigned32 behavior truncates finite in-range magnitudes toward zero. Negative finite values with truncated magnitude below2^31 become their unsigned two's-complement result; larger negative magnitudes yield0x80000000. Positive overflow yields0xffffffff. Zero, subnormals and magnitudes below1 yield0. Infinity/NaN take the overflow path according to their sign bit. Thus replacing it with an ordinary signed conversion or a saturating-to-zero unsigned cast is not equivalent. These semantics are source-backed and tied to the exact encoded match; they have not been run on the live DSP here.

The Beat processing thunk0x80014000 targets this helper. In particular, its calls must not be mistaken for the unrelated initialization writer at0x80014020. The source match resolves the conversion primitive; callers' units, preceding SP rounding and subsequent address calculations still need their own traces.

## Reproduce with your own TI toolchain and private listing

Use a private output directory and the installed toolchain's own licensed source. Nothing below requires publishing firmware or compiled runtime bytes:

```sh
"$TI_ROOT/bin/cl6x" -mv6740 --abi=eabi -O2 --keep_asm -c \
  --obj_directory="$OUT" --asm_directory="$OUT" \
  -I "$TI_ROOT/include" -I "$TI_ROOT/lib/src" "$TI_ROOT/lib/src/fixfu.c"
"$TI_ROOT/bin/dis6x" "$OUT/fixfu.obj" > "$OUT/fixfu.disasm"
python analysis/dsp-reversal-20260915/compare_encoded_region.py \
  "$OUT/fixfu.disasm" "$AZ_LISTING" \
  --left-base 0 --right-base 0x1181f460 --size 0xa0
```

Set TI_ROOT, OUT and AZ_LISTING explicitly; create OUT beforehand. The comparator rejects missing bytes, overlapping records and split boundaries, and prints no payload values. This comparison assumes the supplied disassembly encodings accurately represent the binaries; it does not execute them or validate unrelated sections.

[probe_fixfu.py](probe_fixfu.py) supplies an original integer-only model taking explicit binary32 bits. [Boundary tests](test_fixfu.py) cover zero/subnormals, fractional truncation, both signs around2^31 and2^32, infinity and signed NaN. These22 source-derived vectors pass, as do four invalid-input rejections. They are a reproducible interpretation of the matched source, not independent live numerical evidence. Using bit patterns avoids Python float-to-int behavior or host NaN conversion affecting the result.
