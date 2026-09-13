.syntax unified
.arm
.fpu neon
.text
.balign 8
.global cfx_native_adjust
cfx_native_adjust:
.incbin "native-crush-adjust.bin"
.section .note.GNU-stack,"",%progbits
