#!/usr/bin/env python3
"""Send one F1 snapshot to an explicitly supplied DSP-enabled lab mixer socket."""
import argparse
import math
import socket

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('socket')
p.add_argument('channel', type=int, choices=range(4), help='zero-based deck channel')
p.add_argument('effect', choices=('off', 'filter'))
p.add_argument('color', type=float)
p.add_argument('parameter', type=float)
a = p.parse_args()
if any(not math.isfinite(v) or not 0 <= v <= 1 for v in (a.color, a.parameter)):
    p.error('color and parameter must be finite values from 0 to 1')
msg = f'F1 {a.channel} {int(a.effect == "filter")} {a.color:.9g} {a.parameter:.9g}'.encode('ascii')
with socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as s:
    s.sendto(msg, a.socket)
print('Command sent; check mixer log for accepted/busy/invalid result.')
