# Native Sound Color synchronization check — 2026-09-16

## Scope and ownership

This was a bounded synthetic execution check on the user's Raspberry Pi 5 AArch64 environment. It validates the new decoder, state synchronizer, Unix-datagram service path and mixer command application; it is not an EP147, physical-controller, audio-device or listening test.

Before each run, the known BiteDJ supervisor and its Mixxx child were identified by exact PID/command, terminated through the supervisor, and verified absent. No EP147, `edb`, debugger or other AZ session was active. The test sources were staged only in a private temporary directory and removed afterward. Every run's exit trap restored the same BiteDJ supervisor, and the final process check confirmed both supervisor and Mixxx were running with no diagnostic process left behind.

No firmware, key, cabinet data, music or private database was copied into the staging directory. The test did not access the original music USB. Post-check inspection found that volume mounted writable by the existing environment; it was remounted read-only and the final mount options were verified as `ro`.

## Native regressions

The staged source matched runtime commit `51ca732`. A required feedback module already deployed on the Pi was reused only after its SHA-256 matched the local tracked source.

Native results:

- `mixer/test_native_cfx.py`: 11 tests passed.
- `analysis/test_cfx_feedback_service.py`: 2 tests passed, including an actually saturated Unix-datagram queue followed by successful pending-snapshot delivery.
- `mixer/test_dsp_stream.py`: passed with 14,080 frames, cue maximum error `3.7143595699173915e-09`, active-filter difference RMS `0.007645272889803078`, and Off-tail maximum error `5.40913586144498e-09`.
- The stream's channel-0 F1 result sequence was `1,0,0,0,1`, demonstrating initial application, transition-busy rejection and eventual acceptance of a repeated latest snapshot.

These are native executions of reconstructed host software. They do not make the anonymous AZ selector values equivalent to named RX3 F1 types.

## Observation-only service check

A separate observation-only `run_rx_feedback.py` process received 27 synthetic CRC-valid RX packets through its real Unix input socket and emitted them through its real FIFO owner path.

Verified outcomes:

- first valid packet established the baseline without a synthetic press;
- raw selector states `1..6` and verified same-selector Off state `0` were all observed;
- HUI suffixes 0/1 changed through `frame[23]` while all six selector input levels remained zero;
- shared HUI/selector sources and an independent simultaneous-edge case were processed in MCU selector order, with selectors 1, 4 and 6 ending at selector 6;
- every observation remained labeled `policy: observation` with no configured F1 type;
- zero F1 commands reached the mixer socket.

This validates native AArch64 execution of the separation implemented from static evidence. It does not prove physical button labels, electrical aliasing or semantic effect identity.

## Explicit-policy transport check

The service was then connected to a freshly compiled native `mix_stream`/DSP graph in temporary paths. The deliberately non-identity policy was:

```text
1:6,2:5,3:4,4:3,5:2,6:1
parameter = 0.25
```

A selector-1 press followed by release and same-selector press produced configured F1 type 6 followed by Off. The service delivered 20 bounded snapshot commands while native audio blocks advanced the graph. Each of the four channels reported the same mixer result sequence:

```text
1, 0, 1, 1, 1
```

The initial command applied, the immediate Off command was rejected while the transition was busy, and a bounded repeat was accepted after the transition settled. This proves configured host-policy transport/application and retry behavior only. It does not recover the AZ selector-to-algorithm mapping or establish sound quality.

## Final state

- Temporary test staging: removed.
- Diagnostic EP147/feedback/debug processes: none.
- BiteDJ supervisor and Mixxx: restored and verified running.
- Original USB: not read or written by the test; final mount verified read-only.
- Physical controller/audio/listening: not exercised.
