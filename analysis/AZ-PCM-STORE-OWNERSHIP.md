# Experimental PCM storage ownership

2026-09-13. Standalone implementation, **not installed into AZ**.

`shims/pcm-template-store.c` and `.h` implement a sealed guarded template
with distinct writable private mappings. The caller explicitly initializes
the store; there is no constructor, preload hook, binary modification, or
automatic activation. The existing player was revalidated as PID24479 and
left running throughout this work.

## Ownership contract

Only the exact 14128-byte raw allocation size is accepted. Each slot has a
16384-byte stride. Capacity may reach the verified 33850 slots; initialization
maps the whole requested arena or rolls it back on failure. Prefix/suffix
guards match the original constructor. The returned address is the raw
allocation, eight bytes before the firmware's sample pointer.

Release returns 0 for external pointers, 1 for an owned slot successfully
retired, and a negative errno for an invalid interior address or already
retired/unallocated slot. A future dispatcher must forward only return 0 to
the original free. It must never forward negative results to libc. The
one-past-arena address is outside this ownership domain.

Atomic allocation indexes and active flags prevent duplicate slot assignment
and double retirement. Slots are not reused. Destruction requires quiescent
callers and zero live allocations; live allocations return EBUSY. Retirement
does not discard payload contents or unmap an individual slot. The arena is
unmapped only by explicit final destruction. This is an allocation lifetime
mechanism, **not synchronized recycling during playback**.

## Firmware import evidence

Original EP147 relocation table identifies C free JUMP_SLOT at **0x3b25690**.
Previously executed destructor/helper paths reach free PLT0x424af0. Adjacent
main C imports are calloc0x3b252e0, realloc0x3b25368 and malloc0x3b25900.
This provides a candidate main-executable dispatch point, not proof that every
possible release/reallocation route has been covered. The wrapper remains a
separate sized-delete allocation.

## Verification

`analysis/test-pcm-store.c` passes on host 4KiB and native Pi16KiB kernels:

- Four threads allocate/write512 slots; every sample and both guards are
  checked for isolation, with unique per-slot payloads.
- Wrong size, invalid capacity, exhausted capacity and premature destruction
  are rejected without consuming an extra slot or freeing live storage.
- External/null addresses are distinguished from owned raw/interior addresses.
- Reverse release, repeated release, unallocated-slot release, destruction,
  reinitialization and a four-thread same-pointer release race are checked.
  The release race has exactly one winner and leaves the live count zero.
- Injected failure after three mappings, repeated32 times, leaves no store,
  file descriptor count change, or VMA count change.
- Host AddressSanitizer and UndefinedBehaviorSanitizer run passes.

Build the normal test with:

```sh
cc -O2 -Wall -Wextra -Werror -pthread \
  shims/pcm-template-store.c analysis/test-pcm-store.c -o /tmp/test-pcm-store
/tmp/test-pcm-store
```

Add `-DPCM_STORE_TEST_FAIL_MAP=3` for the injected-failure variant. Native
Pi DSO compilation also passes with the established `-nostdlib -shared -fPIC
-O2 -mno-outline-atomics -fno-stack-protector` options. Its nine unresolved
libc symbols are present in the extracted firmware libc2.29; this is a symbol
availability check, not an executed firmware-loader test.

Commands, outputs, source hashes and libc hash are saved in
`pcm-pool-live/store-ownership-tests.json`.

## Next integration gates

Keep full pool capacity and original guard validation. Tie allocation to the
verified PCM call site, coordinate redundant constructor guard stores, and
retain a correctly initialized normal-allocation fallback. Exercise original
native cleanup instructions with actual mapped storage/dispatch, including
partial construction, before installing a hook in a player. Realloc and all
non-main-module ownership escape routes still require scrutiny.

This pass proves standalone ownership and COW isolation. It does not prove
AZ shutdown, audio timing, first-write fault latency, playback reclamation,
real AZ PSS reduction, or four-deck mixer correctness.

## Original cleanup executed with actual storage

`analysis/run-pcm-native-cleanup.py` now builds and runs a separate native Pi
test, `analysis/test-pcm-native-cleanup.c`, using the actual storage backend.
It extracts SHA-pinned instruction pages to private temporary directories,
maps them at their original virtual addresses with MAP_FIXED_NOREPLACE, and
sets their permissions to read/execute after initializing test trampolines.
The running player is never attached to or altered.

21 cases pass: deleting destructor0x768988, nondeleting destructor0x768d70,
and owner-array cleanup0x7704d8, each with normal mapped pages, mixed mapped
and malloc pages, null payload, zero sample count, empty vector, damaged
prefix, and damaged suffix. Nonempty owner vectors also include a null entry.

Unlike the earlier QEMU recording oracle, the native test actually retires
mapped raw allocations and calls libc free on ordinary raw allocations,
wrappers, the owner vector and (for the deleting variant) the344-byte object.
It verifies the exact pointer/type/size/release-order sequence. On successful
cleanup, all mapped slots are retired and explicit arena destruction succeeds.
Owner-array cleanup leaves its vector allocation intact for the harness caller,
matching the native constructor unwind layout.

The six damaged-guard cases reach the original detection branch, intercepted
to exit42. This does not execute the original assertion/logger or prove its
fatal/nonfatal behavior. The other15 cases complete normally. Unrelated
containers are zeroed; full scheduler destruction, full constructor exception
unwind, allocator GOT installation and full player shutdown remain untested.
Temporary remote code/build files were removed successfully.

Evidence: `pcm-pool-live/native-store-cleanup-tests.json`, including source and
firmware hashes, expected/actual process exits, and individual test output.

## Constructor integration plan from instruction inspection

At0x777afc the constructor calls malloc; return address0x777b00 identifies
this specific payload allocation independently of other same-size allocations.
After success it sets payload=raw+8, then invokes wrapper constructor0x76ca30
with offset0 and sample count1764. The wrapper stores pointer/count without
touching PCM contents. The caller subsequently writes guards at0x777b40 and
0x777b44. The next block0x777b48 inserts the wrapper into the owner vector.

A coordinated path can have the allocation wrapper supply initialized guards
for both mapped storage and ordinary fallback allocations, then omit the two
redundant guard stores. This must be installed as one verified operation:
omitting stores without the allocation wrapper would leave fallback guards
uninitialized, while installing the wrapper without omitting stores forces
private copies and loses the intended saving. Preserve original guard checks.

Before activation, verify the exact source/expected instruction bytes and
allocation site, handle all setup failure paths, and cover ordinary fallback,
unexpected allocation sizes and ownership release/realloc dispatch. Merely
setting an environment variable or adding LD_PRELOAD is not proof that both
parts were installed. No such hook/guard patch is active yet.
