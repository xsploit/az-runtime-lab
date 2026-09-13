
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

00000000022579a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9245d8>:
 22579a8:	a9b67bfd 	stp	x29, x30, [sp,#-160]!
 22579ac:	910003fd 	mov	x29, sp
 22579b0:	a90153f3 	stp	x19, x20, [sp,#16]
 22579b4:	aa0003f4 	mov	x20, x0
 22579b8:	aa0103f3 	mov	x19, x1
 22579bc:	a9025bf5 	stp	x21, x22, [sp,#32]
 22579c0:	a90363f7 	stp	x23, x24, [sp,#48]
 22579c4:	a9046bf9 	stp	x25, x26, [sp,#64]
 22579c8:	a90573fb 	stp	x27, x28, [sp,#80]
 22579cc:	39401820 	ldrb	w0, [x1,#6]
 22579d0:	f9400a9c 	ldr	x28, [x20,#16]
 22579d4:	d3400000 	ubfx	x0, x0, #0, #1
 22579d8:	390253e0 	strb	w0, [sp,#148]
 22579dc:	f9405f81 	ldr	x1, [x28,#184]
 22579e0:	b40117e1 	cbz	x1, 2259cdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92690c>
 22579e4:	f9400383 	ldr	x3, [x28]
 22579e8:	aa1c03e0 	mov	x0, x28
 22579ec:	910253e2 	add	x2, sp, #0x94
 22579f0:	910263f5 	add	x21, sp, #0x98
 22579f4:	f9401063 	ldr	x3, [x3,#32]
 22579f8:	d63f0060 	blr	x3
 22579fc:	b940b380 	ldr	w0, [x28,#176]
 2257a00:	7100001f 	cmp	w0, #0x0
 2257a04:	54008c4c 	b.gt	2258b8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9257bc>
 2257a08:	39401a60 	ldrb	w0, [x19,#6]
 2257a0c:	f9400e9c 	ldr	x28, [x20,#24]
 2257a10:	d3410400 	ubfx	x0, x0, #1, #1
 2257a14:	390253e0 	strb	w0, [sp,#148]
 2257a18:	f9405f81 	ldr	x1, [x28,#184]
 2257a1c:	b40116a1 	cbz	x1, 2259cf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926920>
 2257a20:	f9400383 	ldr	x3, [x28]
 2257a24:	aa1c03e0 	mov	x0, x28
 2257a28:	910253e2 	add	x2, sp, #0x94
 2257a2c:	f9401063 	ldr	x3, [x3,#32]
 2257a30:	d63f0060 	blr	x3
 2257a34:	b940b380 	ldr	w0, [x28,#176]
 2257a38:	7100001f 	cmp	w0, #0x0
 2257a3c:	54007e4c 	b.gt	2258a04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925634>
 2257a40:	39401a60 	ldrb	w0, [x19,#6]
 2257a44:	f940129c 	ldr	x28, [x20,#32]
 2257a48:	d3420800 	ubfx	x0, x0, #2, #1
 2257a4c:	390253e0 	strb	w0, [sp,#148]
 2257a50:	f9405f81 	ldr	x1, [x28,#184]
 2257a54:	b4011341 	cbz	x1, 2259cbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9268ec>
 2257a58:	f9400383 	ldr	x3, [x28]
 2257a5c:	aa1c03e0 	mov	x0, x28
 2257a60:	910253e2 	add	x2, sp, #0x94
 2257a64:	f9401063 	ldr	x3, [x3,#32]
 2257a68:	d63f0060 	blr	x3
 2257a6c:	b940b380 	ldr	w0, [x28,#176]
 2257a70:	7100001f 	cmp	w0, #0x0
 2257a74:	5400704c 	b.gt	225887c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9254ac>
 2257a78:	39401a60 	ldrb	w0, [x19,#6]
 2257a7c:	f940169c 	ldr	x28, [x20,#40]
 2257a80:	d3430c00 	ubfx	x0, x0, #3, #1
 2257a84:	390253e0 	strb	w0, [sp,#148]
 2257a88:	f9405f81 	ldr	x1, [x28,#184]
 2257a8c:	b4011201 	cbz	x1, 2259ccc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9268fc>
 2257a90:	f9400383 	ldr	x3, [x28]
 2257a94:	aa1c03e0 	mov	x0, x28
 2257a98:	910253e2 	add	x2, sp, #0x94
 2257a9c:	f9401063 	ldr	x3, [x3,#32]
 2257aa0:	d63f0060 	blr	x3
 2257aa4:	b940b380 	ldr	w0, [x28,#176]
 2257aa8:	7100001f 	cmp	w0, #0x0
 2257aac:	5400624c 	b.gt	22586f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925324>
 2257ab0:	39401a62 	ldrb	w2, [x19,#6]
 2257ab4:	aa1503e1 	mov	x1, x21
 2257ab8:	f9401a80 	ldr	x0, [x20,#48]
 2257abc:	d3441042 	ubfx	x2, x2, #4, #1
 2257ac0:	390263e2 	strb	w2, [sp,#152]
 2257ac4:	940020eb 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257ac8:	39401a60 	ldrb	w0, [x19,#6]
 2257acc:	f9401e9c 	ldr	x28, [x20,#56]
 2257ad0:	d3451400 	ubfx	x0, x0, #5, #1
 2257ad4:	390253e0 	strb	w0, [sp,#148]
 2257ad8:	f9405f81 	ldr	x1, [x28,#184]
 2257adc:	b4011421 	cbz	x1, 2259d60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926990>
 2257ae0:	f9400383 	ldr	x3, [x28]
 2257ae4:	aa1c03e0 	mov	x0, x28
 2257ae8:	910253e2 	add	x2, sp, #0x94
 2257aec:	f9401063 	ldr	x3, [x3,#32]
 2257af0:	d63f0060 	blr	x3
 2257af4:	b940b380 	ldr	w0, [x28,#176]
 2257af8:	7100001f 	cmp	w0, #0x0
 2257afc:	5400538c 	b.gt	225856c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92519c>
 2257b00:	39401e62 	ldrb	w2, [x19,#7]
 2257b04:	aa1503e1 	mov	x1, x21
 2257b08:	f9402280 	ldr	x0, [x20,#64]
 2257b0c:	d3400042 	ubfx	x2, x2, #0, #1
 2257b10:	390263e2 	strb	w2, [sp,#152]
 2257b14:	940020d7 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257b18:	39401e60 	ldrb	w0, [x19,#7]
 2257b1c:	f940269c 	ldr	x28, [x20,#72]
 2257b20:	d3410400 	ubfx	x0, x0, #1, #1
 2257b24:	390253e0 	strb	w0, [sp,#148]
 2257b28:	f9405f81 	ldr	x1, [x28,#184]
 2257b2c:	b4011221 	cbz	x1, 2259d70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9269a0>
 2257b30:	f9400383 	ldr	x3, [x28]
 2257b34:	aa1c03e0 	mov	x0, x28
 2257b38:	910253e2 	add	x2, sp, #0x94
 2257b3c:	f9401063 	ldr	x3, [x3,#32]
 2257b40:	d63f0060 	blr	x3
 2257b44:	b940b380 	ldr	w0, [x28,#176]
 2257b48:	7100001f 	cmp	w0, #0x0
 2257b4c:	540044cc 	b.gt	22583e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925014>
 2257b50:	39401e62 	ldrb	w2, [x19,#7]
 2257b54:	aa1503e1 	mov	x1, x21
 2257b58:	f9402a80 	ldr	x0, [x20,#80]
 2257b5c:	d3420842 	ubfx	x2, x2, #2, #1
 2257b60:	390263e2 	strb	w2, [sp,#152]
 2257b64:	940020c3 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257b68:	39401e60 	ldrb	w0, [x19,#7]
 2257b6c:	f9402e9c 	ldr	x28, [x20,#88]
 2257b70:	d3430c00 	ubfx	x0, x0, #3, #1
 2257b74:	390253e0 	strb	w0, [sp,#148]
 2257b78:	f9405f81 	ldr	x1, [x28,#184]
 2257b7c:	b4010e21 	cbz	x1, 2259d40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926970>
 2257b80:	f9400383 	ldr	x3, [x28]
 2257b84:	aa1c03e0 	mov	x0, x28
 2257b88:	910253e2 	add	x2, sp, #0x94
 2257b8c:	f9401063 	ldr	x3, [x3,#32]
 2257b90:	d63f0060 	blr	x3
 2257b94:	b940b380 	ldr	w0, [x28,#176]
 2257b98:	7100001f 	cmp	w0, #0x0
 2257b9c:	5400360c 	b.gt	225825c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e8c>
 2257ba0:	39402262 	ldrb	w2, [x19,#8]
 2257ba4:	aa1503e1 	mov	x1, x21
 2257ba8:	f9403280 	ldr	x0, [x20,#96]
 2257bac:	d3410442 	ubfx	x2, x2, #1, #1
 2257bb0:	390263e2 	strb	w2, [sp,#152]
 2257bb4:	940020af 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257bb8:	39402260 	ldrb	w0, [x19,#8]
 2257bbc:	f940369c 	ldr	x28, [x20,#104]
 2257bc0:	d3420800 	ubfx	x0, x0, #2, #1
 2257bc4:	390253e0 	strb	w0, [sp,#148]
 2257bc8:	f9405f81 	ldr	x1, [x28,#184]
 2257bcc:	b4010c21 	cbz	x1, 2259d50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926980>
 2257bd0:	f9400383 	ldr	x3, [x28]
 2257bd4:	aa1c03e0 	mov	x0, x28
 2257bd8:	910253e2 	add	x2, sp, #0x94
 2257bdc:	f9401063 	ldr	x3, [x3,#32]
 2257be0:	d63f0060 	blr	x3
 2257be4:	b940b380 	ldr	w0, [x28,#176]
 2257be8:	7100001f 	cmp	w0, #0x0
 2257bec:	5400276c 	b.gt	22580d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924d08>
 2257bf0:	39402262 	ldrb	w2, [x19,#8]
 2257bf4:	aa1503e1 	mov	x1, x21
 2257bf8:	f9403a80 	ldr	x0, [x20,#112]
 2257bfc:	d3471c42 	ubfx	x2, x2, #7, #1
 2257c00:	390263e2 	strb	w2, [sp,#152]
 2257c04:	9400209b 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257c08:	39c02260 	ldrsb	w0, [x19,#8]
 2257c0c:	37f80080 	tbnz	w0, #31, 2257c1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92484c>
 2257c10:	f000eca0 	adrp	x0, 3fee000 <_ZTISt11range_error@@GLIBCXX_3.4+0x143c0>
 2257c14:	39630401 	ldrb	w1, [x0,#2241]
 2257c18:	35010321 	cbnz	w1, 2259c7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9268ac>
 2257c1c:	39400660 	ldrb	w0, [x19,#1]
 2257c20:	f940429c 	ldr	x28, [x20,#128]
 2257c24:	d3400000 	ubfx	x0, x0, #0, #1
 2257c28:	390253e0 	strb	w0, [sp,#148]
 2257c2c:	f9405f81 	ldr	x1, [x28,#184]
 2257c30:	b4010361 	cbz	x1, 2259c9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9268cc>
 2257c34:	f9400383 	ldr	x3, [x28]
 2257c38:	aa1c03e0 	mov	x0, x28
 2257c3c:	910253e2 	add	x2, sp, #0x94
 2257c40:	f9401063 	ldr	x3, [x3,#32]
 2257c44:	d63f0060 	blr	x3
 2257c48:	b940b380 	ldr	w0, [x28,#176]
 2257c4c:	7100001f 	cmp	w0, #0x0
 2257c50:	5400f52c 	b.gt	2259af4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926724>
 2257c54:	39400662 	ldrb	w2, [x19,#1]
 2257c58:	aa1503e1 	mov	x1, x21
 2257c5c:	f9404680 	ldr	x0, [x20,#136]
 2257c60:	d3410442 	ubfx	x2, x2, #1, #1
 2257c64:	390263e2 	strb	w2, [sp,#152]
 2257c68:	94002082 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257c6c:	39400660 	ldrb	w0, [x19,#1]
 2257c70:	f9404a9c 	ldr	x28, [x20,#144]
 2257c74:	d3420800 	ubfx	x0, x0, #2, #1
 2257c78:	390253e0 	strb	w0, [sp,#148]
 2257c7c:	f9405f81 	ldr	x1, [x28,#184]
 2257c80:	b4010161 	cbz	x1, 2259cac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9268dc>
 2257c84:	f9400383 	ldr	x3, [x28]
 2257c88:	aa1c03e0 	mov	x0, x28
 2257c8c:	910253e2 	add	x2, sp, #0x94
 2257c90:	f9401063 	ldr	x3, [x3,#32]
 2257c94:	d63f0060 	blr	x3
 2257c98:	b940b380 	ldr	w0, [x28,#176]
 2257c9c:	7100001f 	cmp	w0, #0x0
 2257ca0:	5400e66c 	b.gt	225996c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92659c>
 2257ca4:	39400662 	ldrb	w2, [x19,#1]
 2257ca8:	aa1503e1 	mov	x1, x21
 2257cac:	f9404e80 	ldr	x0, [x20,#152]
 2257cb0:	d3430c42 	ubfx	x2, x2, #3, #1
 2257cb4:	390263e2 	strb	w2, [sp,#152]
 2257cb8:	9400206e 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257cbc:	39400662 	ldrb	w2, [x19,#1]
 2257cc0:	aa1503e1 	mov	x1, x21
 2257cc4:	f9405280 	ldr	x0, [x20,#160]
 2257cc8:	d3441042 	ubfx	x2, x2, #4, #1
 2257ccc:	390263e2 	strb	w2, [sp,#152]
 2257cd0:	94002068 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257cd4:	39400662 	ldrb	w2, [x19,#1]
 2257cd8:	aa1503e1 	mov	x1, x21
 2257cdc:	f9405680 	ldr	x0, [x20,#168]
 2257ce0:	d3451442 	ubfx	x2, x2, #5, #1
 2257ce4:	390263e2 	strb	w2, [sp,#152]
 2257ce8:	94002062 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257cec:	39400a60 	ldrb	w0, [x19,#2]
 2257cf0:	f940969c 	ldr	x28, [x20,#296]
 2257cf4:	d3400000 	ubfx	x0, x0, #0, #1
 2257cf8:	390253e0 	strb	w0, [sp,#148]
 2257cfc:	f9405f81 	ldr	x1, [x28,#184]
 2257d00:	b4010501 	cbz	x1, 2259da0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9269d0>
 2257d04:	f9400383 	ldr	x3, [x28]
 2257d08:	aa1c03e0 	mov	x0, x28
 2257d0c:	910253e2 	add	x2, sp, #0x94
 2257d10:	f9401063 	ldr	x3, [x3,#32]
 2257d14:	d63f0060 	blr	x3
 2257d18:	b940b380 	ldr	w0, [x28,#176]
 2257d1c:	7100001f 	cmp	w0, #0x0
 2257d20:	5400d62c 	b.gt	22597e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926414>
 2257d24:	39400a62 	ldrb	w2, [x19,#2]
 2257d28:	aa1503e1 	mov	x1, x21
 2257d2c:	f9408280 	ldr	x0, [x20,#256]
 2257d30:	d3410442 	ubfx	x2, x2, #1, #1
 2257d34:	390263e2 	strb	w2, [sp,#152]
 2257d38:	9400204e 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257d3c:	39400a60 	ldrb	w0, [x19,#2]
 2257d40:	f940929c 	ldr	x28, [x20,#288]
 2257d44:	d3420800 	ubfx	x0, x0, #2, #1
 2257d48:	390253e0 	strb	w0, [sp,#148]
 2257d4c:	f9405f81 	ldr	x1, [x28,#184]
 2257d50:	b4010301 	cbz	x1, 2259db0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9269e0>
 2257d54:	f9400383 	ldr	x3, [x28]
 2257d58:	aa1c03e0 	mov	x0, x28
 2257d5c:	910253e2 	add	x2, sp, #0x94
 2257d60:	f9401063 	ldr	x3, [x3,#32]
 2257d64:	d63f0060 	blr	x3
 2257d68:	b940b380 	ldr	w0, [x28,#176]
 2257d6c:	7100001f 	cmp	w0, #0x0
 2257d70:	5400c76c 	b.gt	225965c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92628c>
 2257d74:	39400a62 	ldrb	w2, [x19,#2]
 2257d78:	aa1503e1 	mov	x1, x21
 2257d7c:	f9408680 	ldr	x0, [x20,#264]
 2257d80:	d3441042 	ubfx	x2, x2, #4, #1
 2257d84:	390263e2 	strb	w2, [sp,#152]
 2257d88:	9400203a 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257d8c:	39400a60 	ldrb	w0, [x19,#2]
 2257d90:	f9408a9c 	ldr	x28, [x20,#272]
 2257d94:	d3451400 	ubfx	x0, x0, #5, #1
 2257d98:	390253e0 	strb	w0, [sp,#148]
 2257d9c:	f9405f81 	ldr	x1, [x28,#184]
 2257da0:	b400ff01 	cbz	x1, 2259d80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9269b0>
 2257da4:	f9400383 	ldr	x3, [x28]
 2257da8:	aa1c03e0 	mov	x0, x28
 2257dac:	910253e2 	add	x2, sp, #0x94
 2257db0:	f9401063 	ldr	x3, [x3,#32]
 2257db4:	d63f0060 	blr	x3
 2257db8:	b940b380 	ldr	w0, [x28,#176]
 2257dbc:	7100001f 	cmp	w0, #0x0
 2257dc0:	5400b8ac 	b.gt	22594d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926104>
 2257dc4:	39400a62 	ldrb	w2, [x19,#2]
 2257dc8:	aa1503e1 	mov	x1, x21
 2257dcc:	f9408e80 	ldr	x0, [x20,#280]
 2257dd0:	d3461842 	ubfx	x2, x2, #6, #1
 2257dd4:	390263e2 	strb	w2, [sp,#152]
 2257dd8:	94002026 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257ddc:	39400e62 	ldrb	w2, [x19,#3]
 2257de0:	aa1503e1 	mov	x1, x21
 2257de4:	f9405a80 	ldr	x0, [x20,#176]
 2257de8:	d3400042 	ubfx	x2, x2, #0, #1
 2257dec:	390263e2 	strb	w2, [sp,#152]
 2257df0:	94002020 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257df4:	39400e62 	ldrb	w2, [x19,#3]
 2257df8:	aa1503e1 	mov	x1, x21
 2257dfc:	f9405e80 	ldr	x0, [x20,#184]
 2257e00:	d3410442 	ubfx	x2, x2, #1, #1
 2257e04:	390263e2 	strb	w2, [sp,#152]
 2257e08:	9400201a 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257e0c:	39400e60 	ldrb	w0, [x19,#3]
 2257e10:	f940629c 	ldr	x28, [x20,#192]
 2257e14:	d3420800 	ubfx	x0, x0, #2, #1
 2257e18:	390253e0 	strb	w0, [sp,#148]
 2257e1c:	f9405f81 	ldr	x1, [x28,#184]
 2257e20:	b400fb81 	cbz	x1, 2259d90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9269c0>
 2257e24:	f9400383 	ldr	x3, [x28]
 2257e28:	aa1c03e0 	mov	x0, x28
 2257e2c:	910253e2 	add	x2, sp, #0x94
 2257e30:	f9401063 	ldr	x3, [x3,#32]
 2257e34:	d63f0060 	blr	x3
 2257e38:	b940b380 	ldr	w0, [x28,#176]
 2257e3c:	7100001f 	cmp	w0, #0x0
 2257e40:	5400a86c 	b.gt	225934c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925f7c>
 2257e44:	39400e62 	ldrb	w2, [x19,#3]
 2257e48:	aa1503e1 	mov	x1, x21
 2257e4c:	f9406680 	ldr	x0, [x20,#200]
 2257e50:	d3441042 	ubfx	x2, x2, #4, #1
 2257e54:	390263e2 	strb	w2, [sp,#152]
 2257e58:	94002006 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257e5c:	39400e60 	ldrb	w0, [x19,#3]
 2257e60:	f9406a9c 	ldr	x28, [x20,#208]
 2257e64:	d3451400 	ubfx	x0, x0, #5, #1
 2257e68:	390253e0 	strb	w0, [sp,#148]
 2257e6c:	f9405f81 	ldr	x1, [x28,#184]
 2257e70:	b400f581 	cbz	x1, 2259d20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926950>
 2257e74:	f9400383 	ldr	x3, [x28]
 2257e78:	aa1c03e0 	mov	x0, x28
 2257e7c:	910253e2 	add	x2, sp, #0x94
 2257e80:	f9401063 	ldr	x3, [x3,#32]
 2257e84:	d63f0060 	blr	x3
 2257e88:	b940b380 	ldr	w0, [x28,#176]
 2257e8c:	7100001f 	cmp	w0, #0x0
 2257e90:	540099ac 	b.gt	22591c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925df4>
 2257e94:	39400e62 	ldrb	w2, [x19,#3]
 2257e98:	aa1503e1 	mov	x1, x21
 2257e9c:	f940aa80 	ldr	x0, [x20,#336]
 2257ea0:	d3471c42 	ubfx	x2, x2, #7, #1
 2257ea4:	390263e2 	strb	w2, [sp,#152]
 2257ea8:	94001ff2 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257eac:	39401260 	ldrb	w0, [x19,#4]
 2257eb0:	f9407a9c 	ldr	x28, [x20,#240]
 2257eb4:	d3400000 	ubfx	x0, x0, #0, #1
 2257eb8:	390253e0 	strb	w0, [sp,#148]
 2257ebc:	f9405f81 	ldr	x1, [x28,#184]
 2257ec0:	b400f381 	cbz	x1, 2259d30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926960>
 2257ec4:	f9400383 	ldr	x3, [x28]
 2257ec8:	aa1c03e0 	mov	x0, x28
 2257ecc:	910253e2 	add	x2, sp, #0x94
 2257ed0:	f9401063 	ldr	x3, [x3,#32]
 2257ed4:	d63f0060 	blr	x3
 2257ed8:	b940b380 	ldr	w0, [x28,#176]
 2257edc:	7100001f 	cmp	w0, #0x0
 2257ee0:	54008aec 	b.gt	225903c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925c6c>
 2257ee4:	39401262 	ldrb	w2, [x19,#4]
 2257ee8:	aa1503e1 	mov	x1, x21
 2257eec:	f9407680 	ldr	x0, [x20,#232]
 2257ef0:	d3410442 	ubfx	x2, x2, #1, #1
 2257ef4:	390263e2 	strb	w2, [sp,#152]
 2257ef8:	94001fde 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257efc:	39401262 	ldrb	w2, [x19,#4]
 2257f00:	aa1503e1 	mov	x1, x21
 2257f04:	f9406e80 	ldr	x0, [x20,#216]
 2257f08:	d3420842 	ubfx	x2, x2, #2, #1
 2257f0c:	390263e2 	strb	w2, [sp,#152]
 2257f10:	94001fd8 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257f14:	39401260 	ldrb	w0, [x19,#4]
 2257f18:	f940729c 	ldr	x28, [x20,#224]
 2257f1c:	d3430c00 	ubfx	x0, x0, #3, #1
 2257f20:	390253e0 	strb	w0, [sp,#148]
 2257f24:	f9405f81 	ldr	x1, [x28,#184]
 2257f28:	b400eec1 	cbz	x1, 2259d00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926930>
 2257f2c:	f9400383 	ldr	x3, [x28]
 2257f30:	aa1c03e0 	mov	x0, x28
 2257f34:	910253e2 	add	x2, sp, #0x94
 2257f38:	f9401063 	ldr	x3, [x3,#32]
 2257f3c:	d63f0060 	blr	x3
 2257f40:	b940b380 	ldr	w0, [x28,#176]
 2257f44:	7100001f 	cmp	w0, #0x0
 2257f48:	54007b8c 	b.gt	2258eb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x925ae8>
 2257f4c:	39401262 	ldrb	w2, [x19,#4]
 2257f50:	aa1503e1 	mov	x1, x21
 2257f54:	f9409a80 	ldr	x0, [x20,#304]
 2257f58:	d3451442 	ubfx	x2, x2, #5, #1
 2257f5c:	390263e2 	strb	w2, [sp,#152]
 2257f60:	94001fc4 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257f64:	39401662 	ldrb	w2, [x19,#5]
 2257f68:	aa1503e1 	mov	x1, x21
 2257f6c:	f940ae80 	ldr	x0, [x20,#344]
 2257f70:	d3400042 	ubfx	x2, x2, #0, #1
 2257f74:	390263e2 	strb	w2, [sp,#152]
 2257f78:	94001fbe 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257f7c:	39401662 	ldrb	w2, [x19,#5]
 2257f80:	aa1503e1 	mov	x1, x21
 2257f84:	f940b280 	ldr	x0, [x20,#352]
 2257f88:	d3410442 	ubfx	x2, x2, #1, #1
 2257f8c:	390263e2 	strb	w2, [sp,#152]
 2257f90:	94001fb8 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257f94:	39401662 	ldrb	w2, [x19,#5]
 2257f98:	aa1503e1 	mov	x1, x21
 2257f9c:	f940b680 	ldr	x0, [x20,#360]
 2257fa0:	d3420842 	ubfx	x2, x2, #2, #1
 2257fa4:	390263e2 	strb	w2, [sp,#152]
 2257fa8:	94001fb2 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257fac:	39401662 	ldrb	w2, [x19,#5]
 2257fb0:	aa1503e1 	mov	x1, x21
 2257fb4:	f940ba80 	ldr	x0, [x20,#368]
 2257fb8:	d3430c42 	ubfx	x2, x2, #3, #1
 2257fbc:	390263e2 	strb	w2, [sp,#152]
 2257fc0:	94001fac 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257fc4:	39401662 	ldrb	w2, [x19,#5]
 2257fc8:	aa1503e1 	mov	x1, x21
 2257fcc:	f940be80 	ldr	x0, [x20,#376]
 2257fd0:	d3441042 	ubfx	x2, x2, #4, #1
 2257fd4:	390263e2 	strb	w2, [sp,#152]
 2257fd8:	94001fa6 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257fdc:	39401662 	ldrb	w2, [x19,#5]
 2257fe0:	aa1503e1 	mov	x1, x21
 2257fe4:	f940c280 	ldr	x0, [x20,#384]
 2257fe8:	d3451442 	ubfx	x2, x2, #5, #1
 2257fec:	390263e2 	strb	w2, [sp,#152]
 2257ff0:	94001fa0 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2257ff4:	39401662 	ldrb	w2, [x19,#5]
 2257ff8:	aa1503e1 	mov	x1, x21
 2257ffc:	f940c680 	ldr	x0, [x20,#392]
 2258000:	d3461842 	ubfx	x2, x2, #6, #1
 2258004:	390263e2 	strb	w2, [sp,#152]
 2258008:	94001f9a 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 225800c:	39401662 	ldrb	w2, [x19,#5]
 2258010:	aa1503e1 	mov	x1, x21
 2258014:	f940ca80 	ldr	x0, [x20,#400]
 2258018:	d3471c42 	ubfx	x2, x2, #7, #1
 225801c:	390263e2 	strb	w2, [sp,#152]
 2258020:	94001f94 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2258024:	39400662 	ldrb	w2, [x19,#1]
 2258028:	aa1503e1 	mov	x1, x21
 225802c:	f9409e80 	ldr	x0, [x20,#312]
 2258030:	d3461842 	ubfx	x2, x2, #6, #1
 2258034:	390263e2 	strb	w2, [sp,#152]
 2258038:	94001f8e 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 225803c:	39400662 	ldrb	w2, [x19,#1]
 2258040:	aa1503e1 	mov	x1, x21
 2258044:	f940a280 	ldr	x0, [x20,#320]
 2258048:	d3471c42 	ubfx	x2, x2, #7, #1
 225804c:	390263e2 	strb	w2, [sp,#152]
 2258050:	94001f88 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2258054:	39401a62 	ldrb	w2, [x19,#6]
 2258058:	aa1503e1 	mov	x1, x21
 225805c:	f9407e80 	ldr	x0, [x20,#248]
 2258060:	d3471c42 	ubfx	x2, x2, #7, #1
 2258064:	390263e2 	strb	w2, [sp,#152]
 2258068:	94001f82 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 225806c:	39401e62 	ldrb	w2, [x19,#7]
 2258070:	aa1503e1 	mov	x1, x21
 2258074:	f940a680 	ldr	x0, [x20,#328]
 2258078:	d3471c42 	ubfx	x2, x2, #7, #1
 225807c:	390263e2 	strb	w2, [sp,#152]
 2258080:	94001f7c 	bl	225fe70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92caa0>
 2258084:	f940d29c 	ldr	x28, [x20,#416]
 2258088:	39400260 	ldrb	w0, [x19]
 225808c:	f9405f81 	ldr	x1, [x28,#184]
 2258090:	12000400 	and	w0, w0, #0x3
 2258094:	b90097e0 	str	w0, [sp,#148]
 2258098:	b400e3c1 	cbz	x1, 2259d10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926940>
 225809c:	f9400383 	ldr	x3, [x28]
 22580a0:	aa1c03e0 	mov	x0, x28
 22580a4:	910253e2 	add	x2, sp, #0x94
 22580a8:	f9401063 	ldr	x3, [x3,#32]
 22580ac:	d63f0060 	blr	x3
 22580b0:	b940b380 	ldr	w0, [x28,#176]
 22580b4:	7100001f 	cmp	w0, #0x0
 22580b8:	5400632c 	b.gt	2258d1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92594c>
 22580bc:	a94153f3 	ldp	x19, x20, [sp,#16]
 22580c0:	a9425bf5 	ldp	x21, x22, [sp,#32]
 22580c4:	a94363f7 	ldp	x23, x24, [sp,#48]
 22580c8:	a9446bf9 	ldp	x25, x26, [sp,#64]
 22580cc:	a94573fb 	ldp	x27, x28, [sp,#80]
 22580d0:	a8ca7bfd 	ldp	x29, x30, [sp],#160
 22580d4:	d65f03c0 	ret
 22580d8:	91010396 	add	x22, x28, #0x40
 22580dc:	aa1603e0 	mov	x0, x22
 22580e0:	9407cfa8 	bl	244bf80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a1cb0>
 22580e4:	72001c1f 	tst	w0, #0xff
 22580e8:	54ffd840 	b.eq	2257bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924820>
 22580ec:	b9408397 	ldr	w23, [x28,#128]
 22580f0:	b9009b9f 	str	wzr, [x28,#152]
 22580f4:	710002ff 	cmp	w23, #0x0
 22580f8:	540156e0 	b.eq	225abd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927804>
 22580fc:	5400e6ed 	b.le	2259dd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926a08>
 2258100:	937d7ee0 	sbfiz	x0, x23, #3, #32
 2258104:	978735f7 	bl	4258e0 <malloc@plt>
 2258108:	91004003 	add	x3, x0, #0x10
 225810c:	aa0003e2 	mov	x2, x0
 2258110:	f9403b80 	ldr	x0, [x28,#112]
 2258114:	510006e1 	sub	w1, w23, #0x1
 2258118:	eb03001f 	cmp	x0, x3
 225811c:	91004003 	add	x3, x0, #0x10
 2258120:	fa433042 	ccmp	x2, x3, #0x2, cc
 2258124:	7a442820 	ccmp	w1, #0x4, #0x0, cs
 2258128:	540157c9 	b.ls	225ac20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x927850>
 225812c:	53017ee3 	lsr	w3, w23, #1
 2258130:	d2800001 	mov	x1, #0x0                   	// #0
 2258134:	d37cec63 	lsl	x3, x3, #4
 2258138:	3ce16800 	ldr	q0, [x0,x1]
 225813c:	3ca16840 	str	q0, [x2,x1]
 2258140:	91004021 	add	x1, x1, #0x10
 2258144:	eb03003f 	cmp	x1, x3
 2258148:	54ffff81 	b.ne	2258138 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924d68>
 225814c:	121f7ae1 	and	w1, w23, #0xfffffffe
 2258150:	36000077 	tbz	w23, #0, 225815c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924d8c>
 2258154:	f8617800 	ldr	x0, [x0,x1,lsl #3]
 2258158:	f8217840 	str	x0, [x2,x1,lsl #3]
 225815c:	2a1703e1 	mov	w1, w23
 2258160:	f9404780 	ldr	x0, [x28,#136]
 2258164:	b9009381 	str	w1, [x28,#144]
 2258168:	91022381 	add	x1, x28, #0x88
 225816c:	f9004782 	str	x2, [x28,#136]
 2258170:	b9009b97 	str	w23, [x28,#152]
 2258174:	f9003fe1 	str	x1, [sp,#120]
 2258178:	9787349e 	bl	4253f0 <free@plt>
 225817c:	aa1603e0 	mov	x0, x22
 2258180:	9407cf88 	bl	244bfa0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a1cd0>
 2258184:	aa1c03e0 	mov	x0, x28
 2258188:	f84a0c19 	ldr	x25, [x0,#160]!
 225818c:	aa1903fb 	mov	x27, x25
 2258190:	b9801000 	ldrsw	x0, [x0,#16]
 2258194:	8b000320 	add	x0, x25, x0
 2258198:	f9003be0 	str	x0, [sp,#112]
 225819c:	eb00033f 	cmp	x25, x0
 22581a0:	540005a0 	b.eq	2258254 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e84>
 22581a4:	d0076c58 	adrp	x24, 10fe2000 <stdout@@GLIBC_2.17+0xcfea430>
 22581a8:	91358318 	add	x24, x24, #0xd60
 22581ac:	d000247a 	adrp	x26, 26e6000 <_ZN6spdlog6logger7log_it_ERKNS_7details7log_msgEbb@@Base+0x15c18>
 22581b0:	910f9340 	add	x0, x26, #0x3e4
 22581b4:	f90043e0 	str	x0, [sp,#128]
 22581b8:	d0076c41 	adrp	x1, 10fe2000 <stdout@@GLIBC_2.17+0xcfea430>
 22581bc:	9135a037 	add	x23, x1, #0xd68
 22581c0:	f9403fe1 	ldr	x1, [sp,#120]
 22581c4:	f9404780 	ldr	x0, [x28,#136]
 22581c8:	b9801036 	ldrsw	x22, [x1,#16]
 22581cc:	39400361 	ldrb	w1, [x27]
 22581d0:	aa0003fa 	mov	x26, x0
 22581d4:	390263e1 	strb	w1, [sp,#152]
 22581d8:	8b160c16 	add	x22, x0, x22, lsl #3
 22581dc:	eb16001f 	cmp	x0, x22
 22581e0:	54000320 	b.eq	2258244 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e74>
 22581e4:	d503201f 	nop
 22581e8:	f9400359 	ldr	x25, [x26]
 22581ec:	f94043e1 	ldr	x1, [sp,#128]
 22581f0:	91002320 	add	x0, x25, #0x8
 22581f4:	eb01001f 	cmp	x0, x1
 22581f8:	54000203 	b.cc	2258238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e68>
 22581fc:	f240041f 	tst	x0, #0x3
 2258200:	540001c1 	b.ne	2258238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e68>
 2258204:	b9400b28 	ldr	w8, [x25,#8]
 2258208:	08dfff00 	ldarb	w0, [x24]
 225820c:	3600fe20 	tbz	w0, #0, 225a1d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x926e00>
 2258210:	b94002e0 	ldr	w0, [x23]
 2258214:	6b00011f 	cmp	w8, w0
 2258218:	54000101 	b.ne	2258238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e68>
 225821c:	f9400383 	ldr	x3, [x28]
 2258220:	aa1903e1 	mov	x1, x25
 2258224:	aa1503e2 	mov	x2, x21
 2258228:	aa1c03e0 	mov	x0, x28
 225822c:	f9400863 	ldr	x3, [x3,#16]
 2258230:	d63f0060 	blr	x3
 2258234:	d503201f 	nop
 2258238:	9100235a 	add	x26, x26, #0x8
 225823c:	eb1a02df 	cmp	x22, x26
 2258240:	54fffd41 	b.ne	22581e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924e18>
 2258244:	f9403be0 	ldr	x0, [sp,#112]
 2258248:	9100077b 	add	x27, x27, #0x1
 225824c:	eb00037f 	cmp	x27, x0
 2258250:	54fffb41 	b.ne	22581b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924de8>
 2258254:	b900b39f 	str	wzr, [x28,#176]
 2258258:	17fffe66 	b	2257bf0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x924820>
