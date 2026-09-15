#!/usr/bin/env python3
"""Integer-only model of the exactly matched TI fixfu binary32 conversion.

Input is an IEEE754 binary32 bit pattern, output unsigned32. This does not
execute DSP firmware or model preceding floating-point calculations.
"""
import argparse


def convert(bits):
    if not isinstance(bits,int) or isinstance(bits,bool) or not 0<=bits<=0xffffffff:
        raise ValueError('expected an unsigned32 bit pattern')
    sign=bits>>31
    exponent=(bits>>23)&255
    fraction=bits&0x7fffff
    if exponent==0 or exponent<127:return 0
    if exponent>158:return 0x80000000 if sign else 0xffffffff
    significand=(1<<23)|fraction
    shift=exponent-127-23
    magnitude=(significand<<shift) if shift>=0 else (significand>>-shift)
    if not sign:return magnitude
    return 0x80000000 if magnitude>=0x80000000 else (-magnitude)&0xffffffff


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('bits',type=lambda x:int(x,0),nargs='+')
    a=p.parse_args()
    try:
        for bits in a.bits:print(f'{bits:#010x} -> {convert(bits):#010x}')
    except ValueError as exc:p.error(str(exc))


if __name__=='__main__':main()
