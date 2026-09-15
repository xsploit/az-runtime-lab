#!/usr/bin/env python3
"""Diagnostic evaluator for the statically inferred AZ input core arithmetic.

This is not a DSP oracle: it omits compact-loop output scheduling, peripheral
data packing, floating-control state, and downstream processing.
"""

import argparse
import struct


MODE_GAIN_BITS = {1: 0x402E0D69, 2: 0x3F61CEEF}


def f32(value: float) -> float:
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits_to_f32(bits: int) -> float:
    return struct.unpack("<f", struct.pack("<I", bits))[0]


def signed_word(bits: int) -> int:
    bits &= 0xFFFFFFFF
    return bits - 0x100000000 if bits & 0x80000000 else bits


def evaluate_core(bits: int, mode: int) -> tuple[int, float, int]:
    shifted = signed_word(bits) >> 8
    normalized = f32(f32(shifted) * (2.0 ** -23))
    gained = f32(normalized * bits_to_f32(MODE_GAIN_BITS[mode]))
    result_bits = struct.unpack("<I", struct.pack("<f", gained))[0]
    return shifted, gained, result_bits


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", type=int, choices=(1, 2))
    parser.add_argument("word", type=lambda value: int(value, 0))
    args = parser.parse_args()
    shifted, gained, result_bits = evaluate_core(args.word, args.mode)
    print(f"shifted={shifted} candidate_float={gained:.9g} bits=0x{result_bits:08x}")


if __name__ == "__main__":
    main()
