# RX3 controller payload comparison

The locally decrypted RX3 1.19 and 1.20 ISO files contain more than the Linux player. Both include `images/EUP.mot`, `images/SUB.mot`, an unstripped ARM Linux `update` executable, boot/kernel/rootfs images, and application/resource archives. This inspection extracted only the two MOT files, release marker and updater to ignored private storage. Nothing was executed or flashed.

## Version and integrity evidence

The ISO release markers are respectively `1.19` and `1.20`. The three comparison files are byte-identical between those versions:

| File | SHA-256 | Additional check |
|---|---|---|
| `images/EUP.mot` | `59c4c27aebc5c6e32854dc3b47d6688da93f02a94a230cc23981ffebeee2da9b` | All 1,513 S-record lengths/checksums pass; 47,565 data bytes |
| `images/SUB.mot` | `51809d23aa7a61ca65238f41e39b85a00cc94fe1e5e115a5dd475ca61c88fa33` | All 1,065 S-record lengths/checksums pass; 33,249 data bytes |
| `update` | `ef9069cdb514518ddfbd326368ab2bd1320bba980490da84bb3fb0ed65d81da7` | ARM EABI5 executable; symbol table retained |

ISO hashes: 1.19 `29791419acbeb85ac42964fdbf7cf4d21254982f017da4089e3df126dd8b284a`; 1.20 `2b4e49280681917c0af9f75e3d6a1c5416b205b83052c6c3c3e7be3f73ab2394`. Payload equality does not imply the whole updates or players are identical.

The MOT files contain S2 data records (24-bit addresses), S0 headers and S8 termination records. Data spans sparse regions between `0xe000` and `0x100000` exclusive. Their termination address is zero; do not treat it as a proven reset entry point. Address width and file extension alone do not identify the processor or instruction set.

## Useful named entry points in the updater

`nm -C update` exposes these methods:

| Address | Symbol |
|---|---|
| `0x137f0` | `M16SpiComm::subucom_send_request(unsigned char*, int)` |
| `0x13aac` | `M16SpiComm::subucom_read_response(unsigned char*, int)` |
| `0x14484` | `M16SpiComm::enterUpdateMode_core()` |
| `0x20044` | `M16Downloader::updateApl()` |
| `0x20ce8` | `M16Downloader::updateBoot()` |
| `0x216e0` | `M16Downloader::updateFix()` |

`Sh2aUpdater` and `Sh2aDownloader` symbols are also present. Update-mode SPI messages are not necessarily runtime mixer messages.

The `M16Updater` constructor resolves two concrete payload/transport associations. For update type 1, call `0x1e57c` passes label `ERP`, `/dev/subucom_spi1.0`, and `images/EUP.mot` to `M16Downloader`. For type 2, call `0x1e5e4` passes `SUB`, `/dev/subucom_spi2.0`, and `images/SUB.mot`. The pointer literals at `0x1e77c`–`0x1e794` were resolved through ELF load segments, not guessed from nearby strings. These are vendor device-node expectations, not paths that users should create on a Pi. Exact MCU part numbers and runtime message compatibility remain unestablished.

## Next comparison boundary

Use the confirmed M16 download association to identify the exact MCU family before choosing a disassembler. Compare any resulting runtime interface with the AZ control-frame evidence only after identifying its actual role. No RX3 C674x DSP payload, shared AZ packet layout or common effects implementation has been established by this inventory.

For reproduction, list the supplied decrypted ISO with `bsdtar -tf`, extract only the named files into a private directory, hash them, and use `nm -C` on the updater. No key, vendor payload, disassembly dump or personal runtime path is included here.
