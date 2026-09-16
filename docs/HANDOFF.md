# AZ runtime: fresh-session handoff

Updated 2026-09-15 after native old-library acceptance. Read this first, then only
one subsystem's linked notes. Do not import the entire prior chat or raw dumps.

## Project and scope

Repository: https://github.com/xsploit/az-runtime-lab
Purpose: run the XDJ-AZ 1.30 EP147 player in a Raspberry Pi 5 compatibility runtime,
understand its interfaces/DSP, and retain findings useful to BiteDJ. This is not
stock hardware firmware acceptance or permission to publish proprietary assets.
The user's Pi has 4 GB RAM, a touchscreen and DDJ-FLX6. Existing preferred BiteDJ
controller behaviour is the reference when controller work resumes.

Latest completed milestone: old Rekordbox **Device Library** (`export.pdb`,
`exportExt.pdb`, original ANLZ) browsing/loading in AZ. OneLibrary is the internal
adaptation format, not the requested source format. No mandatory music re-export.

## Branches: check before editing or merging

- `research/claude-legacy-library-20260915`: library work; pushed fix `312bc69`.
  This handoff follows that commit. Not merged into the runtime branch.
- `feat/native-performance-and-setup-20260914`: runtime/DSP checkout last observed
  at `96efc6b`. Do not reset it to the library branch or overwrite its work.
- Both checkouts were clean before this handoff. Recheck current Git state.
- Local-only workspace/Pi access pointers are in ignored `local/SESSION-ACCESS.md`
  on the originating machine. If absent, obtain paths/access from the user.

## Library: verified and why it finally worked

Read [native acceptance](../analysis/legacy-library-20260915/NATIVE-ACCEPTANCE-20260915.md)
and `library/build_device_library.py`; use STATUS/HANDOFF in that directory only
for additional history. Earlier claims that COMMENT alone caused the failure are
superseded.

- 13,646 tracks, six playlists, 667 playlist entries; host preservation tests pass.
- Native AZ on Pi rendered categories, playlists, artwork and source playlist order.
- Tracks loaded on both decks with original waveform/grid/phrase data.
- Green hot cue A at 30.993 s matched source ANLZ. Orange saved loops D/G/H also
  matched source slots and displayed times. Exact examples are in the report.
- Native play advanced; ALSA capture contained nonzero decoded PCM. No physical
  headphone listening/latency claim was made for this acceptance run.
- Root cause: small semantic `menuItem.kind` values were forwarded unchanged and
  rejected by the UI decoder. Correct wire codes include TRACK=0x83,
  PLAYLIST=0x84. It is not a universal offset. Defaults and regression tests fixed.
- A staged PIONEER mount hid USBANLZ. Source audio, USBANLZ and Artwork must remain
  visible through read-only mounts after the staged metadata mount.
- Original USB was never modified. Output staging is plaintext; separately
  authorized SQLCipher encryption is still required for the runtime copy.

Remaining library work, if requested: integrate/review the branch against the
main runtime, package staging/encryption/launch into a reproducible user flow,
verify search/sort breadth and sustained two-deck loading, and test cue recall
sample accuracy. Stock physical AZ hotplug is not proved. Do not describe the
entire consumer installation flow as finished merely because native acceptance
passed.

## DSP and controls: separate work, not finished

On the runtime branch read `analysis/DSP-PORT-PLAN.md`, then only the relevant
file in `analysis/dsp-reversal-20260915/`. Latest runtime commit records verified
Sound Color HUI registration and its mapping gap. A complete faithful DSP/effects
port is NOT established.

Terra finished its bounded filter/caller-family checkpoint and is paused. Its
private STATUS/HANDOFF locations are in local access notes. Claude's separate
biquad/DSP output exists but remains unreviewed; its latest exit code is 1, which
is not proof of successful completion. Inspect concise status/results before
reusing any claim. Do not restart broad duplicate reversals.

## Rendering/performance

On the runtime branch start with `analysis/native-performance-20260914/RESULTS.md`
and `analysis/AZ-BITEDJ-PERFORMANCE-ASSESSMENT.md`. Preserve known-good rendering
patches and measure baseline versus candidate. Do not infer Pi performance from
QEMU or repeat old numeric claims without checking their exact configuration.

## Last device/agent state — historical, recheck live

After acceptance, diagnostic EP147 and edb processes were stopped and BiteDJ was
restored. No debugger was left attached. The verified encrypted library remains
in the private staged metadata directory. Do not wake or relaunch anything solely
to refresh this note.

The five-minute `check-finish-az-and-terra` heartbeat is PAUSED. Finish AZ and Terra
are paused. Root owns the completed library takeover. No fresh subsystem session
has been started by this handoff. Never operate the Pi concurrently with another
worker; establish ownership first.

## Workflow for the next session

1. Choose ONE subsystem and an explicit measurable acceptance target.
2. Read only this file and its relevant report/source. Check Git state and device
   ownership before mutations. Treat historical state as historical.
3. Use bounded searches; save large disassembly/logs privately, return small excerpts.
4. Keep source findings, emulator results, Pi execution and listening evidence distinct.
5. Commit reviewed source/docs/tests only. No keys, cabinet contents, firmware,
   decrypted binaries, music, library fixtures or raw dumps in public commits.
6. At the next major milestone, update this handoff and retire the session.
   User prefers fresh sessions per subsystem and low context churn. Do not create
   extra active threads or restart paused work unless requested.

Suggested new-session prompt:

> Read docs/HANDOFF.md and only the relevant subsystem notes. Work on [subsystem]
> until [specific acceptance target]. Check branch and ownership first. Keep
> outputs compact and update the handoff with verified results before stopping.
