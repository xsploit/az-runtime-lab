.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_iso_volume
.type native_iso_volume,%function
native_iso_volume:
.incbin "native-isolator-native_iso_volume.bin"
.balign 8
.global native_iso_execute
.type native_iso_execute,%function
native_iso_execute:
.incbin "native-isolator-native_iso_execute.bin"
.balign 8
.global native_iso_reset
.type native_iso_reset,%function
native_iso_reset:
.incbin "native-isolator-native_iso_reset.bin"
.section .note.GNU-stack,"",%progbits
