# DSP buffer movement and startup: initial static map

This map uses the C674x-aware TI dis6x listing, not the superseded C64x-only listing. Addresses refer to the verified AZ 1.30 DSP payload. No DSP execution or audio parity test has been performed.

| Address | Evidence | Interpretation / limit |
|---|---|---|
| `0x1181f760` | Initializes B15 stack, B14 data pointer, FADCR/FMCR; conditional startup branches | Runtime entry. Startup is not an effect kernel. |
| `0x1181eb94` | Calls initialization targets followed by a loop at `0x1181ec24` | Startup/main candidate. Loop observes MMIO and timers; not yet the audio callback. |
| `0x11815ecc` | Reads a halfword via B14 index330; if positive, waits for MMIO `0x01c01068` bit8; writes bit8 at `0x01c01070`; clears the halfword | EDMA completion wait/ack helper, based on TI IPR/ICR register definitions. Do not mistake its frequent references for an effect routine. |
| `0x118161ec` | Writes words starting at `0x01c04600` | EDMA PaRAM set48 configuration candidate. Full source/destination/count argument semantics remain to trace. |
| `0x1181fae0` | Restores register pairs from stack and branches through restored B3 | Shared return/epilogue helper, not an effect kernel. |

Primary register reference: [TI TMS320C6745/C6747 datasheet](https://e2e.ti.com/cfs-file/__key/CommunityServer-Discussions-Components-Files/115/3323.tms320c6747.pdf), EDMA3 channel-controller registers (`IPR=0x01c01068`, `ICR=0x01c01070`) and PaRAM range `0x01c04000` with 32-byte sets. See also [EDMA user guide](https://www.ti.com/lit/ug/sprufl1c/sprufl1c.pdf).

The helper `map_direct_edges.py` indexes direct branch operands reproducibly. It does not recover function boundaries, indirect targets, delay slots or reachability. Initial private output contains 2,800 operands / 1,838 distinct targets over all wrapped sections; those counts are indexing statistics, not counts of functions or effects, because some wrapped sections contain data.

Next: connect DMA descriptor source/destination buffers to interrupt entry and math loops; prove coefficient/state ownership before assigning EQ/CFX/Beat FX names. Runtime SPI state is a parallel investigation. No controller mapping change follows from this map alone.

## Interrupt and staged control edges

The 512-byte section at `0x1180a000` contains sixteen 32-byte vector slots. Slot0 establishes ISTP and branches to `0x1181f760`. Slot14 targets `0x1181a9a0`; that wrapper saves registers/loop state, calls `0x1181d6f4` at `0x1181aa28`, updates a counter, restores state and returns through IRP. Setup at `0x1181d484` enables IER bit14. This establishes a static interrupt-handler edge; external interrupt routing and live cadence remain unverified.

Separately, the staged control buffer at `0x11800a00` is read by `0x1180e644` (direct caller `0x1181ae90`). It writes B14 global word indices11–14. The arithmetic buffer-processing path around `0x1180d6d0` performs LDDW/ADDDP/STDW and reads those indices from `0x1180d6f4` onward to select branches/output pointers. This is a control-state-to-arithmetic-path connection, not an identified acoustic effect. Note the distinct addresses: interrupt target `0x1181d6f4` is NOT arithmetic site `0x1180d6f4`.

MCU-side SPI transfer size is 256 bytes; outgoing checksum covers128 halfwords (256 bytes), while incoming checksum verification at `0x8654` covers64 halfwords (128 bytes). Do not assume symmetric full-frame checksum coverage. The staged DSP copy candidate has a 256-byte address span; complete store coverage and the exact SPI-to-buffer connection need further packet-aware tracing.
