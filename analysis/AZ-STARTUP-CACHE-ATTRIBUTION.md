# AZ startup cache attribution

2026-09-12. Previous turn made progress by measuring allocator statistics. This turn locates two distinct startup allocation groups in native AZ code; it does not yet reduce their sizes.

## Confirmed large raw-file caches

The main-executable C allocation trace records five successful malloc requests of **105,044,016 bytes**, all returning to **0xe97044** immediately after the call at **0xe97040**. They are present before loading tracks. The previous allocator snapshot reports five live objects in the112MiB size class; the request fits that class.

The construction routine starting0xe96fb0 reads an integer configuration atx1, shifts it left20 to obtain bytes, and divides by16,384 to get a block count. It requests `(block_count + 2) * 16,408` bytes. The observed request is exactly `(6,400 + 2) * 16,408`, corresponding to a100MiB configured payload, with24 bytes of per-block overhead and two guard blocks. The following code writes guard patterns0xaf and0xef and builds a free-block list. Do not confuse its16KiB data blocks with either jemalloc's64KiB allocation page or the kernel's16KiB memory page.

This same routine constructs `input_stream::RawFileDataCache<16384, input_stream::detail::RawFileDataCacheImpl<16384>>`:

- RTTI type string0x27e4f90, typeinfo0x27e4fe8.
- Vtable address points0x27e5b38,0x27e5bc8,0x27e5c38,0x27e5c60 are written to the new cache object's interfaces at0xe97600..0xe97618.
- At0xe97638, the pool object retaining the allocated buffer is stored in the cache object at+0x2e8.
- The nearby native diagnostic string names `input_stream::CachePool::<lambda(const input_stream::FileCacheConfig&, int, meow::TaskDrivenThreadWithTimer*)>` at0x27e8d08.

Together, live call sites, exact arithmetic and the constructor's data flow attribute these blocks to raw-file caching. This is not a waveform image buffer or proof of one cache per specific deck. Mapping each instance to its consumer remains open.

No backing buffer was shrunk or discarded. A smaller configured capacity is a candidate for controlled startup testing; it could increase storage reads and affect seeks or streaming. Allocator purge does not release these live application-owned pools. Actual resident savings are unmeasured.

## Separate music-library list caches

The C++ trace records five10MiB new[] requests returning to0x12c2ba8. The construction code allocates a pool configured by constants `(1024,10240)` at0x2863370 and a10MiB backing array, then stores the pool at+0x40 of an object with vtable0x28629b0: `music_library::ListCacheCollector`. That collector is attached to the containing library-service bundle at+0xb0; a `ListServer` receives it at+0x40. Other reconstructed member types are in az-library-cache-owner-types.json.

These are a different group from the112MiB-class raw-file caches. Removing library caches and changing raw-file read-ahead are different experiments with different behavior risks.

## Tracing method and verification

- Current kernel config confirms CONFIG_UPROBE_EVENTS is unset. [Kernel documentation](https://www.kernel.org/doc/html/latest/trace/uprobetracer.html) identifies that option as required for user-space probe events. No kernel changes were made.
- A host-only LD_AUDIT attempt failed before execution because the allocator could not obtain static TLS. That implementation was removed; it was not deployed to the Pi.
- `large-new-trace.c` forwards the four ordinary/nothrow scalar/array new entry points via cached RTLD_NEXT addresses. It does not interpose C allocation. Host and Pi tests cover successful allocations, exception unwinding, null nothrow failure and subsequent frees. Its fixed512-event ring records returned calls >=8MiB, not live allocation ownership or exceptions.
- `main-allocation-trace.c` resolves original C allocation functions normally, then changes only the main executable's three RELA import slots. Its constructor checks all slots share one mapped page, temporarily adds write access and restores the page's original protection. It does not globally interpose malloc/calloc or replace the allocator. Host and Pi tests pass for PIE/lazy bindings and non-PIE/full-RELRO, with calloc zeroing, realloc content preservation, unaffected C++ behavior and protection restoration.
- Native main C slots: calloc0x3b252e0, realloc0x3b25368, malloc0x3b25900. The reader checks installed mask7, error0, process identity and exact overlay SHA before accepting events. This is an AZ-only launcher option, `LAB_MAIN_ALLOCATION_TRACE=1`. C++ trace option is `LAB_LARGE_NEW_TRACE=1`.
- The first C-trace firmware launch exited127 because the host headers redirected sscanf to unavailable `__isoc23_sscanf`. Added an explicit legacy sscanf symbol alias, reran the Pi full-RELRO forwarding test and verified successful native startup. No firmware crash or core is implied by that loader rejection. The rejected log is retained.

Build native trace shims with `-nostdlib -shared -fPIC -O2 -mno-outline-atomics -funwind-tables -fno-stack-protector -Wall -Wextra -Werror`. No GLIBC version requirements; check required symbol names too, since an unversioned import can still be unavailable in the older loader. The shims remain diagnostics, not enabled by default or suitable as final performance measurements.

## State and next work

Current kept-open session6982 runs EP14721258 and Xwayland21251, with both allocation traces and the allocator snapshot enabled. Original waveform contrast, fractional grid, staged image presentation and59Hz timing are retained. Both DeadWrong tracks were reloaded and transport started after the diagnostic restart. Paced null audio is still used; no audible output claim. Previous kept-open sessions were deliberately stopped and their player/display processes verified gone. Original firmware unchanged.

Next is to locate the FileCacheConfig capacity source and map the five cache consumers; test smaller capacities through constructor configuration, preserving all block-count, guard and ownership invariants. Compare memory, seek/load latency and source progression with identical content, then restore baseline for confirmation. Do not reduce the malloc request independently of the configured block count. The16KiB allocator-build experiment remains a separate lead, and the wider firmware/audio/controller goal is still open.
