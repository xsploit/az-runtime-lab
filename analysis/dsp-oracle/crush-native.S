.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_crush_color
.type native_crush_color,%function
native_crush_color:
.incbin "native-crush-native_crush_color.bin",0,52
.balign 8
.space 4
.global native_crush_parameter
.type native_crush_parameter,%function
native_crush_parameter:
.incbin "native-crush-native_crush_parameter.bin",0,204
.balign 8
.space 4
.global native_crush_core
.type native_crush_core,%function
native_crush_core:
.incbin "native-crush-native_crush_core.bin",0,76
bl powf
.incbin "native-crush-native_crush_core.bin",80,196
bl powf
.incbin "native-crush-native_crush_core.bin",280,1776
.word crush_tmp
.incbin "native-crush-native_crush_core.bin",2060,232
.global native_crush_init
.set native_crush_init,native_crush_core+616
.global native_crush_execute
.set native_crush_execute,native_crush_core+1072
.bss
.balign 8
crush_tmp:.space 512
.section .note.GNU-stack,"",%progbits
