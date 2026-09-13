.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_eq_volume
native_eq_volume:
.incbin "native-equalizer-native_eq_volume.bin",0,92
.balign 8
.global native_eq_execute
native_eq_execute:
.incbin "native-equalizer-native_eq_execute.bin",0,472
bl __aeabi_idivmod
.incbin "native-equalizer-native_eq_execute.bin",476,80
bl __aeabi_idivmod
.incbin "native-equalizer-native_eq_execute.bin",560,72
bl __aeabi_idivmod
.incbin "native-equalizer-native_eq_execute.bin",636,356
bl __aeabi_idivmod
.incbin "native-equalizer-native_eq_execute.bin",996,88
bl __aeabi_idivmod
.incbin "native-equalizer-native_eq_execute.bin",1088,92
bl __aeabi_idivmod
.incbin "native-equalizer-native_eq_execute.bin",1184,164
.word native_equalizer_tables+5120
.word native_equalizer_tables
.balign 8
.space 4
.global native_eq_reset
native_eq_reset:
.incbin "native-equalizer-native_eq_reset.bin",0,60
.balign 8
.global native_equalizer_tables
native_equalizer_tables:
.incbin "native-equalizer-tables.bin"
.section .note.GNU-stack,"",%progbits
