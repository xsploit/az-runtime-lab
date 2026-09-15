#!/usr/bin/env python3
"""Static column/type map of EP147's local (USB OneLibrary) SQLite readers.

Disassembles the local SqliteDataBase code range, resolves ADRP+ADD string
materializations, and pairs each column-name literal with the next sqlite3
column/bind call. Writes JSON evidence; reads only the supplied binary.

  python3 library/az_schema_xrefs.py --ep147 PATH [--out FILE]

Default binary comes from az_paths (AZ_ROOTFS). No bytes other than printable
identifier strings are emitted, so no key material reaches the output.
"""
import argparse
import hashlib
import json
import re
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from az_paths import lab_path  # noqa: E402

EXPECTED_SHA256 = '736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
RODATA_DELTA = 0x400000
# Local SQLite family: SqliteDataBase ctor 0x1179e60, playlist getters
# 0x1181340, matching 0x1197048. CloudSqlite starts near 0x1270000.
TEXT_RANGE = (0x1160000, 0x11c0000)
IDENT = re.compile(rb'^[A-Za-z_][A-Za-z0-9_]{1,40}$')
ADRP = re.compile(r'^\s*([0-9a-f]+):\s+adrp\s+(x\d+), 0x([0-9a-f]+)')
ADD = re.compile(r'^\s*([0-9a-f]+):\s+add\s+(x\d+), (x\d+), #0x([0-9a-f]+)')
CALL = re.compile(r'^\s*([0-9a-f]+):\s+bl\s+0x([0-9a-f]+)(?: <(sqlite3_[a-z0-9_]+)@plt>)?')
PROLOGUE = re.compile(r'^\s*([0-9a-f]+):\s+stp\s+x29, x30, \[sp, #-0x[0-9a-f]+\]!')
ANY = re.compile(r'^\s*([0-9a-f]+):')
WINDOW = 40


def c_string(data, va):
    off = va - RODATA_DELTA
    if not 0 <= off < len(data):
        return None
    end = data.find(b'\0', off, off + 256)
    return data[off:end] if end > off else None


def find_wrappers(listing):
    """Map small local functions that call one sqlite3_column_* to that call."""
    wrappers, start, calls = {}, None, set()
    for line in listing:
        if m := PROLOGUE.match(line):
            if start is not None and len(calls) == 1:
                wrappers[start] = 'via:' + calls.pop()
            start, calls = int(m.group(1), 16), set()
        elif (m := CALL.match(line)) and m.group(3):
            calls.add(m.group(3))
    return {k: v for k, v in wrappers.items() if 'sqlite3_column_' in v}


def scan(binary):
    data = binary.read_bytes()
    listing = subprocess.run(
        ['llvm-objdump', '-d', '--triple=aarch64', '--no-show-raw-insn',
         f'--start-address={TEXT_RANGE[0]:#x}', f'--stop-address={TEXT_RANGE[1]:#x}',
         str(binary)], check=True, capture_output=True, text=True).stdout.splitlines()
    wrappers = find_wrappers(listing)
    pending = {}
    pending_column = []  # (instruction index, address, name)
    columns = defaultdict(lambda: {'readers': defaultdict(list), 'refs': []})
    literals = defaultdict(list)
    insn = 0
    for line in listing:
        if not ANY.match(line):
            continue
        insn += 1
        if m := ADRP.match(line):
            pending[m.group(2)] = int(m.group(3), 16)
            continue
        if (m := ADD.match(line)) and m.group(3) in pending:
            va = pending.pop(m.group(3)) + int(m.group(4), 16)
            s = c_string(data, va)
            if s and all(32 <= c < 127 for c in s):
                text = s.decode()
                literals[text].append(m.group(1))
                if IDENT.match(s):
                    pending_column.append((insn, m.group(1), text))
            continue
        if m := CALL.match(line):
            fn = m.group(3) or wrappers.get(int(m.group(2), 16))
            if not fn:
                continue
            pending_column = [p for p in pending_column if insn - p[0] <= WINDOW]
            if pending_column and fn.removeprefix('via:').startswith(('sqlite3_column_', 'sqlite3_bind_')):
                _, ref, name = pending_column[-1]
                columns[name]['readers'][fn].append(m.group(1))
                pending_column.clear()
    return {
        'binary_sha256': hashlib.sha256(data).hexdigest(),
        'text_range': [hex(v) for v in TEXT_RANGE],
        'column_calls': {k: {fn: v for fn, v in c['readers'].items()}
                         for k, c in sorted(columns.items())},
        'literals': {k: v for k, v in sorted(literals.items())},
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--ep147', type=Path,
                        default=lab_path('xdjaz/rootfs') / 'home/root/pdj/EP147')
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    result = scan(args.ep147)
    if result['binary_sha256'] != EXPECTED_SHA256:
        print('warning: addresses were derived for a different EP147 build', file=sys.stderr)
    text = json.dumps(result, indent=1)
    if args.out:
        args.out.write_text(text + '\n')
    else:
        print(text)


if __name__ == '__main__':
    main()
