# AZ controller research: reviewed checkpoint

This is a bounded review of static PC research, not a working effects port or a Pi performance result. No device changes were made. Private firmware, extracted DSP sections and keys are excluded.

## Verified in this review

- The public AZ kernel device tree `arch/arm64/boot/dts/rockchip/rk3399-atc-board-V03.dts` places `subucom-spi@1` beneath SPI1, with `reg = <1>`, comment `cs1: MPNL`, and pinctrl label `SoM_MPNL_REQ`. This independently identifies the previously unexplained SPI1 chip-select 1 as the mixer panel. It does not by itself establish that EP147 needs another emulated runtime endpoint.
- Re-running the local AIS parser against MIXER_CONT's region at file offset `0x1a0000` produced 26 commands, 11 load sections, 232,152 loaded bytes, and jump entry `0x1181f760` inside the section starting at `0x1180a400`. Script length is 232,468 bytes. All 11 attempted CRC comparisons failed. Parsing and hashes are not successful independent CRC verification.
- The existing packet decoder distinguishes MCU-to-player controls (checksum at 96–97) from player-to-MCU messages (checksum at 104–105). Its anonymous player-to-MCU words start at byte 88 and records at byte 40; they are not established as master knobs at bytes 56–60.

The underlying research additionally reports TI C6000 startup instructions in the embedded image and a corresponding MCU slave-boot host. That supports an executable DSP payload inside the update which runs on a separate processor. These instruction traces have not been fully independently audited here. Exact chip identification and individual effects algorithms remain open.

## Corrections to the initial Claude draft

1. **Payload location versus execution:** the DSP payload is embedded in the MIXER_CONT update region. The MCU sends it to another processor. The statement that looking inside this update is a dead end, or that it contains no DSP program, is withdrawn. The MCU's own instruction stream and the embedded DSP instruction stream are separate analysis targets.
2. **Master control names:** the draft mixes host TX/RX directions and treats a nearby diagnostic-string heuristic as confirmation. The helper itself labels its results candidates. The proposed four names must not be added to the player-to-MCU decoder without tracing registration, callback, packet direction, offsets and packed low bits end to end. Four 10-bit controls cannot be represented by four independent whole bytes; the proposed five-byte group needs explicit packing evidence.
3. **BPM formula:** at `0xad70` the handler reads multiple fields, multiplies values, applies mode-dependent rounding, dispatches by mode and has invalid-input paths. At `0xae10` one path compares an intermediate against `0xfa0`; the reciprocal result and threshold are stored in different fields. This does not establish a universal `round(40000000 / interval)` BPM formula or prove the units of captured 400/15000 values. Remove that simplification from implementation recommendations.
4. **ErP length:** a claimed 28-byte total frame conflicts with a checksum stored at offsets 28–29. The saved flow map records a two-byte checksum store at a sub-buffer offset `0x1c`. Distinguish covered data, checksum-inclusive subpacket and outer transfer length before asserting a total frame size or altering the existing fixture.
5. **Page size:** 4 KiB pages describe the shipped ARM64 Linux kernel on the Rockchip platform, not the Cortex-M MCU. The Pi allocator/page-size compatibility issue belongs to the Linux application environment.
6. **Performance recommendations:** original-hardware THP, realtime priorities, clocks and affinity are reference behavior, not evidence of improvements on Pi. No automatic THP change, realtime-throttling removal or affinity patch is approved by this research. Preserve the working display/audio baseline and compare measured underruns, scheduling latency, frame intervals, RAM and temperature before adopting changes.
7. **Confidence:** peripheral addresses and SDK strings identify a compatible MCU family, not necessarily an exact fitted silicon part. Likewise an AIS memory map and decoded entry are not proof of complete DSP/effects parity. The unresolved CRC algorithm must remain visible; guesses about its seed or masking are hypotheses.

## Useful findings pending independent validation

The research supplies addresses and maps for DSP SPI framing, route/mute/ack transitions, ON-AIR gating/debounce, meters, player-info dispatch, and deck/panel parsing. These are worthwhile leads, not production-ready contracts. Check the saved instruction paths and validate representative packets before changing controls. Recover actual DSP routines from the embedded image if faithful effects are the objective; MCU control code alone does not establish those algorithms.

## Next implementation gates

1. Audit controller packet direction and packing against both MCU and EP147 consumers.
2. Resolve AIS CRC coverage/algorithm against TI's boot specification or reference implementation; do not relabel failures as success.
3. Trace DSP routines and compare matched audio inputs before claiming effects equivalence.
4. Verify route and ON-AIR state transitions with fixtures and then physical controller/audio acceptance.
5. Run targeted Pi performance comparisons only with the device available and the known-good baseline preserved.

## Evidence and scope

- Existing recovery baseline: [update recovery](../update-recovery-20260914/REPORT.md).
- Existing decoder: `analysis/az_mixer_packet.py`, `inspect` versus `inspect_tx`.
- Local private research: `local/claude-az-controller-research/`, including tools, maps and original draft. It is git-ignored and not part of this publication.
- Primary format reference used by the research: [TI SPRAB41F](https://www.ti.com/lit/an/sprab41f/sprab41f.pdf). CRC verification remains unresolved.

This checkpoint publishes reviewed conclusions and corrections only. It does not publish firmware, keys, disassembly dumps, or deploy code. Claude stopped on a session limit; its original IN PROGRESS status was stale.
