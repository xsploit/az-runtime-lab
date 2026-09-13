# Local storage discovery research

## Verified from shipped scripts, not executed

XDJ-AZ rootfs/etc/udev/rules.d/98-local.rules starts device-mount@ services for supported sd disk/partition events. home/root/scripts/device-mount.sh mounts media under /media/usb/<device> (or /media/sd/<device>), then writes a custom kernel notification endpoint. Successful mount notification is:

    mount /media/usb/sda1 vfat protect:0

The script sends it to /proc/udev_usb1 or /proc/udev_usb2 according to USB bus identity. Removal uses `umount <mountpoint>`. Separate caution rules send connection/error events. The AZ executable contains the matching proc path strings, supporting this as a player integration lead; the actual reader/parser and its polling semantics are not yet mapped.

A directory containing music alone is therefore not proven sufficient to register a USB source. The emulator currently lacks these device-specific proc endpoints. Next trace the player's reads and event parsing, then implement an isolated notification fixture with a synthetic track directory. Do not synthesize host device events or run the shipped mount script on the PC: it changes scheduler settings and deletes existing mount directories as part of appliance setup. Its behavior is reference data for the harness.

## Model differences

AZ script maps USB1 bus1-1 and USB2 bus2-1. CDJ-3000X script maps USB1 bus5-1 and USB2 bus1-1, labelling the latter USB-C. CDJ additionally gates USB classification on matching these bus IDs. Reusing appliance USB topology literally on a Pi/PC would therefore be unreliable; a compatibility layer should translate host storage events to the player's logical ports.

AZ script explicitly selects vfat, exfat-fuse and hfsplus mount commands. This is script coverage, not a claim about every filesystem accepted by all firmware versions. Write protection is read from sysfs and included in the notification. Preserve a read-only synthetic fixture for initial emulated library tests.

Evidence hashes and exact local script paths: storage-script-provenance.json. Existing firmware archives stay private. No new storage mounts, deletions or player patches made during this inspection.

## Executable registration matches the script protocol

AZ setup function0x2101610 builds16-byte entries containing a path string and integer port code. Manually checked instructions register /proc/udev_usb1 with0 and /proc/udev_usb2 with1. The next entries register /proc/udev_sd1 with3 and /proc/udev_nfs with4. These are internal registration values; they do not establish which physical device features are available in the lab.

The same setup constructs four delimiter/prefix strings, preserving punctuation: `connect,`, `disconnect,`, `mount ` and `umount `. It passes the path/code collection and these strings to constructor0x21ba400 at0x2101904, then stores the resulting944-byte object at owner+64. This is stronger evidence than string presence alone: the notification paths and script vocabulary are passed together into a concrete component. The reader, event readiness and parser tokenization inside that component remain unverified.

Evidence: usb-path-xrefs.py, az-usb-path-xrefs.json, az-usb-reader-construction.asm, az-usb-reader-construction-tail.asm, az-usb-reader-install.asm, az-storage-constructor.asm. Xrefs are heuristic candidates validated with disassembly. Next follow constructor0x21ba400 to its fd opening/registration and callback before choosing regular-file, pipe or custom-read emulation. No USB notification fixture has been enabled yet.

## StorageMountDetector and actual read path identified

Constructor0x21ba400 installs vtable0x2e584d0, validated as meow::StorageMountDetector. Its bases include TimerHandler(+8), TaskDrivenThreadWithTimer(+88), and StartupListener(+824). It copies the path/code entries to its collection at+856/count+872 and the four prefixes to+880,+888,+896,+904. Timer callback table0x2e58518 slot2 is thunk0x21ba1c0, which adjusts this by-8 and enters0x21b9b90.

On its active-observer path,0x21b9b90 iterates the configured paths, calls open64(path,0), then fcntl64 F_GETFL/F_SETFL adding0x800 (nonblocking), calls reader0x21b99c0, and closes the fd. Thus this is a reopen/read/close scan, not evidence of a permanently epoll-registered proc descriptor. The exact timer rescheduling interval is still unverified.

Reader0x21b99c0 clears a4096-byte stack buffer and performs one read(fd,buffer,4095). Positive results enter string parsing; nonpositive results take a different branch. That makes a scripted read fixture feasible without emulating a block device, but a static ordinary file might replay the same notification on every reopen. Determine parser return semantics and duplicate/event consumption behavior before choosing the fixture. A plain FIFO can also block in open before nonblocking is applied, so it is not automatically a suitable substitution.

Evidence: az-storage-constructor-body.asm, validated RTTI map, az-storage-timer-entry.asm, az-storage-scan-entry.asm, az-storage-read-entry.asm. No notification injection attempted yet. Next finish prefix parsing and scan result handling, then implement a narrow per-path queued-response shim.

## Reader event classification

Reader0x21b99c0 uses helper0x2316fa0 to compare a configured prefix with the beginning of the read string. The helper counts the prefix's characters, then compares that many decoded characters in order, returning false on a mismatch. For the shipped ASCII prefixes this supports these ordinary, noncombined messages:

| Input | Reader result | Output string |
|---|---:|---|
| read<=0 |0 |not assigned on this branch |
| `mount <payload>` |1 |full read string copied |
| `umount <payload>` |2 |full read string copied |
| `connect,` |3 |not assigned on this branch |
| `disconnect,` |5 |not assigned on this branch |

The parser checks mount/umount first, then connect/disconnect. A connect message containing a mount marker has an additional result4 path at0x21b9b38; exact substring extraction helpers0x234a400/0x234a3c0/0x233c370 remain to be audited before generating combined messages. Simple separate notifications avoid depending on that unresolved combined format. Unknown positive input retains0 unless one of these branches matches. This table is static control-flow evidence; no parser execution test yet.

No event consumption write, truncate or acknowledge syscall appears in the inspected reader: it performs one read and returns a classified result. Its caller closes the descriptor. A fixture should therefore consume its own pending notification rather than continually returning a persistent file's contents. The real kernel endpoint may have its own consumption semantics; its implementation has not been inspected.

Evidence: az-storage-parse.asm, az-storage-prefix-helper.asm and az-storage-prefix-helper-tail.asm, preceding constructor field mapping. The helper evidence covers ASCII prefix matching; Unicode edge cases are outside this pass. Next inspect result1 mount payload handling, then implement an isolated single-event response adapter.

## Synthetic USB1 source recognized by the running player

Mapped normal mount dispatch0x21b9f80: the full event string and logical port are delivered to observer virtual slot4 at0x21ba010 (after an optional string callback). A new opt-in offline-usb-fixture.c derives from paced diagnostic audio and intercepts only open64 of /proc/udev_usb1. Each open returns a real nonblocking pipe: first contains connect, second contains `mount /media/usb/lab vfat protect:1`, subsequent pipes are empty. Closing the writer provides EOF and avoids replay. Other opens forward through openat syscall. This is a narrow test adapter, not general hotplug or multi-process state support.

Launcher USB_FIXTURE=1 requires PACED_AUDIO and binds fixtures/usb read-only into /media/usb/lab. The fixture contains a generated10-second44100Hz stereo16-bit440Hz tone at low amplitude. No user music or real USB device is mounted.

Bounded AZ run remained alive at screenshot capture. Both events were logged exactly once. Visual inspection of xdjaz/usb-fixture-source.png shows USB1 selected, Local Library and available space, replacing NO DEVICE. Both decks still show Not Loaded. This proves synthetic device discovery, not track browsing, successful decoding or playback. Available capacity is the underlying host filesystem's reported value, not a emulated device capacity guarantee. Cloud says no authentication key; no cloud action attempted.

Evidence: az-storage-mount-branch.asm, offline-usb-fixture.c, az-usb-fixture-events.log, xdjaz/usb-fixture-source.png. Next automate selecting the local source and loading the generated tone, then measure actual PCM output.

## First navigation attempts and crash evidence

Added click-private-display.py (XTest on explicitly supplied private Xvfb display) and LAB_CLICK=x,y at probe tick900. Clicking Local Library at740,190 left the source view unchanged; player stayed running. A second run targeting USB1 arrow595,115 exited139. Do not conclude the click caused it: event delivery timing was not logged in that run. The click helper now reports XTest results and synchronizes before closing its display connection.

coredumpctl located actual child4157129 (launcher PID4157127), SIGSEGV at2026-09-12 08:45:32 PDT; thread name Shutdown, TID4157181. Command was /qemu with offline-usb-fixture.so and EP147. Host core shows unsymbolized QEMU frames and SI_USER; guest fault location is not established. No OOM/kill messages appeared in the checked five-minute kernel journal; current available memory was~15GiB, which alone cannot rule out earlier transients. Systemd retained the15.7MB compressed core; no private core extracted or uploaded in this pass.

Track browsing/loading remains unverified. Next inspect guest/emulator shutdown context and ensure the input event is delivered after source initialization before treating this as an input or firmware failure. Last verified USB1 source screenshot remains usb-fixture-source.png.

## Crash follow-up and no-click control

Inspected systemd core4157129 using the installed qemu-aarch64-static executable and gdb, saving az-navigation-host-backtrace.txt (main backtrace plus top three frames for all threads). The extracted core lived in a fresh private TemporaryDirectory and was deleted when inspection finished. The host executable is stripped; the backtraces remain unsymbolized QEMU addresses, so no guest fault location or root cause is established. No debug symbols were fetched and no core uploaded.

A new20-second USB fixture run with TRACE=1 and no LAB_CLICK remained alive at capture (returncode null). Its trace logs both synthetic USB events; selected signal/termination search showed no SIGSEGV or exit_group entry. This confirms another successful no-click control but does not prove click causality: syscall tracing changes timing and prior failures were intermittent. The trace remains local at xdjaz/trace-launch.log (~37MB); it is not a portable artifact or public upload.

Next test input after a verified ready screenshot rather than relying only on a fixed startup delay, recording XTest status and process liveness immediately before/after. If a failure reproduces, obtain guest-level PC/register evidence with QEMU's debugger; host stripped frames alone are insufficient.

## Ready-screen navigation succeeds and tone metadata is visible

Added bounded LAB_DURATION_SECONDS(1..120, default20) and an explicit started event containing private display/PID. In a60-second USB fixture probe, first captured usb-before-click.png and verified source readiness. A click on the USB1 arrow595,115 changed selection to Local Library (usb-after-click.png). After selecting the Local Library row750,190 and two closely spaced clicks on that row, the player entered BROWSE. Screenshot usb-library-double-click.png shows LAB-TONE-440Hz.wav and duration00:10, proving directory enumeration and basic WAV metadata reading. The exact minimum click sequence is not isolated; the recorded sequence worked.

Every controlled XTest call reported success, and the player remained alive at final capture. The harness deliberately ended at60 seconds. A subsequent attempted click on the track failed because the private display had already closed; that was scheduled teardown, not a new crash. The tone remains unloaded, both deck panels Not Loaded. No PCM output or music playback established.

This supersedes the earlier uncertainty that ordinary X mouse input might not work for source navigation. It works on the ready screen with this sequence. The prior Shutdown-thread crash remains separately unexplained and was not reproduced in this run.
