# PCM return-path investigation — 2026-09-13

User is shutting down the Pi for the night. No Pi tests, SSH probes, or runtime changes were started in this investigation turn. Continue offline until user makes the Pi available again.

Previous goal turn made progress: verified identical decoded audio samples for baseline and template-memory runs and retained the evidence. This turn inspected additional original AZ instructions locally.

## Verified static observations

Firmware: original EP147 SHA256 736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6.

- Pool<Page>::push at 0x7734d0 publishes the wrapper pointer into its deque. The normal path neither reads nor clears PCM payload. Its slow path calls 0x772270. Caller-level lifetime still matters.
- Cluster::Reservation::setPage at 0x77cf98 is identified by diagnostic string 0x25f2ba0. When its reserved entry byte is nonzero and entry+8 is null, it stores the supplied page at entry+8, clears the reservation byte, increments cluster+0x28, clears reservation+8, and returns a nonzero result. Otherwise the normal rejection path returns the supplied page to Pool::push at 0x77cfdc and clears reservation+8. Do not reclaim at the common setPage entry: successful pages remain in use.
- Track::Reservation::setPage at 0x77d128 is identified by diagnostic string 0x25f2c48. It checks the captured identity at reservation+8 against track+0x20 and captured generation at reservation+0x10 against track+0x28 before calling the cluster setter at 0x77d280. Identity/generation mismatch returns directly on the inspected path; this alone does not prove the outer ownership outcome.
- BufferingCommander::onPageFilled-related closure at 0x77d3e8 is identified by the diagnostic at 0x25f2cf0. It gets the PageBuffer from commander+0x10, performs track lookup via 0x7709c0, and sends the page to pool at PageBuffer+0x30 on error (call 0x77d550) or missing-track (0x77d590). The valid path calls the track reservation setter at 0x77d448. This verifies the PageBuffer+0x30 embedding for these paths.
- A direct caller 0x782aa8 invokes 0x77d3e8 on the false branch of a preceding virtual call. A true branch dispatches through another virtual method. Those interfaces and scheduling context are not yet resolved.
- Cluster retirement path around 0x774640 obtains an exclusive state by LDAXR/STLXR changing 0 to -1, clears the cluster pointer at 0x774660, then calls 0x670488 before draining its pages. 0x670488 changes -1 back to zero using LDAXR/STLXR. The lock is therefore released BEFORE the pool pushes at 0x7746a0. A similar pattern precedes 0x7740d0. This is evidence of cluster detachment, not proof of global pool synchronization or absence of outstanding payload readers.
- Cluster tail-release helper begins at 0x773620 (not 0x773600). It clears entry+8 before pushing at 0x77367c and decrements cluster count. The earlier direct-call query for 0x773600 was the wrong function entry and must not be used to infer absence of callers.

## Remaining work

Trace caller synchronization and reader lifetime, including the virtual dispatch route; establish where a page is exclusively owned before queue publication. No MADV_DONTNEED/reclamation change was implemented. Test actual return semantics and pool slow path before any integration, then repeat playback/load/seek and audio checks once the Pi is available.

Supporting current disassembly: pcm-pool-live/pool-return-expanded.txt; existing pool-push-callers.json and pool-push-disassembly.txt. Static observations are not concurrency proof.
