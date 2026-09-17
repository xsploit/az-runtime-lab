# Gain-region command45: MCU-to-DSP bridge

The [gain-ramp region](GAIN-RAMP-FF58.md) reads staged command halfword45 at DSP address `0x11800a5a` (`0x1180ff58–ff64`). The host-side source is now traced to the `CrossFaderCurve` application setting; the static chain is detailed below.

Independent review of the mixer MCU Thumb listing identifies the corresponding transmit-field source. Function `0x18de8` receives the transmit-frame pointer in r0. `0x18e6e` saves frame+0x44 in r6. At `0x18ecc`, r0 becomes `0x20003228`, loaded from literal `0x19014`. `LDR r2,[r0,#0x54]` at `0x18f22` reads the word at `0x2000327c`; `STRH r2,[r6,#0x16]` at `0x18f24` writes its low 16 bits to frame+0x5a, i.e. halfword45.

This path is gated by MCU bytes at `0x200031a5` and `0x200031a7` equaling 1, checked at `0x18df2–df6` and `0x18e0e–e12`. At `0x18f30/32`, the latter byte is cleared after filling the frame. The alternative branch and the call frequency are not closed by this trace; do not interpret the field as refreshed unconditionally every interrupt.

The adjacent halfword46 is filled at `0x18f2c/2e` from low16 of MCU word `0x20003280`. Adjacency is not evidence that both fields share a control identity.

This connects a concrete MCU persistent word to the transmitted command offset consumed by the DSP gain region. The downstream trace alone does not prove a physical knob/fader identity or full transport timing. Host-to-MCU packet offsets must not be equated with these DSP halfword indices.

## Producer of MCU word 0x2000327c

The producer is now traced one step upstream. MCU routine `0x18b22` loads base `0x20026e78` into r1, then forms r2=base+0xb6 at `0x18b28`. `LDRB r3,[r2,#3]` at `0x18b82` reads byte **0x20026f31** (base+0xb9). `STR r3,[r0,#0x54]` at `0x18b84`, with r0=`0x20003228`, zero-extends that byte into the persistent word `0x2000327c`. Thus the value on this producer path is 0..255 before the later halfword transmission.

The enclosing update routine `0x18c28` checks byte `0x200031a6` at `0x18c30–34`, calls the producer at `0x18c4c` when nonzero, then sets byte `0x200031a7` to 1 at `0x18c50/52`. That is the same pending-update byte checked and cleared by the transmit filler. This links production to the previously documented transmission gate; it does not prove the physical event source or scheduling frequency.

The reviewed chain is now: MCU byte `0x20026f31` → zero-extended word `0x2000327c` → command halfword45 → DSP staged address `0x11800a5a` → gain-region table selection. The following sections identify the writer and its typed setting source. The selector is a curve setting, not the continuous fader position.

## Host packet producer and reduced domain

MCU parser `0x1f6a` receives the host packet pointer in r0. It loads base `0x20026e78` into r6 at `0x1f6e`, then forms r1=base+0xab at `0x1f7c`. `LDRB [r0,#8]` at `0x1fd2`, `UBFX #2,#2` at `0x1fd4`, and `STRB [r1,#0xe]` at `0x1fd8` establish:

```text
MCU[0x20026f31] = (HOSTTX[8] >> 2) & 3
```

Combined with the downstream producer and transmit path above, this yields command45 values0..3 on this traced path, a tighter bound than the byte-width bound alone. Other writers or initialization values are not excluded. The DSP's extraction of the command low two bits is consistent with this packed selector, but consistency does not supply its UI name. The typed EP147 source is established below.

## EP147 setting identity: CrossFaderCurve

For EP147 SHA-256 `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`, the serializer is called with packet+4 (`0x215c138–215c14c`). Helper `0x215a2f8` uses adapter byte+22 at `0x215a398`, inserts its low two bits with BFI at `0x215a39c`, and stores helper-relative byte4: absolute HOSTTX byte8. Adjacent adapter byte+20 is a separate EqIso source, not this field.

The `usecase::mixer::Mixer` RTTI identifies the listener subobject at outer offset40 as `IItemListener<application_setting::CrossFaderCurve>`. Its thunk `0xa8b828` adjusts the object pointer and reaches callback `0xa8b4e0`. The matching-setting path bounds the incoming enum to indices0..2, maps through table `0x26d9458`, and calls forwarder `0xa8b388`. That forwarder invokes adapter virtual offset+40. In the `device_adapter::mixer::Mixer` vtable at `0x2e42208`, this slot is `0x2134528`, which stores the value to adapter byte+22.

The resulting static chain is **CrossFaderCurve setting → adapter byte+22 → HOSTTX byte8 bits2..3 → MCU byte0x20026f31 → MCU word0x2000327c → DSP command45 → gain-table bank selector**. This names the setting source, not the audible curve law. Runtime object identity, the enum display labels, table contents and continuous-position source remain separate verification tasks.

The callback's three mapping bytes at VA `0x26d9458` (ELF `.rodata`, file offset `0x22d9458`) encode input enum indices0/1/2 as bank selectors2/1/0. Display labels and invalid-enum fallback behavior are not established; do not infer an additional user curve from the transport field's two-bit width.
