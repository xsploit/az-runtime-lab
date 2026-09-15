# AZ DSP reversal: verified checksum and instruction decoding

## Checksum resolved

All 11 embedded DSP load-section CRCs match the TMS320C6747/45/43 boot algorithm. The earlier OMAP-L132/L138 algorithm was the wrong device-generation reference. This supersedes the unresolved CRC limitation in the September 14 review; it does not establish effects parity or hardware execution.

The calculation processes little-endian 32-bit words MSB-first, with polynomial 0x04C11DB7 and zero initial state. Each section covers address, size, then data, resetting after validation. All observed lengths are multiples of four; partial-word padding is unverified on this image. Exact matches independently reproduce the boundaries and coverage for this payload.

Run `python3 analysis/dsp-reversal-20260915/verify_ais.py /path/to/private/ais.bin`. This helper targets the observed AIS subset, emits metadata only unless explicit dump options are supplied, and exits nonzero for missing sections/entry or incomplete CRC success. It is not a general security-hardened firmware validator.

## Disassembler corrected

The earlier Capstone C64x listing treated compact instruction pairs as full words and some packet headers as undecodable bytes. TI dis6x 8.5.0.LTS, with C674x ELF attributes copied from a locally compiled probe, decodes the entry region correctly. At 0x1181f784/786, two compact operations (move and conditional branch) replace the misleading single load in the old listing. Entry setup initializes SP/DP and floating-point control registers before runtime calls.

The recovered sections were wrapped without byte changes in a private ELF for static disassembly. ISA attributes are analyst-supplied decoding metadata, not evidence of an original executable header. All sections were marked executable solely to inspect them; this does not prove every section is code. Data/code separation and delay-slot/parallel execution semantics remain necessary before function reconstruction. The old overall valid-instruction percentage is not a reliable metric.

## Next reversal targets

Trace runtime startup into the audio processing and SPI-command handlers with packet-aware disassembly, then identify state buffers and individual filter/effect routines. Check matched audio before claiming recovered DSP parity. Controller mapping remains deferred. No Pi changes or production patches were made.

## Primary references

- [TI SPRABB1C, Using the TMS320C6747/45/43 Bootloader](https://www.ti.com/lit/an/sprabb1c/sprabb1c.pdf), section 4 and Appendix C.
- [TI C64x/C64x+ instruction reference](https://www.ti.com/lit/ug/spru732h/spru732h.pdf), compact fetch-packet header/layout.
- [TI dis6x documentation](https://downloads.ti.com/docs/esd/SPRUI03/invoking-the-disassembler-stdz0783966.html).

Private payloads, toolchain installers and disassembly remain under ignored local directories. Only analysis code and conclusions are published.
