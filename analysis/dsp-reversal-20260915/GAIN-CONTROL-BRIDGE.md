# Gain-region command45: MCU-to-DSP bridge

The [gain-ramp region](GAIN-RAMP-FF58.md) reads staged command halfword45 at DSP address `0x11800a5a` (`0x1180ff58–ff64`). Its semantic control name is still unknown.

Independent review of the mixer MCU Thumb listing identifies the corresponding transmit-field source. Function `0x18de8` receives the transmit-frame pointer in r0. `0x18e6e` saves frame+0x44 in r6. At `0x18ecc`, r0 becomes `0x20003228`, loaded from literal `0x19014`. `LDR r2,[r0,#0x54]` at `0x18f22` reads the word at `0x2000327c`; `STRH r2,[r6,#0x16]` at `0x18f24` writes its low 16 bits to frame+0x5a, i.e. halfword45.

This path is gated by MCU bytes at `0x200031a5` and `0x200031a7` equaling 1, checked at `0x18df2–df6` and `0x18e0e–e12`. At `0x18f30/32`, the latter byte is cleared after filling the frame. The alternative branch and the call frequency are not closed by this trace; do not interpret the field as refreshed unconditionally every interrupt.

The adjacent halfword46 is filled at `0x18f2c/2e` from low16 of MCU word `0x20003280`. Adjacency is not evidence that both fields share a control identity.

This connects a concrete MCU persistent word to the transmitted command offset consumed by the DSP gain region. It does not yet prove the physical knob/fader identity, upstream producer of `0x2000327c`, or full transport timing. Host-to-MCU packet offsets must not be equated with these DSP halfword indices.
