#!/usr/bin/env python3
"""Parse and verify a TI AIS (Application Image Script) boot stream.

Reference: TI SPRABB1C "Using the OMAP-L132/L138 Bootloader", sec. 4 (commands) and
Appendix C (CRC: word-oriented, polynomial 0x04C11DB7, zero seed;
Section Load feeds address and size words, then section data).

Usage:
  ais.py BLOB [--offset N] [--json OUT] [--dump-dir DIR]
BLOB may be a flat MCU dump (use --offset, e.g. 0x1a0000 for MIXER_CONT_UCOM.bin
based at 0x60000000) or an extracted AIS file. --dump-dir writes each loaded section
(private evidence; keep git-ignored). No firmware is executed.
"""
import argparse, json, os, struct, zlib

OPS = {0x58535901: 'SECTION_LOAD', 0x58535902: 'VALIDATE_CRC', 0x58535903: 'ENABLE_CRC',
       0x58535904: 'DISABLE_CRC', 0x58535905: 'JUMP', 0x58535906: 'JUMP_CLOSE',
       0x58535907: 'BOOT_TABLE', 0x5853590A: 'SECTION_FILL', 0x5853590D: 'FUNCTION_EXECUTE',
       0x58535963: 'SEQ_READ_ENABLE'}


def crc_update(data: bytes, crc: int) -> int:
    """Process little-endian 32-bit words, MSB-first; zero-pad final word."""
    for pos in range(0, len(data), 4):
        word = int.from_bytes(data[pos:pos + 4].ljust(4, b"\0"), "little")
        for bit in range(31, -1, -1):
            msb = crc & 0x80000000
            crc = ((crc << 1) | ((word >> bit) & 1)) & 0xFFFFFFFF
            if msb:
                crc ^= 0x04C11DB7
    return crc



def parse(b, off=0):
    if struct.unpack_from('<I', b, off)[0] != 0x41504954:
        raise SystemExit('AIS magic 0x41504954 not found at offset 0x%x' % off)
    p = off + 4
    cmds, crc, crc_on = [], 0, False
    while True:
        op = struct.unpack_from('<I', b, p)[0]
        name = OPS.get(op, 'UNKNOWN_0x%08x' % op)
        rec = dict(offset='0x%x' % (p - off), op=name)
        p += 4
        if op == 0x58535901:
            addr, size = struct.unpack_from('<2I', b, p)
            data = b[p + 8:p + 8 + size]
            if crc_on:
                crc = crc_update(struct.pack('<2I', addr, size), crc)
                crc = crc_update(data, crc)
            rec.update(addr='0x%08x' % addr, size=size, sha256=__import__('hashlib').sha256(data).hexdigest(),
                       all_zero=not any(data))
            rec['_data'] = data
            p += 8 + ((size + 3) & ~3)
        elif op == 0x5853590A:
            addr, size, typ, pat = struct.unpack_from('<4I', b, p)
            rec.update(addr='0x%08x' % addr, size=size, type=typ, pattern='0x%x' % pat)
            p += 16
        elif op == 0x58535902:
            exp, seek = struct.unpack_from('<Ii', b, p)
            rec.update(expected='0x%08x' % exp, computed='0x%08x' % crc, match=(exp == crc), seek=seek)
            p += 8
            crc = 0
        elif op == 0x58535903:
            crc_on = True
        elif op == 0x58535904:
            crc_on = False
        elif op == 0x5853590D:
            w = struct.unpack_from('<I', b, p)[0]
            n = w >> 16
            args = struct.unpack_from('<%dI' % n, b, p + 4)
            rec.update(function_index=w & 0xffff, args=['0x%08x' % x for x in args])
            p += 4 + 4 * n
        elif op == 0x58535907:
            typ, addr, data, sleep = struct.unpack_from('<4I', b, p)
            rec.update(type='0x%08x' % typ, addr='0x%08x' % addr, data='0x%x' % data, sleep=sleep)
            p += 16
        elif op in (0x58535905, 0x58535906):
            rec.update(entry='0x%08x' % struct.unpack_from('<I', b, p)[0])
            p += 4
        elif op == 0x58535963:
            pass
        else:
            cmds.append(rec)
            break
        cmds.append(rec)
        if op == 0x58535906:
            break
    return cmds, p - off


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('blob')
    ap.add_argument('--offset', default='0')
    ap.add_argument('--json')
    ap.add_argument('--dump-dir')
    a = ap.parse_args()
    b = open(a.blob, 'rb').read()
    cmds, length = parse(b, int(a.offset, 0))
    if a.dump_dir:
        os.makedirs(a.dump_dir, exist_ok=True)
        for c in cmds:
            if '_data' in c:
                with open(os.path.join(a.dump_dir, 'sec_%s.bin' % c['addr'][2:]), 'wb') as f:
                    f.write(c['_data'])
    for c in cmds:
        c.pop('_data', None)
    entry = next((c['entry'] for c in cmds if c['op'] == 'JUMP_CLOSE'), None)
    secs = [c for c in cmds if c['op'] == 'SECTION_LOAD']
    inside = [c['addr'] for c in secs if entry and int(c['addr'], 16) <= int(entry, 16) < int(c['addr'], 16) + c['size']]
    summary = dict(script_length=length, commands=len(cmds), sections=len(secs),
                   loaded_bytes=sum(c['size'] for c in secs), entry=entry, entry_in_section=inside,
                   crc_checks=sum(1 for c in cmds if c['op'] == 'VALIDATE_CRC'),
                   crc_matches=sum(1 for c in cmds if c.get('match')))
    out = dict(summary=summary, commands=cmds)
    if a.json:
        with open(a.json, 'w') as f:
            json.dump(out, f, indent=1)
    print(json.dumps(summary, indent=1))
    if not entry or not secs or summary["crc_checks"] != len(secs) or summary["crc_matches"] != len(secs):
        raise SystemExit(1)


if __name__ == '__main__':
    main()
