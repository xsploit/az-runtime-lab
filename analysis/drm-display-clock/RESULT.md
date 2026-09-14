# Display-clock findings and shutdown checkpoint

## Preserved improvement

Native Pi launchers now put the transient vsync timestamp directory on tmpfs by default. The directory is bound read-only into the player's existing sysfs-shaped path; atomic replacement is retained, with a readable initial timestamp before launch. LAB_TIMING_TMPFS=0 explicitly selects the previous disk path for comparisons. Changes were applied to both repo native launchers and the installed Pi copies while preserving their unrelated differences. Backups end in .before-memory-clock-20260913.

The in-memory timing path was verified inside the running player's mount namespace. Both tracks loaded and played after restart, with the original 59.24Hz timing, fractional grid, staged upload and persisted Sway linear scaling.

Native DRM publisher isolation: disk-backed publication hit a 177.000ms write and two writes longer than a refresh before rejecting a stale event. The same 15-second tmpfs test had maximum write5.193ms, zero over-refresh writes,901 events, zero skips. This is a controlled publisher workload, not a claim that every live AZ stall lasted177ms. A separate20-second observation of the original live synthetic file measured maximum age45.45ms versus22.87ms after the memory-backed restart; p95 was17.24/16.71ms. These are short separate runs, not long-run latency guarantees.

The shared helper passed host and Pi checks:1000 atomic replacements concurrent with a reader, no empty/decreasing timestamps, private directory, cleanup, explicit legacy fallback and invalid-switch rejection. Final launcher integration compiles. The running memory-clock variant exercised the same mount/publication behavior; standard launcher copies were updated afterward, without another restart. A standard-launcher boot check remains to be done next time.

## Real display timing remains a candidate

DRM card0 / CRTC36 exposed the connected DSI-2 clock at approximately60.0155Hz. Native event publishing into memory completed1232/1232 sequences during the moving A/B/A, and7251/7251 over the two-minute live trial, with zero skips or errors. During that trial maximum observed delivery lateness1.970ms and file write4.388ms. Source positions advanced normally with paced NULL audio.

Earlier native comparison tightened upload phase relative to the display clock from circular spread approximately5ms to0.636ms. Memory-backed A/B/A measured player CPU48.36/53.50/48.36 percent of one core, Xwayland15.37/18.25/15.25, and candidate helper0.625. Thus this is a potential smoothness tradeoff, not a CPU reduction. It does not prove a specific compositor frame reached physical scanout or eliminate optical flicker.

The user did not provide a visual rating before asking to power down and move the Pi. The bounded trial restored the59.24Hz native period and original publisher. Do not silently treat real-DRM timing as the selected default. The linear filter restoration was separately confirmed by the user in the preceding pass.

The first Python publisher was invalid (root-only clock permissions). Two disk-backed native live trials rejected stale events and restored the original clock. Their failures led to the measured disk-publication stall. The memory-backed native helper subsequently completed the tests above. Details are retained in README.md and raw reports; no original firmware bytes were changed.

## CPU profile and next steps

Ten-second cycles:u sampling collected about2K samples without lost samples. EP147 accounted for74.05% of sampled cycles; libc12.56%; packed24 conversion6.15%; jemalloc1.81%. Report offsets differ from actual executable virtual addresses by0x400000; use samples.txt raw IPs. Native raster hotspots include0x241e820/0x241ee70, and the waveform RGB generation loop around0x1dfeef8. No speculative SIMD replacement was deployed.

Next: verify the updated standard native launcher after the move, confirm linear filtering and tmpfs timing, reload two tracks, then compare real-display timing physically. CPU follow-up should target the measured native raster loops. Analysis/load stress and audible audio/controller validation remain outstanding.

## Shutdown

User requested shutdown to move the Pi. Saved results to both host and Pi, ran sync, and systemctl poweroff returned success. The last player was3787, Xwayland3778 and memory-clock launcher3764; these IDs and /run/user/1000/az-display-clock-0fd5fyfm are obsolete after shutdown. Discover fresh IDs/paths on restart. BiteDJ remained stopped. No automation created and no claim of background Pi work after shutdown.
