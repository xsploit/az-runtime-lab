
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1de4d60:      	stp	x29, x30, [sp, #-0x30]!
 1de4d64:      	adrp	x1, 0x2d72000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7af1a8>
 1de4d68:      	add	x1, x1, #0xb48
 1de4d6c:      	mov	x29, sp
 1de4d70:      	stp	x19, x20, [sp, #0x10]
 1de4d74:      	mov	x19, x0
 1de4d78:      	ldr	x0, [x0, #0x148]
 1de4d7c:      	str	x1, [x19]
 1de4d80:      	str	xzr, [x19, #0x148]
 1de4d84:      	cbz	x0, 0x1de4d94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f0c>
 1de4d88:      	ldr	x1, [x0]
 1de4d8c:      	ldr	x1, [x1, #0x8]
 1de4d90:      	blr	x1
 1de4d94:      	ldr	x0, [x19, #0x150]
 1de4d98:      	str	xzr, [x19, #0x150]
 1de4d9c:      	cbz	x0, 0x1de4dac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f24>
 1de4da0:      	ldr	x1, [x0]
 1de4da4:      	ldr	x1, [x1, #0x8]
 1de4da8:      	blr	x1
 1de4dac:      	ldr	x0, [x19, #0x158]
 1de4db0:      	str	xzr, [x19, #0x158]
 1de4db4:      	cbz	x0, 0x1de4dd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f50>
 1de4db8:      	ldr	x1, [x0]
 1de4dbc:      	ldr	x1, [x1, #0x8]
 1de4dc0:      	blr	x1
 1de4dc4:      	ldr	x0, [x19, #0x158]
 1de4dc8:      	cbz	x0, 0x1de4dd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f50>
 1de4dcc:      	ldr	x1, [x0]
 1de4dd0:      	ldr	x1, [x1, #0x8]
 1de4dd4:      	blr	x1
 1de4dd8:      	ldr	x0, [x19, #0x150]
 1de4ddc:      	cbz	x0, 0x1de4dec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f64>
 1de4de0:      	ldr	x1, [x0]
 1de4de4:      	ldr	x1, [x1, #0x8]
 1de4de8:      	blr	x1
 1de4dec:      	ldr	x0, [x19, #0x148]
 1de4df0:      	cbz	x0, 0x1de4e00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f78>
 1de4df4:      	ldr	x1, [x0]
 1de4df8:      	ldr	x1, [x1, #0x8]
 1de4dfc:      	blr	x1
 1de4e00:      	ldr	x20, [x19, #0x140]
 1de4e04:      	cbz	x20, 0x1de4e38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fb0>
 1de4e08:      	adrp	x0, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de4e0c:      	str	x21, [sp, #0x20]
 1de4e10:      	ldr	x21, [x0, #0xb60]
 1de4e14:      	cbz	x21, 0x1de4e48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fc0>
 1de4e18:      	add	x1, x20, #0x8
 1de4e1c:      	ldaxr	w0, [x1]
 1de4e20:      	sub	w2, w0, #0x1
 1de4e24:      	stlxr	w3, w2, [x1]
 1de4e28:      	cbnz	w3, 0x1de4e1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4f94>
 1de4e2c:      	cmp	w0, #0x1
 1de4e30:      	b.eq	0x1de4e5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fd4>
 1de4e34:      	ldr	x21, [sp, #0x20]
 1de4e38:      	mov	x0, x19
 1de4e3c:      	ldp	x19, x20, [sp, #0x10]
 1de4e40:      	ldp	x29, x30, [sp], #0x30
 1de4e44:      	b	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de4e48:      	ldr	w0, [x20, #0x8]
 1de4e4c:      	sub	w1, w0, #0x1
 1de4e50:      	str	w1, [x20, #0x8]
 1de4e54:      	cmp	w0, #0x1
 1de4e58:      	b.ne	0x1de4e34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fac>
 1de4e5c:      	ldr	x1, [x20]
 1de4e60:      	mov	x0, x20
 1de4e64:      	ldr	x1, [x1, #0x10]
 1de4e68:      	blr	x1
 1de4e6c:      	cbz	x21, 0x1de4ea4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e501c>
 1de4e70:      	add	x1, x20, #0xc
 1de4e74:      	ldaxr	w0, [x1]
 1de4e78:      	sub	w2, w0, #0x1
 1de4e7c:      	stlxr	w3, w2, [x1]
 1de4e80:      	cbnz	w3, 0x1de4e74 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fec>
 1de4e84:      	cmp	w0, #0x1
 1de4e88:      	b.ne	0x1de4e34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fac>
 1de4e8c:      	ldr	x1, [x20]
 1de4e90:      	mov	x0, x20
 1de4e94:      	ldr	x1, [x1, #0x18]
 1de4e98:      	blr	x1
 1de4e9c:      	ldr	x21, [sp, #0x20]
 1de4ea0:      	b	0x1de4e38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4fb0>
 1de4ea4:      	ldr	w0, [x20, #0xc]
 1de4ea8:      	sub	w1, w0, #0x1
 1de4eac:      	str	w1, [x20, #0xc]
 1de4eb0:      	b	0x1de4e84 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4ffc>
 1de4eb4:      	nop
 1de4eb8:      	stp	x29, x30, [sp, #-0x20]!
 1de4ebc:      	mov	x29, sp
 1de4ec0:      	str	x19, [sp, #0x10]
 1de4ec4:      	mov	x19, x0
 1de4ec8:      	bl	0x1de4d60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e4ed8>
 1de4ecc:      	mov	x0, x19
 1de4ed0:      	mov	x1, #0x160              // =352
 1de4ed4:      	ldr	x19, [sp, #0x10]
 1de4ed8:      	ldp	x29, x30, [sp], #0x20
 1de4edc:      	b	0x426660 <_ZdlPvm@plt>
 1de4ee0:      	stp	x29, x30, [sp, #-0x20]!
 1de4ee4:      	mov	x29, sp
 1de4ee8:      	ldr	x1, [x0, #0x158]
 1de4eec:      	ldr	w2, [x0, #0x12c]
 1de4ef0:      	ldr	x3, [x1]
 1de4ef4:      	ldr	x3, [x3, #0x60]
 1de4ef8:      	str	x19, [sp, #0x10]
 1de4efc:      	mov	x19, x0
 1de4f00:      	ldr	x0, [x0, #0x138]
 1de4f04:      	ldrb	w0, [x0, #0x5e]
 1de4f08:      	cmp	w2, w0
 1de4f0c:      	b.gt	0x1de4f1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5094>
 1de4f10:      	ldr	w2, [x19, #0x128]
 1de4f14:      	cmp	w0, w2
 1de4f18:      	b.le	0x1de4f48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e50c0>
 1de4f1c:      	mov	x0, x1
 1de4f20:      	mov	w1, #0x0                // =0
 1de4f24:      	blr	x3
 1de4f28:      	ldr	x2, [x19, #0x148]
 1de4f2c:      	mov	w1, #0x0                // =0
 1de4f30:      	ldr	x19, [sp, #0x10]
 1de4f34:      	mov	x0, x2
 1de4f38:      	ldr	x2, [x2]
 1de4f3c:      	ldp	x29, x30, [sp], #0x20
 1de4f40:      	ldr	x2, [x2, #0x60]
 1de4f44:      	br	x2
 1de4f48:      	scvtf	s1, w2
 1de4f4c:      	scvtf	s0, w0
 1de4f50:      	ldr	x2, [x19, #0x150]
 1de4f54:      	mov	x0, x1
 1de4f58:      	ldr	w4, [x1, #0x28]
 1de4f5c:      	mov	w1, #0x1                // =1
 1de4f60:      	fdiv	s0, s0, s1
 1de4f64:      	ldr	w2, [x2, #0x28]
 1de4f68:      	str	d8, [sp, #0x18]
 1de4f6c:      	sub	w2, w2, w4
 1de4f70:      	scvtf	s8, w2
 1de4f74:      	fmul	s0, s8, s0
 1de4f78:      	fcvtzs	s8, s0
 1de4f7c:      	blr	x3
 1de4f80:      	ldr	x1, [x19, #0x158]
 1de4f84:      	mov	x0, x1
 1de4f88:      	ldr	w2, [x1, #0x24]
 1de4f8c:      	fmov	w1, s8
 1de4f90:      	bl	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1de4f94:      	ldr	x2, [x19, #0x148]
 1de4f98:      	mov	w1, #0x0                // =0
 1de4f9c:      	ldr	x19, [sp, #0x10]
 1de4fa0:      	mov	x0, x2
 1de4fa4:      	ldr	x2, [x2]
 1de4fa8:      	ldr	d8, [sp, #0x18]
 1de4fac:      	ldp	x29, x30, [sp], #0x20
 1de4fb0:      	ldr	x2, [x2, #0x60]
 1de4fb4:      	br	x2
 1de4fb8:      	stp	x29, x30, [sp, #-0x20]!
 1de4fbc:      	mov	x29, sp
 1de4fc0:      	ldr	w1, [x0, #0x134]
 1de4fc4:      	stp	x19, x20, [sp, #0x10]
 1de4fc8:      	mov	x19, x0
 1de4fcc:      	ldr	x0, [x0, #0x138]
 1de4fd0:      	ldrb	w0, [x0, #0x5f]
 1de4fd4:      	cmp	w1, w0
 1de4fd8:      	b.gt	0x1de5010 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5188>
 1de4fdc:      	ldr	w1, [x19, #0x130]
 1de4fe0:      	cmp	w0, w1
 1de4fe4:      	b.gt	0x1de5010 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5188>
 1de4fe8:      	cmp	w0, #0x3
 1de4fec:      	b.eq	0x1de50d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e524c>
 1de4ff0:      	b.ls	0x1de5048 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51c0>
 1de4ff4:      	cmp	w0, #0x5
 1de4ff8:      	b.eq	0x1de50cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5244>
 1de4ffc:      	b.lo	0x1de50b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5228>
 1de5000:      	cmp	w0, #0x6
 1de5004:      	b.ne	0x1de50b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5230>
 1de5008:      	ldr	w20, [x19, #0x118]
 1de500c:      	b	0x1de505c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51d4>
 1de5010:      	ldr	x2, [x19, #0x148]
 1de5014:      	mov	w1, #0x0                // =0
 1de5018:      	mov	x0, x2
 1de501c:      	ldr	x2, [x2]
 1de5020:      	ldr	x2, [x2, #0x60]
 1de5024:      	blr	x2
 1de5028:      	ldr	x2, [x19, #0x158]
 1de502c:      	mov	w1, #0x0                // =0
 1de5030:      	ldp	x19, x20, [sp, #0x10]
 1de5034:      	mov	x0, x2
 1de5038:      	ldr	x2, [x2]
 1de503c:      	ldp	x29, x30, [sp], #0x20
 1de5040:      	ldr	x2, [x2, #0x60]
 1de5044:      	br	x2
 1de5048:      	cmp	w0, #0x1
 1de504c:      	b.eq	0x1de50a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5220>
 1de5050:      	cmp	w0, #0x2
 1de5054:      	b.ne	0x1de50b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5230>
 1de5058:      	ldr	w20, [x19, #0xd8]
 1de505c:      	ldr	x2, [x19, #0x148]
 1de5060:      	mov	w1, #0x1                // =1
 1de5064:      	mov	x0, x2
 1de5068:      	ldr	x2, [x2]
 1de506c:      	ldr	x2, [x2, #0x60]
 1de5070:      	blr	x2
 1de5074:      	ldr	x2, [x19, #0x148]
 1de5078:      	mov	w1, w20
 1de507c:      	mov	x0, x2
 1de5080:      	ldr	w2, [x2, #0x24]
 1de5084:      	bl	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1de5088:      	ldr	x2, [x19, #0x158]
 1de508c:      	mov	w1, #0x0                // =0
 1de5090:      	ldp	x19, x20, [sp, #0x10]
 1de5094:      	mov	x0, x2
 1de5098:      	ldr	x2, [x2]
 1de509c:      	ldp	x29, x30, [sp], #0x20
 1de50a0:      	ldr	x2, [x2, #0x60]
 1de50a4:      	br	x2
 1de50a8:      	ldr	w20, [x19, #0xc8]
 1de50ac:      	b	0x1de505c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51d4>
 1de50b0:      	ldr	w20, [x19, #0xf8]
 1de50b4:      	b	0x1de505c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51d4>
 1de50b8:      	mov	w20, #0x0               // =0
 1de50bc:      	mov	x1, #0x0                // =0
 1de50c0:      	mov	w0, #0x0                // =0
 1de50c4:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de50c8:      	b	0x1de505c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51d4>
 1de50cc:      	ldr	w20, [x19, #0x108]
 1de50d0:      	b	0x1de505c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51d4>
 1de50d4:      	ldr	w20, [x19, #0xe8]
 1de50d8:      	b	0x1de505c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e51d4>
 1de50dc:      	nop
 1de50e0:      	ldr	x1, [x0, #0x138]
 1de50e4:      	ldrb	w1, [x1, #0x51]
 1de50e8:      	cmp	w1, #0x9
 1de50ec:      	b.ls	0x1de510c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5284>
 1de50f0:      	cmp	w1, #0xc
 1de50f4:      	b.ls	0x1de5114 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e528c>
 1de50f8:      	cmp	w1, #0xd
 1de50fc:      	b.eq	0x1de5118 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5290>
 1de5100:      	mov	x1, #0x0                // =0
 1de5104:      	mov	w0, #0x0                // =0
 1de5108:      	b	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de510c:      	cmp	w1, #0x3
 1de5110:      	b.hs	0x1de5118 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5290>
 1de5114:      	b	0x1de4fb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5130>
 1de5118:      	b	0x1de4ee0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5058>
 1de511c:      	nop
 1de5120:      	stp	x29, x30, [sp, #-0x20]!
 1de5124:      	mov	x29, sp
 1de5128:      	stp	x19, x20, [sp, #0x10]
 1de512c:      	mov	x19, x0
 1de5130:      	ldr	x0, [x0, #0x138]
 1de5134:      	ldrb	w0, [x0, #0x51]
 1de5138:      	cmp	w0, #0xd
 1de513c:      	b.hi	0x1de51dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5354>
 1de5140:      	ldr	x4, [x19, #0x150]
 1de5144:      	and	x2, x0, #0xff
 1de5148:      	adrp	x3, 0x2d72000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7af1a8>
 1de514c:      	add	x3, x3, #0xcb0
 1de5150:      	mov	x0, x4
 1de5154:      	mov	w1, #0x1                // =1
 1de5158:      	ldr	x4, [x4]
 1de515c:      	ldr	w20, [x3, x2, lsl #2]
 1de5160:      	ldr	x2, [x4, #0x60]
 1de5164:      	blr	x2
 1de5168:      	ldr	x0, [x19, #0x150]
 1de516c:      	ldr	w1, [x0, #0xc8]
 1de5170:      	cmp	w20, w1
 1de5174:      	b.eq	0x1de5180 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e52f8>
 1de5178:      	str	w20, [x0, #0xc8]
 1de517c:      	bl	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1de5180:      	ldr	x0, [x19, #0x138]
 1de5184:      	ldrb	w0, [x0, #0x51]
 1de5188:      	cmp	w0, #0x9
 1de518c:      	b.ls	0x1de51b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e532c>
 1de5190:      	cmp	w0, #0xc
 1de5194:      	b.ls	0x1de51bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5334>
 1de5198:      	cmp	w0, #0xd
 1de519c:      	b.eq	0x1de51cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5344>
 1de51a0:      	ldp	x19, x20, [sp, #0x10]
 1de51a4:      	mov	x1, #0x0                // =0
 1de51a8:      	ldp	x29, x30, [sp], #0x20
 1de51ac:      	mov	w0, #0x0                // =0
 1de51b0:      	b	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de51b4:      	cmp	w0, #0x3
 1de51b8:      	b.hs	0x1de51cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5344>
 1de51bc:      	mov	x0, x19
 1de51c0:      	ldp	x19, x20, [sp, #0x10]
 1de51c4:      	ldp	x29, x30, [sp], #0x20
 1de51c8:      	b	0x1de4fb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5130>
 1de51cc:      	mov	x0, x19
 1de51d0:      	ldp	x19, x20, [sp, #0x10]
 1de51d4:      	ldp	x29, x30, [sp], #0x20
 1de51d8:      	b	0x1de4ee0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5058>
 1de51dc:      	mov	x1, #0x0                // =0
 1de51e0:      	mov	w0, #0x0                // =0
 1de51e4:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de51e8:      	b	0x1de5180 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e52f8>
 1de51ec:      	nop
 1de51f0:      	stp	x29, x30, [sp, #-0x20]!
 1de51f4:      	mov	x29, sp
 1de51f8:      	stp	x19, x20, [sp, #0x10]
 1de51fc:      	mov	x19, x0
 1de5200:      	ldr	x0, [x0, #0x138]
 1de5204:      	ldrb	w0, [x0, #0x51]
 1de5208:      	cmp	w0, #0xd
 1de520c:      	b.hi	0x1de52ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5424>
 1de5210:      	ldr	x4, [x19, #0x150]
 1de5214:      	and	x2, x0, #0xff
 1de5218:      	adrp	x3, 0x2d72000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7af1a8>
 1de521c:      	add	x3, x3, #0xcb0
 1de5220:      	mov	x0, x4
 1de5224:      	mov	w1, #0x1                // =1
 1de5228:      	ldr	x4, [x4]
 1de522c:      	ldr	w20, [x3, x2, lsl #2]
 1de5230:      	ldr	x2, [x4, #0x60]
 1de5234:      	blr	x2
 1de5238:      	ldr	x0, [x19, #0x150]
 1de523c:      	ldr	w1, [x0, #0xc8]
 1de5240:      	cmp	w20, w1
 1de5244:      	b.eq	0x1de5250 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e53c8>
 1de5248:      	str	w20, [x0, #0xc8]
 1de524c:      	bl	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1de5250:      	ldr	x0, [x19, #0x138]
 1de5254:      	ldrb	w0, [x0, #0x51]
 1de5258:      	cmp	w0, #0x9
 1de525c:      	b.ls	0x1de5284 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e53fc>
 1de5260:      	cmp	w0, #0xc
 1de5264:      	b.ls	0x1de528c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5404>
 1de5268:      	cmp	w0, #0xd
 1de526c:      	b.eq	0x1de529c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5414>
 1de5270:      	ldp	x19, x20, [sp, #0x10]
 1de5274:      	mov	x1, #0x0                // =0
 1de5278:      	ldp	x29, x30, [sp], #0x20
 1de527c:      	mov	w0, #0x0                // =0
 1de5280:      	b	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de5284:      	cmp	w0, #0x3
 1de5288:      	b.hs	0x1de529c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5414>
 1de528c:      	mov	x0, x19
 1de5290:      	ldp	x19, x20, [sp, #0x10]
 1de5294:      	ldp	x29, x30, [sp], #0x20
 1de5298:      	b	0x1de4fb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5130>
 1de529c:      	mov	x0, x19
 1de52a0:      	ldp	x19, x20, [sp, #0x10]
 1de52a4:      	ldp	x29, x30, [sp], #0x20
 1de52a8:      	b	0x1de4ee0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5058>
 1de52ac:      	mov	x1, #0x0                // =0
 1de52b0:      	mov	w0, #0x0                // =0
 1de52b4:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de52b8:      	b	0x1de5250 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e53c8>
 1de52bc:      	nop
 1de52c0:      	stp	x29, x30, [sp, #-0xd0]!
 1de52c4:      	mov	x29, sp
 1de52c8:      	stp	x19, x20, [sp, #0x10]
 1de52cc:      	mov	x20, x1
 1de52d0:      	mov	x19, x0
 1de52d4:      	stp	x21, x22, [sp, #0x20]
 1de52d8:      	stp	x23, x24, [sp, #0x30]
 1de52dc:      	stp	x25, x26, [sp, #0x40]
 1de52e0:      	stp	x27, x28, [sp, #0x50]
 1de52e4:      	bl	0x243cff0 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7bd0>
 1de52e8:      	mov	x4, #0x7f               // =127
 1de52ec:      	ldp	x1, x0, [x20]
 1de52f0:      	mov	x3, #0x6                // =6
 1de52f4:      	adrp	x2, 0x2d72000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7af1a8>
 1de52f8:      	movk	x4, #0x1, lsl #32
 1de52fc:      	add	x2, x2, #0xb48
 1de5300:      	movk	x3, #0x1, lsl #32
 1de5304:      	str	x2, [x19]
 1de5308:      	stp	xzr, xzr, [x19, #0xc8]
 1de530c:      	stp	xzr, xzr, [x19, #0xd8]
 1de5310:      	stp	xzr, xzr, [x19, #0xe8]
 1de5314:      	stp	xzr, xzr, [x19, #0xf8]
 1de5318:      	stp	xzr, xzr, [x19, #0x108]
 1de531c:      	stp	xzr, xzr, [x19, #0x118]
 1de5320:      	stp	x4, x3, [x19, #0x128]
 1de5324:      	stp	x1, x0, [x19, #0x138]
 1de5328:      	cbz	x0, 0x1de534c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e54c4>
 1de532c:      	adrp	x1, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5330:      	ldr	x1, [x1, #0xb60]
 1de5334:      	cbz	x1, 0x1de5988 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b00>
 1de5338:      	add	x0, x0, #0x8
 1de533c:      	ldaxr	w1, [x0]
 1de5340:      	add	w1, w1, #0x1
 1de5344:      	stlxr	w2, w1, [x0]
 1de5348:      	cbnz	w2, 0x1de533c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e54b4>
 1de534c:      	stp	xzr, xzr, [x19, #0x148]
 1de5350:      	adrp	x22, 0x29ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x42b1a8>
 1de5354:      	add	x22, x22, #0xf10
 1de5358:      	str	xzr, [x19, #0x158]
 1de535c:      	mov	x1, x22
 1de5360:      	add	x0, sp, #0x78
 1de5364:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1de5368:      	mov	x0, #0xf0               // =240
 1de536c:      	str	xzr, [sp, #0x90]
 1de5370:      	str	wzr, [sp, #0x98]
 1de5374:      	str	wzr, [sp, #0xa0]
 1de5378:      	bl	0x424d40 <_Znwm@plt>
 1de537c:      	mov	x21, x0
 1de5380:      	add	x25, x0, #0xd0
 1de5384:      	add	x1, sp, #0x78
 1de5388:      	adrp	x23, 0x29e9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4261a8>
 1de538c:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1de5390:      	add	x23, x23, #0x540
 1de5394:      	ldr	w24, [sp, #0xa0]
 1de5398:      	str	x23, [x21]
 1de539c:      	str	wzr, [x21, #0xc8]
 1de53a0:      	cmp	w24, #0x0
 1de53a4:      	str	xzr, [x21, #0xd0]
 1de53a8:      	str	wzr, [x25, #0x8]
 1de53ac:      	str	w24, [x25, #0x10]
 1de53b0:      	b.eq	0x1de53f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5570>
 1de53b4:      	b.le	0x1de5998 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b10>
 1de53b8:      	sbfiz	x0, x24, #3, #32
 1de53bc:      	bl	0x424fd0 <malloc@plt>
 1de53c0:      	str	x0, [x21, #0xd0]
 1de53c4:      	mov	x20, #0x0               // =0
 1de53c8:      	str	w24, [x25, #0x8]
 1de53cc:      	b	0x1de53d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e554c>
 1de53d0:      	ldr	x0, [x21, #0xd0]
 1de53d4:      	lsl	x1, x20, #3
 1de53d8:      	ldr	x2, [sp, #0x90]
 1de53dc:      	add	x0, x0, x1
 1de53e0:      	add	x20, x20, #0x1
 1de53e4:      	add	x1, x2, x1
 1de53e8:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de53ec:      	ldr	w0, [x25, #0x10]
 1de53f0:      	cmp	w0, w20
 1de53f4:      	b.gt	0x1de53d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5548>
 1de53f8:      	add	x20, x21, #0xe8
 1de53fc:      	adrp	x24, 0x3bd7000 <stdout+0x95f40>
 1de5400:      	mov	x0, x20
 1de5404:      	add	x24, x24, #0x9b0
 1de5408:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1de540c:      	mov	x1, x24
 1de5410:      	add	x0, sp, #0x70
 1de5414:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de5418:      	mov	w1, #0x100              // =256
 1de541c:      	add	x2, sp, #0x70
 1de5420:      	mov	x0, x21
 1de5424:      	movk	w1, #0x7000, lsl #16
 1de5428:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de542c:      	add	x0, sp, #0x70
 1de5430:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5434:      	ldr	x0, [x19, #0x148]
 1de5438:      	str	x21, [x19, #0x148]
 1de543c:      	cbz	x0, 0x1de544c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e55c4>
 1de5440:      	ldr	x1, [x0]
 1de5444:      	ldr	x1, [x1, #0x8]
 1de5448:      	blr	x1
 1de544c:      	ldr	w0, [sp, #0xa0]
 1de5450:      	mov	x20, #0x0               // =0
 1de5454:      	cmp	w0, #0x0
 1de5458:      	b.le	0x1de547c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e55f4>
 1de545c:      	nop
 1de5460:      	ldr	x0, [sp, #0x90]
 1de5464:      	add	x0, x0, x20, lsl #3
 1de5468:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de546c:      	ldr	w0, [sp, #0xa0]
 1de5470:      	add	x20, x20, #0x1
 1de5474:      	cmp	w0, w20
 1de5478:      	b.gt	0x1de5460 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e55d8>
 1de547c:      	ldr	x0, [sp, #0x90]
 1de5480:      	bl	0x424af0 <free@plt>
 1de5484:      	add	x0, sp, #0x78
 1de5488:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de548c:      	ldr	x1, [x19, #0x148]
 1de5490:      	mov	w2, #-0x1               // =-1
 1de5494:      	mov	x0, x19
 1de5498:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1de549c:      	add	x21, sp, #0x90
 1de54a0:      	mov	w1, #0x77ffffff         // =2013265919
 1de54a4:      	ldr	x20, [x19, #0x148]
 1de54a8:      	mov	x0, x21
 1de54ac:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1de54b0:      	mov	w1, #0x100              // =256
 1de54b4:      	mov	x2, x21
 1de54b8:      	mov	x0, x20
 1de54bc:      	movk	w1, #0x7000, lsl #16
 1de54c0:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de54c4:      	mov	x0, x21
 1de54c8:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de54cc:      	ldr	x0, [x19, #0x148]
 1de54d0:      	mov	w4, #0x1f               // =31
 1de54d4:      	mov	w3, #0x1c               // =28
 1de54d8:      	mov	w2, #0x8                // =8
 1de54dc:      	mov	w1, #0x3c               // =60
 1de54e0:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1de54e4:      	mov	x1, x22
 1de54e8:      	add	x0, sp, #0x70
 1de54ec:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1de54f0:      	adrp	x25, 0x3b35000
 1de54f4:      	mov	x8, x21
 1de54f8:      	mov	w1, #0x452              // =1106
 1de54fc:      	ldr	x0, [x25, #0xa90]
 1de5500:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5504:      	add	x25, x25, #0xa90
 1de5508:      	add	x8, sp, #0x98
 1de550c:      	mov	w1, #0x476              // =1142
 1de5510:      	ldr	x0, [x25, #0x8]
 1de5514:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5518:      	ldr	x0, [x25, #0x10]
 1de551c:      	add	x8, sp, #0xa0
 1de5520:      	mov	w1, #0x476              // =1142
 1de5524:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5528:      	ldr	x0, [x25, #0x18]
 1de552c:      	add	x8, sp, #0xa8
 1de5530:      	mov	w1, #0x559              // =1369
 1de5534:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5538:      	ldr	x0, [x25, #0x20]
 1de553c:      	add	x8, sp, #0xb0
 1de5540:      	mov	w1, #0x56a              // =1386
 1de5544:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5548:      	ldr	x0, [x25, #0x28]
 1de554c:      	add	x8, sp, #0xb8
 1de5550:      	mov	w1, #0xd3               // =211
 1de5554:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5558:      	ldr	x0, [x25, #0x30]
 1de555c:      	add	x8, sp, #0xc0
 1de5560:      	mov	w1, #0xd3               // =211
 1de5564:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5568:      	ldr	x0, [x25, #0x38]
 1de556c:      	add	x8, sp, #0xc8
 1de5570:      	mov	w1, #0x39d              // =925
 1de5574:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5578:      	mov	x0, #0x80               // =128
 1de557c:      	str	wzr, [sp, #0x88]
 1de5580:      	bl	0x424fd0 <malloc@plt>
 1de5584:      	add	x26, sp, #0xd0
 1de5588:      	mov	w2, #0x10               // =16
 1de558c:      	mov	x20, x21
 1de5590:      	mov	w1, #0x0                // =0
 1de5594:      	str	x0, [sp, #0x78]
 1de5598:      	str	w2, [sp, #0x80]
 1de559c:      	b	0x1de55a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e571c>
 1de55a0:      	ldr	x0, [sp, #0x78]
 1de55a4:      	add	x0, x0, w1, sxtw #3
 1de55a8:      	mov	x1, x20
 1de55ac:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de55b0:      	ldr	w1, [sp, #0x88]
 1de55b4:      	add	x20, x20, #0x8
 1de55b8:      	cmp	x26, x20
 1de55bc:      	add	w1, w1, #0x1
 1de55c0:      	str	w1, [sp, #0x88]
 1de55c4:      	b.ne	0x1de55a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5718>
 1de55c8:      	mov	x0, #0xf0               // =240
 1de55cc:      	bl	0x424d40 <_Znwm@plt>
 1de55d0:      	mov	x26, x0
 1de55d4:      	add	x27, x0, #0xd0
 1de55d8:      	add	x1, sp, #0x70
 1de55dc:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1de55e0:      	ldr	w28, [sp, #0x88]
 1de55e4:      	str	x23, [x26]
 1de55e8:      	str	wzr, [x26, #0xc8]
 1de55ec:      	cmp	w28, #0x0
 1de55f0:      	str	xzr, [x26, #0xd0]
 1de55f4:      	str	wzr, [x27, #0x8]
 1de55f8:      	str	w28, [x27, #0x10]
 1de55fc:      	b.eq	0x1de5644 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e57bc>
 1de5600:      	b.le	0x1de59a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b18>
 1de5604:      	sbfiz	x0, x28, #3, #32
 1de5608:      	bl	0x424fd0 <malloc@plt>
 1de560c:      	str	x0, [x26, #0xd0]
 1de5610:      	mov	x20, #0x0               // =0
 1de5614:      	str	w28, [x27, #0x8]
 1de5618:      	b	0x1de5620 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5798>
 1de561c:      	ldr	x0, [x26, #0xd0]
 1de5620:      	lsl	x1, x20, #3
 1de5624:      	ldr	x2, [sp, #0x78]
 1de5628:      	add	x0, x0, x1
 1de562c:      	add	x20, x20, #0x1
 1de5630:      	add	x1, x2, x1
 1de5634:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de5638:      	ldr	w0, [x27, #0x10]
 1de563c:      	cmp	w0, w20
 1de5640:      	b.gt	0x1de561c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5794>
 1de5644:      	add	x20, x26, #0xe8
 1de5648:      	mov	x0, x20
 1de564c:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1de5650:      	add	x0, sp, #0x68
 1de5654:      	mov	x1, x24
 1de5658:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de565c:      	mov	w1, #0x100              // =256
 1de5660:      	add	x2, sp, #0x68
 1de5664:      	mov	x0, x26
 1de5668:      	movk	w1, #0x7000, lsl #16
 1de566c:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de5670:      	add	x0, sp, #0x68
 1de5674:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5678:      	ldr	x0, [x19, #0x150]
 1de567c:      	str	x26, [x19, #0x150]
 1de5680:      	cbz	x0, 0x1de5690 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5808>
 1de5684:      	ldr	x1, [x0]
 1de5688:      	ldr	x1, [x1, #0x8]
 1de568c:      	blr	x1
 1de5690:      	ldr	w0, [sp, #0x88]
 1de5694:      	mov	x20, #0x0               // =0
 1de5698:      	cmp	w0, #0x0
 1de569c:      	b.le	0x1de56bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5834>
 1de56a0:      	ldr	x0, [sp, #0x78]
 1de56a4:      	add	x0, x0, x20, lsl #3
 1de56a8:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de56ac:      	ldr	w0, [sp, #0x88]
 1de56b0:      	add	x20, x20, #0x1
 1de56b4:      	cmp	w0, w20
 1de56b8:      	b.gt	0x1de56a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5818>
 1de56bc:      	ldr	x0, [sp, #0x78]
 1de56c0:      	add	x20, x21, #0x38
 1de56c4:      	bl	0x424af0 <free@plt>
 1de56c8:      	mov	x0, x20
 1de56cc:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de56d0:      	cmp	x20, x21
 1de56d4:      	sub	x20, x20, #0x8
 1de56d8:      	b.ne	0x1de56c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5840>
 1de56dc:      	add	x0, sp, #0x70
 1de56e0:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de56e4:      	ldr	x1, [x19, #0x150]
 1de56e8:      	mov	w2, #-0x1               // =-1
 1de56ec:      	mov	x0, x19
 1de56f0:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1de56f4:      	ldr	x20, [x19, #0x150]
 1de56f8:      	mov	w1, #0x0                // =0
 1de56fc:      	mov	x0, x21
 1de5700:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1de5704:      	mov	w1, #0x100              // =256
 1de5708:      	mov	x2, x21
 1de570c:      	mov	x0, x20
 1de5710:      	movk	w1, #0x7000, lsl #16
 1de5714:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de5718:      	mov	x0, x21
 1de571c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5720:      	ldr	x0, [x19, #0x150]
 1de5724:      	mov	w4, #0x31               // =49
 1de5728:      	mov	w3, #0xb0               // =176
 1de572c:      	mov	w2, #0x0                // =0
 1de5730:      	mov	w1, #0x0                // =0
 1de5734:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1de5738:      	mov	x1, x22
 1de573c:      	add	x0, sp, #0x70
 1de5740:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1de5744:      	ldr	x0, [x25, #0x40]
 1de5748:      	add	x8, sp, #0x78
 1de574c:      	mov	w1, #0x63               // =99
 1de5750:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5754:      	mov	x0, #0x40               // =64
 1de5758:      	str	wzr, [sp, #0xa0]
 1de575c:      	bl	0x424fd0 <malloc@plt>
 1de5760:      	str	x0, [sp, #0x90]
 1de5764:      	mov	w2, #0x8                // =8
 1de5768:      	add	x1, sp, #0x78
 1de576c:      	str	w2, [sp, #0x98]
 1de5770:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de5774:      	ldr	w1, [sp, #0xa0]
 1de5778:      	mov	x0, #0xf0               // =240
 1de577c:      	add	w1, w1, #0x1
 1de5780:      	str	w1, [sp, #0xa0]
 1de5784:      	bl	0x424d40 <_Znwm@plt>
 1de5788:      	mov	x22, x0
 1de578c:      	add	x25, x0, #0xd0
 1de5790:      	add	x1, sp, #0x70
 1de5794:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1de5798:      	ldr	w26, [sp, #0xa0]
 1de579c:      	str	x23, [x22]
 1de57a0:      	str	wzr, [x22, #0xc8]
 1de57a4:      	cmp	w26, #0x0
 1de57a8:      	str	xzr, [x22, #0xd0]
 1de57ac:      	str	wzr, [x25, #0x8]
 1de57b0:      	str	w26, [x25, #0x10]
 1de57b4:      	b.eq	0x1de57fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5974>
 1de57b8:      	b.le	0x1de59a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b20>
 1de57bc:      	sbfiz	x0, x26, #3, #32
 1de57c0:      	bl	0x424fd0 <malloc@plt>
 1de57c4:      	str	x0, [x22, #0xd0]
 1de57c8:      	mov	x20, #0x0               // =0
 1de57cc:      	str	w26, [x25, #0x8]
 1de57d0:      	b	0x1de57d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5950>
 1de57d4:      	ldr	x0, [x22, #0xd0]
 1de57d8:      	lsl	x1, x20, #3
 1de57dc:      	ldr	x2, [sp, #0x90]
 1de57e0:      	add	x0, x0, x1
 1de57e4:      	add	x20, x20, #0x1
 1de57e8:      	add	x1, x2, x1
 1de57ec:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de57f0:      	ldr	w0, [x25, #0x10]
 1de57f4:      	cmp	w0, w20
 1de57f8:      	b.gt	0x1de57d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e594c>
 1de57fc:      	add	x20, x22, #0xe8
 1de5800:      	mov	x0, x20
 1de5804:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1de5808:      	mov	x1, x24
 1de580c:      	add	x0, sp, #0x68
 1de5810:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de5814:      	mov	w1, #0x100              // =256
 1de5818:      	add	x2, sp, #0x68
 1de581c:      	mov	x0, x22
 1de5820:      	movk	w1, #0x7000, lsl #16
 1de5824:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de5828:      	add	x0, sp, #0x68
 1de582c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5830:      	ldr	x0, [x19, #0x158]
 1de5834:      	str	x22, [x19, #0x158]
 1de5838:      	cbz	x0, 0x1de5848 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e59c0>
 1de583c:      	ldr	x1, [x0]
 1de5840:      	ldr	x1, [x1, #0x8]
 1de5844:      	blr	x1
 1de5848:      	ldr	w0, [sp, #0xa0]
 1de584c:      	mov	x20, #0x0               // =0
 1de5850:      	cmp	w0, #0x0
 1de5854:      	b.le	0x1de5874 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e59ec>
 1de5858:      	ldr	x0, [sp, #0x90]
 1de585c:      	add	x0, x0, x20, lsl #3
 1de5860:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5864:      	ldr	w0, [sp, #0xa0]
 1de5868:      	add	x20, x20, #0x1
 1de586c:      	cmp	w0, w20
 1de5870:      	b.gt	0x1de5858 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e59d0>
 1de5874:      	ldr	x0, [sp, #0x90]
 1de5878:      	bl	0x424af0 <free@plt>
 1de587c:      	add	x0, sp, #0x78
 1de5880:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5884:      	add	x0, sp, #0x70
 1de5888:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de588c:      	ldr	x1, [x19, #0x158]
 1de5890:      	mov	w2, #-0x1               // =-1
 1de5894:      	mov	x0, x19
 1de5898:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1de589c:      	ldr	x20, [x19, #0x158]
 1de58a0:      	mov	w1, #0x0                // =0
 1de58a4:      	mov	x0, x21
 1de58a8:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1de58ac:      	mov	w1, #0x100              // =256
 1de58b0:      	mov	x2, x21
 1de58b4:      	mov	x0, x20
 1de58b8:      	movk	w1, #0x7000, lsl #16
 1de58bc:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de58c0:      	mov	x0, x21
 1de58c4:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de58c8:      	ldr	x0, [x19, #0x158]
 1de58cc:      	mov	w4, #0x29               // =41
 1de58d0:      	mov	w3, #0x6                // =6
 1de58d4:      	mov	w2, #0x4                // =4
 1de58d8:      	mov	w1, #0x6f               // =111
 1de58dc:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1de58e0:      	adrp	x0, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de58e4:      	adrp	x4, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de58e8:      	add	x3, x19, #0x200
 1de58ec:      	mov	w2, #0x31               // =49
 1de58f0:      	ldr	q2, [x0, #0xb00]
 1de58f4:      	adrp	x0, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de58f8:      	mov	w1, #0xb0               // =176
 1de58fc:      	ldr	q1, [x0, #0xb10]
 1de5900:      	adrp	x0, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5904:      	stur	q2, [x19, #0xc8]
 1de5908:      	ldr	q0, [x0, #0xb20]
 1de590c:      	adrp	x0, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5910:      	stur	q1, [x19, #0xd8]
 1de5914:      	ldr	q1, [x4, #0xb40]
 1de5918:      	adrp	x4, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de591c:      	ldr	q2, [x0, #0xb30]
 1de5920:      	stur	q0, [x19, #0xe8]
 1de5924:      	mov	x0, x19
 1de5928:      	ldr	q0, [x4, #0xb50]
 1de592c:      	stur	q2, [x19, #0xf8]
 1de5930:      	stur	q1, [x3, #-0xf8]
 1de5934:      	stur	q0, [x3, #-0xe8]
 1de5938:      	bl	0x249f200 <_ZNSt8functionIFvvEEC2ERKS1_+0x129de0>
 1de593c:      	mov	w1, #0x0                // =0
 1de5940:      	ldr	x2, [x19, #0x158]
 1de5944:      	mov	x0, x2
 1de5948:      	ldr	x2, [x2]
 1de594c:      	ldr	x2, [x2, #0x60]
 1de5950:      	blr	x2
 1de5954:      	ldr	x2, [x19, #0x148]
 1de5958:      	mov	w1, #0x0                // =0
 1de595c:      	mov	x0, x2
 1de5960:      	ldr	x2, [x2]
 1de5964:      	ldr	x2, [x2, #0x60]
 1de5968:      	blr	x2
 1de596c:      	ldp	x19, x20, [sp, #0x10]
 1de5970:      	ldp	x21, x22, [sp, #0x20]
 1de5974:      	ldp	x23, x24, [sp, #0x30]
 1de5978:      	ldp	x25, x26, [sp, #0x40]
 1de597c:      	ldp	x27, x28, [sp, #0x50]
 1de5980:      	ldp	x29, x30, [sp], #0xd0
 1de5984:      	ret
 1de5988:      	ldr	w1, [x0, #0x8]
 1de598c:      	add	w1, w1, #0x1
 1de5990:      	str	w1, [x0, #0x8]
 1de5994:      	b	0x1de534c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e54c4>
 1de5998:      	str	w24, [x25, #0x8]
 1de599c:      	b	0x1de53f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5570>
 1de59a0:      	str	w28, [x27, #0x8]
 1de59a4:      	b	0x1de5644 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e57bc>
 1de59a8:      	str	w26, [x25, #0x8]
 1de59ac:      	b	0x1de57fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5974>
 1de59b0:      	mov	x20, x0
 1de59b4:      	add	x0, sp, #0x70
 1de59b8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de59bc:      	b	0x1de59cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b44>
 1de59c0:      	mov	x20, x0
 1de59c4:      	mov	x0, x21
 1de59c8:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de59cc:      	ldr	x0, [x19, #0x158]
 1de59d0:      	cbz	x0, 0x1de59e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b58>
 1de59d4:      	ldr	x1, [x0]
 1de59d8:      	ldr	x1, [x1, #0x8]
 1de59dc:      	blr	x1
 1de59e0:      	ldr	x0, [x19, #0x150]
 1de59e4:      	cbz	x0, 0x1de59f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b6c>
 1de59e8:      	ldr	x1, [x0]
 1de59ec:      	ldr	x1, [x1, #0x8]
 1de59f0:      	blr	x1
 1de59f4:      	ldr	x0, [x19, #0x148]
 1de59f8:      	cbz	x0, 0x1de5a08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b80>
 1de59fc:      	ldr	x1, [x0]
 1de5a00:      	ldr	x1, [x1, #0x8]
 1de5a04:      	blr	x1
 1de5a08:      	ldr	x0, [x19, #0x140]
 1de5a0c:      	cbz	x0, 0x1de5a14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b8c>
 1de5a10:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1de5a14:      	mov	x0, x19
 1de5a18:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de5a1c:      	mov	x0, x20
 1de5a20:      	bl	0x424d10 <_Unwind_Resume@plt>
 1de5a24:      	mov	x22, x0
 1de5a28:      	add	x0, sp, #0x68
 1de5a2c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5a30:      	mov	x0, x20
 1de5a34:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5a38:      	mov	x0, x27
 1de5a3c:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de5a40:      	mov	x0, x26
 1de5a44:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de5a48:      	mov	x20, x22
 1de5a4c:      	mov	x0, x26
 1de5a50:      	mov	x1, #0xf0               // =240
 1de5a54:      	bl	0x426660 <_ZdlPvm@plt>
 1de5a58:      	mov	x22, #0x8               // =8
 1de5a5c:      	add	x0, sp, #0x78
 1de5a60:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de5a64:      	sub	x22, x22, #0x1
 1de5a68:      	cmn	x22, #0x1
 1de5a6c:      	b.eq	0x1de59b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b2c>
 1de5a70:      	add	x0, x21, x22, lsl #3
 1de5a74:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5a78:      	b	0x1de5a64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5bdc>
 1de5a7c:      	mov	x23, x0
 1de5a80:      	add	x0, sp, #0x68
 1de5a84:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5a88:      	mov	x0, x20
 1de5a8c:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5a90:      	mov	x0, x25
 1de5a94:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de5a98:      	mov	x0, x22
 1de5a9c:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de5aa0:      	mov	x20, x23
 1de5aa4:      	mov	x0, x22
 1de5aa8:      	mov	x1, #0xf0               // =240
 1de5aac:      	bl	0x426660 <_ZdlPvm@plt>
 1de5ab0:      	mov	x0, x21
 1de5ab4:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de5ab8:      	add	x0, sp, #0x78
 1de5abc:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5ac0:      	b	0x1de59b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b2c>
 1de5ac4:      	mov	x20, x0
 1de5ac8:      	add	x0, sp, #0x90
 1de5acc:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de5ad0:      	add	x0, sp, #0x78
 1de5ad4:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de5ad8:      	b	0x1de59cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b44>
 1de5adc:      	b	0x1de59c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b38>
 1de5ae0:      	mov	x20, x0
 1de5ae4:      	b	0x1de5ab0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5c28>
 1de5ae8:      	mov	x22, x0
 1de5aec:      	add	x0, sp, #0x70
 1de5af0:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5af4:      	mov	x0, x20
 1de5af8:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de5afc:      	mov	x0, x25
 1de5b00:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de5b04:      	mov	x0, x21
 1de5b08:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de5b0c:      	mov	x20, x22
 1de5b10:      	mov	x0, x21
 1de5b14:      	mov	x1, #0xf0               // =240
 1de5b18:      	bl	0x426660 <_ZdlPvm@plt>
 1de5b1c:      	b	0x1de5ac8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5c40>
 1de5b20:      	mov	x20, x0
 1de5b24:      	b	0x1de59b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b2c>
 1de5b28:      	b	0x1de59c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b38>
 1de5b2c:      	mov	x20, x0
 1de5b30:      	b	0x1de5a58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5bd0>
 1de5b34:      	mov	x20, x0
 1de5b38:      	b	0x1de59cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5b44>
 1de5b3c:      	udf	#0x0
 1de5b40:      	ret
 1de5b44:      	nop
 1de5b48:      	stp	x29, x30, [sp, #-0x30]!
 1de5b4c:      	mov	x29, sp
 1de5b50:      	add	x0, sp, #0x28
 1de5b54:      	str	x19, [sp, #0x10]
 1de5b58:      	mov	x19, x1
 1de5b5c:      	adrp	x1, 0x3bd7000 <stdout+0x95f40>
 1de5b60:      	add	x1, x1, #0x948
 1de5b64:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de5b68:      	add	x1, sp, #0x28
 1de5b6c:      	mov	x0, x19
 1de5b70:      	bl	0x23af7d0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3a3b0>
 1de5b74:      	add	x0, sp, #0x28
 1de5b78:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5b7c:      	mov	w1, #0x2323             // =8995
 1de5b80:      	add	x0, sp, #0x20
 1de5b84:      	movk	w1, #0xff23, lsl #16
 1de5b88:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1de5b8c:      	add	x1, sp, #0x20
 1de5b90:      	add	x0, sp, #0x28
 1de5b94:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de5b98:      	add	x1, sp, #0x28
 1de5b9c:      	mov	x0, x19
 1de5ba0:      	bl	0x23af140 <_ZNSt8functionIFvvEEC2ERKS1_+0x39d20>
 1de5ba4:      	add	x0, sp, #0x28
 1de5ba8:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5bac:      	mov	x0, x19
 1de5bb0:      	mov	w4, #0x1e               // =30
 1de5bb4:      	mov	w3, #0xb0               // =176
 1de5bb8:      	mov	w2, #0x0                // =0
 1de5bbc:      	mov	w1, #0x0                // =0
 1de5bc0:      	bl	0x23af680 <_ZNSt8functionIFvvEEC2ERKS1_+0x3a260>
 1de5bc4:      	add	x0, sp, #0x20
 1de5bc8:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5bcc:      	ldr	x19, [sp, #0x10]
 1de5bd0:      	ldp	x29, x30, [sp], #0x30
 1de5bd4:      	ret
 1de5bd8:      	mov	x19, x0
 1de5bdc:      	add	x0, sp, #0x28
 1de5be0:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5be4:      	mov	x0, x19
 1de5be8:      	bl	0x424d10 <_Unwind_Resume@plt>
 1de5bec:      	mov	x19, x0
 1de5bf0:      	b	0x1de5c00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5d78>
 1de5bf4:      	mov	x19, x0
 1de5bf8:      	add	x0, sp, #0x28
 1de5bfc:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5c00:      	add	x0, sp, #0x20
 1de5c04:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de5c08:      	mov	x0, x19
 1de5c0c:      	bl	0x424d10 <_Unwind_Resume@plt>
 1de5c10:      	stp	x29, x30, [sp, #-0x30]!
 1de5c14:      	adrp	x1, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5c18:      	add	x1, x1, #0xbb0
 1de5c1c:      	mov	x29, sp
 1de5c20:      	stp	x19, x20, [sp, #0x10]
 1de5c24:      	mov	x19, x0
 1de5c28:      	ldr	x0, [x0, #0xd8]
 1de5c2c:      	str	x1, [x19]
 1de5c30:      	str	xzr, [x19, #0xd8]
 1de5c34:      	cbz	x0, 0x1de5c44 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5dbc>
 1de5c38:      	ldr	x1, [x0]
 1de5c3c:      	ldr	x1, [x1, #0x8]
 1de5c40:      	blr	x1
 1de5c44:      	ldr	x0, [x19, #0xe0]
 1de5c48:      	str	xzr, [x19, #0xe0]
 1de5c4c:      	cbz	x0, 0x1de5c5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5dd4>
 1de5c50:      	ldr	x1, [x0]
 1de5c54:      	ldr	x1, [x1, #0x8]
 1de5c58:      	blr	x1
 1de5c5c:      	ldr	x0, [x19, #0xe8]
 1de5c60:      	str	xzr, [x19, #0xe8]
 1de5c64:      	cbz	x0, 0x1de5c88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e00>
 1de5c68:      	ldr	x1, [x0]
 1de5c6c:      	ldr	x1, [x1, #0x8]
 1de5c70:      	blr	x1
 1de5c74:      	ldr	x0, [x19, #0xe8]
 1de5c78:      	cbz	x0, 0x1de5c88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e00>
 1de5c7c:      	ldr	x1, [x0]
 1de5c80:      	ldr	x1, [x1, #0x8]
 1de5c84:      	blr	x1
 1de5c88:      	ldr	x0, [x19, #0xe0]
 1de5c8c:      	cbz	x0, 0x1de5c9c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e14>
 1de5c90:      	ldr	x1, [x0]
 1de5c94:      	ldr	x1, [x1, #0x8]
 1de5c98:      	blr	x1
 1de5c9c:      	ldr	x0, [x19, #0xd8]
 1de5ca0:      	cbz	x0, 0x1de5cb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e28>
 1de5ca4:      	ldr	x1, [x0]
 1de5ca8:      	ldr	x1, [x1, #0x8]
 1de5cac:      	blr	x1
 1de5cb0:      	ldr	x20, [x19, #0xd0]
 1de5cb4:      	cbz	x20, 0x1de5ce8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e60>
 1de5cb8:      	adrp	x0, 0x2d79000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b61a8>
 1de5cbc:      	str	x21, [sp, #0x20]
 1de5cc0:      	ldr	x21, [x0, #0x410]
 1de5cc4:      	cbz	x21, 0x1de5cf8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e70>
 1de5cc8:      	add	x1, x20, #0x8
 1de5ccc:      	ldaxr	w0, [x1]
 1de5cd0:      	sub	w2, w0, #0x1
 1de5cd4:      	stlxr	w3, w2, [x1]
 1de5cd8:      	cbnz	w3, 0x1de5ccc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e44>
 1de5cdc:      	cmp	w0, #0x1
 1de5ce0:      	b.eq	0x1de5d0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e84>
 1de5ce4:      	ldr	x21, [sp, #0x20]
 1de5ce8:      	mov	x0, x19
 1de5cec:      	ldp	x19, x20, [sp, #0x10]
 1de5cf0:      	ldp	x29, x30, [sp], #0x30
 1de5cf4:      	b	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de5cf8:      	ldr	w0, [x20, #0x8]
 1de5cfc:      	sub	w1, w0, #0x1
 1de5d00:      	str	w1, [x20, #0x8]
 1de5d04:      	cmp	w0, #0x1
 1de5d08:      	b.ne	0x1de5ce4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e5c>
 1de5d0c:      	ldr	x1, [x20]
 1de5d10:      	mov	x0, x20
 1de5d14:      	ldr	x1, [x1, #0x10]
 1de5d18:      	blr	x1
 1de5d1c:      	cbz	x21, 0x1de5d54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5ecc>
 1de5d20:      	add	x1, x20, #0xc
 1de5d24:      	ldaxr	w0, [x1]
 1de5d28:      	sub	w2, w0, #0x1
 1de5d2c:      	stlxr	w3, w2, [x1]
 1de5d30:      	cbnz	w3, 0x1de5d24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e9c>
 1de5d34:      	cmp	w0, #0x1
 1de5d38:      	b.ne	0x1de5ce4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e5c>
 1de5d3c:      	ldr	x1, [x20]
 1de5d40:      	mov	x0, x20
 1de5d44:      	ldr	x1, [x1, #0x18]
 1de5d48:      	blr	x1
 1de5d4c:      	ldr	x21, [sp, #0x20]
 1de5d50:      	b	0x1de5ce8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5e60>
 1de5d54:      	ldr	w0, [x20, #0xc]
 1de5d58:      	sub	w1, w0, #0x1
 1de5d5c:      	str	w1, [x20, #0xc]
 1de5d60:      	b	0x1de5d34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5eac>
 1de5d64:      	nop
 1de5d68:      	stp	x29, x30, [sp, #-0x20]!
 1de5d6c:      	mov	x29, sp
 1de5d70:      	str	x19, [sp, #0x10]
 1de5d74:      	mov	x19, x0
 1de5d78:      	bl	0x1de5c10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5d88>
 1de5d7c:      	mov	x0, x19
 1de5d80:      	mov	x1, #0xf0               // =240
 1de5d84:      	ldr	x19, [sp, #0x10]
 1de5d88:      	ldp	x29, x30, [sp], #0x20
 1de5d8c:      	b	0x426660 <_ZdlPvm@plt>
 1de5d90:      	stp	x29, x30, [sp, #-0x20]!
 1de5d94:      	mov	x29, sp
 1de5d98:      	stp	x19, x20, [sp, #0x10]
 1de5d9c:      	mov	x19, x0
 1de5da0:      	ldr	x0, [x0, #0xe8]
 1de5da4:      	bl	0x1de51f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5368>
 1de5da8:      	ldr	x0, [x19, #0xc8]
 1de5dac:      	ldrb	w0, [x0, #0x51]
 1de5db0:      	cmp	w0, #0xd
 1de5db4:      	b.hi	0x1de5e0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5f84>
 1de5db8:      	ldr	x4, [x19, #0xe0]
 1de5dbc:      	and	x2, x0, #0xff
 1de5dc0:      	adrp	x3, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5dc4:      	add	x3, x3, #0xd10
 1de5dc8:      	mov	x0, x4
 1de5dcc:      	mov	w1, #0x1                // =1
 1de5dd0:      	ldr	x4, [x4]
 1de5dd4:      	ldr	w20, [x3, x2, lsl #2]
 1de5dd8:      	ldr	x2, [x4, #0x60]
 1de5ddc:      	blr	x2
 1de5de0:      	ldr	x0, [x19, #0xe0]
 1de5de4:      	ldr	w1, [x0, #0xc8]
 1de5de8:      	cmp	w20, w1
 1de5dec:      	b.eq	0x1de5e00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5f78>
 1de5df0:      	str	w20, [x0, #0xc8]
 1de5df4:      	ldp	x19, x20, [sp, #0x10]
 1de5df8:      	ldp	x29, x30, [sp], #0x20
 1de5dfc:      	b	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1de5e00:      	ldp	x19, x20, [sp, #0x10]
 1de5e04:      	ldp	x29, x30, [sp], #0x20
 1de5e08:      	ret
 1de5e0c:      	ldp	x19, x20, [sp, #0x10]
 1de5e10:      	mov	x1, #0x0                // =0
 1de5e14:      	ldp	x29, x30, [sp], #0x20
 1de5e18:      	mov	w0, #0x0                // =0
 1de5e1c:      	b	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de5e20:      	ldr	x1, [x0, #0xc8]
 1de5e24:      	ldrb	w1, [x1, #0x51]
 1de5e28:      	cmp	w1, #0xd
 1de5e2c:      	b.hi	0x1de5e94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e600c>
 1de5e30:      	stp	x29, x30, [sp, #-0x20]!
 1de5e34:      	and	x2, x1, #0xff
 1de5e38:      	adrp	x3, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5e3c:      	mov	x29, sp
 1de5e40:      	ldr	x4, [x0, #0xe0]
 1de5e44:      	stp	x19, x20, [sp, #0x10]
 1de5e48:      	mov	x19, x0
 1de5e4c:      	mov	x0, x4
 1de5e50:      	add	x3, x3, #0xd10
 1de5e54:      	ldr	x4, [x4]
 1de5e58:      	mov	w1, #0x1                // =1
 1de5e5c:      	ldr	w20, [x3, x2, lsl #2]
 1de5e60:      	ldr	x2, [x4, #0x60]
 1de5e64:      	blr	x2
 1de5e68:      	ldr	x0, [x19, #0xe0]
 1de5e6c:      	ldr	w1, [x0, #0xc8]
 1de5e70:      	cmp	w20, w1
 1de5e74:      	b.eq	0x1de5e88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6000>
 1de5e78:      	str	w20, [x0, #0xc8]
 1de5e7c:      	ldp	x19, x20, [sp, #0x10]
 1de5e80:      	ldp	x29, x30, [sp], #0x20
 1de5e84:      	b	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1de5e88:      	ldp	x19, x20, [sp, #0x10]
 1de5e8c:      	ldp	x29, x30, [sp], #0x20
 1de5e90:      	ret
 1de5e94:      	mov	x1, #0x0                // =0
 1de5e98:      	mov	w0, #0x0                // =0
 1de5e9c:      	b	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1de5ea0:      	stp	x29, x30, [sp, #-0xf0]!
 1de5ea4:      	mov	x29, sp
 1de5ea8:      	stp	x19, x20, [sp, #0x10]
 1de5eac:      	mov	x19, x1
 1de5eb0:      	mov	x20, x0
 1de5eb4:      	stp	x21, x22, [sp, #0x20]
 1de5eb8:      	stp	x23, x24, [sp, #0x30]
 1de5ebc:      	stp	x25, x26, [sp, #0x40]
 1de5ec0:      	bl	0x243cff0 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7bd0>
 1de5ec4:      	adrp	x2, 0x2d74000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b11a8>
 1de5ec8:      	ldp	x1, x0, [x19]
 1de5ecc:      	add	x2, x2, #0xbb0
 1de5ed0:      	str	x2, [x20]
 1de5ed4:      	stp	x1, x0, [x20, #0xc8]
 1de5ed8:      	cbz	x0, 0x1de5efc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6074>
 1de5edc:      	adrp	x1, 0x2d79000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b61a8>
 1de5ee0:      	ldr	x1, [x1, #0x410]
 1de5ee4:      	cbz	x1, 0x1de6400 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6578>
 1de5ee8:      	add	x0, x0, #0x8
 1de5eec:      	ldaxr	w1, [x0]
 1de5ef0:      	add	w1, w1, #0x1
 1de5ef4:      	stlxr	w2, w1, [x0]
 1de5ef8:      	cbnz	w2, 0x1de5eec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6064>
 1de5efc:      	stp	xzr, xzr, [x20, #0xd8]
 1de5f00:      	adrp	x1, 0x29ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x42b1a8>
 1de5f04:      	add	x0, sp, #0x60
 1de5f08:      	str	xzr, [x20, #0xe8]
 1de5f0c:      	add	x1, x1, #0xf10
 1de5f10:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1de5f14:      	adrp	x24, 0x3b35000
 1de5f18:      	add	x8, sp, #0x68
 1de5f1c:      	mov	w1, #0x498              // =1176
 1de5f20:      	ldr	x0, [x24, #0xad8]
 1de5f24:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de5f28:      	mov	x0, #0x40               // =64
 1de5f2c:      	str	wzr, [sp, #0x90]
 1de5f30:      	bl	0x424fd0 <malloc@plt>
 1de5f34:      	str	x0, [sp, #0x80]
 1de5f38:      	mov	w2, #0x8                // =8
 1de5f3c:      	add	x1, sp, #0x68
 1de5f40:      	str	w2, [sp, #0x88]
 1de5f44:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de5f48:      	ldr	w1, [sp, #0x90]
 1de5f4c:      	mov	x0, #0xf0               // =240
 1de5f50:      	add	w1, w1, #0x1
 1de5f54:      	str	w1, [sp, #0x90]
 1de5f58:      	bl	0x424d40 <_Znwm@plt>
 1de5f5c:      	mov	x21, x0
 1de5f60:      	add	x25, x0, #0xd0
 1de5f64:      	add	x1, sp, #0x60
 1de5f68:      	adrp	x23, 0x29e9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4261a8>
 1de5f6c:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1de5f70:      	add	x23, x23, #0x540
 1de5f74:      	ldr	w22, [sp, #0x90]
 1de5f78:      	str	x23, [x21]
 1de5f7c:      	str	wzr, [x21, #0xc8]
 1de5f80:      	cmp	w22, #0x0
 1de5f84:      	str	xzr, [x21, #0xd0]
 1de5f88:      	str	wzr, [x25, #0x8]
 1de5f8c:      	str	w22, [x25, #0x10]
 1de5f90:      	b.eq	0x1de5fd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6150>
 1de5f94:      	b.le	0x1de6410 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6588>
 1de5f98:      	sbfiz	x0, x22, #3, #32
 1de5f9c:      	bl	0x424fd0 <malloc@plt>
 1de5fa0:      	str	x0, [x21, #0xd0]
 1de5fa4:      	mov	x19, #0x0               // =0
 1de5fa8:      	str	w22, [x25, #0x8]
 1de5fac:      	b	0x1de5fb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e612c>
 1de5fb0:      	ldr	x0, [x21, #0xd0]
 1de5fb4:      	lsl	x1, x19, #3
 1de5fb8:      	ldr	x2, [sp, #0x80]
 1de5fbc:      	add	x0, x0, x1
 1de5fc0:      	add	x19, x19, #0x1
 1de5fc4:      	add	x1, x2, x1
 1de5fc8:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de5fcc:      	ldr	w0, [x25, #0x10]
 1de5fd0:      	cmp	w0, w19
 1de5fd4:      	b.gt	0x1de5fb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6128>
 1de5fd8:      	add	x19, x21, #0xe8
 1de5fdc:      	adrp	x22, 0x3bd7000 <stdout+0x95f40>
 1de5fe0:      	mov	x0, x19
 1de5fe4:      	add	x22, x22, #0x9b0
 1de5fe8:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1de5fec:      	mov	x1, x22
 1de5ff0:      	add	x0, sp, #0x58
 1de5ff4:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de5ff8:      	mov	w1, #0x100              // =256
 1de5ffc:      	add	x2, sp, #0x58
 1de6000:      	mov	x0, x21
 1de6004:      	movk	w1, #0x7000, lsl #16
 1de6008:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de600c:      	add	x0, sp, #0x58
 1de6010:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de6014:      	ldr	x0, [x20, #0xd8]
 1de6018:      	str	x21, [x20, #0xd8]
 1de601c:      	cbz	x0, 0x1de602c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e61a4>
 1de6020:      	ldr	x1, [x0]
 1de6024:      	ldr	x1, [x1, #0x8]
 1de6028:      	blr	x1
 1de602c:      	ldr	w0, [sp, #0x90]
 1de6030:      	mov	x19, #0x0               // =0
 1de6034:      	cmp	w0, #0x0
 1de6038:      	b.le	0x1de605c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e61d4>
 1de603c:      	nop
 1de6040:      	ldr	x0, [sp, #0x80]
 1de6044:      	add	x0, x0, x19, lsl #3
 1de6048:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de604c:      	ldr	w0, [sp, #0x90]
 1de6050:      	add	x19, x19, #0x1
 1de6054:      	cmp	w0, w19
 1de6058:      	b.gt	0x1de6040 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e61b8>
 1de605c:      	ldr	x0, [sp, #0x80]
 1de6060:      	bl	0x424af0 <free@plt>
 1de6064:      	add	x0, sp, #0x68
 1de6068:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de606c:      	add	x0, sp, #0x60
 1de6070:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de6074:      	ldr	x1, [x20, #0xd8]
 1de6078:      	mov	w2, #-0x1               // =-1
 1de607c:      	mov	x0, x20
 1de6080:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1de6084:      	add	x21, sp, #0x80
 1de6088:      	mov	w1, #0x0                // =0
 1de608c:      	ldr	x19, [x20, #0xd8]
 1de6090:      	mov	x0, x21
 1de6094:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1de6098:      	mov	w1, #0x100              // =256
 1de609c:      	mov	x2, x21
 1de60a0:      	mov	x0, x19
 1de60a4:      	movk	w1, #0x7000, lsl #16
 1de60a8:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de60ac:      	mov	x0, x21
 1de60b0:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de60b4:      	ldr	x0, [x20, #0xd8]
 1de60b8:      	mov	w4, #0x1e               // =30
 1de60bc:      	mov	w3, #0xb0               // =176
 1de60c0:      	mov	w2, #0x0                // =0
 1de60c4:      	mov	w1, #0x0                // =0
 1de60c8:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1de60cc:      	adrp	x1, 0x2d79000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7b61a8>
 1de60d0:      	add	x0, sp, #0x60
 1de60d4:      	add	x1, x1, #0x418
 1de60d8:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1de60dc:      	add	x24, x24, #0xad8
 1de60e0:      	mov	x8, x21
 1de60e4:      	mov	w1, #0x2ad              // =685
 1de60e8:      	ldr	x0, [x24, #0x8]
 1de60ec:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de60f0:      	ldr	x0, [x24, #0x10]
 1de60f4:      	add	x8, sp, #0x88
 1de60f8:      	mov	w1, #0x446              // =1094
 1de60fc:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6100:      	ldr	x0, [x24, #0x18]
 1de6104:      	add	x8, sp, #0x90
 1de6108:      	mov	w1, #0x617              // =1559
 1de610c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6110:      	ldr	x0, [x24, #0x20]
 1de6114:      	add	x8, sp, #0x98
 1de6118:      	mov	w1, #0x617              // =1559
 1de611c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6120:      	ldr	x0, [x24, #0x28]
 1de6124:      	add	x8, sp, #0xa0
 1de6128:      	mov	w1, #0x568              // =1384
 1de612c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6130:      	ldr	x0, [x24, #0x30]
 1de6134:      	add	x8, sp, #0xa8
 1de6138:      	mov	w1, #0x5c9              // =1481
 1de613c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6140:      	ldr	x0, [x24, #0x38]
 1de6144:      	add	x8, sp, #0xb0
 1de6148:      	mov	w1, #0x617              // =1559
 1de614c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6150:      	ldr	x0, [x24, #0x40]
 1de6154:      	add	x8, sp, #0xb8
 1de6158:      	mov	w1, #0x446              // =1094
 1de615c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6160:      	ldr	x0, [x24, #0x48]
 1de6164:      	add	x8, sp, #0xc0
 1de6168:      	mov	w1, #0x317              // =791
 1de616c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6170:      	ldr	x0, [x24, #0x50]
 1de6174:      	add	x8, sp, #0xc8
 1de6178:      	mov	w1, #0x2c2              // =706
 1de617c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6180:      	ldr	x0, [x24, #0x58]
 1de6184:      	add	x8, sp, #0xd0
 1de6188:      	mov	w1, #0x780              // =1920
 1de618c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de6190:      	ldr	x0, [x24, #0x60]
 1de6194:      	add	x8, sp, #0xd8
 1de6198:      	mov	w1, #0x2b7              // =695
 1de619c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de61a0:      	ldr	x0, [x24, #0x68]
 1de61a4:      	add	x8, sp, #0xe0
 1de61a8:      	mov	w1, #0x617              // =1559
 1de61ac:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de61b0:      	ldr	x0, [x24, #0x70]
 1de61b4:      	add	x8, sp, #0xe8
 1de61b8:      	mov	w1, #0x2c2              // =706
 1de61bc:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1de61c0:      	mov	x0, #0xc0               // =192
 1de61c4:      	str	wzr, [sp, #0x78]
 1de61c8:      	bl	0x424fd0 <malloc@plt>
 1de61cc:      	add	x24, sp, #0xf0
 1de61d0:      	mov	w2, #0x18               // =24
 1de61d4:      	mov	x19, x21
 1de61d8:      	mov	w1, #0x0                // =0
 1de61dc:      	str	x0, [sp, #0x68]
 1de61e0:      	str	w2, [sp, #0x70]
 1de61e4:      	b	0x1de61ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6364>
 1de61e8:      	ldr	x0, [sp, #0x68]
 1de61ec:      	add	x0, x0, w1, sxtw #3
 1de61f0:      	mov	x1, x19
 1de61f4:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de61f8:      	ldr	w1, [sp, #0x78]
 1de61fc:      	add	x19, x19, #0x8
 1de6200:      	cmp	x24, x19
 1de6204:      	add	w1, w1, #0x1
 1de6208:      	str	w1, [sp, #0x78]
 1de620c:      	b.ne	0x1de61e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6360>
 1de6210:      	mov	x0, #0xf0               // =240
 1de6214:      	bl	0x424d40 <_Znwm@plt>
 1de6218:      	mov	x24, x0
 1de621c:      	add	x25, x0, #0xd0
 1de6220:      	add	x1, sp, #0x60
 1de6224:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1de6228:      	ldr	w26, [sp, #0x78]
 1de622c:      	str	x23, [x24]
 1de6230:      	str	wzr, [x24, #0xc8]
 1de6234:      	cmp	w26, #0x0
 1de6238:      	str	xzr, [x24, #0xd0]
 1de623c:      	str	wzr, [x25, #0x8]
 1de6240:      	str	w26, [x25, #0x10]
 1de6244:      	b.eq	0x1de628c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6404>
 1de6248:      	b.le	0x1de6418 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6590>
 1de624c:      	sbfiz	x0, x26, #3, #32
 1de6250:      	bl	0x424fd0 <malloc@plt>
 1de6254:      	str	x0, [x24, #0xd0]
 1de6258:      	mov	x19, #0x0               // =0
 1de625c:      	str	w26, [x25, #0x8]
 1de6260:      	b	0x1de6268 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e63e0>
 1de6264:      	ldr	x0, [x24, #0xd0]
 1de6268:      	lsl	x1, x19, #3
 1de626c:      	ldr	x2, [sp, #0x68]
 1de6270:      	add	x0, x0, x1
 1de6274:      	add	x19, x19, #0x1
 1de6278:      	add	x1, x2, x1
 1de627c:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1de6280:      	ldr	w0, [x25, #0x10]
 1de6284:      	cmp	w0, w19
 1de6288:      	b.gt	0x1de6264 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e63dc>
 1de628c:      	add	x19, x24, #0xe8
 1de6290:      	mov	x0, x19
 1de6294:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1de6298:      	mov	x1, x22
 1de629c:      	add	x0, sp, #0x58
 1de62a0:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1de62a4:      	mov	w1, #0x100              // =256
 1de62a8:      	add	x2, sp, #0x58
 1de62ac:      	mov	x0, x24
 1de62b0:      	movk	w1, #0x7000, lsl #16
 1de62b4:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de62b8:      	add	x0, sp, #0x58
 1de62bc:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de62c0:      	ldr	x0, [x20, #0xe0]
 1de62c4:      	str	x24, [x20, #0xe0]
 1de62c8:      	cbz	x0, 0x1de62d8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6450>
 1de62cc:      	ldr	x1, [x0]
 1de62d0:      	ldr	x1, [x1, #0x8]
 1de62d4:      	blr	x1
 1de62d8:      	ldr	w0, [sp, #0x78]
 1de62dc:      	mov	x19, #0x0               // =0
 1de62e0:      	cmp	w0, #0x0
 1de62e4:      	b.le	0x1de6304 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e647c>
 1de62e8:      	ldr	x0, [sp, #0x68]
 1de62ec:      	add	x0, x0, x19, lsl #3
 1de62f0:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de62f4:      	ldr	w0, [sp, #0x78]
 1de62f8:      	add	x19, x19, #0x1
 1de62fc:      	cmp	w0, w19
 1de6300:      	b.gt	0x1de62e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6460>
 1de6304:      	ldr	x0, [sp, #0x68]
 1de6308:      	add	x19, x21, #0x68
 1de630c:      	bl	0x424af0 <free@plt>
 1de6310:      	mov	x0, x19
 1de6314:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de6318:      	cmp	x21, x19
 1de631c:      	sub	x19, x19, #0x8
 1de6320:      	b.ne	0x1de6310 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6488>
 1de6324:      	add	x0, sp, #0x60
 1de6328:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de632c:      	ldr	x1, [x20, #0xe0]
 1de6330:      	mov	w2, #-0x1               // =-1
 1de6334:      	mov	x0, x20
 1de6338:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1de633c:      	ldr	x19, [x20, #0xe0]
 1de6340:      	mov	w1, #0x0                // =0
 1de6344:      	mov	x0, x21
 1de6348:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1de634c:      	mov	w1, #0x100              // =256
 1de6350:      	mov	x2, x21
 1de6354:      	mov	x0, x19
 1de6358:      	movk	w1, #0x7000, lsl #16
 1de635c:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1de6360:      	mov	x0, x21
 1de6364:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de6368:      	ldr	x0, [x20, #0xe0]
 1de636c:      	mov	w4, #0x14               // =20
 1de6370:      	mov	w3, #0xb0               // =176
 1de6374:      	mov	w2, #0x1e               // =30
 1de6378:      	mov	w1, #0x0                // =0
 1de637c:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1de6380:      	mov	x0, #0x160              // =352
 1de6384:      	bl	0x424d40 <_Znwm@plt>
 1de6388:      	mov	x19, x0
 1de638c:      	add	x1, x20, #0xc8
 1de6390:      	bl	0x1de52c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e5438>
 1de6394:      	ldr	x0, [x20, #0xe8]
 1de6398:      	str	x19, [x20, #0xe8]
 1de639c:      	cbz	x0, 0x1de63b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6528>
 1de63a0:      	ldr	x1, [x0]
 1de63a4:      	ldr	x1, [x1, #0x8]
 1de63a8:      	blr	x1
 1de63ac:      	ldr	x19, [x20, #0xe8]
 1de63b0:      	mov	x1, x19
 1de63b4:      	mov	w2, #-0x1               // =-1
 1de63b8:      	mov	x0, x20
 1de63bc:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1de63c0:      	ldr	x0, [x20, #0xe8]
 1de63c4:      	mov	w4, #0x31               // =49
 1de63c8:      	mov	w3, #0xb0               // =176
 1de63cc:      	mov	w2, #0x34               // =52
 1de63d0:      	mov	w1, #0x0                // =0
 1de63d4:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1de63d8:      	mov	w2, #0x65               // =101
 1de63dc:      	mov	w1, #0xb0               // =176
 1de63e0:      	mov	x0, x20
 1de63e4:      	bl	0x249f200 <_ZNSt8functionIFvvEEC2ERKS1_+0x129de0>
 1de63e8:      	ldp	x19, x20, [sp, #0x10]
 1de63ec:      	ldp	x21, x22, [sp, #0x20]
 1de63f0:      	ldp	x23, x24, [sp, #0x30]
 1de63f4:      	ldp	x25, x26, [sp, #0x40]
 1de63f8:      	ldp	x29, x30, [sp], #0xf0
 1de63fc:      	ret
 1de6400:      	ldr	w1, [x0, #0x8]
 1de6404:      	add	w1, w1, #0x1
 1de6408:      	str	w1, [x0, #0x8]
 1de640c:      	b	0x1de5efc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6074>
 1de6410:      	str	w22, [x25, #0x8]
 1de6414:      	b	0x1de5fd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6150>
 1de6418:      	str	w26, [x25, #0x8]
 1de641c:      	b	0x1de628c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6404>
 1de6420:      	mov	x1, x0
 1de6424:      	mov	x0, x21
 1de6428:      	mov	x21, x1
 1de642c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de6430:      	ldr	x0, [x20, #0xe8]
 1de6434:      	cbz	x0, 0x1de6444 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e65bc>
 1de6438:      	ldr	x1, [x0]
 1de643c:      	ldr	x1, [x1, #0x8]
 1de6440:      	blr	x1
 1de6444:      	ldr	x0, [x20, #0xe0]
 1de6448:      	cbz	x0, 0x1de6458 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e65d0>
 1de644c:      	ldr	x1, [x0]
 1de6450:      	ldr	x1, [x1, #0x8]
 1de6454:      	blr	x1
 1de6458:      	ldr	x0, [x20, #0xd8]
 1de645c:      	cbz	x0, 0x1de646c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e65e4>
 1de6460:      	ldr	x1, [x0]
 1de6464:      	ldr	x1, [x1, #0x8]
 1de6468:      	blr	x1
 1de646c:      	ldr	x0, [x20, #0xd0]
 1de6470:      	cbz	x0, 0x1de6478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e65f0>
 1de6474:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1de6478:      	mov	x0, x20
 1de647c:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de6480:      	mov	x0, x21
 1de6484:      	bl	0x424d10 <_Unwind_Resume@plt>
 1de6488:      	mov	x22, x0
 1de648c:      	add	x0, sp, #0x58
 1de6490:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1de6494:      	mov	x0, x19
 1de6498:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de649c:      	mov	x0, x25
 1de64a0:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de64a4:      	mov	x0, x24
 1de64a8:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1de64ac:      	mov	x19, x22
 1de64b0:      	mov	x0, x24
 1de64b4:      	mov	x1, #0xf0               // =240
 1de64b8:      	bl	0x426660 <_ZdlPvm@plt>
 1de64bc:      	mov	x22, #0xe               // =14
 1de64c0:      	add	x0, sp, #0x68
 1de64c4:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1de64c8:      	sub	x22, x22, #0x1
 1de64cc:      	cmn	x22, #0x1
 1de64d0:      	b.ne	0x1de64e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e665c>
 1de64d4:      	mov	x21, x19
 1de64d8:      	add	x0, sp, #0x60
 1de64dc:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1de64e0:      	b	0x1de6430 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e65a8>
 1de64e4:      	add	x0, x21, x22, lsl #3
 1de64e8:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1de64ec:      	b	0x1de64c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5e6640>
 1de64f0:      	mov	x21, x0
 1de64f4:      	mov	x1, #0x160              // =352
 1de64f8:      	mov	x0, x19
 1de64fc:      	bl	0x426660 <_ZdlPvm@plt>
