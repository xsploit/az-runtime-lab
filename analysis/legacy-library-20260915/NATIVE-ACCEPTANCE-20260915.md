# Native AZ acceptance, 2026-09-15

## Result after root takeover

The 13,646-track old Device Library export now works in native ARM64 AZ 1.30
on the Pi lab: category browsing, six playlists, playlist track order, artwork,
loading into both decks, original ANLZ waveforms/beat grids/phrases, hot cue
colours and saved loop slots. No source USB files were modified or re-exported.

This supersedes the earlier empty-browser diagnosis. **COMMENT was not proved to
be the cause.** The `unknown rootCategory` message was a downstream consequence
of an empty root vector, not proof that the final SQL row caused it.

## Actual failure and fix

Some public OneLibrary writers seed small semantic menu kinds (TRACK=4,
PLAYLIST=6). EP147's SQLite menu getter at `0x11810b8` returns the stored byte
unchanged; the server creates and sends rows. The UI root decoder at
`0x10b56a0` subtracts `0x80`, bounds-checks against `0x3e`, and uses a signed
lookup table at `0x28309e0`. Small values are discarded, yielding an empty UI.

Bounded native GDB evidence:

- `0x1258bbc`: raw vector held two category entries.
- `0x12484e8`: output vector still held two entries.
- `0x12a47c4`: server send count was 2.
- `0x1e60fa8` and `0x1ea41c8`: resulting UI vectors were empty.

Changing TRACK to `0x83` populated the real track list. PLAYLIST must be `0x84`,
not a universal arithmetic offset: `0x85` selects BPM. The generator now seeds
18 admitted category wire codes and 10 sorts. Reference category imports reject
unsupported visible kinds instead of silently generating an empty browser.

## Source preservation and native checks

Host tests pass with 13,646 tracks, 6 playlists, 667 entries, all 22 entity tables,
23 recovered SQL fragments and 75 observed columns. IDs, metadata and playlist
order are preserved. The exact firmware SQLCipher library and EP147 both opened
the separately encrypted staged database. No decryption keys are published.

Native rendered checks on the full source library:

- Genre/artist categories populated, then all six playlist names rendered.
- `nss` showed its 53 tracks in source order.
- `SUBSECT-RAGE` loaded from `emo`, with 145 BPM, Ab, 2:58.200,
  overview/detail waveforms, grid and phrase display.
- `It Was All A Dream` loaded on deck 2. Source ANLZ has hot cue A at 30,993 ms,
  RGB (26,255,0); AZ showed the green A and `00:30` label.
- `_Levels_(Skrillex Remix)` loaded from `nss` item 51. Its source saved loops
  are D at 191,556–191,986 ms, G at 262,286–263,145 ms, and H at
  265,496–265,713 ms, all orange. AZ displayed D/G/H with loop icons, orange
  colour, and matching second-resolution labels 03:11, 04:22, 04:25.
- Native ERP play advanced the waveform and remaining time. The paced ALSA file
  capture produced nonzero decoded PCM (153,872 nonzero bytes in a sampled
  trailing 1 MiB). This is decoded-output evidence, not a listening test or a
  physical FLX6 routing/latency acceptance.

The first load lacked waveforms because the diagnostic staged PIONEER mount
hid USBANLZ. Mounting the source USBANLZ and Artwork trees read-only fixed it.
Do not translate or discard those files; the original ANLZ format is consumed
by AZ directly.

## Portable lab setup

Use `library/stage_from_usb.py --drive-root /path/to/usb --out-dir /path/to/stage`
with `--bitedj-root /path/to/bitedj` (or BITEDJ_ROOT). The generated database is
plaintext; create a separately encrypted SQLCipher copy using your authorized
key/tooling before launching AZ. Never substitute plaintext at the runtime path.

For the existing runtime launcher, set:

- `USB_FIXTURE_PATH`: fixture mount root;
- `USB_PIONEER_WRITABLE`: separate staged PIONEER directory containing the
  encrypted `rekordbox/exportLibrary.db`;
- `USB_MEDIA_SOURCE_ROOT`: original USB root, supplying read-only Contents,
  Music, PIONEER/USBANLZ and PIONEER/Artwork mounts.

The original USB root is not a writable metadata staging directory. The launcher
rejects that direct mistake. Source submounts are applied after the staged
PIONEER mount so the stage cannot hide analysis and artwork. Paths are supplied
by the operator; no workstation username or drive label is embedded.

## Remaining boundaries

Verified acceptance is the compatibility runtime on Pi, with offline USB/mixer
fixtures. No GDB value patches were needed for the successful runs. This is not
stock physical XDJ-AZ hotplug acceptance. Every track, every sort/category,
search behaviour, cue recall sample accuracy and sustained two-deck load stress
have not been exhaustively tested. The old export is adapted internally to AZ's
SQLite database; this does not make stock firmware parse export.pdb directly.
Private screenshots, original media, database fixtures, firmware and raw
reverse-engineering dumps remain outside the public changes.
