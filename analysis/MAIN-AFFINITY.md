# Optional AZ main-thread placement

`MAIN_CPU_LIST=0,2,4,6,8,10` enables a lab-only override of affinity requests made by the process main thread for itself. Use with the existing offline AZ launcher options. CPU numbers must be allowed to the launcher; no universal default is selected. Omit the variable for native behavior. Do not copy these PC-specific numbers to a Pi.

The pass-through interposer leaves explicit worker-thread requests intact. New threads initially inherit the main thread's mask until they request their own, so this startup setting is not perfectly identical to the earlier post-start main-thread experiment. It does not alter scheduling permissions, priorities, firmware files, or audio processing.

Verified startup guest208465: main0,2,4,6,8,10; JUCE ALSA18; HuiProcessor15-17,19; IndicatorCtrl14-17. See az-main-affinity-option-live.json. Playback verified in guest210182 with MIX_STREAM: six-second capture29 visible waveformchanges/sec, three-second master/cue output nonzero and finite with peaks below1. Screenshot confirms advancing MP3 playhead. See az-startup-option-playback.json. Physical output and long-duration stability remain unverified. Earlier post-start alternating measurements averaged18.58 versus30 visible waveformchanges/sec on this PC; not Pi performance or compositor presentation FPS.

Build `shims/main-affinity.c` as an ARM64 shared library with `-shared -fPIC -O2 -ldl -pthread` into `shims/main-affinity.so`. The launcher sets LAB_MAIN_CPUS through bwrap's environment because QEMU's `-E` treats commas as variable separators.
