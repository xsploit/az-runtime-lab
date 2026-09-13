# Native AZ view observation

`az_live_view.LiveView(pid, manager=None)` reads the verified native current-view
identity without pausing guest threads or writing memory. `sample()` returns
`kind` (`browse`, `pc_control`, or opaque `other`), identity, current object,
nested object, PID and monotonic observation time.

The observer pins a Linux pidfd and an open `/proc/PID/mem` descriptor. It rejects
an exited process before and after sampling; callers must discover a new manager
for a new player session. Initialization checks the mapped getter instructions
and vtable metadata. Each sample checks the manager vtable, nested getter,
non-null current object and initialized, distinct Browse/PC Control identities.
Two complete layout reads must agree. Failures raise `ViewUnavailable`.

Matching repeated reads are not an atomic snapshot: a page could change away and
back between reads, or change after the result returns. This remains a private
lab observer, not synchronized firmware telemetry. A future production bridge
needs a GUI-thread observation hook or an explicit race-tolerant command policy.
Do not infer track-list focus or accelerated scrolling from `kind= browse`.
PcControlView has a distinct static name, but entering it still needs live testing.

`find-live-view-manager.py PID` performs a discovery scan. It skips file-backed,
shared, non-writable and individual anonymous mappings larger than1GiB, checks
candidate manager and nested getter identities, and reports candidates rather
than choosing one silently. The successful discovery scanned approximately4.35GB;
this is not appropriate for routine polling. Once discovered, the reader only
performs a small fixed set of reads per observation.

`test_az_live_view.py` checks stable classification, changes during a read,
replaced objects, overridden getters, invalid view-name state and null views.
`test_live_view_session.py` is the live integration harness: it requires one
already running bounded offline AZ session, discovers the object, sends native
browse packets, checks the observed Browse state and waits for launcher-owned
shutdown to verify that the observer rejects further reads.

Evidence for the initial native layout and screenshot correlation is in
`az-view-state-getter-map.json` and `live-view-identity.json`. Firmware addresses
are specific to the pinned AZ EP147 SHA256 documented there.


## Direct owner discovery (verified live)

Omit `manager` to resolve the native ownership chain:

`global0x3bd5d70 → EP147Application+0x110 → UiLayerObjects+0x10 → GuiObjectManager+0x190 → ViewObjectManager`

Every owner vtable is checked. The chain is rechecked before and after each
sample, so replacement is rejected rather than silently continuing with an old
manager. A partially constructed owner raises `ViewUnavailable`; callers may
retry during bounded startup while checking that the player is alive.

Native PID471684 verified this path with no heap scan: initial other page then
Browse after native input. `direct-view-owner-live.json` records the result.
Nine tests cover the observer plus full/partial/incorrect owner chains.
The earlier heap scan remains a diagnostic fallback for research, not the
normal discovery path. This change does not make reads atomic or resolve focus.

## Preferred navigation adapter

`az_live_navigation.LiveNavigation` wraps the saved XML `Navigation` adapter
and a live observer. Each new Back/View press takes a new observation and checks
its age (50ms maximum by default). Browse means Back emits native Back and View
stays open. Verified Source/Waveform pages mean either control emits the native
Browse-open toggle. PC Control and unmapped pages are explicitly rejected until
their preferred behavior is tested. Encoder/load input does not need a page read.

A held repeat or release never requires page availability; note-off is normalized
by the existing mapper. This preserves release delivery when observation fails.
The adapter returns native packets; it is not yet a persistent physical MIDI
bridge. Use the RX owner transport when that service is enabled, or an exclusive
FIFO during differential research. Do not mix direct writers with the service.

SourceSelectView identity is initialized at global0x3baf668 via0x660094;
WaveformView at0x3baf6d0 via0x6600b8. The observer requires four distinct initialized
name values (Browse, PC Control, Source, Waveform). It does not infer track-list
focus, and an external page change after observation remains possible. Inputs
are never automatically retried as toggles in response to missing feedback.


## Persistent native navigation service

`python runtime-lab/analysis/run_native_navigation.py PID BASELINE RX_SOCKET MIDI_SOCKET --mapping XML --seconds 120`

This binds a private0600 MIDI datagram socket after the native observer is ready.
Supply complete three-byte MIDI channel messages. It uses the saved mapping,
automatic page observation and a nonblocking connection to the RX owner's input
socket. Owner inode replacement terminates the session; invalid/unverified input
is reported. The player process is checked continuously. Graceful shutdown
releases this producer's held buttons before removing the MIDI socket.

Run one navigation producer per RX session; avoid other full-frame control
writers concurrently. Mixer Q1 feedback can run alongside it because the RX
owner merges its effect fields. No physical MIDI device is opened. Stop this
service before stopping the RX owner/player. The launcher supports lifecycle integration through `NATIVE_NAVIGATION=1`
with `RX_FEEDBACK=1`. Physical MIDI intake is still pending.

Native PID485268 loaded a track, retained Echo123BPM/halfbeat244ms feedback,
opened Browse with View and focused the sidebar with Back.17 input-generated
packets plus one shutdown release produced18 packets with0 rejected. Service
exit0 and its socket removal were verified. Evidence native-nav-service-live.json,
native-nav-service.log and native-nav-service-*.png.


## Launcher-managed navigation

Enable `NATIVE_NAVIGATION=1` alongside the existing paced AZ, mixer fixture,
DSP graph and RX feedback flags. The launcher finds `/qemu ... EP147` only
inside its own descendant process tree and starts the observer/navigation
service after the RX owner socket is ready. It publishes a `native_navigation`
JSON event only once the MIDI socket exists, after native view initialization.
The socket is `navigation-midi.sock`, distinct from the software mixer routing
socket. Send complete three-byte channel messages to this endpoint.

Premature service exits and readiness timeouts fail the run. Cleanup stops
navigation first so held-button releases can reach the live RX owner/player,
then stops feedback and the player. Forced shutdown is reported by its nonzero
return code; it does not prove releases were delivered. This is still a bounded
private lab session, not a physical MIDI dispatcher or a complete controller map.
