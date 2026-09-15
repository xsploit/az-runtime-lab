# AZ DSP SPI and interrupt-path map

Static evidence from the C674x-aware TI disassembler and matching MCU code. The AIS section checksums pass 11/11. No DSP execution, live bus capture, acoustic effect identification or Pi deployment is claimed.

## Hardware receive and transmit endpoints

DSP setup at `0x11816414` onward configures EDMA PaRAM set14 at `0x01c041c0`: source is SPI0 SPIBUF `0x01c41040`, destination `0x11800800`, ACNT/BCNT `0x00800002` (128 elements of 2 bytes). Stores occur at `0x11816444` (source), `0x1181644e` (counts), `0x11816456` (destination). This identifies a 256-byte SPI receive destination, beyond simply matching marker strings.

PaRAM set15 at `0x01c041e0` has source `0x11800940` (`0x11816492`), counts `0x00400002` (`0x11816498`: 64 elements of 2 bytes), and destination SPI0 SPIDAT1 `0x01c4103c` (`0x118164a2`). Thus this DSP transmit descriptor covers 128 bytes. The MCU clocks a 256-byte exchange; how the remaining transmit clocks are handled is not yet established.

## Integrity contract, verified from both sides

| Direction | Header words | Data covered by checksum | Evidence |
|---|---|---:|---|
| MCU to DSP | 1, AAAA | 256 bytes, including checksum at offset254 | MCU clears/stores checksum at `0x8614–0x8620`; DSP `0x1181d5ee/0x1181d5f4` calls folded-sum helper with128 halfwords and compares to FFFF |
| DSP to MCU | 1, 5555 | 128 bytes, including checksum at offset126 | DSP `0x1181d4b8/0x1181d4c0` uses64 halfwords and `0x1181d4d4` stores checksum at `0x118009be`; MCU `0x8654–0x865e` checks64 halfwords |

The underlying checksum is an end-around-carry 16-bit sum, with the transmitted complemented sum making the complete covered words fold to FFFF. `inspect_spi_frame.py` tests one physical frame against these framing/checksum rules; it does not name effects or authenticate commands. Synthetic checks verify both directions, covered-byte corruption rejection, and the fact that changing RX bytes beyond128 is outside the observed checksum. This is not a captured hardware test.

## Interrupt responsibilities

- **Slot8**, vector `0x1180a100` -> handler `0x1181ada4`: reads EDMA IPR `0x01c01068`, masks low6 bits, writes ICR `0x01c01070`, then executes a long direct-call sequence. It reaches `0x1181d5ac`, `0x11819880`, and staged-control reader `0x1180e644` in order. The sequence is recorded in `irq8-direct-edges.json`. This supersedes the earlier description of the reader's caller as only an initialization sequence. Static interrupt reachability is established; cadence and trigger configuration require more work.
- **Slot14**, vector `0x1180a1c0` -> wrapper `0x1181a9a0` -> helper `0x1181d6f4`: snapshots SPI0 SPIFLG at `0x01c41010` into B14 word247 and writes its low8 bits back. `EXTU B0,24,24` masks low8 bits; it does not extract bit24. The register's low error flags have write-one-to-clear semantics. This handler acknowledges SPI error status; it is not the bulk audio-processing chain.

## Staging and arithmetic connection

The checksum/header-gated DSP command handler calls a transfer routine at `0x1181a14c`, with source `0x11800800`, destination `0x11800a00`, and a 256-byte pointer span. Full store coverage still requires compact software-pipeline scheduling analysis; do not yet translate it as an assumed memcpy.

The reader `0x1180e644` loads staged halfwords and changes B14 word indices11–14. Those indices are read by the buffer-arithmetic path around `0x1180d6f4`, controlling branches and output pointers near LDDW/ADDDP/STDW loops. This gives a concrete transport -> checked command -> staging -> state -> arithmetic research path. Exact field names, effect identities, copy completeness, recurrence and acoustic behavior remain open.

## Primary references

- [TI C6747 datasheet](https://www.ti.com/lit/ds/symlink/tms320c6747.pdf): SPI0 base and SPIFLG/SPIBUF/SPIDAT1 addresses.
- [TI C6745/C6747 technical reference](https://www.ti.com/lit/ug/spruh91d/spruh91d.pdf): EDMA PaRAM fields, SPI flag semantics and register offsets.
- [Prior buffer/startup map](BUFFER-MAP.md).
