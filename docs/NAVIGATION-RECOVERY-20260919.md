# FLX6 navigation recovery

Back/View were being suppressed by bridge policy: View did nothing in Browse,
and unclassified settings/modal pages rejected escape input. On the Pi, native
Back escaped Mixer Settings to Browse, and native View returned to Waveform.

The bridge now sends native Back on non-waveform pages; Back on Waveform keeps
the preferred open-browser shortcut. View sends the native Browse toggle.
Normal Browse rotation opens Browse from Waveform, otherwise passes the rotary
to the current native page. Shift+Browse zoom behavior is unchanged.
Fresh page observations and held-button/release protections remain enforced.

Validation: navigation packet tests and five live-navigation unit tests pass;
bridge compiles. Mixer Settings -> Back -> Browse -> View -> Waveform was
verified on the device. This is not exhaustive native modal-screen validation.

Deployment: all three bridge modules installed in the Pi's normal runtime.
Back/View are active in the current session; the subsequent rotary-policy edit
is on disk and takes effect on the next AZ start. Playback was left running.
Normal startup loads these files, with no experimental priorities enabled.

Recovery: the normal session configures both Merge FX buttons held together for
two seconds to exit AZ to the mode menu, independently of page classification.
That physical combination was not retested during this change.
