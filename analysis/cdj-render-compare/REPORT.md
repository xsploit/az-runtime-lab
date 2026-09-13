# CDJ-3000X versus XDJ-AZ: native timing and image gate

Read-only local investigation, 2026-09-13. The inspected CDJ is **CDJ-3000X v1.40 EP145**, not the original CDJ-3000. AZ is v1.30 EP147. All addresses below are ELF virtual addresses. No firmware, launcher, shim, device, or running player was changed. No firmware bytes were uploaded.

## Result

The CDJ-3000X contains a materially less restrictive display scheduler than the original AZ, and asks its LocalPlayer timer for 50 Hz rather than AZ's 30 Hz. Its display timer is configured for 49.69 Hz rather than AZ's 59.24 Hz. Thus nominal panel/display frequency alone would be a misleading explanation of the difference: original AZ also has additional repaint/upload gating and a slower source-position timer.

The native software image renderer's fractional translation gate is identical in the two binaries for the 60-byte gate examined. This does not demonstrate that their waveform/grid callers draw identically. It does rule out the claim that CDJ-3000X simply lacks AZ's generic integer-translation shortcut.

These are verified static code findings, not measured CDJ runtime cadence or proof of the cause of the user's original CDJ-3000 observation.

| Mechanism | AZ original EP147 | CDJ-3000X EP145 |
|---|---|---|
| LocalPlayer requested update rate | 30 Hz at `0x1e262e8` | 50 Hz at `0x1f6ace0` |
| JUCE timer interval from that request | integer 1000/30 = 33 ms | integer 1000/50 = 20 ms |
| Display requested rate | 59.24 Hz, per existing AZ analysis | 49.69 Hz, double at `0x303ed98` |
| Display nominal period | 16.880486 ms | 20.124774 ms |
| Repaint callback gating | difference of floor-divided tick counts must exceed 1 | no analogous tick-count gate in callback |
| Upload delay hook | tick-count calculation may return a positive delay | refresh timing state, then always return zero |
| Upload following callback | boundary calculation and further display-period reservation | registered X11 timer requested with 1 ms |
| Near-unit image translation gate | quality test and `(fixedX OR fixedY) & 0xe0` | same instructions and rounding |

The AZ experimental overlay changes its LocalPlayer request to 60 Hz and alters seven display-policy instructions. The CDJ code is a different implementation, **not an eight-address patch template**. In particular, CDJ's 1 ms X11 request and period-based timer fallback must not be interpreted as a 1000 Hz display.

## LocalPlayer configuration chain

CDJ configuration constructor `0x1f6acd8` loads `w1 = 50` at `0x1f6ace0` and stores it to configuration+8 at `0x1f6ad10`.

Two wrapper paths establish where that configuration goes:

- `0x1f5d87c` constructs the configuration at stack+0x20; `0x1f5d88c` passes that address in x1 to collection constructor `0x1f6f750` at `0x1f5d890`.
- `0x1f5d914` constructs it at stack+0x30; `0x1f5d938` passes the same configuration to `0x1f6f750` at `0x1f5d948`.

The collection constructor retains config x1 in x20 at `0x1f6f780`. It loads config+8 into w5 at `0x1f6f8a0`, then calls LocalPlayer factory `0x1f6f1c8` at `0x1f6f8b8`. The factory saves w5 at stack+0x9c (`0x1f6f230`), reloads w1 (`0x1f6f430`), tests positive (`0x1f6f438`/`0x1f6f44c`), and calls `0x24bcfb0` at `0x1f6f454`.

The helper `0x24bcfb0` checks positive, loads 1000, performs signed integer division by w1, and branches to timer start `0x24bca70`. This proves a 20 ms timer request on that constructed path. The factory installs primary vtable `0x2fa9e28`; the existing CDJ RTTI map identifies `gui::player_info::LocalPlayer`.

AZ's corresponding chain is already documented in `../AZ-SCROLL-STARTUP-EXPERIMENT.md`. Its startup configuration is 30, and its equivalent helper is `0x239d2e0`. This investigation re-disassembled the startup load and final helper caller in AZ as a comparison check.

## Display scheduler identity and connection to X11

CDJ `0x2269d78` loads the double at `0x303ed98` (49.69) into d0, then calls factory `0x22779e8`. The factory allocates 0x88 bytes and calls constructor `0x22778d0`. That constructor stores `1000.0 / requested_hz` at object+0x58 (`0x2277920` and `0x2277954`). The RTTI name at `0x3040a00` is `device_adapter::MainDisplayUpdateTimer`.

Constructor-installed vtables make the comparison stronger than an isolated byte-pattern match:

- Primary vtable `0x3040b00` includes onImageBlit `0x22773e0`, delay method `0x22773c0`, X11 timer setter `0x2277aa8`, and callback `0x2277640`.
- JUCE timer subobject vtable `0x3040b58` includes callback `0x22776e0`, the equivalent callback using the adjusted object base.
- Display hook subobject vtable `0x3040bb0` contains onImageBlit adjustment thunk `0x2277618`, delay thunk `0x2277620`, and timer setter `0x2277ab0`.

Factory `0x2277a18` passes object+0x28 to registration `0x22d6590`, which stores it in global `0x11015b08`. X11's delay dispatcher `0x22d65c0` reads this global and branches through hook slot+8. X11 callback code calls it at `0x261abe4` and branches to rescheduling if its result is nonzero (`0x261abe8`). This is the same kind of delay-hook integration documented for AZ, not an unrelated dormant utility.

CDJ delay method `0x22773c0` and its adjusted entry `0x2277620` call timing updater `0x2277250` and return zero unconditionally. Original AZ `0x212f300` calculates elapsed tick counts and only immediately returns zero after their difference exceeds one (`0x212f344`/`0x212f348`).

CDJ callback `0x2277640`:

1. Reads period+0x58 and computes integer `trunc(period + 0.5) + 1` for its own timer request. With the configured period this is 21 ms.
2. Stops/restarts its JUCE timer and refreshes clock state.
3. Calls the stored callback at `0x22776a0` without AZ's floor-tick threshold.
4. Refreshes clock state again and, if its X11 timer pointer exists, requests that timer with 1 ms at `0x22776b8`/`0x22776c4`.

CDJ onImageBlit `0x22773e0` additionally computes a delay to the next vsync-relative boundary, starts its timer with that delay, and records current time at +0x80. Therefore the complete system is still sensitive to vsync phase, scheduling jitter, and blit notifications. The 21 ms callback fallback is not a measured steady-state frame interval. AZ's original callback `0x212fb40` instead includes its >1 tick threshold at `0x212fb94` and additional post-callback period arithmetic at `0x212fc1c`.

CDJ timing code refers to `/sys/module/rockchipdrm/parameters/vsync_time`. A lab synthetic writer is not evidence of physical panel vblank, in either model.

## Fractional image gate comparison

CDJ image routine starts at `0x251aa30`, corresponding to AZ `0x23fad60`. The exact 60 bytes from AZ `0x23fadf8` match CDJ `0x251aac8`, verified by `collect.py` against both complete SHA256-pinned files. This includes:

- quality field at state+0x60;
- float-to-signed-fixed-point conversion with eight fractional bits;
- quality-zero branch;
- combined-coordinate `& 0xe0` test;
- addition of 128 and arithmetic shift by 8 on the integer shortcut.

The CDJ gate test is `0x251aae4`; the filtered branch target is `0x251ab44`. AZ's corresponding test is `0x23fae14`, branch `0x23fae18`, filtered target `0x23fae74`.

This establishes a shared backend behavior. It does not establish whether CDJ's detailed waveform uses this backend on hardware, what subpixel coordinates its grid callers supply, or whether it uses different cached images or blending. No CDJ grid-call dataflow or live image inspection was performed in this bounded pass.

## Original CDJ-3000 availability and limits

Targeted filenames under the current workspace and Downloads found the existing original-CDJ source archive `rx3-research/cdj3000-leads/CDJ-3000.tar.bz2`, and CDJ-3000X v1.40 ISO/initramfs material. The archive listing is open-source platform material, not an extracted proprietary player. The existing original-CDJ investigation `rx3-research/cdj3000-leads/README.md` explicitly records no verified decryption key and no decrypted firmware. No original-CDJ application was located by this bounded search. This is not an exhaustive search of all mounted storage.

Consequently this report cannot explain an original CDJ-3000's hardware smoothness from its firmware. It provides a concrete related-model comparison and supports examining AZ's source/update and display-policy path separately from generic raster filtering. It does not justify replacing the current preferred AZ experiment or claim that the remaining physical wobble is solved.

## Reproduction and evidence

Run `python runtime-lab/analysis/cdj-render-compare/collect.py` locally. It validates complete input SHA256, writes only comparison artifacts here, emits compact disassembly excerpts through local `llvm-objdump`, and verifies the common image gate. `helpers.py` maps ELF virtual addresses through file-backed load segments. `manifest.json` records hashes, period and relevant vtables. Neither script opens or changes a running process.

Pinned CDJ SHA256: `97413d309b2bc2527bc38644245e7f1cb52e0d8de33dc48bc029048c81e9f378`.
Pinned AZ SHA256: `736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6`.
