# PCM buffer lifetime: native-code cleanup verification

2026-09-13. Original EP147 SHA256
736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6.

## Native ownership paths

PageBuffer vtable0x25f9c00 names nondeleting destructor0x768d70 and deleting
destructor0x768988. Both drain the owning vector at object+0x80 in reverse
order, skipping null entries, and validate each live page's eight AF prefix
bytes and eight EF suffix bytes when payload/count are positive.

Payload release passes wrapper.data-8 to C free@plt0x424af0: call0x768bc8
in the deleting destructor,0x768fb0 in the nondeleting destructor. The
16-byte wrapper itself goes separately to sized operator delete@plt0x426660.
After the loop the vector allocation is freed. The deleting variant also
passes the344-byte PageBuffer object to sized delete; nondeleting does not.
Null payloads skip payload free while still deleting their wrapper. Zero
sample count skips guard checks but still frees a nonnull allocation.

Owner-array cleanup helper0x7704d8 follows the same page guard/payload/wrapper
rules, with payload free at0x7705e8. It drains the count but leaves the vector
allocation for its caller. Constructor exception cleanup at0x7780b4 calls
this helper, then frees the vector at0x7780c0. This links the helper to partial
construction, but does not constitute an executed full exception-unwind test.

Outer PageBufferSystemUnit destructor0x772010 releases its adapter+0x18,
then scheduler+0x10, then PageBuffer+8. These are static call-order findings;
the synthetic tests do not execute the scheduler shutdown or its threads.

## Original instruction execution

probe-pcm-destructor.py copies SHA-pinned instruction pages into temporary
AArch64 test ELFs and executes them locally under qemu-aarch64-static. It
records allocator calls instead of actually freeing synthetic fixture data.
No proprietary instruction copies persist after the temporary directory exits.

18 tests pass: deleting/nondeleting destructors and owner-array cleanup,
each with normal pages, a damaged prefix guard, a damaged suffix guard,
a null payload, a zero sample count and an empty vector. Nonempty fixtures
also contain a null vector entry. Expected allocator type, pointer, size,
order and guard-detection events match the native instructions exactly.

Guard-error reporting is intercepted at0x768ca0,0x76907c,0x770658 and resumed
after the logging block. This verifies entry into the detection path, NOT
whether the real assertion/logger aborts or resumes. Empty non-page containers
avoid unrelated destruction; no full application shutdown or concurrency claim.
Output: pcm-pool-live/destructor-oracle.json. Supporting disassembly:
pool-destructors.txt, page-owner-array-cleanup.txt, constructor-cleanup-tail.txt.

## Consequences for a template-backed allocator

- The raw allocation address and payload address differ by8bytes. Ownership
  dispatch must recognize the raw address used by free, not only payload.
- Keep guard validation and independent wrapper allocation/deletion intact.
- Cover normal destruction and partial-construction cleanup. Switching malloc
  alone would hand mapped memory to libc free and is invalid.
- A process-wide pointer-range ownership check can cover mapped raw addresses,
  but which import table/call sites need dispatch still requires implementation
  and validation. These tests do not prove every possible release route.
- Recycling free pages during playback is a separate synchronized lifetime
  question. Destructor correctness does not establish safe concurrent reclaim.
- No replacement allocator deployed to the running player this pass.
