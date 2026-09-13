
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 24fa940:      	mov	x0, #0x0                // =0
 24fa944:      	str	xzr, [sp, #0x128]
 24fa948:      	str	wzr, [sp, #0x130]
 24fa94c:      	cmp	w19, #0x0
 24fa950:      	str	w19, [sp, #0x138]
 24fa954:      	sbfiz	x21, x19, #4, #32
 24fa958:      	b.eq	0x24fa9ac <_ZNSt8functionIFvvEEC2ERKS1_+0x18558c>
 24fa95c:      	b.le	0x24fb220 <_ZNSt8functionIFvvEEC2ERKS1_+0x185e00>
 24fa960:      	mov	x0, x21
 24fa964:      	bl	0x424fd0 <malloc@plt>
 24fa968:      	ldr	x2, [sp, #0x110]
 24fa96c:      	str	x0, [sp, #0x128]
 24fa970:      	str	w19, [sp, #0x130]
 24fa974:      	add	x1, x0, #0x10
 24fa978:      	add	x3, x2, #0x10
 24fa97c:      	cmp	x0, x3
 24fa980:      	ccmp	x1, x2, #0x0, lo
 24fa984:      	b.hi	0x24fb1b4 <_ZNSt8functionIFvvEEC2ERKS1_+0x185d94>
 24fa988:      	sub	w3, w19, #0x1
 24fa98c:      	mov	x1, #0x0                // =0
 24fa990:      	add	x3, x3, #0x1
 24fa994:      	lsl	x3, x3, #4
 24fa998:      	ldr	q0, [x2, x1]
 24fa99c:      	str	q0, [x0, x1]
 24fa9a0:      	add	x1, x1, #0x10
 24fa9a4:      	cmp	x3, x1
 24fa9a8:      	b.ne	0x24fa998 <_ZNSt8functionIFvvEEC2ERKS1_+0x185578>
 24fa9ac:      	ldr	s1, [sp, #0x100]
 24fa9b0:      	add	x1, x0, x21
 24fa9b4:      	ldr	w2, [sp, #0x104]
 24fa9b8:      	cmp	x1, x0
 24fa9bc:      	dup	v1.2s, v1.s[0]
 24fa9c0:      	mov	v1.s[1], w2
 24fa9c4:      	b.eq	0x24fa9dc <_ZNSt8functionIFvvEEC2ERKS1_+0x1855bc>
 24fa9c8:      	ldr	d0, [x0]
 24fa9cc:      	sub	v0.2s, v0.2s, v1.2s
 24fa9d0:      	str	d0, [x0], #0x10
 24fa9d4:      	cmp	x1, x0
 24fa9d8:      	b.ne	0x24fa9c8 <_ZNSt8functionIFvvEEC2ERKS1_+0x1855a8>
 24fa9dc:      	ldr	x0, [x22, #0x18]
 24fa9e0:      	ldr	w0, [x0, #0xa0]
 24fa9e4:      	cmp	w0, #0x20
 24fa9e8:      	b.ne	0x24faa40 <_ZNSt8functionIFvvEEC2ERKS1_+0x185620>
 24fa9ec:      	ldr	x19, [sp, #0x110]
 24fa9f0:      	add	x21, x19, x21
 24fa9f4:      	cmp	x21, x19
 24fa9f8:      	b.eq	0x24faa40 <_ZNSt8functionIFvvEEC2ERKS1_+0x185620>
 24fa9fc:      	add	x23, sp, #0x140
 24faa00:      	ldp	d0, d1, [x19]
 24faa04:      	mov	w1, #0x0                // =0
 24faa08:      	ldr	d2, [sp, #0x100]
 24faa0c:      	add	x0, sp, #0xf8
 24faa10:      	sub	v0.2s, v0.2s, v2.2s
 24faa14:      	stp	d0, d1, [sp, #0x140]
 24faa18:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 24faa1c:      	add	x2, sp, #0xf8
 24faa20:      	mov	x1, x23
 24faa24:      	mov	x0, x20
 24faa28:      	bl	0x23b2c50 <_ZNSt8functionIFvvEEC2ERKS1_+0x3d830>
 24faa2c:      	add	x0, sp, #0xf8
 24faa30:      	add	x19, x19, #0x10
 24faa34:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 24faa38:      	cmp	x21, x19
 24faa3c:      	b.ne	0x24faa00 <_ZNSt8functionIFvvEEC2ERKS1_+0x1855e0>
 24faa40:      	adrp	x1, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24faa44:      	adrp	x0, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24faa48:      	add	x1, x1, #0xd78
 24faa4c:      	add	x0, x0, #0xd40
 24faa50:      	bl	0x2539000 <_ZNSt8functionIFvvEEC2ERKS1_+0x1c3be0>
 24faa54:      	ldr	x0, [x22, #0x18]
 24faa58:      	ldr	x0, [x0, #0x8]
 24faa5c:      	bl	0x246e1a0 <_ZNSt8functionIFvvEEC2ERKS1_+0xf8d80>
 24faa60:      	ldr	x4, [x0]
 24faa64:      	adrp	x3, 0x2430000 <_ZNSt8functionIFvvEEC2ERKS1_+0xbabe0>
 24faa68:      	add	x3, x3, #0xbd0
 24faa6c:      	ldr	w2, [sp, #0x100]
 24faa70:      	ldr	w1, [sp, #0x104]
 24faa74:      	ldr	x4, [x4, #0x58]
 24faa78:      	neg	w2, w2
 24faa7c:      	neg	w1, w1
 24faa80:      	stp	w2, w1, [sp, #0xf8]
 24faa84:      	cmp	x4, x3
 24faa88:      	b.ne	0x24fb194 <_ZNSt8functionIFvvEEC2ERKS1_+0x185d74>
 24faa8c:      	mov	x0, #0x28               // =40
 24faa90:      	str	w2, [sp, #0x140]
 24faa94:      	str	w1, [sp, #0x144]
 24faa98:      	bl	0x424d40 <_Znwm@plt>
 24faa9c:      	add	x1, sp, #0x140
 24faaa0:      	mov	x19, x0
 24faaa4:      	mov	x2, x1
 24faaa8:      	add	x3, sp, #0x128
 24faaac:      	mov	x1, x20
 24faab0:      	str	x2, [sp, #0xc8]
 24faab4:      	bl	0x23e34c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x6e0a0>
 24faab8:      	ldr	x1, [x22, #0x18]
 24faabc:      	ldr	x0, [x19]
 24faac0:      	ldr	d0, [x1, #0xb8]
 24faac4:      	ldr	x21, [sp, #0xc8]
 24faac8:      	fcvt	s0, d0
 24faacc:      	ldr	x20, [x0, #0x20]
 24faad0:      	mov	x8, x21
 24faad4:      	bl	0x23a9120 <_ZNSt8functionIFvvEEC2ERKS1_+0x33d00>
 24faad8:      	mov	x1, x21
 24faadc:      	mov	x0, x19
 24faae0:      	blr	x20
 24faae4:      	ldr	x0, [x22, #0x18]
 24faae8:      	mov	x1, x19
 24faaec:      	bl	0x2469040 <_ZNSt8functionIFvvEEC2ERKS1_+0xf3c20>
 24faaf0:      	ldr	x1, [x19]
 24faaf4:      	mov	x0, x19
 24faaf8:      	ldr	x1, [x1, #0x8]
 24faafc:      	blr	x1
 24fab00:      	ldr	x20, [sp, #0x110]
 24fab04:      	ldrsw	x0, [sp, #0x120]
 24fab08:      	add	x0, x20, x0, lsl #4
 24fab0c:      	str	x0, [sp, #0xc0]
 24fab10:      	cmp	x0, x20
 24fab14:      	b.eq	0x24fabe4 <_ZNSt8functionIFvvEEC2ERKS1_+0x1857c4>
 24fab18:      	adrp	x0, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fab1c:      	add	x0, x0, #0xd88
 24fab20:      	str	x0, [sp, #0xe8]
 24fab24:      	nop
 24fab28:      	ldr	x19, [x22, #0x20]
 24fab2c:      	ldrb	w0, [x19, #0xa8]
 24fab30:      	cbz	w0, 0x24fab40 <_ZNSt8functionIFvvEEC2ERKS1_+0x185720>
 24fab34:      	ldr	w0, [x22, #0x54]
 24fab38:      	add	w0, w0, #0x1
 24fab3c:      	str	w0, [x22, #0x54]
 24fab40:      	ldp	w2, w3, [x20]
 24fab44:      	stp	w2, w3, [sp, #0xa0]
 24fab48:      	ldr	w1, [sp, #0x104]
 24fab4c:      	ldr	w21, [sp, #0x100]
 24fab50:      	sub	w1, w3, w1
 24fab54:      	str	w1, [sp, #0x94]
 24fab58:      	ldr	x0, [x22, #0x18]
 24fab5c:      	sub	w21, w2, w21
 24fab60:      	ldr	x26, [x19, #0x80]
 24fab64:      	ldp	w2, w1, [x20, #0x8]
 24fab68:      	stp	w2, w1, [sp, #0x98]
 24fab6c:      	ldr	d8, [x0, #0x60]
 24fab70:      	cbz	x26, 0x24fab7c <_ZNSt8functionIFvvEEC2ERKS1_+0x18575c>
 24fab74:      	mov	x0, x26
 24fab78:      	bl	0x425a30 <XLockDisplay@plt>
 24fab7c:      	ldr	x2, [x19, #0x78]
 24fab80:      	cbz	x2, 0x24faf58 <_ZNSt8functionIFvvEEC2ERKS1_+0x185b38>
 24fab84:      	ldr	w0, [x19, #0x50]
 24fab88:      	ldr	x3, [x19, #0x48]
 24fab8c:      	cmp	w0, #0x10
 24fab90:      	b.eq	0x24face4 <_ZNSt8functionIFvvEEC2ERKS1_+0x1858c4>
 24fab94:      	ldrb	w1, [x19, #0xa8]
 24fab98:      	ldr	x0, [x19, #0x80]
 24fab9c:      	cbz	w1, 0x24fac84 <_ZNSt8functionIFvvEEC2ERKS1_+0x185864>
 24faba0:      	mov	w1, #0x1                // =1
 24faba4:      	str	w1, [sp, #0x10]
 24faba8:      	ldp	w5, w4, [sp, #0x94]
 24fabac:      	fmov	x1, d8
 24fabb0:      	ldp	w6, w7, [sp, #0xa0]
 24fabb4:      	str	w4, [sp]
 24fabb8:      	ldr	w4, [sp, #0x9c]
 24fabbc:      	str	w4, [sp, #0x8]
 24fabc0:      	mov	w4, w21
 24fabc4:      	bl	0x426ae0 <XShmPutImage@plt>
 24fabc8:      	cbz	x26, 0x24fabd4 <_ZNSt8functionIFvvEEC2ERKS1_+0x1857b4>
 24fabcc:      	mov	x0, x26
 24fabd0:      	bl	0x426570 <XUnlockDisplay@plt>
 24fabd4:      	ldr	x0, [sp, #0xc0]
 24fabd8:      	add	x20, x20, #0x10
 24fabdc:      	cmp	x0, x20
 24fabe0:      	b.ne	0x24fab28 <_ZNSt8functionIFvvEEC2ERKS1_+0x185708>
 24fabe4:      	bl	0x21b5990 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x2d878>
 24fabe8:      	bl	0x2538ff0 <_ZNSt8functionIFvvEEC2ERKS1_+0x1c3bd0>
 24fabec:      	ldr	x0, [sp, #0x128]
 24fabf0:      	bl	0x424af0 <free@plt>
 24fabf4:      	ldp	x23, x24, [sp, #0x50]
 24fabf8:      	ldp	x25, x26, [sp, #0x60]
 24fabfc:      	ldp	x27, x28, [sp, #0x70]
