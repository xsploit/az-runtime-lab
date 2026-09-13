.syntax unified
.arm
.fpu neon
.text
.balign 8
.global cfx_native_calc
.type cfx_native_calc,%function
cfx_native_calc:
.incbin "native-cfx-calc-init.bin",0,0x83c
.word cfx_ones
.global cfx_native_initialize
.set cfx_native_initialize,cfx_native_calc+0x52c
.global cfx_native_execute
.set cfx_native_execute,cfx_native_calc+0x5cc
.section .rodata
.balign 8
cfx_ones:
.float 1.0,1.0
.section .note.GNU-stack,"",%progbits
