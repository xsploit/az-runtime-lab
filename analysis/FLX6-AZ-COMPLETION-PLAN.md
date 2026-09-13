# Complete FLX6-controlled AZ: current evidence and next work

2026-09-13. User authorized the whole controller/effects setup, preserving the
preferred BiteDJ mappings. Basic usable transport/navigation comes before
finishing every effect. Cabinet integration is separate from controls and DSP.

| Area | Current evidence | Still required |
| --- | --- | --- |
| Browse, encoder press, four load buttons | Saved XML adapter; native browser selection/load paths previously exercised | Physical controller and all page contexts |
| Preferred Back/View | Live-view-aware adapter and bounded emulated folder/sidebar/waveform checks | Native Pi observer integration and physical verification |
| Play/Cue | Native ERP paths previously exercised on Pi; new XML-driven held-state adapter | Continuous MIDI-to-ERP delivery and hardware test |
| Master Tempo | Native AZ pitch preservation verified with tone under emulation; keylock binding now translated to ERP | Music quality, initial state/LED feedback and physical button test |
| Decks 3/4 transport | XML bindings known | Native layer selection; do not silently route them to decks 1/2 |
| Tempo slider | Native converter and speed/pitch path verified | Preferred BiteDJ paired-byte/range behavior and full MIDI delivery |
| Jog touch/rotation | Saved script bindings available | Native packet semantics, touch/bend/scratch state and physical timing |
| Mixer/headphones | Host routing, selected native state and recovered headphone stage tested in isolation | Physical routing, pickup/reconnect and full state consistency |
| EQ and all effects | Existing modules and original-code research present; coverage varies | Audit each algorithm/state pipeline, finish missing implementations, compare originals and integrate |
| Touchscreen | Partial native interaction demonstrated | Explicit page-by-page test, including browse/search/settings/transport |
| Cabinet | Two matching local images, extracted material, read-only launcher mount | Separately verify desired library and online-service behavior |

## New persistent transport adapter

`flx6_transport.Transport` reads the supplied BiteDJ MIDI XML. It translates
play, cue_default and keylock for logical decks 1/2 to the already traced ERP
button fields. It preserves other packet fields and simultaneous held buttons,
normalizes MIDI note-off releases, suppresses repeated presses and produces the
correct ERP CRC. `release_all()` supplies a release snapshot for disconnect.
It does not toggle a guessed playback or Master Tempo state; the native app
receives the physical button state and owns those actions.

Five offline tests passed against the saved mapping, including holding Cue
while pressing Play, activity on the other deck, note-off velocity, disconnect
release and rejecting unmapped deck3/4 layers without changing the frame.
Existing navigation tests still pass. These do not establish physical-controller
support, MIDI stream parsing or packet delivery. No Pi was contacted.

The adapter is a component, not an enabled launcher feature. The next integration
must have one persistent owner for the ERP stream and preserve ordered edges.
Do not run independent pulse writers against that stream. In particular the
current Pi launchers explicitly reject NATIVE_NAVIGATION because their copied
QEMU guest-discovery path is unsuitable; native Pi discovery/observation needs
adaptation before advertising the combined controller bridge as ready.

## Acceptance order

1. Complete shared MIDI delivery with device reconnect and release behavior;
   wire navigation and transport to their separate native receive channels.
2. Verify browse/back/view/load/play/cue on the actual Pi and FLX6 before adding
   jog/tempo complexity. Keep the preferred Browse encoder semantics.
3. Add validated deck-layer selection, jog touch/rotation, tempo and remaining
   buttons; verify no stuck presses or wrong-deck events.
4. Audit/finish all effects using the available AZ implementation and RX3
   reference algorithms where AZ delegates processing to mixer hardware.
   Compare original output and state transitions; do not label an approximate
   effect a faithful port or assume RX3/AZ algorithms are identical.
5. Run long-session two/four-deck audio/control/rendering/resource checks.

Cabinet is key/certificate material, not an effects library. Its presence does
not verify streaming login. Provider authentication and any actual account
interaction remain separate from offline mixer/controller development.
