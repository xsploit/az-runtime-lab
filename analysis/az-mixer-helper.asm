
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000014aada0 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f1f8>:
 14aada0:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 14aada4:	910003fd 	mov	x29, sp
 14aada8:	a9025bf5 	stp	x21, x22, [sp,#32]
 14aadac:	39400022 	ldrb	w2, [x1]
 14aadb0:	f9400436 	ldr	x22, [x1,#8]
 14aadb4:	a90153f3 	stp	x19, x20, [sp,#16]
 14aadb8:	f9400ec3 	ldr	x3, [x22,#24]
 14aadbc:	f9001bf7 	str	x23, [sp,#48]
 14aadc0:	35000a42 	cbnz	w2, 14aaf08 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f360>
 14aadc4:	b9400ad7 	ldr	w23, [x22,#8]
 14aadc8:	f10006ff 	cmp	x23, #0x1
 14aadcc:	54000680 	b.eq	14aae9c <_ZNSt15recursive_mutex4lockEv@@Base+0x1f2f4>
 14aadd0:	d37ef465 	lsl	x5, x3, #2
 14aadd4:	91003ca1 	add	x1, x5, #0xf
 14aadd8:	927cec21 	and	x1, x1, #0xfffffffffffffff0
 14aaddc:	cb2163ff 	sub	sp, sp, x1
 14aade0:	910003f5 	mov	x21, sp
 14aade4:	b4000323 	cbz	x3, 14aae48 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f2a0>
 14aade8:	b9400c04 	ldr	w4, [x0,#12]
 14aadec:	d2800002 	mov	x2, #0x0                   	// #0
 14aadf0:	2a0403e1 	mov	w1, w4
 14aadf4:	d503201f 	nop
 14aadf8:	7100003f 	cmp	w1, #0x0
 14aadfc:	5400006d 	b.le	14aae08 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f260>
 14aae00:	51000421 	sub	w1, w1, #0x1
 14aae04:	b9000c01 	str	w1, [x0,#12]
 14aae08:	91000442 	add	x2, x2, #0x1
 14aae0c:	eb02007f 	cmp	x3, x2
 14aae10:	54ffff41 	b.ne	14aadf8 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f250>
 14aae14:	8b1500a2 	add	x2, x5, x21
 14aae18:	aa1503e1 	mov	x1, x21
 14aae1c:	d503201f 	nop
 14aae20:	7100009f 	cmp	w4, #0x0
 14aae24:	5400068d 	b.le	14aaef4 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f34c>
 14aae28:	bd400000 	ldr	s0, [x0]
 14aae2c:	51000484 	sub	w4, w4, #0x1
 14aae30:	bd400801 	ldr	s1, [x0,#8]
 14aae34:	1e212800 	fadd	s0, s0, s1
 14aae38:	bc004420 	str	s0, [x1],#4
 14aae3c:	eb01005f 	cmp	x2, x1
 14aae40:	bd000000 	str	s0, [x0]
 14aae44:	54fffee1 	b.ne	14aae20 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f278>
 14aae48:	b40001f7 	cbz	x23, 14aae84 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f2dc>
 14aae4c:	2a0303f4 	mov	w20, w3
 14aae50:	d37df2f7 	lsl	x23, x23, #3
 14aae54:	d2800013 	mov	x19, #0x0                   	// #0
 14aae58:	f94002c0 	ldr	x0, [x22]
 14aae5c:	2a1403e3 	mov	w3, w20
 14aae60:	f9400ac1 	ldr	x1, [x22,#16]
 14aae64:	aa1503e2 	mov	x2, x21
 14aae68:	f8736800 	ldr	x0, [x0,x19]
 14aae6c:	91002273 	add	x19, x19, #0x8
 14aae70:	8b010801 	add	x1, x0, x1, lsl #2
 14aae74:	aa0103e0 	mov	x0, x1
 14aae78:	9436240e 	bl	2233eb0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xabd98>
 14aae7c:	eb17027f 	cmp	x19, x23
 14aae80:	54fffec1 	b.ne	14aae58 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f2b0>
 14aae84:	910003bf 	mov	sp, x29
 14aae88:	a94153f3 	ldp	x19, x20, [sp,#16]
 14aae8c:	a9425bf5 	ldp	x21, x22, [sp,#32]
 14aae90:	f9401bf7 	ldr	x23, [sp,#48]
 14aae94:	a8c47bfd 	ldp	x29, x30, [sp],#64
 14aae98:	d65f03c0 	ret
 14aae9c:	f94002c2 	ldr	x2, [x22]
 14aaea0:	f9400ac1 	ldr	x1, [x22,#16]
 14aaea4:	f9400044 	ldr	x4, [x2]
 14aaea8:	b4fffee3 	cbz	x3, 14aae84 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f2dc>
 14aaeac:	8b010063 	add	x3, x3, x1
 14aaeb0:	b9400c02 	ldr	w2, [x0,#12]
 14aaeb4:	8b010881 	add	x1, x4, x1, lsl #2
 14aaeb8:	8b030883 	add	x3, x4, x3, lsl #2
 14aaebc:	7100005f 	cmp	w2, #0x0
 14aaec0:	bd400021 	ldr	s1, [x1]
 14aaec4:	5400054d 	b.le	14aaf6c <_ZNSt15recursive_mutex4lockEv@@Base+0x1f3c4>
 14aaec8:	bd400000 	ldr	s0, [x0]
 14aaecc:	51000442 	sub	w2, w2, #0x1
 14aaed0:	bd400802 	ldr	s2, [x0,#8]
 14aaed4:	b9000c02 	str	w2, [x0,#12]
 14aaed8:	1e222800 	fadd	s0, s0, s2
 14aaedc:	1e200821 	fmul	s1, s1, s0
 14aaee0:	bd000000 	str	s0, [x0]
 14aaee4:	bc004421 	str	s1, [x1],#4
 14aaee8:	eb01007f 	cmp	x3, x1
 14aaeec:	54fffe81 	b.ne	14aaebc <_ZNSt15recursive_mutex4lockEv@@Base+0x1f314>
 14aaef0:	17ffffe5 	b	14aae84 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f2dc>
 14aaef4:	b9400405 	ldr	w5, [x0,#4]
 14aaef8:	b8004425 	str	w5, [x1],#4
 14aaefc:	eb02003f 	cmp	x1, x2
