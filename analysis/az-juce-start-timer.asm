
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 239cda0:      	stp	x29, x30, [sp, #-0x70]!
 239cda4:      	mov	x29, sp
 239cda8:      	stp	x21, x22, [sp, #0x20]
 239cdac:      	mov	x21, x0
 239cdb0:      	stp	x19, x20, [sp, #0x10]
 239cdb4:      	adrp	x20, 0x3bd7000 <stdout+0x95f40>
 239cdb8:      	add	x20, x20, #0x818
 239cdbc:      	mov	w19, w1
 239cdc0:      	add	x0, x20, #0x20
 239cdc4:      	bl	0x232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3fc8>
 239cdc8:      	ldr	w0, [x21, #0x10]
 239cdcc:      	cmp	w19, #0x0
 239cdd0:      	csinc	w2, w19, wzr, gt
 239cdd4:      	str	w2, [x21, #0x10]
 239cdd8:      	cbz	w0, 0x239ce5c <_ZNSt8functionIFvvEEC2ERKS1_+0x27a3c>
 239cddc:      	ldr	x0, [x20, #0x18]
 239cde0:      	cbz	x0, 0x239ce44 <_ZNSt8functionIFvvEEC2ERKS1_+0x27a24>
 239cde4:      	ldr	x3, [x21, #0x8]
 239cde8:      	ldr	x4, [x0, #0x1a0]
 239cdec:      	lsl	x5, x3, #4
 239cdf0:      	add	x1, x4, x5
 239cdf4:      	ldr	w6, [x1, #0x8]
 239cdf8:      	cmp	w6, w2
 239cdfc:      	b.eq	0x239ce44 <_ZNSt8functionIFvvEEC2ERKS1_+0x27a24>
 239ce00:      	str	w2, [x1, #0x8]
 239ce04:      	b.lt	0x239cf0c <_ZNSt8functionIFvvEEC2ERKS1_+0x27aec>
 239ce08:      	cbz	x3, 0x239ce40 <_ZNSt8functionIFvvEEC2ERKS1_+0x27a20>
 239ce0c:      	ldr	x8, [x1]
 239ce10:      	sub	x5, x3, #0x1
 239ce14:      	ldur	w6, [x1, #-0x8]
 239ce18:      	cmp	w6, w2
 239ce1c:      	b.le	0x239d104 <_ZNSt8functionIFvvEEC2ERKS1_+0x27ce4>
 239ce20:      	ldp	x6, x7, [x1, #-0x10]
 239ce24:      	stp	x6, x7, [x1], #-0x10
 239ce28:      	str	x3, [x6, #0x8]
 239ce2c:      	mov	x3, x5
 239ce30:      	cbnz	x5, 0x239ce10 <_ZNSt8functionIFvvEEC2ERKS1_+0x279f0>
 239ce34:      	str	x8, [x4]
 239ce38:      	str	w2, [x4, #0x8]
 239ce3c:      	str	x5, [x8, #0x8]
 239ce40:      	bl	0x231ceb0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x194d98>
 239ce44:      	add	x0, x20, #0x20
 239ce48:      	bl	0x232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3ff8>
 239ce4c:      	ldp	x19, x20, [sp, #0x10]
 239ce50:      	ldp	x21, x22, [sp, #0x20]
 239ce54:      	ldp	x29, x30, [sp], #0x70
 239ce58:      	ret
 239ce5c:      	ldr	x22, [x20, #0x18]
 239ce60:      	stp	x23, x24, [sp, #0x30]
 239ce64:      	add	x24, x22, #0x1a0
 239ce68:      	cbz	x22, 0x239cfc0 <_ZNSt8functionIFvvEEC2ERKS1_+0x27ba0>
 239ce6c:      	ldp	x23, x1, [x22, #0x1a0]
 239ce70:      	ldr	x0, [x24, #0x10]
 239ce74:      	str	x21, [sp, #0x60]
 239ce78:      	str	w2, [sp, #0x68]
 239ce7c:      	sub	x23, x1, x23
 239ce80:      	cmp	x1, x0
 239ce84:      	asr	x19, x23, #4
 239ce88:      	b.eq	0x239cfb0 <_ZNSt8functionIFvvEEC2ERKS1_+0x27b90>
 239ce8c:      	str	x21, [x1]
 239ce90:      	add	x0, x1, #0x10
 239ce94:      	str	w2, [x1, #0x8]
 239ce98:      	str	x0, [x24, #0x8]
 239ce9c:      	str	x19, [x21, #0x8]
 239cea0:      	cbz	x19, 0x239cee8 <_ZNSt8functionIFvvEEC2ERKS1_+0x27ac8>
 239cea4:      	ldr	x5, [x22, #0x1a0]
 239cea8:      	add	x1, x5, x23
 239ceac:      	ldr	x6, [x5, x23]
 239ceb0:      	mov	x0, x1
 239ceb4:      	ldr	w4, [x1, #0x8]
 239ceb8:      	ldur	w2, [x0, #-0x8]
 239cebc:      	sub	x1, x19, #0x1
 239cec0:      	cmp	w4, w2
 239cec4:      	b.ge	0x239cfa4 <_ZNSt8functionIFvvEEC2ERKS1_+0x27b84>
 239cec8:      	ldp	x2, x3, [x0, #-0x10]
 239cecc:      	stp	x2, x3, [x0], #-0x10
 239ced0:      	str	x19, [x2, #0x8]
 239ced4:      	mov	x19, x1
 239ced8:      	cbnz	x1, 0x239ceb8 <_ZNSt8functionIFvvEEC2ERKS1_+0x27a98>
 239cedc:      	str	x6, [x5]
 239cee0:      	str	w4, [x5, #0x8]
 239cee4:      	str	x1, [x6, #0x8]
 239cee8:      	mov	x0, x22
 239ceec:      	bl	0x231ceb0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x194d98>
 239cef0:      	add	x0, x20, #0x20
 239cef4:      	ldp	x23, x24, [sp, #0x30]
 239cef8:      	bl	0x232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a3ff8>
 239cefc:      	ldp	x19, x20, [sp, #0x10]
 239cf00:      	ldp	x21, x22, [sp, #0x20]
 239cf04:      	ldp	x29, x30, [sp], #0x70
 239cf08:      	ret
 239cf0c:      	ldr	x9, [x0, #0x1a8]
 239cf10:      	sub	x9, x9, x4
 239cf14:      	asr	x9, x9, #4
 239cf18:      	sub	x6, x9, #0x1
 239cf1c:      	cmp	x3, x6
 239cf20:      	b.hs	0x239ce40 <_ZNSt8functionIFvvEEC2ERKS1_+0x27a20>
 239cf24:      	add	x6, x3, #0x1
 239cf28:      	cmp	x6, x9
 239cf2c:      	ldr	x11, [x1]
 239cf30:      	b.eq	0x239d110 <_ZNSt8functionIFvvEEC2ERKS1_+0x27cf0>
 239cf34:      	add	x5, x5, #0x10
 239cf38:      	add	x4, x4, x5
 239cf3c:      	ldr	w5, [x4, #0x8]
