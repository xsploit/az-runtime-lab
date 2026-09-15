#!/usr/bin/env python3
"""Schema-free reader for rekordbox PDB page framing.

The bundled Kaitai schema describes export.pdb row layouts. exportExt.pdb uses
the same page/table framing but different rows, so the typed parser crashes on
it (see library/pdb_extract.cpp). This module reads only the framing -- header,
tables, pages, row index -- and hands back raw row bytes, so any PDB variant can
be inspected safely without a schema for its rows.

Field order follows rekordbox_pdb.ksy exactly:

  header: 4B zero | u4 len_page | u4 num_tables | u4 next_unused | u4 | u4 seq |
          4B gap | tables[num_tables]
  table:  u4 type | u4 empty_candidate | u4 first_page | u4 last_page
  page:   4B zero | u4 page_index | u4 type | u4 next_page | u4 | 4B |
          b13 num_rows + b11 num_rows_valid | u1 page_flags | u2 free_size |
          u2 used_size | u2 | u2 | u2 | u2 | heap at 0x28
  index:  per group of 16 rows, base = len_page - group_index * 0x24,
          present flags u2 at base - 4, row offset u2 at base - (6 + 2*i)

Use as a library (read_tables / iter_rows) or run it to summarise a file:
  python3 library/pdb_raw.py FILE [--table N] [--hex N]
"""
from __future__ import annotations

import argparse
import struct
from dataclasses import dataclass
from pathlib import Path

HEAP_POS = 0x28
GROUP_STRIDE = 0x24


@dataclass
class Table:
    index: int
    type: int
    first_page: int
    last_page: int


@dataclass
class Row:
    page_index: int
    group_index: int
    row_index: int
    offset: int          # absolute file offset of the row
    data: bytes          # bytes from the row start to the end of the heap


class PdbFile:
    def __init__(self, path):
        self.path = Path(path)
        self.blob = self.path.read_bytes()
        if len(self.blob) < 32:
            raise ValueError("file too small to be a PDB")
        zero, self.len_page, self.num_tables = struct.unpack_from("<III", self.blob, 0)
        if zero != 0:
            raise ValueError(f"leading word is {zero:#x}, expected 0; not a PDB")
        if not (512 <= self.len_page <= 65536) or self.len_page & (self.len_page - 1):
            raise ValueError(f"implausible page size {self.len_page}")
        if not 0 < self.num_tables <= 64:
            raise ValueError(f"implausible table count {self.num_tables}")

    def tables(self):
        out = []
        for i in range(self.num_tables):
            off = 28 + i * 16
            if off + 16 > len(self.blob):
                break
            type_, _empty, first, last = struct.unpack_from("<IIII", self.blob, off)
            out.append(Table(i, type_, first, last))
        return out

    def _page_header(self, index):
        base = index * self.len_page
        if base + HEAP_POS > len(self.blob):
            return None
        gap, page_index, type_, next_page = struct.unpack_from("<IIII", self.blob, base)
        if gap != 0:
            return None
        counts = int.from_bytes(self.blob[base + 0x18:base + 0x1B], "little")
        num_rows = counts & 0x1FFF
        page_flags = self.blob[base + 0x1B]
        return {
            "base": base,
            "page_index": page_index,
            "type": type_,
            "next_page": next_page,
            "num_rows": num_rows,
            "num_rows_valid": (counts >> 13) & 0x7FF,
            "page_flags": page_flags,
            "is_data_page": (page_flags & 0x40) == 0,
        }

    def iter_pages(self, table: Table):
        """Walk a table's page chain, never revisiting a page."""
        seen = set()
        index = table.first_page
        while True:
            if index in seen:
                break
            seen.add(index)
            header = self._page_header(index)
            if header is None:
                break
            yield header
            if index == table.last_page:
                break
            index = header["next_page"]

    def iter_rows(self, table: Table):
        for page in self.iter_pages(table):
            if not page["is_data_page"]:
                continue
            base = page["base"]
            num_rows = page["num_rows"]
            groups = (num_rows - 1) // 16 + 1 if num_rows else 0
            for g in range(groups):
                gbase = base + self.len_page - g * GROUP_STRIDE
                if gbase - 4 < base:
                    continue
                flags = struct.unpack_from("<H", self.blob, gbase - 4)[0]
                for i in range(16):
                    if g * 16 + i >= num_rows:
                        break
                    if not (flags >> i) & 1:
                        continue
                    pos = gbase - (6 + 2 * i)
                    if pos < base:
                        continue
                    ofs_row = struct.unpack_from("<H", self.blob, pos)[0]
                    start = base + HEAP_POS + ofs_row
                    end = base + self.len_page
                    if not base <= start < end:
                        continue
                    yield Row(page["page_index"], g, i, start, self.blob[start:end])


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("file", type=Path)
    ap.add_argument("--table", type=int, help="only this table type")
    ap.add_argument("--hex", type=int, default=0, metavar="N",
                    help="dump the first N bytes of each row")
    ap.add_argument("--limit", type=int, default=10)
    args = ap.parse_args()

    pdb = PdbFile(args.file)
    print(f"{pdb.path.name}: page={pdb.len_page} tables={pdb.num_tables}")
    for table in pdb.tables():
        rows = list(pdb.iter_rows(table))
        if args.table is not None and table.type != args.table:
            continue
        print(f"  table[{table.index}] type={table.type} rows={len(rows)}")
        if args.hex and rows:
            for row in rows[:args.limit]:
                chunk = row.data[:args.hex]
                text = "".join(chr(c) if 32 <= c < 127 else "." for c in chunk)
                print(f"    +{row.offset:#08x} {chunk.hex(' ')}  |{text}|")


if __name__ == "__main__":
    main()
