# AZ raw-file cache capacity experiment

2026-09-12. Private AZ 1.30 native Pi test; original firmware remains unchanged.

Confirmed shared FileCacheConfig at VA 0x25fa6e0 is four uint32 fields `(100, 2048, 5, 1024)`. Normal startup loads it at 0x77696c; fallback loads it at 0xe88778. Configuration reaches CachePool 0xe95ac0 and the indirect RawFileDataCache factory 0xe96fb0. The first field is MiB capacity and third field is cache count; other fields preserved without claiming their meaning.

Temporary overlay supports explicit 32, 64 or 100 MiB. Only the capacity data changes relative to the existing eight timing patches; source hash and original configuration are verified. Native 32 MiB run confirms five successful malloc requests of 33,636,400 bytes at return address 0xe97044, versus five 105,044,016-byte requests at 100 MiB. Guard/block arithmetic remains consistent with the configured capacity. 64 MiB is prepared but not run.

| Observation | Earlier 100 MiB baseline | 32 MiB experiment |
|---|---:|---:|
| Startup process RSS (MiB) | 922.38 | 922.61 |
| Startup allocator allocated (MiB) | 1489.42 | 1128.85 |
| Two loaded decks process RSS (MiB) | 962.64 | 963.22 |
| Two loaded decks allocator allocated (MiB) | 1508.82 | 1148.30 |

These are separate sessions, not a tightly matched timing trial. Allocator snapshots and physical RSS measure different things. The large accounting reduction did not produce a measurable useful RSS reduction in this short-track workload. Do not claim a 360 MiB physical RAM saving. Earlier 100 MiB measurements have fewer diagnostic traces enabled; this reinforces avoiding a fine-grained numerical comparison.

Both 32 MiB decks loaded Dead Wrong acapella and advanced at 44,133.6 source units/sec during a ten-second read-only sample (nominal 44,100). Player CPU was 42.99% of one core, not a controlled CPU improvement comparison. Audio remains paced null; no audible fidelity, underrun, sustained playback or cache-eviction validation. A paused sample is saved separately and not counted as playback. Initial UI selection before startup finished did not load tracks; later UI verification and native load/play inputs did.

Original 100 MiB cache configuration restored after this experiment. No smaller capacity enabled by default. Follow-up memory research should target resident allocation/layout rather than assuming reserved cache capacity is resident. All raw samples are in cache-capacity-live; variants and reference map in az-file-cache-variants.json and az-file-cache-default-references.json.

Restored100 MiB session22519 verification: both loaded decks advance44,134.4 source units/sec across10sec; player42.79%onecore andRSS964.09MiB. Same diagnostic shims as32 MiB run. Short separate samples support no useful memory/CPU benefit in this workload, not an exact equivalence guarantee. Main-waveform screenshot saved as cache-capacity-live/cache100-restored.png. A preliminary sampler crossing the unloaded sentinel during load is excluded; helper now reports null for sentinel positions rather than a bogus rate.
