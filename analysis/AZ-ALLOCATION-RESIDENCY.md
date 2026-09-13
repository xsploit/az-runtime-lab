# AZ allocation residency and dominant small bins

2026-09-12. Read-only native Pi observations, followed by an expanded diagnostic snapshot. Original firmware and cache capacity unchanged.

## Resident ranges

EP14722519 was confirmed live and its executable SHA pinned. pi-allocation-residency.py reads pagemap status bits without reading payload data or emitting physical frame numbers. Validates trace PID/start identity, records whether mappings change, and unions overlapping historical ranges before totaling. Host4KiB and Pi16KiB anonymous mapping self-tests correctly distinguish untouched from two written pages. Present virtual pages are not a unique physical-page census; historical allocation records can be freed/reused. These limitations prohibit adding all individual rows as live-object RAM.

The five recorded100MiB raw-cache allocation ranges had present page spans0.0625/0.0625/0.0625/0.0625/4.265625MiB, total4.515625MiB. This explains why changing reserved capacity had little effect in the short-track workload. It does not establish behavior with long tracks or streaming. Five recorded10MiB ListCacheCollector ranges were essentially fully present. Recorded8/16MiB allocation ranges at return addresses0xd9d04c/0xd9d080 were also almost fully present, with overlapping historical records; combined union of all recorded C/C++ ranges was174.75MiB. The remaining footprint is not captured by this >=8MiB trace.

The largest anonymous VMA had545.56MiB of present page spans. No mapping changes during the0.49sec scan. A VMA is not an object and has not been mapped to a specific allocator pool or semantic owner.

## Small-bin distribution

Expanded allocator-snapshot.c JSON options fromJabx toJax to include merged small-bin counts. Still no individual arenas/mutex counters, no allocation tuning, purge or flush. Pi tests confirm64MiB allocation/free accounting, bounded JSON, no-request no-op, errno preservation, and explicit missing allocator statistics. Normal-thread native samples take3.3–3.9ms; not requested during CPU samples.

At startup,33,930 regions in the14,336-byte size class account for463.89MiB. Their slabs occupy464.19MiB of allocator capacity. After two tracks load,33,925 regions account for463.82MiB. Total small-bin accounting is622.14MiB startup and647.63MiB loaded. summarize-allocator-bins.py sums all bins and exactly reconciles with the allocator's small allocation total.

This is the strongest next attribution target, but size-class accounting does not yet prove these objects own the observed545MiB resident VMA, nor identify their purpose or actual request size. Size14,336 includes requests in(12,288,14,336]. It also does not imply464MiB can be safely removed. A static immediate-allocation scan found11 candidates but misses computed sizes and wrappers; none is claimed as the source of the33,930 allocations. Save future caller tracing for this request interval instead of another generic large-allocation trace.

Separate disassembly at0xd9cfc8 confirms the8/16MiB requests are rounded power-of-two arrays of8-byte elements, explicitly zeroed, stored in a large owning structure. Semantic owner still unknown; do not shrink them on this evidence.

## Current viewing session

One deliberate restart enabled expanded diagnostic JSON. Kept-open exec29218, EP14723202; original100MiB cache defaults,59Hz timing, fractional grid, staged image upload and original waveform contrast remain. Both DeadWrong decks loaded and advanced44,109.7 source units/sec in10sec. Player CPU42.68%onecore, RSS964.45MiB, paced null audio. Main-waveform screenshot saved. User reports that the display looks good; no new rendering change this pass. Overall native control/DSP/physical audio work remains unfinished.
