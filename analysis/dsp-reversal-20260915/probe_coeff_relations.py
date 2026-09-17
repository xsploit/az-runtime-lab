#!/usr/bin/env python3
"""Diagnostic algebra probe; ideal reciprocal is NOT DSP RCPSP parity."""
import argparse
import math
import struct


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def coeff(x, q):
    k = struct.unpack('<f', struct.pack('<I', 0x37BE37C6))[0]
    x, q = f32(x), f32(q)
    t = f32(k * x)
    u = f32(t * q)
    v = f32(t * t)
    w = f32(u + u)
    d = f32(f32(v + w) + f32(4.0))
    # DSP 0x1181fa60 uses RCPSP plus refinements. This diagnostic substitutes
    # an ideal f32 reciprocal so only coefficient structure is tested.
    r = f32(1.0 / d)
    m = f32(v - f32(4.0))
    z = f32(v - w)
    p = f32(m + m)
    n = f32(f32(4.0) + z)
    fb = (f32(r * p), f32(r * n))
    lp = (f32(r * v), f32(f32(v + v) * r), f32(r * v))
    hp = (f32(f32(4.0) * r), f32(f32(-8.0) * r), f32(f32(4.0) * r))
    return d, r, lp, hp, fb


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--x', type=float, default=1000.0)
    ap.add_argument('--q', type=float, default=0.7)
    args = ap.parse_args()
    d, r, lp, hp, fb = coeff(args.x, args.q)
    print(f'x={f32(args.x)} q={f32(args.q)} denominator={d} ideal_reciprocal={r}')
    print('LP:', ' '.join(f'{v:.9g}/0x{bits(v):08x}' for v in lp))
    print('HP:', ' '.join(f'{v:.9g}/0x{bits(v):08x}' for v in hp))
    print('shared_feedback:', ' '.join(f'{v:.9g}/0x{bits(v):08x}' for v in fb))
    assert bits(lp[0]) == bits(lp[2])
    assert bits(hp[0]) == bits(hp[2])
    assert math.isclose(hp[1], -2 * hp[0], rel_tol=0, abs_tol=0)


if __name__ == '__main__':
    main()
