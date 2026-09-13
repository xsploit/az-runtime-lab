/* AZ 1.30 private renderer experiment, once per waveform update.
 * Interpolate the recovered contrast weights at their native 0.1 boundaries.
 * Preserve all scratch registers, NZCV and FPSR; caller stack is unchanged.
 * Phase and coefficient locations are pinned native-frame offsets.
 */
.macro lab_smooth_waveform_coefficients
 sub sp,sp,#128
 stp x0,x1,[sp]
 stp x2,x3,[sp,#16]
 stp x4,x5,[sp,#32]
 stp q0,q1,[sp,#48]
 stp q2,q3,[sp,#80]
 mrs x0,nzcv
 str x0,[sp,#112]
 mrs x0,fpsr
 str x0,[sp,#120]
 ldr d0,[sp,#0x1b0]
 fcmp d0,#0.0
 b.vs .Lcoeff_restore\@
 b.lt .Lcoeff_restore\@
 fmov d1,#1.0
 fcmp d0,d1
 b.gt .Lcoeff_restore\@
 fmov d1,#10.0
 fmul d0,d0,d1
 fcvtzs w0,d0
 cmp w0,#10
 b.ge .Lcoeff_endpoint\@
 scvtf d1,w0
 fsub d0,d0,d1
 adr x1,.Lcoeff_table\@
 add x1,x1,x0,lsl #3
 ldp w2,w3,[x1]
 ldp w4,w5,[x1,#8]
 sub w4,w4,w2
 sub w5,w5,w3
 scvtf d1,w2
 scvtf d2,w4
 fmul d2,d2,d0
 fadd d1,d1,d2
 fcvtzs w2,d1
 scvtf d1,w3
 scvtf d2,w5
 fmul d2,d2,d0
 fadd d1,d1,d2
 fcvtzs w3,d1
 b .Lcoeff_store\@
.Lcoeff_endpoint\@:
 mov w2,#0
 mov w3,#32768
.Lcoeff_store\@:
 str w2,[sp,#0x1b8]
 str w3,[sp,#0x1bc]
.Lcoeff_restore\@:
 ldr x0,[sp,#120]
 msr fpsr,x0
 ldr x0,[sp,#112]
 msr nzcv,x0
 ldp q0,q1,[sp,#48]
 ldp q2,q3,[sp,#80]
 ldp x4,x5,[sp,#32]
 ldp x2,x3,[sp,#16]
 ldp x0,x1,[sp]
 add sp,sp,#128
 b .Lcoeff_done\@
.balign 8
.Lcoeff_table\@:
 .word 32768,0
 .word 31129,8847
 .word 28835,12451
 .word 26214,16056
 .word 24248,19333
 .word 22282,22282
 .word 19333,24248
 .word 16056,26214
 .word 12451,28835
 .word 8847,31129
 .word 0,32768
.Lcoeff_done\@:
.endm
