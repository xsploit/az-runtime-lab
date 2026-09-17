#!/usr/bin/env python3
"""Inspect one observed-layout MCU/DSP SPI frame, without assigning FX semantics.

MCU->DSP: 256 bytes with header 1/AAAA and full-frame folded16 sum FFFF.
DSP->MCU: physical 256-byte transfer; header 1/5555 and only first128 bytes
are covered by the observed MCU checksum check. The trailing128 are unvalidated.
"""
import argparse,json,struct
from pathlib import Path

def folded16(data):
    if len(data)%2:raise ValueError('Even byte count required')
    total=sum(w[0] for w in struct.iter_unpack('<H',data))
    while total>>16:total=(total&0xffff)+(total>>16)
    return total

def inspect(frame,direction):
    if direction not in ('mcu-to-dsp','dsp-to-mcu'):raise ValueError('Unknown direction')
    if len(frame)!=256:raise ValueError('Expected one 256-byte physical frame')
    count=256 if direction=='mcu-to-dsp' else 128
    expected=(1,0xaaaa if direction=='mcu-to-dsp' else 0x5555)
    header=struct.unpack_from('<HH',frame)
    return dict(direction=direction,physical_bytes=256,checked_bytes=count,
                unchecked_tail_bytes=256-count,header_valid=header==expected,
                checksum_valid=folded16(frame[:count])==0xffff,
                scope='Framing/checksum only; no authentication, effect semantics or live transport proof')

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('frame',type=Path);p.add_argument('--direction',choices=['mcu-to-dsp','dsp-to-mcu'],required=True)
    a=p.parse_args();r=inspect(a.frame.read_bytes(),a.direction);print(json.dumps(r,indent=2))
    return 0 if r['header_valid'] and r['checksum_valid'] else 1

if __name__=='__main__':raise SystemExit(main())
