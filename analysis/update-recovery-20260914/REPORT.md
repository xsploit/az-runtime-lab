# AZ update recovery: what it adds — 2026-09-14

Read-only PC inspection. No vendor executables, updater or controller firmware
were run. No Pi connection, flashing or deployment. Private inputs remain local.

## Direct extraction is now reproduced

The other task's `piopack-validation.json` records unmodified `piofirm unpack`
exiting 0 at piopack commit `34db8f87e2d4fa59276b109fa9dcb766af0ab4fc`, using
model `XDJ-XZN`. Independently rehashed both output ISOs in this inspection:
175,409,152 bytes, SHA256
`b294978a74fd887de56041825963d52f3645efe557e0c78f16516c4e04709dba`.
They match. The earlier missing-dependency checkpoint has been superseded.
The unpack invocation itself was not rerun by this inspection.

Every regular non-symlink file in the new rootfs was compared with our existing
AZ rootfs: **7,641 identical; zero new-only; zero different**. This comparison is
one-directional and excludes symlinks/device nodes. EP147 is still SHA256
`736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.
There is no newly recovered version of the player, libraries or UI here.

The useful extra inspection targets are outside the initramfs: the complete
kernel, bootloader/update images and four controller S-record files. They were
already present inside the earlier matching ISO; unpacking them makes them
accessible, rather than creating new firmware content.

## Controller images: useful for input and mixer protocol work

Validated every record's byte count and checksum; zero failures. All four files
use S3 data records (32-bit addresses), S7 entry `0x60002409`, flash config at
`0x60000000`, IVT at `0x60001000`, vectors at `0x60002000`. Initial stack words
point into `0x2000xxxx`; reset vectors are Thumb addresses.

| Image | Revision | Actual data bytes | Address envelope, end exclusive |
|---|---|---:|---|
| DECK_UCOM | 1.02 | 490,496 | 0x60000000–0x60200000 |
| ErP_UCOM | 1.00 | 109,312 | 0x60000000–0x60080000 |
| MIXER_CONT_UCOM | 1.03 | 384,768 | 0x60000000–0x601d8d00 |
| MPNL_UCOM | 1.02 | 94,464 | 0x60000000–0x60060000 |

Sparse address envelopes are not file/data sizes. Their `FCFB` flash tag and
header version `0x56010400` match NXP's FlexSPI format. The layout is consistent
with i.MX RT-family microcontrollers; the exact silicon part is not established.
Compare [NXP AN12183, boot image layout](https://www.nxp.com/docs/en/nxp/application-notes/AN12183.pdf)
and [NXP ROM API definitions](https://mcuxpresso.nxp.com/api_doc/dev/4587/a00041.html).
These are separate microcontroller programs, not additional ARM64 Linux apps.

MIXER_CONT contains diagnostic fragments referencing `dsp_com`, mute, auto-BPM,
I2S, LPSPI and `USB_UTILITY_MBX`; source-path remnants also identify mixer code.
MPNL has mixer-panel/FSL-clock-driver remnants. DECK includes TaskQueue and
beat-jump-related text. String fragments can abut instructions/data and are
**leads, not recovered function declarations or proven algorithms**.

Strong next target: follow mixer-controller SPI/mailbox handlers, mute/ack and
DSP-command state transitions, then compare them to EP147's mixer messages and
our host mixer. That could improve effect state, LEDs, initialization and missing
control responses. It does not establish that the sample-processing Beat FX DSP
program is embedded in MIXER_CONT. The processor driving a DSP can be distinct
from the DSP executing the effects.

The stripped AArch64 Updater references all four image names and nodes
`subucom_spi5.0`, `subucom_spi2.0`, `subucom_spi1.0`, `subucom_spi1.1` and
`subucom_spi3.0`. The `spi1.1` occurrence is a specific lead beyond our four
current fixture nodes. String presence alone does not map MPNL to that node;
trace the updater selection logic before implementing it.

## Kernel and boot: constraints, not a ready-made Pi optimization

Recovered the embedded gzip IKCONFIG member (`IKCFG_ST` offset 8,497,736) from
the full kernel, rather than assuming the public-source defconfig was the shipped
configuration. Selected actual options:

- ARM64 4 KiB pages; PREEMPT enabled, HZ=1000, high-resolution scheduler tick.
- NR_CPUS=8 is the build maximum, not a claim that the AZ has eight cores.
- Rockchip DRM, RGA2 and the D810 sound driver enabled.
- Interactive governor is the compiled default, but the existing `fix-clock.sh`
  explicitly selects performance for CPU clusters, DDR and GPU.

The unchanged startup scripts reserve CPU4 by changing general affinity from
mask `3f` to `2f`, put X and SPI work on CPU5, and assign high realtime priorities
to selected threads. These are RK3399 assumptions, not masks to copy onto a
four-core Pi. PREEMPT=y does not establish PREEMPT_RT. A 1 kHz kernel tick also
does not mean the GUI is rendering at 1,000 FPS.

This helps explain why an unconstrained generic Linux launch can behave
differently, and why allocator page-size compatibility matters on our tested
16 KiB-page Pi. It does not prove changing the Pi kernel or governor is beneficial;
use measured analysis-under-playback tests before such changes.

The already-available GPL `sound/soc/codecs/d810.c` accepts 44.1 kHz and S32_LE,
with one DAI supporting up to eight playback channels plus another supporting
two. That corroborates the ten-channel hardware-facing transport assumption. It
is interface registration/configuration, not a recovered EQ/Beat FX algorithm.
Our existing float32 player/audio fixture and FLX6 output are different layers.

## Boundaries and recommended order

1. Mixer-controller command/ack/mute and effect-state handlers.
2. Deck/panel input and response formats; determine the extra updater SPI endpoint.
3. Use the shipped kernel/boot settings as a comparison reference for targeted Pi
   measurements, retaining the working display and audio baseline.

Bootloader images are not Pi executables and this is not a full eMMC dump.
Cabinet still has separate encryption; equivalence to our previously supplied
cabinet is unverified. No newly recovered cloud access or complete effects DSP
is claimed. No keys, firmware bytes, ISOs, S-record payloads or kernel config dump
are included in this report.
