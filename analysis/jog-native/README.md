# AZ 1.30 native jog interface

Pinned original EP147 SHA256: 736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6.

Receive decoder 0x21375d0 builds the adapter input from a 152-byte deck-ucom packet: uint16 count at10, uint16 period at12, flags byte9 bits1/2/3. Container+8 is the HuiJog, constructor 0x213b420 installs adapter vtable0x2e42838; conversion slot is0x21380b8. HuiJog adapter dispatch0x21ef810 calls it and compares returned touch/speed/delta before notifying observers.

Original converter executed on Pi5: 10,000 randomized inputs matched touch, signed 16-bit cumulative counter wrap, speed, direction and extra flag. `check.c` executes a private copy of the original 0x2138000..0x213bfff page via a read-only executable mapping, conversion entry+0xb8. Original instruction bytes are not committed. Result: PASS, no mismatches. Test included period65535 stopped sentinel and excluded invalid period0.

Output: touch at0; position at4; speed at8; signed counter delta/3240 at16; direction and extra flag at20/21. Speed magnitude is float bits0x440ae38e / period, or zero for65535. Direction false negates it. Native high-speed bend correction is preserved by the actual player, not reimplemented here.

FLX6 uses center64 relative increments and 14-bit tempo. Current candidate scales jog ticks0.81, motivated by BiteDJ's7200 ticks/rev at33⅓RPM (4000ticks/sec) versus native delta denominator3240. This is a calibration hypothesis, not a measured mechanical match. The event interval estimates the native period; a50ms idle timeout sends stopped speed. User confirmed physical jog/tempo response but detailed sensitivity/scratch behavior still needs feedback.

`erp-button-trace.json` saves candidate register materializations with consumer diagnostics and direct byte/bit dispatch links. Original Play/Cue/MT fields agree with earlier execution. Newly connected simple buttons need per-button live verification. Byte6 is an eight-pad bitmap; native Hot Cue mode is selected before hotcue activation. No claim that all pad modes or Shift+pad semantics are complete.
