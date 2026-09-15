#!/usr/bin/env python3
"""Pure PC arithmetic probe for the statically inferred route-1 bounded ramp recurrence.

This does not execute DSP firmware or model C674x SPLOOP scheduling/rounding modes.
"""
import struct


def f32(value):
    return struct.unpack(">f", struct.pack(">f", value))[0]


delta = struct.unpack(">f", (0x3BF83E10).to_bytes(4, "big"))[0]
assert 0.0075 < delta < 0.0076


def run(start, step, count=22):
    x = f32(start)
    values = []
    for _ in range(count):
        x = f32(x + f32(step))
        x = min(1.0, max(0.0, x))
        values.append(x)
    return values


up = run(0.0, delta)
down = run(1.0, -delta)
assert all(0.0 <= x <= 1.0 for x in up + down)
assert all(up[i] >= up[i - 1] for i in range(1, 22))
assert all(down[i] <= down[i - 1] for i in range(1, 22))
print(f"delta={delta:.12f}")
print(f"up: first={up[0]:.12f}, last={up[-1]:.12f}")
print(f"down: first={down[0]:.12f}, last={down[-1]:.12f}")
