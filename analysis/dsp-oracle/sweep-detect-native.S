.syntax unified
.arm
.fpu neon
.text
.balign 8
.space 4
.global native_sweep_detector_core
native_sweep_detector_core:
.incbin "native-sweep-detect.bin",0,876
bl abort
.incbin "native-sweep-detect.bin",880,4
.global native_sweep_detect
.set native_sweep_detect,native_sweep_detector_core+96
.section .note.GNU-stack,"",%progbits
