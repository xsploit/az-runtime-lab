
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000019d8cd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8e48>:
 19d8cd0:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 19d8cd4:	910003fd 	mov	x29, sp
 19d8cd8:	f9411000 	ldr	x0, [x0,#544]
 19d8cdc:	9100c3e8 	add	x8, sp, #0x30
 19d8ce0:	a90153f3 	stp	x19, x20, [sp,#16]
 19d8ce4:	12001c54 	and	w20, w2, #0xff
 19d8ce8:	f90013f5 	str	x21, [sp,#32]
 19d8cec:	2a0103f5 	mov	w21, w1
 19d8cf0:	9417cdc6 	bl	1fcc408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7cc580>
 19d8cf4:	f9401be0 	ldr	x0, [sp,#48]
 19d8cf8:	b4000780 	cbz	x0, 19d8de8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f60>
 19d8cfc:	f948b413 	ldr	x19, [x0,#4456]
 19d8d00:	f948b000 	ldr	x0, [x0,#4448]
 19d8d04:	b4000873 	cbz	x19, 19d8e10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f88>
 19d8d08:	d00080a1 	adrp	x1, 29ee000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x42b1a8>
 19d8d0c:	f9471c21 	ldr	x1, [x1,#3640]
 19d8d10:	b4000901 	cbz	x1, 19d8e30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8fa8>
 19d8d14:	91002261 	add	x1, x19, #0x8
 19d8d18:	885ffc22 	ldaxr	w2, [x1]
 19d8d1c:	11000442 	add	w2, w2, #0x1
 19d8d20:	8803fc22 	stlxr	w3, w2, [x1]
 19d8d24:	35ffffa3 	cbnz	w3, 19d8d18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8e90>
 19d8d28:	39430400 	ldrb	w0, [x0,#193]
 19d8d2c:	340006c0 	cbz	w0, 19d8e04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f7c>
 19d8d30:	71000ebf 	cmp	w21, #0x3
 19d8d34:	54000748 	b.hi	19d8e1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f94>
 19d8d38:	b0008080 	adrp	x0, 29e9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x4261a8>
 19d8d3c:	9130c000 	add	x0, x0, #0xc30
 19d8d40:	8b354815 	add	x21, x0, w21, uxtw #2
 19d8d44:	396ce2a5 	ldrb	w5, [x21,#2872]
 19d8d48:	b0005f40 	adrp	x0, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 19d8d4c:	91382800 	add	x0, x0, #0xe0a
 19d8d50:	97fff74e 	bl	19d6a88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d6c00>
 19d8d54:	8b001002 	add	x2, x0, x0, lsl #4
 19d8d58:	d2801661 	mov	x1, #0xb3                  	// #179
 19d8d5c:	d28d1444 	mov	x4, #0x68a2                	// #26786
 19d8d60:	8b020c02 	add	x2, x0, x2, lsl #3
 19d8d64:	f2f12001 	movk	x1, #0x8900, lsl #48
 19d8d68:	9101a443 	add	x3, x2, #0x69
 19d8d6c:	f2a7f104 	movk	x4, #0x3f88, lsl #16
 19d8d70:	f2cbadc4 	movk	x4, #0x5d6e, lsl #32
 19d8d74:	910103e0 	add	x0, sp, #0x40
 19d8d78:	f2e03bc4 	movk	x4, #0x1de, lsl #48
 19d8d7c:	9bc17c62 	umulh	x2, x3, x1
 19d8d80:	d378fc42 	lsr	x2, x2, #56
 19d8d84:	9b048c42 	msub	x2, x2, x4, x3
 19d8d88:	8b021043 	add	x3, x2, x2, lsl #4
 19d8d8c:	8b030c42 	add	x2, x2, x3, lsl #3
 19d8d90:	91013442 	add	x2, x2, #0x4d
 19d8d94:	9bc17c41 	umulh	x1, x2, x1
 19d8d98:	d378fc21 	lsr	x1, x1, #56
 19d8d9c:	9b048821 	msub	x1, x1, x4, x2
 19d8da0:	aa0120a1 	orr	x1, x5, x1, lsl #8
 19d8da4:	f90023e1 	str	x1, [sp,#64]
 19d8da8:	94002a42 	bl	19e36b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1e3828>
 19d8dac:	b40001c0 	cbz	x0, 19d8de4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f5c>
 19d8db0:	f9400001 	ldr	x1, [x0]
 19d8db4:	910103e8 	add	x8, sp, #0x40
 19d8db8:	f9408821 	ldr	x1, [x1,#272]
 19d8dbc:	d63f0020 	blr	x1
 19d8dc0:	f94023e2 	ldr	x2, [sp,#64]
 19d8dc4:	2a1403e1 	mov	w1, w20
 19d8dc8:	aa0203e0 	mov	x0, x2
 19d8dcc:	f9400042 	ldr	x2, [x2]
 19d8dd0:	f9400842 	ldr	x2, [x2,#16]
 19d8dd4:	d63f0040 	blr	x2
 19d8dd8:	f94027e0 	ldr	x0, [sp,#72]
 19d8ddc:	b4000040 	cbz	x0, 19d8de4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f5c>
 19d8de0:	97b26d3e 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19d8de4:	b5000113 	cbnz	x19, 19d8e04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f7c>
 19d8de8:	f9401fe0 	ldr	x0, [sp,#56]
 19d8dec:	b4000040 	cbz	x0, 19d8df4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f6c>
 19d8df0:	97b26d3a 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19d8df4:	a94153f3 	ldp	x19, x20, [sp,#16]
 19d8df8:	f94013f5 	ldr	x21, [sp,#32]
 19d8dfc:	a8c57bfd 	ldp	x29, x30, [sp],#80
 19d8e00:	d65f03c0 	ret
 19d8e04:	aa1303e0 	mov	x0, x19
 19d8e08:	97b26d34 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19d8e0c:	17fffff7 	b	19d8de8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f60>
 19d8e10:	39430400 	ldrb	w0, [x0,#193]
 19d8e14:	35fff8e0 	cbnz	w0, 19d8d30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8ea8>
 19d8e18:	17fffff4 	b	19d8de8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8f60>
 19d8e1c:	d2800001 	mov	x1, #0x0                   	// #0
 19d8e20:	52800000 	mov	w0, #0x0                   	// #0
 19d8e24:	94209e27 	bl	22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x785a8>
 19d8e28:	d2800005 	mov	x5, #0x0                   	// #0
 19d8e2c:	17ffffc7 	b	19d8d48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8ec0>
 19d8e30:	b9400a61 	ldr	w1, [x19,#8]
 19d8e34:	11000421 	add	w1, w1, #0x1
 19d8e38:	b9000a61 	str	w1, [x19,#8]
 19d8e3c:	17ffffbb 	b	19d8d28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8ea0>
 19d8e40:	aa0003f4 	mov	x20, x0
 19d8e44:	b4000073 	cbz	x19, 19d8e50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8fc8>
 19d8e48:	aa1303e0 	mov	x0, x19
 19d8e4c:	97b26d23 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19d8e50:	f9401fe0 	ldr	x0, [sp,#56]
 19d8e54:	b4000040 	cbz	x0, 19d8e5c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8fd4>
 19d8e58:	97b26d20 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19d8e5c:	aa1403e0 	mov	x0, x20
 19d8e60:	97a92fac 	bl	424d10 <_Unwind_Resume@plt>
 19d8e64:	f94027e1 	ldr	x1, [sp,#72]
 19d8e68:	aa0003f4 	mov	x20, x0
 19d8e6c:	b4fffec1 	cbz	x1, 19d8e44 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8fbc>
 19d8e70:	aa0103e0 	mov	x0, x1
 19d8e74:	97b26d19 	bl	6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv@@Base>
 19d8e78:	b5fffe93 	cbnz	x19, 19d8e48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8fc0>
 19d8e7c:	17fffff5 	b	19d8e50 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x1d8fc8>
 19d8e80:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 19d8e84:	910003fd 	mov	x29, sp
 19d8e88:	a90153f3 	stp	x19, x20, [sp,#16]
 19d8e8c:	aa0103f3 	mov	x19, x1
