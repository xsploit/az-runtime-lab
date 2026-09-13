.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_eq_volume
.type native_eq_volume,%function
native_eq_volume:
.incbin "native-eq-control-native_eq_volume.bin"
.balign 8
.global native_iso_volume
.type native_iso_volume,%function
native_iso_volume:
.incbin "native-eq-control-native_iso_volume.bin"
.section .note.GNU-stack,"",%progbits
