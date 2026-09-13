
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021edba0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x65a88>:
 21edba0:	aa0003e1 	mov	x1, x0
 21edba4:	d10083ff 	sub	sp, sp, #0x20
 21edba8:	d2800000 	mov	x0, #0x0                   	// #0
 21edbac:	b9403c22 	ldr	w2, [x1,#60]
 21edbb0:	3940c023 	ldrb	w3, [x1,#48]
 21edbb4:	390003e3 	strb	w3, [sp]
 21edbb8:	b80013e2 	stur	w2, [sp,#1]
 21edbbc:	b9403421 	ldr	w1, [x1,#52]
 21edbc0:	f94003e2 	ldr	x2, [sp]
 21edbc4:	910083ff 	add	sp, sp, #0x20
 21edbc8:	b3407c40 	bfxil	x0, x2, #0, #32
 21edbcc:	d360fc42 	lsr	x2, x2, #32
 21edbd0:	b3607c40 	bfi	x0, x2, #32, #32
 21edbd4:	d65f03c0 	ret
 21edbd8:	d503201f 	nop
 21edbdc:	d503201f 	nop
 21edbe0:	aa0003e2 	mov	x2, x0
 21edbe4:	f84d8443 	ldr	x3, [x2],#216
 21edbe8:	f9400863 	ldr	x3, [x3,#16]
 21edbec:	d61f0060 	br	x3
 21edbf0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21edbf4:	52800024 	mov	w4, #0x1                   	// #1
 21edbf8:	910003fd 	mov	x29, sp
 21edbfc:	fc4dc000 	ldur	d0, [x0,#220]
 21edc00:	f9400005 	ldr	x5, [x0]
 21edc04:	390047e4 	strb	w4, [sp,#17]
 21edc08:	390073e4 	strb	w4, [sp,#28]
 21edc0c:	910043e2 	add	x2, sp, #0x10
 21edc10:	39436004 	ldrb	w4, [x0,#216]
 21edc14:	f94008a3 	ldr	x3, [x5,#16]
 21edc18:	390043e4 	strb	w4, [sp,#16]
 21edc1c:	fc0143e0 	stur	d0, [sp,#20]
 21edc20:	d63f0060 	blr	x3
 21edc24:	a8c27bfd 	ldp	x29, x30, [sp],#32
 21edc28:	d65f03c0 	ret
 21edc2c:	d503201f 	nop
