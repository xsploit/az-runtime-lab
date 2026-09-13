
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002260ac0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d6f0>:
 2260ac0:	d63f0020 	blr	x1
 2260ac4:	f940ce61 	ldr	x1, [x19,#408]
 2260ac8:	9101e3e0 	add	x0, sp, #0x78
 2260acc:	f100003f 	cmp	x1, #0x0
 2260ad0:	91030022 	add	x2, x1, #0xc0
 2260ad4:	9a811041 	csel	x1, x2, x1, ne
 2260ad8:	97fff3cc 	bl	225da08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92a638>
 2260adc:	d296c001 	mov	x1, #0xb600                	// #46592
 2260ae0:	d2800600 	mov	x0, #0x30                  	// #48
 2260ae4:	f2a78901 	movk	x1, #0x3c48, lsl #16
 2260ae8:	f2cd55a1 	movk	x1, #0x6aad, lsl #32
 2260aec:	f2f9ca41 	movk	x1, #0xce52, lsl #48
 2260af0:	f900afe1 	str	x1, [sp,#344]
 2260af4:	978712df 	bl	425670 <_Znwm@plt>
 2260af8:	aa0003f4 	mov	x20, x0
 2260afc:	90076db5 	adrp	x21, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 2260b00:	913562b5 	add	x21, x21, #0xd58
 2260b04:	08dffea0 	ldarb	w0, [x21]
 2260b08:	90076db8 	adrp	x24, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 2260b0c:	36002be0 	tbz	w0, #0, 2261088 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92dcb8>
 2260b10:	b94d6304 	ldr	w4, [x24,#3424]
 2260b14:	f0006ee1 	adrp	x1, 303f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x94d410>
 2260b18:	d2b7f003 	mov	x3, #0xbf800000            	// #3212836864
 2260b1c:	9106e021 	add	x1, x1, #0x1b8
 2260b20:	d2800c02 	mov	x2, #0x60                  	// #96
 2260b24:	f2e7f003 	movk	x3, #0x3f80, lsl #48
 2260b28:	f2c00602 	movk	x2, #0x30, lsl #32
 2260b2c:	f9000281 	str	x1, [x20]
 2260b30:	b9000a84 	str	w4, [x20,#8]
 2260b34:	d2801d00 	mov	x0, #0xe8                  	// #232
 2260b38:	3900329f 	strb	wzr, [x20,#12]
 2260b3c:	a9017e83 	stp	x3, xzr, [x20,#16]
 2260b40:	a9020a9f 	stp	xzr, x2, [x20,#32]
 2260b44:	f900abf4 	str	x20, [sp,#336]
 2260b48:	978712ca 	bl	425670 <_Znwm@plt>
 2260b4c:	aa0003f4 	mov	x20, x0
 2260b50:	910543e2 	add	x2, sp, #0x150
 2260b54:	910563e1 	add	x1, sp, #0x158
 2260b58:	9402c892 	bl	2312da0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68ad0>
 2260b5c:	f940d260 	ldr	x0, [x19,#416]
 2260b60:	f900d274 	str	x20, [x19,#416]
 2260b64:	b40000c0 	cbz	x0, 2260b7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d7ac>
 2260b68:	f9400001 	ldr	x1, [x0]
 2260b6c:	f9400421 	ldr	x1, [x1,#8]
 2260b70:	d63f0020 	blr	x1
 2260b74:	f940d274 	ldr	x20, [x19,#416]
 2260b78:	b4000054 	cbz	x20, 2260b80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d7b0>
 2260b7c:	91030294 	add	x20, x20, #0xc0
 2260b80:	aa1403e1 	mov	x1, x20
 2260b84:	910563e0 	add	x0, sp, #0x158
 2260b88:	97fff3a0 	bl	225da08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92a638>
 2260b8c:	f940abe0 	ldr	x0, [sp,#336]
 2260b90:	b4000080 	cbz	x0, 2260ba0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d7d0>
 2260b94:	f9400001 	ldr	x1, [x0]
 2260b98:	f9400421 	ldr	x1, [x1,#8]
 2260b9c:	d63f0020 	blr	x1
 2260ba0:	9101c260 	add	x0, x19, #0x70
 2260ba4:	97fff933 	bl	225f070 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92bca0>
 2260ba8:	d2844f41 	mov	x1, #0x227a                	// #8826
 2260bac:	d2801c00 	mov	x0, #0xe0                  	// #224
 2260bb0:	f2b088c1 	movk	x1, #0x8446, lsl #16
 2260bb4:	f2d21241 	movk	x1, #0x9092, lsl #32
 2260bb8:	f2e03ac1 	movk	x1, #0x1d6, lsl #48
 2260bbc:	f90047e1 	str	x1, [sp,#136]
 2260bc0:	978712ac 	bl	425670 <_Znwm@plt>
 2260bc4:	d2844f41 	mov	x1, #0x227a                	// #8826
 2260bc8:	aa0003f4 	mov	x20, x0
 2260bcc:	f2b088c1 	movk	x1, #0x8446, lsl #16
 2260bd0:	f2d21241 	movk	x1, #0x9092, lsl #32
 2260bd4:	f2e03ac1 	movk	x1, #0x1d6, lsl #48
 2260bd8:	9402ced6 	bl	2314730 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6a460>
 2260bdc:	f9403660 	ldr	x0, [x19,#104]
 2260be0:	f9003674 	str	x20, [x19,#104]
 2260be4:	b40000c0 	cbz	x0, 2260bfc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d82c>
 2260be8:	f9400001 	ldr	x1, [x0]
 2260bec:	f9400421 	ldr	x1, [x1,#8]
 2260bf0:	d63f0020 	blr	x1
 2260bf4:	f9403674 	ldr	x20, [x19,#104]
 2260bf8:	b4000054 	cbz	x20, 2260c00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d830>
 2260bfc:	91030294 	add	x20, x20, #0xc0
 2260c00:	aa1403e1 	mov	x1, x20
 2260c04:	910223e0 	add	x0, sp, #0x88
 2260c08:	97fff55e 	bl	225e180 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92adb0>
 2260c0c:	d2800c00 	mov	x0, #0x60                  	// #96
 2260c10:	f940367b 	ldr	x27, [x19,#104]
 2260c14:	97871297 	bl	425670 <_Znwm@plt>
 2260c18:	4f000400 	movi	v0.4s, #0x0
 2260c1c:	aa0003f4 	mov	x20, x0
 2260c20:	90076db5 	adrp	x21, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 2260c24:	9135a2b5 	add	x21, x21, #0xd68
 2260c28:	b900081f 	str	wzr, [x0,#8]
 2260c2c:	a9017c1f 	stp	xzr, xzr, [x0,#16]
 2260c30:	3d800800 	str	q0, [x0,#32]
 2260c34:	3d800c00 	str	q0, [x0,#48]
 2260c38:	3d801000 	str	q0, [x0,#64]
 2260c3c:	3d801400 	str	q0, [x0,#80]
 2260c40:	08dffea0 	ldarb	w0, [x21]
 2260c44:	90076db6 	adrp	x22, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 2260c48:	36001fa0 	tbz	w0, #0, 226103c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92dc6c>
 2260c4c:	aa1403f7 	mov	x23, x20
 2260c50:	b94d72c0 	ldr	w0, [x22,#3440]
 2260c54:	91008298 	add	x24, x20, #0x20
 2260c58:	b9000a80 	str	w0, [x20,#8]
 2260c5c:	f0006ef9 	adrp	x25, 303f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x94d410>
 2260c60:	91064339 	add	x25, x25, #0x190
 2260c64:	f80106f9 	str	x25, [x23],#16
 2260c68:	91010296 	add	x22, x20, #0x40
 2260c6c:	f9000a9f 	str	xzr, [x20,#16]
 2260c70:	d2800101 	mov	x1, #0x8                   	// #8
 2260c74:	f900129f 	str	xzr, [x20,#32]
 2260c78:	d2800800 	mov	x0, #0x40                  	// #64
 2260c7c:	a900ff1f 	stp	xzr, xzr, [x24,#8]
 2260c80:	f9000f1f 	str	xzr, [x24,#24]
 2260c84:	f900229f 	str	xzr, [x20,#64]
 2260c88:	a900fedf 	stp	xzr, xzr, [x22,#8]
 2260c8c:	f9000edf 	str	xzr, [x22,#24]
 2260c90:	f90006e1 	str	x1, [x23,#8]
 2260c94:	97871277 	bl	425670 <_Znwm@plt>
 2260c98:	f94006f5 	ldr	x21, [x23,#8]
 2260c9c:	aa0003fa 	mov	x26, x0
 2260ca0:	f9000a9a 	str	x26, [x20,#16]
 2260ca4:	d2804000 	mov	x0, #0x200                 	// #512
 2260ca8:	d10006b5 	sub	x21, x21, #0x1
 2260cac:	d341feb5 	lsr	x21, x21, #1
 2260cb0:	8b150f5c 	add	x28, x26, x21, lsl #3
 2260cb4:	9787126f 	bl	425670 <_Znwm@plt>
 2260cb8:	4e080c00 	dup	v0.2d, x0
 2260cbc:	91080001 	add	x1, x0, #0x200
 2260cc0:	a9017301 	stp	x1, x28, [x24,#16]
 2260cc4:	a90086c0 	stp	x0, x1, [x22,#8]
 2260cc8:	f9000edc 	str	x28, [x22,#24]
 2260ccc:	f9405f76 	ldr	x22, [x27,#184]
 2260cd0:	3d800a80 	str	q0, [x20,#32]
 2260cd4:	f8357b40 	str	x0, [x26,x21,lsl #3]
 2260cd8:	f9001ae0 	str	x0, [x23,#48]
 2260cdc:	f9005f74 	str	x20, [x27,#184]
 2260ce0:	b4000356 	cbz	x22, 2260d48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d978>
 2260ce4:	f94002c1 	ldr	x1, [x22]
 2260ce8:	90ffffe0 	adrp	x0, 225c000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x928c30>
 2260cec:	91150000 	add	x0, x0, #0x540
 2260cf0:	f9400421 	ldr	x1, [x1,#8]
 2260cf4:	eb00003f 	cmp	x1, x0
 2260cf8:	54002141 	b.ne	2261120 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92dd50>
 2260cfc:	aa1603e1 	mov	x1, x22
 2260d00:	f9400ac0 	ldr	x0, [x22,#16]
 2260d04:	f8010439 	str	x25, [x1],#16
 2260d08:	b4000180 	cbz	x0, 2260d38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d968>
 2260d0c:	f9402435 	ldr	x21, [x1,#72]
 2260d10:	f9401434 	ldr	x20, [x1,#40]
 2260d14:	910022b5 	add	x21, x21, #0x8
 2260d18:	eb15029f 	cmp	x20, x21
 2260d1c:	540000c2 	b.cs	2260d34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d964>
 2260d20:	f8408680 	ldr	x0, [x20],#8
 2260d24:	97871297 	bl	425780 <_ZdlPv@plt>
 2260d28:	eb1402bf 	cmp	x21, x20
 2260d2c:	54ffffa8 	b.hi	2260d20 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d950>
 2260d30:	f9400ac0 	ldr	x0, [x22,#16]
 2260d34:	97871293 	bl	425780 <_ZdlPv@plt>
 2260d38:	b9000adf 	str	wzr, [x22,#8]
 2260d3c:	aa1603e0 	mov	x0, x22
 2260d40:	d2800c01 	mov	x1, #0x60                  	// #96
 2260d44:	978718cb 	bl	427070 <_ZdlPvm@plt>
 2260d48:	d297a7a3 	mov	x3, #0xbd3d                	// #48445
 2260d4c:	910543e2 	add	x2, sp, #0x150
 2260d50:	f2b7c6a3 	movk	x3, #0xbe35, lsl #16
 2260d54:	910563e1 	add	x1, sp, #0x158
 2260d58:	f2d76c83 	movk	x3, #0xbb64, lsl #32
 2260d5c:	aa1303e0 	mov	x0, x19
 2260d60:	f2e00c63 	movk	x3, #0x63, lsl #48
 2260d64:	a9150fff 	stp	xzr, x3, [sp,#336]
 2260d68:	97ffef6c 	bl	225cb18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x929748>
 2260d6c:	f940abe0 	ldr	x0, [sp,#336]
 2260d70:	b4000080 	cbz	x0, 2260d80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d9b0>
 2260d74:	f9400001 	ldr	x1, [x0]
 2260d78:	f9400421 	ldr	x1, [x1,#8]
 2260d7c:	d63f0020 	blr	x1
 2260d80:	d29dd5c3 	mov	x3, #0xeeae                	// #61102
 2260d84:	910503e2 	add	x2, sp, #0x140
 2260d88:	f2a1dd83 	movk	x3, #0xeec, lsl #16
 2260d8c:	910523e1 	add	x1, sp, #0x148
 2260d90:	f2d76cc3 	movk	x3, #0xbb66, lsl #32
 2260d94:	91002260 	add	x0, x19, #0x8
 2260d98:	f2e00c63 	movk	x3, #0x63, lsl #48
 2260d9c:	a9140fff 	stp	xzr, x3, [sp,#320]
 2260da0:	97ffef5e 	bl	225cb18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x929748>
 2260da4:	f940a3e0 	ldr	x0, [sp,#320]
 2260da8:	b4000080 	cbz	x0, 2260db8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d9e8>
 2260dac:	f9400001 	ldr	x1, [x0]
 2260db0:	f9400421 	ldr	x1, [x1,#8]
 2260db4:	d63f0020 	blr	x1
 2260db8:	d29c6383 	mov	x3, #0xe31c                	// #58140
 2260dbc:	9104c3e2 	add	x2, sp, #0x130
 2260dc0:	f2b0f2c3 	movk	x3, #0x8796, lsl #16
 2260dc4:	9104e3e1 	add	x1, sp, #0x138
 2260dc8:	f2cd7823 	movk	x3, #0x6bc1, lsl #32
 2260dcc:	91004260 	add	x0, x19, #0x10
 2260dd0:	f2e021a3 	movk	x3, #0x10d, lsl #48
 2260dd4:	a9130fff 	stp	xzr, x3, [sp,#304]
 2260dd8:	97ffef50 	bl	225cb18 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x929748>
 2260ddc:	f9409be0 	ldr	x0, [sp,#304]
 2260de0:	b4000080 	cbz	x0, 2260df0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92da20>
 2260de4:	f9400001 	ldr	x1, [x0]
 2260de8:	f9400421 	ldr	x1, [x1,#8]
 2260dec:	d63f0020 	blr	x1
