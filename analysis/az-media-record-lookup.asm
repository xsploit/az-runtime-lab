
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000b44c30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a018>:
  b44c30:	f8440c04 	ldr	x4, [x0,#64]!
  b44c34:	12001c63 	and	w3, w3, #0xff
  b44c38:	12001c46 	and	w6, w2, #0xff
  b44c3c:	d3401047 	ubfx	x7, x2, #0, #5
  b44c40:	b9801005 	ldrsw	x5, [x0,#16]
  b44c44:	8b050c85 	add	x5, x4, x5, lsl #3
  b44c48:	eb05009f 	cmp	x4, x5
  b44c4c:	54000200 	b.eq	b44c8c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a074>
  b44c50:	f9400080 	ldr	x0, [x4]
  b44c54:	91002084 	add	x4, x4, #0x8
  b44c58:	f9404002 	ldr	x2, [x0,#128]
  b44c5c:	6b02003f 	cmp	w1, w2
  b44c60:	d3609c42 	ubfx	x2, x2, #32, #8
  b44c64:	54ffff21 	b.ne	b44c48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a030>
  b44c68:	6b0200df 	cmp	w6, w2
  b44c6c:	54fffee1 	b.ne	b44c48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a030>
  b44c70:	340000c3 	cbz	w3, b44c88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a070>
  b44c74:	f10014ff 	cmp	x7, #0x5
  b44c78:	54000081 	b.ne	b44c88 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a070>
  b44c7c:	39422002 	ldrb	w2, [x0,#136]
  b44c80:	6b03005f 	cmp	w2, w3
  b44c84:	54fffe21 	b.ne	b44c48 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a030>
  b44c88:	d65f03c0 	ret
  b44c8c:	d2800000 	mov	x0, #0x0                   	// #0
  b44c90:	d65f03c0 	ret
  b44c94:	d503201f 	nop
  b44c98:	a9b77bfd 	stp	x29, x30, [sp,#-144]!
  b44c9c:	910003fd 	mov	x29, sp
  b44ca0:	a9025bf5 	stp	x21, x22, [sp,#32]
  b44ca4:	91022015 	add	x21, x0, #0x88
  b44ca8:	12001c76 	and	w22, w3, #0xff
  b44cac:	a90153f3 	stp	x19, x20, [sp,#16]
  b44cb0:	aa0003f4 	mov	x20, x0
  b44cb4:	2a0203f3 	mov	w19, w2
  b44cb8:	aa1503e0 	mov	x0, x21
  b44cbc:	290bffe1 	stp	w1, wzr, [sp,#92]
  b44cc0:	7900cbff 	strh	wzr, [sp,#100]
  b44cc4:	945f9d07 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
  b44cc8:	b9405fe1 	ldr	w1, [sp,#92]
  b44ccc:	2a1603e3 	mov	w3, w22
  b44cd0:	2a1303e2 	mov	w2, w19
  b44cd4:	aa1403e0 	mov	x0, x20
  b44cd8:	97ffffd6 	bl	b44c30 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a018>
  b44cdc:	b4000c60 	cbz	x0, b44e68 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a250>
  b44ce0:	f9400002 	ldr	x2, [x0]
  b44ce4:	b0ffffa1 	adrp	x1, b39000 <_ZSt20__throw_bad_weak_ptrv@@Base+0x22e3e8>
  b44ce8:	91322021 	add	x1, x1, #0xc88
  b44cec:	aa0003f3 	mov	x19, x0
  b44cf0:	f9403842 	ldr	x2, [x2,#112]
  b44cf4:	eb01005f 	cmp	x2, x1
  b44cf8:	54000b41 	b.ne	b44e60 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a248>
  b44cfc:	f9404261 	ldr	x1, [x19,#128]
  b44d00:	b90063e1 	str	w1, [sp,#96]
  b44d04:	aa1503e0 	mov	x0, x21
  b44d08:	d360bc21 	ubfx	x1, x1, #32, #16
  b44d0c:	7900cbe1 	strh	w1, [sp,#100]
  b44d10:	945f9d00 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
  b44d14:	f9401293 	ldr	x19, [x20,#32]
  b44d18:	b4000153 	cbz	x19, b44d40 <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a128>
  b44d1c:	f9400262 	ldr	x2, [x19]
  b44d20:	aa1303e0 	mov	x0, x19
  b44d24:	910183e1 	add	x1, sp, #0x60
  b44d28:	f9407042 	ldr	x2, [x2,#224]
  b44d2c:	d63f0040 	blr	x2
  b44d30:	a94153f3 	ldp	x19, x20, [sp,#16]
  b44d34:	a9425bf5 	ldp	x21, x22, [sp,#32]
  b44d38:	a8c97bfd 	ldp	x29, x30, [sp],#144
  b44d3c:	d65f03c0 	ret
  b44d40:	f9401680 	ldr	x0, [x20,#40]
  b44d44:	b4fffec0 	cbz	x0, b44d1c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a104>
  b44d48:	b0017ff6 	adrp	x22, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b44d4c:	9123e2d6 	add	x22, x22, #0x8f8
  b44d50:	08dffec0 	ldarb	w0, [x22]
  b44d54:	360015c0 	tbz	w0, #0, b4500c <_ZSt20__throw_bad_weak_ptrv@@Base+0x23a3f4>
  b44d58:	b0017ff5 	adrp	x21, 3b41000 <_ZSt4cerr@@GLIBCXX_3.4+0x68>
  b44d5c:	912402b5 	add	x21, x21, #0x900
  b44d60:	b9801aa1 	ldrsw	x1, [x21,#24]
  b44d64:	f9401682 	ldr	x2, [x20,#40]
  b44d68:	f94006a3 	ldr	x3, [x21,#8]
  b44d6c:	9ac10840 	udiv	x0, x2, x1
