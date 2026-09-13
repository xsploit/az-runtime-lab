# Diagnostic audio pacing checkpoint

The offline lab now supports PACED_AUDIO=1 together with NULL_AUDIO=1 and OFFLINE_MIDI=1. It forwards PCM calls to the guest null sink and clocks successful output transfers using the accepted sample rate. This produces no audible audio and does not emulate hardware DSP or device latency.

## Measured configurations

| Runtime | Accepted output rate | Observed channels | Transfer | Audio host CPU |
|---|---:|---:|---|---:|
| XDJ-AZ1.30 |44100Hz |10 (earlier channel trace) |64-frame writei/readi |5.6% of one core |
| CDJ-3000X1.40 |96000Hz |2 |64-frame writei |4.28% of one core |

Rates reflect the settings accepted in these launches, not every device mode or supported rate. The CDJ trace did not show readi transfers; discovery opens for capture do not prove active capture. CPU spans are about6 seconds after audio startup under host QEMU, not native Pi measurements or a controlled performance comparison. Both paced probes were alive at screenshot capture before deliberate teardown.

An initial CDJ attempt exited1 before player launch because /etc/asound.conf did not exist as a mount target under its read-only root. The launcher now creates the placeholder before entering bubblewrap. The retry succeeded. This was a harness setup failure, not a firmware crash.

## Evidence and implications

AZ evidence: az-paced-audio-thread-baseline.json, az-paced-audio-profile-raw.json, az-paced-audio-transfer-trace.log. CDJ evidence: corresponding cdj3000x-paced-audio files. offline-audio-paced.c is the source-only diagnostic adapter.

Do not hardcode the AZ rate/channel arrangement when building CDJ audio handling. A future common mixer bridge must explicitly negotiate format/rate/channels and provide resampling where necessary. Subsequent tone PCM capture and four-deck decoding are verified (see FOUR-DECK-REPRO.md and TEMPO-CONTROL.md). Music quality, master/headphone mixing, effect DSP and physical-device integration remain unverified.
