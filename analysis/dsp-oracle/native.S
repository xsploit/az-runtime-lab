.syntax unified
.arm
.fpu neon
.text
.balign 8
.global iir_native
.type iir_native,%function
iir_native:
.incbin "native-iir.bin"
.size iir_native, .-iir_native
.section .note.GNU-stack,"",%progbits
