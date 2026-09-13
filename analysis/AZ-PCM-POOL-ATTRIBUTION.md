# Dominant startup allocation: PCM page-buffer pool

2026-09-12. Targeted diagnostic C/C++ returned-call aggregation for request sizes(12,288,14,336]. Compile-time LAB_TRACE_SMALL_BIN defaults0; opted-in Pi builds add fixed256-row aggregate counters with no allocation/I/O in recorder. Existing >=8MiB tracing remains. Four-thread400-call tests pass for C++new and Cmalloc; existing forwarding, C++exception/nothrow and C import permission tests pass with aggregation enabled. Counts are historical returned calls, not a live-object census or free trace.

Native EP14723902 startup C trace records33,850 successful malloc requests of14,128bytes at call0x777afc/return0x777b00. Zero aggregate overflow. C++ trace only7 matching calls at startup. This overwhelmingly explains the14,336 allocator bin's33,930 startup regions; not all80remaining regions attributed. Rounded dominant capacity is462.79MiB; requested capacity456.08MiB.

Confirmed constructor0x7779a8 writes vtable0x25f9bc8 with RTTI `pcmbuf::pagebuf::PageBufferSystemUnit<pcmbuf::pagebuf::DefaultPageStaticConfig>`; allocated inner344-byte object gets vtable0x25f9c00, RTTI `pcmbuf::pagebuf::PageBuffer<pcmbuf::pagebuf::DefaultPageStaticConfig>`. Diagnostic string0x25f13b8 names `pcmbuf::pagebuf::Page<StaticConfig>::Page(const pcmbuf::pagebuf::PageBufferConfig&)`.

The33,850-iteration loop reads configuration+0x10 at0x777a44 and allocates `(computed_count+2)*8`; native size14128 implies1764data elements plus two guards. Call0x688878 bounds-checks/clamps the configured per-page count to[1,1048576]; do not equate8-byte elements with a confirmed sample format yet. Guard patterns0xaf/0xef written around data. The loop allocates a16-byte page wrapper and adds it to owning containers. Distinct from100MiB RawFileDataCache and10MiB ListCacheCollector pools.

Only direct constructor caller found at0x765e34 in function0x765d00, which builds the configuration on stack+0x68. Number of pages atconfig+0x10 is w9, stored0x765e18; w9 =50*w5, and w5 derives from config values as3*96+381+2*4=677, giving33,850. Constants loaded at0x25fad20 start(9,96); original default blob0x25fad10=(3,18,44100,2). Some fields are overridden during construction. Full semantics/consumers and whether reducing this buffer pool preserves required buffering remain unverified. No memory-policy patch made.

Startup aggregate/raw allocator data and disassembly saved under small-bin-live. Last benchmark-fixture player23902 was deliberately stopped when user asked about their USB. New real-USB session is recorded in TRACKER.md. Full native control/DSP/audio goal remains active.

Live24479 read-only structural verification: exactly one PageBuffer with config uint32s `[1764,50,30000,37,33850,677,50,600,1500000,88200]`, object0x7ffec4121200. Owning vector count33850/capacity43144. Free-page deque uses64pointer slots per512-byte node; stable start/finish snapshots gave33850free with no tracks,30648free after loading Estara on both decks,30378free around11seconds of playback. Not-in-free-queue counts0/3202/3472, not a guarantee of safe reduced capacity. Both sources advance44113units/sec, read directly from the real USB folder; screenshot verifies95BPM Estara waveforms. Paced null audio remains. Same file on both decks, not two independent-file stress testing.

pi-pcm-pool.py searches only present private anonymous pages, saves no heap dump/PCM data, and validates type/config/container bounds. Initial scan872.8MiB took8.3sec; subsequent direct metadata reads about1ms. Do not reuse object pointer across player restarts. No memory-policy or rendering changes this turn. User next requests their SUBSECT tracks; loading those will also allow distinct-file observations.

## Owned residency verified, not just accounting

pi-pcm-pages.py followed all33,850 page wrappers from the live owning vector and verified distinct payload ranges,1764elements per page and unchanged owner/vector before and after. Sixteen spread-out samples retain originalAF/EF8-byte guards. The union of page-aligned backing ranges spans462.8125MiB, all present, no swapped pages. Requested total456.0783MiB; allocator-rounded total462.7930MiB. Boundary page sharing means this is a virtual-page footprint, not a unique physical-page census. Ownership is substantially stronger than historical malloc ranges. No PCM contents were read/saved; only wrapper metadata,16guard pairs and pagemap bits. Runtime0.35sec; original pool untouched.

Further code evidence: factorycaller0x7adb90 supplies44100 to0x765d00. The multiply-high/shift at0x765db8/0x765dd0 implements division by25 here, yielding1764 (not441). Source sample domain is44.1kHz;1764elements span40ms. Firmware diagnostic strings explicitly identify `DefaultPageStaticConfig::InternalDataT = meow::Float2` in Page::write and PageBuffer::read takesFloat2*. This supports interleaved stereo float storage and explains8-byte elements. Nominal total duration across pooled data is1354seconds; it is shared storage, not a claim of1354seconds per deck or required reserve.

Schedulerconstructor0x7760e0 receives the same buffering policy config; first24bytes copied to+0x2d8, policy field+4 (96) also stored at scheduler+0x35c. This links the constant to both pool sizing and the scheduling structure. Its full semantic role is still unknown: do not label it seconds, tracks or thread count without tracing consumers.

After user-selected track changes,9519pages were outside the free queue and24331remained free. This is a changing cache-occupancy observation, not a safe reduction bound. Concurrent transport sample had deck1paused and deck2reaching its end, so it is excluded from steady two-deck performance comparisons. No memory-policy change or restart made during these observations.

User requested SUBSECT tracks, then cancelled the loading request ('Dont worry about it bro continue your work') and explicitly resumed this memory lead. Search found125matching paths underContents/UnknownArtist/UnknownAlbum; no SUBSECT track loading claimed. User UI interactions changed the displayed track while navigating. Stop UI control and leave selections alone. Actual USB remains mounted read-only in the AZ namespace.


## Scheduler policy resolved: 96 is the locked-range limit

Function 0x780ea8 takes the scheduler and constructs the embedded list address
at scheduler+0x330. At 0x780edc it reads list+0x2c (96), compares it with
scheduler+0x350 (registered object count), and only allocates/appends the
64-byte range object when the count is below the limit. Diagnostic 0x25f45c0
explicitly names `LockedRangeList::regNewRange`; 0x25fa6c0 says
`list.size() < nMaxRanges`. The limit-exceeded path returns -1. This is an
interface/resource limit as well as an input to pool sizing, not simply a
cache-retention target. Individual features owning each range remain untraced.

The constructor replaces base vtable 0x25f9aa0 with final vtable 0x25f9c70
at 0x77639c. Final RTTI identifies `BufferingScheduler`. The initial scanner
incorrectly searched the base vtable and found no instance; correcting it
found one validated scheduler at 0x7ffec45d3800 in PID24479/start2739430,
linked to the known PageBuffer through both +0x308 and +0x330.

`pi-pcm-policy.py` scans present anonymous pages for initial discovery and
reads only metadata. Live policy is [9,96,44100,2,4,200], with **88 registered
locked-range objects out of maximum 96**, and five parallel buffering units.
A repeated direct read agreed and took 1.3ms with no scan. Registered objects
are not the number currently holding pages. Pool observation remains 9519
pages outside the free queue, 24331 free. This rules out casually reducing
96 to 64 or 32 while retaining the existing clients. It does not prove 88
would suffice for all operations.

The cleaner is embedded at scheduler+0x378, initialized at 0x7768c8 onward;
the parallel unit list is at +0x360. Neither is the locked-range list +0x330.
Diagnostic evidence identifies freeSomeClusters at 0x7750f8 and
freePartsOfTrack at 0x7748d0. Cleaner has a bounded ten-pass retry path
(0x775128, 0x775a18), with an intervening call taking argument 1; units and
semantics of that delay call are unverified. Full reclamation and range
ownership remain the next targets before a pool-capacity experiment.

Artifacts: pcm-pool-live/locked-range-diagnostics.json, az-pcm-policy.json,
az-pcm-policy-direct.json, az-pcm-pool-policy.json, buffer-cleaner-compact.txt,
pcm-region-compact.txt. No firmware, playback selection, rendering policy,
or pool limit changed; no player restart. No RAM saving claimed.


## Live range ownership and protected coordinates (2026-09-13)

Extended pi-pcm-policy.py --ranges reads stable64-byte records from all88
registered pointers, verifies each pool/config backreference, and emits page
coordinates with anonymous per-source group numbers. In the current paused/
ended-track state only two records have nonempty ranges, totaling221 unique
page coordinates across two source groups. These are requested protected
coordinates, not proof of residency or of minimum safe pool capacity.

pi-find-range-owners.py scans present anonymous pages for a scheduler pointer,
valid registered ID, and adjacent RangeWithSourceInfo vtable0x25eb308. Found
exactly88 references covering IDs0..87 with no gaps. Forty-four references
have CuePropertyWithBufferLock vtable0x288f0d0 at offset-0x118; each has its
second scheduler reference at+0x88 with the paired range ID. All88 are covered
by these44 cue-property objects. Firmware RTTI names the cue-property class;
constructor candidate0x13e3f2c onward contains the reviewed calls through
scheduler slot0x58 with integer5 and stored returned IDs. The UI meaning of
each individual cue object is not yet assigned. Do not label the96 slots
as free-to-remove cache settings.

Evidence: az-range-owners.json, cue-range-pairs.json, az-pcm-policy-ranges.json,
locked-range-owner-candidate.txt, slot58-result-store-candidates.txt under
pcm-pool-live. Generic slot0x58 scans include unrelated interfaces; candidate
presence alone is not attribution. The early0x7921f0 candidate was rejected.

A separate guarded-page sharing/COW experiment passed; see
AZ-PCM-TEMPLATE-EXPERIMENT.md. This changes the next experiment toward backing
storage without cutting range/pool capacity. No such implementation is yet
integrated into AZ, and no AZ RAM savings are claimed.
