# AZ complete one-tick scheduling candidate

Private live experiment on EP147 v1.30, SHA256736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6. No firmware file changes. The broader full firmware/DSP task remains incomplete.

This extends the four-instruction experiment documented in AZ-ONE-TICK-EXPERIMENT.md with:

| Address | Original | Candidate | Meaning |
| --- | --- | --- | --- |
| 0x212fc1c | 0x1e632800 (`fadd d0,d0,d3`) | 0xd503201f (`nop`) | Remove extra period after computing next redraw boundary |
| 0x212fc44 | 0x52800022 (`mov w2,1`) | 0x52800002 (`mov w2,0`) | Main callback's insufficient-ticks fallback uses the one-tick policy |
| 0x212f358 | 0x52800022 (`mov w2,1`) | 0x52800002 (`mov w2,0`) | X11 upload-delay fallback uses the matching policy |

All seven original words are checked before application. New words verified using llvm-mc. GDB stops threads while writing code, then detaches; instruction values are checked through process memory. The script restores originals in finally, including on ordinary exceptions and SIGINT/SIGTERM. SIGKILL/host loss cannot execute cleanup; restarting the original executable clears changes. No permanent or startup patch has yet been enabled.

The schedule still uses the original16.880486ms period, absolute59.24Hz synthetic clock, and native timer mechanism. It does not establish real compositor/DRM vblank synchronization. Upload requests use1ms to avoid deliberately waiting another synthetic tick.

Six-second internal-field A/B/A, without ffmpeg:

| Phase | Repaint changes | Blit changes | Repaint median | Blit median |
| --- | --- | --- | --- | --- |
| Original | 178 | 177 | 33.646ms | 33.704ms |
| Candidate | 355 | 355 | 16.836ms | 16.814ms |
| Restored | 177 | 178 | 33.681ms | 33.725ms |

Candidate maxima18.696/18.717ms. These are changes to native scheduler timestamps, not physical frames or proof of distinct waveform content. Candidate changes did speed up the internal scheduler, unlike the incomplete four-instruction experiment. Saved `az-full-one-tick-fields-*.json` and `az-full-one-tick-field-summary.json`.

## Actual waveform-content result

After the reload helper completed, ran six-second original/candidate/restored waveform captures while both DeadWrong tracks played. Candidate screenshot shows both loaded and nonzero remaining times; view remained expanded. 850×170 capture:29.667/29.484/29.500 native changes/sec. Candidate capture only648samples versus719–720 for original/restored, so a smaller-capture follow-up was required. AZ CPU with capture rose31.29→51.02→31.43% of one core; this is a load increase without an observed content benefit.

Repeated with400×32 crop atx420/y150, separately named `pi-small-one-tick-experiment.py`/`az-small-one-tick-*`. This sustained719/721/721 samples over~6seconds:29.500/29.627/29.460 content changes/sec, medians~33.33ms. Thus the larger capture's shortfall does not explain the unchanged content update count. This still is not physical-panelFPS.

Combined evidence: the candidate doubles internal redraw/upload timestamp cadence but does not double distinct waveform frames. The next investigation should distinguish waveform update/data-provider gating from final upload behavior. Do not deploy this candidate just for faster callbacks: it currently adds CPU cost without a verified visible gain. All original instructions were restored after both tests; no persistent native scheduling patch is enabled. Linear compositor filtering remains the only new active visual change.
