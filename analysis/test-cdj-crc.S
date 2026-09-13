.text
.global native_crc
.type native_crc,%function
native_crc:
 sub sp,sp,#544
 stp x19,x20,[sp]
 mov x19,x0
 add x20,sp,#16
 mov x0,x20
 add x1,x20,#512
 mov w3,#62
 adr x2,constants
 ldr q3,[x2]
 ldr q1,[x2,#16]
 movi v6.4s,#8
 movi v5.4s,#4
 movi v2.8h,#1
.incbin "runtime-lab/analysis/cdj-crc-body.bin"
 mov w0,w1
 ldp x19,x20,[sp]
 add sp,sp,#544
 ret
.balign 16
constants:
.incbin "runtime-lab/analysis/cdj-crc-constants.bin"
.section .note.GNU-stack,"",@progbits
