
runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145:     file format elf64-littleaarch64


Disassembly of section .text:

00000000022608a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d4d0>:
 22608a0:	a9aa7bfd 	stp	x29, x30, [sp,#-352]!
 22608a4:	d28d0001 	mov	x1, #0x6800                	// #26624
 22608a8:	f2a3b761 	movk	x1, #0x1dbb, lsl #16
 22608ac:	910003fd 	mov	x29, sp
 22608b0:	a90153f3 	stp	x19, x20, [sp,#16]
 22608b4:	aa0003f3 	mov	x19, x0
 22608b8:	a9025bf5 	stp	x21, x22, [sp,#32]
 22608bc:	91052016 	add	x22, x0, #0x148
 22608c0:	9101c000 	add	x0, x0, #0x70
 22608c4:	a90363f7 	stp	x23, x24, [sp,#48]
 22608c8:	91062277 	add	x23, x19, #0x188
 22608cc:	a9046bf9 	stp	x25, x26, [sp,#64]
 22608d0:	a90573fb 	stp	x27, x28, [sp,#80]
 22608d4:	a9007e7f 	stp	xzr, xzr, [x19]
 22608d8:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 22608dc:	a9027e7f 	stp	xzr, xzr, [x19,#32]
 22608e0:	a9037e7f 	stp	xzr, xzr, [x19,#48]
 22608e4:	a9047e7f 	stp	xzr, xzr, [x19,#64]
 22608e8:	a9057e7f 	stp	xzr, xzr, [x19,#80]
 22608ec:	f90033e0 	str	x0, [sp,#96]
 22608f0:	d2800200 	mov	x0, #0x10                  	// #16
 22608f4:	a9067e7f 	stp	xzr, xzr, [x19,#96]
 22608f8:	a9077e7f 	stp	xzr, xzr, [x19,#112]
 22608fc:	a9087e7f 	stp	xzr, xzr, [x19,#128]
 2260900:	a9097e7f 	stp	xzr, xzr, [x19,#144]
 2260904:	a90a7e7f 	stp	xzr, xzr, [x19,#160]
 2260908:	a90b7e7f 	stp	xzr, xzr, [x19,#176]
 226090c:	a90c7e7f 	stp	xzr, xzr, [x19,#192]
 2260910:	a90d7e7f 	stp	xzr, xzr, [x19,#208]
 2260914:	a90e7e7f 	stp	xzr, xzr, [x19,#224]
 2260918:	a90f7e7f 	stp	xzr, xzr, [x19,#240]
 226091c:	a9107e7f 	stp	xzr, xzr, [x19,#256]
 2260920:	a9117e7f 	stp	xzr, xzr, [x19,#272]
 2260924:	a9127e7f 	stp	xzr, xzr, [x19,#288]
 2260928:	a9137e7f 	stp	xzr, xzr, [x19,#304]
 226092c:	f900a27f 	str	xzr, [x19,#320]
 2260930:	a9007edf 	stp	xzr, xzr, [x22]
 2260934:	a9017edf 	stp	xzr, xzr, [x22,#16]
 2260938:	a9027edf 	stp	xzr, xzr, [x22,#32]
 226093c:	a9037edf 	stp	xzr, xzr, [x22,#48]
 2260940:	a918fe7f 	stp	xzr, xzr, [x19,#392]
 2260944:	a919fe7f 	stp	xzr, xzr, [x19,#408]
 2260948:	f90043e1 	str	x1, [sp,#128]
 226094c:	97871349 	bl	425670 <_Znwm@plt>
 2260950:	aa0003f5 	mov	x21, x0
 2260954:	90076db4 	adrp	x20, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 2260958:	91352294 	add	x20, x20, #0xd48
 226095c:	b900081f 	str	wzr, [x0,#8]
 2260960:	7900181f 	strh	wzr, [x0,#12]
 2260964:	08dffe80 	ldarb	w0, [x20]
 2260968:	90076db8 	adrp	x24, 11014000 <stdout@@GLIBC_2.17+0xd01c430>
 226096c:	36003b40 	tbz	w0, #0, 22610d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92dd04>
 2260970:	b94d5302 	ldr	w2, [x24,#3408]
 2260974:	90006ec1 	adrp	x1, 3038000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x946410>
 2260978:	91126021 	add	x1, x1, #0x498
 226097c:	f90002a1 	str	x1, [x21]
 2260980:	b9000aa2 	str	w2, [x21,#8]
 2260984:	d2802100 	mov	x0, #0x108                 	// #264
 2260988:	79001abf 	strh	wzr, [x21,#12]
 226098c:	f94043f8 	ldr	x24, [sp,#128]
 2260990:	97871338 	bl	425670 <_Znwm@plt>
 2260994:	aa0003f4 	mov	x20, x0
 2260998:	aa1803e1 	mov	x1, x24
 226099c:	9402c879 	bl	2312b80 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x688b0>
 22609a0:	f940c660 	ldr	x0, [x19,#392]
 22609a4:	f900c674 	str	x20, [x19,#392]
 22609a8:	b40000a0 	cbz	x0, 22609bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d5ec>
 22609ac:	f9400001 	ldr	x1, [x0]
 22609b0:	f9400421 	ldr	x1, [x1,#8]
 22609b4:	d63f0020 	blr	x1
 22609b8:	f940c674 	ldr	x20, [x19,#392]
 22609bc:	f9405e80 	ldr	x0, [x20,#184]
 22609c0:	f9005e95 	str	x21, [x20,#184]
 22609c4:	b40000c0 	cbz	x0, 22609dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d60c>
 22609c8:	f9400001 	ldr	x1, [x0]
 22609cc:	f9400421 	ldr	x1, [x1,#8]
 22609d0:	d63f0020 	blr	x1
 22609d4:	f940c674 	ldr	x20, [x19,#392]
 22609d8:	b4000054 	cbz	x20, 22609e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d610>
 22609dc:	91030294 	add	x20, x20, #0xc0
 22609e0:	aa1403e1 	mov	x1, x20
 22609e4:	910203e0 	add	x0, sp, #0x80
 22609e8:	97fffdd0 	bl	2260128 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92cd58>
 22609ec:	d299a001 	mov	x1, #0xcd00                	// #52480
 22609f0:	d2801c00 	mov	x0, #0xe0                  	// #224
 22609f4:	f2afb8e1 	movk	x1, #0x7dc7, lsl #16
 22609f8:	f2c63a61 	movk	x1, #0x31d3, lsl #32
 22609fc:	f2e7f841 	movk	x1, #0x3fc2, lsl #48
 2260a00:	f9003be1 	str	x1, [sp,#112]
 2260a04:	9787131b 	bl	425670 <_Znwm@plt>
 2260a08:	d299a001 	mov	x1, #0xcd00                	// #52480
 2260a0c:	aa0003f4 	mov	x20, x0
 2260a10:	f2afb8e1 	movk	x1, #0x7dc7, lsl #16
 2260a14:	f2c63a61 	movk	x1, #0x31d3, lsl #32
 2260a18:	f2e7f841 	movk	x1, #0x3fc2, lsl #48
 2260a1c:	9402d309 	bl	2315640 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6b370>
 2260a20:	f940ca60 	ldr	x0, [x19,#400]
 2260a24:	f900ca74 	str	x20, [x19,#400]
 2260a28:	b40000c0 	cbz	x0, 2260a40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d670>
 2260a2c:	f9400001 	ldr	x1, [x0]
 2260a30:	f9400421 	ldr	x1, [x1,#8]
 2260a34:	d63f0020 	blr	x1
 2260a38:	f940ca74 	ldr	x20, [x19,#400]
 2260a3c:	b4000054 	cbz	x20, 2260a44 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92d674>
 2260a40:	91030294 	add	x20, x20, #0xc0
 2260a44:	aa1403e1 	mov	x1, x20
 2260a48:	9101c3e0 	add	x0, sp, #0x70
 2260a4c:	97fff7ab 	bl	225e8f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x92b528>
 2260a50:	d29a4001 	mov	x1, #0xd200                	// #53760
 2260a54:	d2800300 	mov	x0, #0x18                  	// #24
 2260a58:	f2a32301 	movk	x1, #0x1918, lsl #16
 2260a5c:	f2c5b901 	movk	x1, #0x2dc8, lsl #32
 2260a60:	f2f76cc1 	movk	x1, #0xbb66, lsl #48
 2260a64:	f9003fe1 	str	x1, [sp,#120]
 2260a68:	97871302 	bl	425670 <_Znwm@plt>
 2260a6c:	1e2e1000 	fmov	s0, #1.000000000000000000e+00
 2260a70:	aa0003f4 	mov	x20, x0
 2260a74:	52801fe1 	mov	w1, #0xff                  	// #255
 2260a78:	9402c02e 	bl	2310b30 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x66860>
 2260a7c:	d2801d00 	mov	x0, #0xe8                  	// #232
 2260a80:	f900aff4 	str	x20, [sp,#344]
 2260a84:	978712fb 	bl	425670 <_Znwm@plt>
 2260a88:	aa0003f4 	mov	x20, x0
 2260a8c:	910563e2 	add	x2, sp, #0x158
 2260a90:	9101e3e1 	add	x1, sp, #0x78
 2260a94:	9402c8c3 	bl	2312da0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x68ad0>
 2260a98:	f940ce60 	ldr	x0, [x19,#408]
 2260a9c:	f900ce74 	str	x20, [x19,#408]
