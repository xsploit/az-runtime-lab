.syntax unified
.arm
.fpu neon
.text
.balign 8
.global native_dub_color
.type native_dub_color,%function
native_dub_color:
.incbin "native-dubecho-native_dub_color.bin"
.balign 8
.global native_dub_inner
.type native_dub_inner,%function
native_dub_inner:
.incbin "native-dubecho-native_dub_inner.bin"
.balign 8
.space 4
.global native_dub_calculate
.type native_dub_calculate,%function
native_dub_calculate:
.incbin "native-dubecho-native_dub_calculate.bin",0,28
b native_dub_inner
.incbin "native-dubecho-native_dub_calculate.bin",32,524
.global native_dub_on
.set native_dub_on,native_dub_color+36
.global native_dub_off
.set native_dub_off,native_dub_color+60
.global native_dub_feedback
.set native_dub_feedback,native_dub_calculate+44
.global native_dub_parameter
.set native_dub_parameter,native_dub_calculate+520
.section .note.GNU-stack,"",%progbits
