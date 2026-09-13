
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

0000000002375420 <_ZNSt8functionIFvvEEC2ERKS1_>:
 24fac00:      	bl	0x231f0d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x196fb8>
 24fac04:      	str	w0, [x22, #0x28]
 24fac08:      	mov	w1, #0x21               // =33
 24fac0c:      	mov	x0, x22
 24fac10:      	bl	0x239cda0 <_ZNSt8functionIFvvEEC2ERKS1_+0x27980>
 24fac14:      	ldr	x0, [sp, #0x110]
 24fac18:      	bl	0x424af0 <free@plt>
 24fac1c:      	ldp	x29, x30, [sp, #0x20]
 24fac20:      	ldp	x19, x20, [sp, #0x30]
 24fac24:      	ldp	x21, x22, [sp, #0x40]
 24fac28:      	ldr	d8, [sp, #0x80]
 24fac2c:      	add	sp, sp, #0x1c0
 24fac30:      	ret
 24fac34:      	adrp	x1, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fac38:      	adrp	x0, 0x315e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0xb9b1a8>
 24fac3c:      	add	x1, x1, #0xd28
 24fac40:      	add	x0, x0, #0xd40
 24fac44:      	bl	0x2539000 <_ZNSt8functionIFvvEEC2ERKS1_+0x1c3be0>
 24fac48:      	mov	x0, x22
 24fac4c:      	mov	w1, #0x21               // =33
 24fac50:      	bl	0x239cda0 <_ZNSt8functionIFvvEEC2ERKS1_+0x27980>
 24fac54:      	ldp	x29, x30, [sp, #0x20]
 24fac58:      	ldp	x21, x22, [sp, #0x40]
 24fac5c:      	ldr	d8, [sp, #0x80]
 24fac60:      	add	sp, sp, #0x1c0
 24fac64:      	ret
 24fac68:      	ldr	x0, [x19, #0x80]
 24fac6c:      	bl	0x2432ac0 <_ZNSt8functionIFvvEEC2ERKS1_+0xbd6a0>
 24fac70:      	tst	w0, #0xff
 24fac74:      	b.ne	0x24fb098 <_ZNSt8functionIFvvEEC2ERKS1_+0x185c78>
 24fac78:      	ldrb	w0, [x19, #0xa8]
 24fac7c:      	cbnz	w0, 0x24fa90c <_ZNSt8functionIFvvEEC2ERKS1_+0x1854ec>
 24fac80:      	b	0x24fa874 <_ZNSt8functionIFvvEEC2ERKS1_+0x185454>
 24fac84:      	ldp	w5, w1, [sp, #0x94]
 24fac88:      	str	w1, [sp]
 24fac8c:      	ldr	w1, [sp, #0x9c]
 24fac90:      	mov	w4, w21
 24fac94:      	ldp	w6, w7, [sp, #0xa0]
 24fac98:      	str	w1, [sp, #0x8]
 24fac9c:      	fmov	x1, d8
 24faca0:      	bl	0x4257f0 <XPutImage@plt>
 24faca4:      	cbz	w0, 0x24fabc8 <_ZNSt8functionIFvvEEC2ERKS1_+0x1857a8>
 24faca8:      	mov	w1, w0
 24facac:      	add	x0, sp, #0xf8
 24facb0:      	bl	0x2310b10 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1889f8>
 24facb4:      	ldr	x0, [sp, #0xe8]
 24facb8:      	add	x1, sp, #0xf8
 24facbc:      	ldr	x19, [sp, #0xc8]
 24facc0:      	mov	x8, x19
 24facc4:      	bl	0x2334000 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abee8>
 24facc8:      	mov	x0, x19
 24faccc:      	bl	0x232e420 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a6308>
 24facd0:      	mov	x0, x19
 24facd4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 24facd8:      	add	x0, sp, #0xf8
 24facdc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 24face0:      	b	0x24fabc8 <_ZNSt8functionIFvvEEC2ERKS1_+0x1857a8>
 24face4:      	ldr	w2, [x3, #0x38]
 24face8:      	mov	w0, #0x1f               // =31
 24facec:      	ldr	w27, [x3, #0x40]
 24facf0:      	ldr	w28, [x3, #0x48]
 24facf4:      	str	w2, [sp, #0xa8]
 24facf8:      	b	0x24fad08 <_ZNSt8functionIFvvEEC2ERKS1_+0x1858e8>
 24facfc:      	sub	w0, w0, #0x1
 24fad00:      	cmn	w0, #0x1
 24fad04:      	b.eq	0x24faffc <_ZNSt8functionIFvvEEC2ERKS1_+0x185bdc>
 24fad08:      	lsr	w1, w2, w0
 24fad0c:      	and	w3, w1, #0x1
 24fad10:      	tbz	w1, #0x0, 0x24facfc <_ZNSt8functionIFvvEEC2ERKS1_+0x1858dc>
 24fad14:      	subs	w0, w0, #0x7
 24fad18:      	csel	w0, w0, wzr, pl
 24fad1c:      	str	w0, [sp, #0xb0]
 24fad20:      	mov	w0, #0x1f               // =31
 24fad24:      	ldr	w3, [sp, #0xa8]
 24fad28:      	b	0x24fad38 <_ZNSt8functionIFvvEEC2ERKS1_+0x185918>
 24fad2c:      	sub	w0, w0, #0x1
 24fad30:      	cmn	w0, #0x1
 24fad34:      	b.eq	0x24faf98 <_ZNSt8functionIFvvEEC2ERKS1_+0x185b78>
 24fad38:      	lsr	w1, w3, w0
 24fad3c:      	add	w2, w0, #0x1
 24fad40:      	and	w4, w1, #0x1
 24fad44:      	tbz	w1, #0x0, 0x24fad2c <_ZNSt8functionIFvvEEC2ERKS1_+0x18590c>
 24fad48:      	cmp	w2, #0x7
 24fad4c:      	mov	w0, #0x8                // =8
 24fad50:      	sub	w2, w0, w2
 24fad54:      	csel	w0, w2, wzr, le
 24fad58:      	str	w0, [sp, #0xb4]
 24fad5c:      	mov	w0, #0x1f               // =31
