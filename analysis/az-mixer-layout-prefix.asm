
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130b08 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930c80>:
 2130b08:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2130b0c:	910003fd 	mov	x29, sp
 2130b10:	a90153f3 	stp	x19, x20, [sp,#16]
 2130b14:	9117c014 	add	x20, x0, #0x5f0
 2130b18:	91170013 	add	x19, x0, #0x5c0
 2130b1c:	aa1303e0 	mov	x0, x19
 2130b20:	a9025bf5 	stp	x21, x22, [sp,#32]
 2130b24:	aa0103f6 	mov	x22, x1
 2130b28:	9407ed6e 	bl	232c0e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3fc8>
 2130b2c:	a9408295 	ldp	x21, x0, [x20,#8]
 2130b30:	eb0002bf 	cmp	x21, x0
 2130b34:	54000240 	b.eq	2130b7c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930cf4>
 2130b38:	910022a2 	add	x2, x21, #0x8
 2130b3c:	9100e3e1 	add	x1, sp, #0x38
 2130b40:	aa1603e0 	mov	x0, x22
 2130b44:	f9001fe2 	str	x2, [sp,#56]
 2130b48:	94000f6c 	bl	21348f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934a70>
 2130b4c:	b94002c0 	ldr	w0, [x22]
 2130b50:	f9400681 	ldr	x1, [x20,#8]
 2130b54:	4a807c00 	eor	w0, w0, w0, asr #31
 2130b58:	b90002a0 	str	w0, [x21]
 2130b5c:	91006020 	add	x0, x1, #0x18
 2130b60:	f9000680 	str	x0, [x20,#8]
 2130b64:	aa1303e0 	mov	x0, x19
 2130b68:	9407ed6a 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130b6c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130b70:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2130b74:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2130b78:	d65f03c0 	ret
 2130b7c:	aa1603e2 	mov	x2, x22
 2130b80:	aa1503e1 	mov	x1, x21
 2130b84:	aa1403e0 	mov	x0, x20
 2130b88:	94000fc8 	bl	2134aa8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934c20>
 2130b8c:	aa1303e0 	mov	x0, x19
 2130b90:	9407ed60 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130b94:	a94153f3 	ldp	x19, x20, [sp,#16]
 2130b98:	a9425bf5 	ldp	x21, x22, [sp,#32]
 2130b9c:	a8c47bfd 	ldp	x29, x30, [sp],#64
 2130ba0:	d65f03c0 	ret
 2130ba4:	aa0003f4 	mov	x20, x0
 2130ba8:	aa1303e0 	mov	x0, x19
 2130bac:	9407ed59 	bl	232c110 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3ff8>
 2130bb0:	aa1403e0 	mov	x0, x20
 2130bb4:	978bd057 	bl	424d10 <_Unwind_Resume@plt>
 2130bb8:	a9b17bfd 	stp	x29, x30, [sp,#-240]!
 2130bbc:	910003fd 	mov	x29, sp
 2130bc0:	a90153f3 	stp	x19, x20, [sp,#16]
 2130bc4:	aa0003f3 	mov	x19, x0
 2130bc8:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130bcc:	a9046bf9 	stp	x25, x26, [sp,#64]
 2130bd0:	aa1303f9 	mov	x25, x19
 2130bd4:	91056000 	add	x0, x0, #0x158
 2130bd8:	a9025bf5 	stp	x21, x22, [sp,#32]
 2130bdc:	b000d0b4 	adrp	x20, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2130be0:	9118e294 	add	x20, x20, #0x638
 2130be4:	a90363f7 	stp	x23, x24, [sp,#48]
 2130be8:	a90573fb 	stp	x27, x28, [sp,#80]
 2130bec:	f8008720 	str	x0, [x25],#8
 2130bf0:	08dffe80 	ldarb	w0, [x20]
 2130bf4:	b000d0b5 	adrp	x21, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2130bf8:	36002740 	tbz	w0, #0, 21310e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x931258>
 2130bfc:	b94642a3 	ldr	w3, [x21,#1600]
 2130c00:	910a0278 	add	x24, x19, #0x280
 2130c04:	d0006895 	adrp	x21, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c08:	910ba2b5 	add	x21, x21, #0x2e8
 2130c0c:	91008274 	add	x20, x19, #0x20
 2130c10:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c14:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c18:	91082021 	add	x1, x1, #0x208
 2130c1c:	910b0000 	add	x0, x0, #0x2c0
 2130c20:	52802002 	mov	w2, #0x100                 	// #256
 2130c24:	a9000261 	stp	x1, x0, [x19]
 2130c28:	b9001263 	str	w3, [x19,#16]
 2130c2c:	b9001662 	str	w2, [x19,#20]
 2130c30:	7900327f 	strh	wzr, [x19,#24]
 2130c34:	f90043f4 	str	x20, [sp,#128]
 2130c38:	f9000295 	str	x21, [x20]
 2130c3c:	91008280 	add	x0, x20, #0x20
 2130c40:	3900229f 	strb	wzr, [x20,#8]
 2130c44:	3900329f 	strb	wzr, [x20,#12]
 2130c48:	9407ec36 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130c4c:	3901429f 	strb	wzr, [x20,#80]
 2130c50:	9101a280 	add	x0, x20, #0x68
 2130c54:	91026294 	add	x20, x20, #0x98
 2130c58:	9407ec32 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130c5c:	eb18029f 	cmp	x20, x24
 2130c60:	54fffec1 	b.ne	2130c38 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930db0>
 2130c64:	52806014 	mov	w20, #0x300                 	// #768
 2130c68:	d0006896 	adrp	x22, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130c6c:	910e02d6 	add	x22, x22, #0x380
 2130c70:	f9014276 	str	x22, [x19,#640]
 2130c74:	79051274 	strh	w20, [x19,#648]
 2130c78:	910a4260 	add	x0, x19, #0x290
 2130c7c:	b9000f1f 	str	wzr, [x24,#12]
 2130c80:	5280003b 	mov	w27, #0x1                   	// #1
 2130c84:	52800055 	mov	w21, #0x2                   	// #2
 2130c88:	5280007c 	mov	w28, #0x3                   	// #3
 2130c8c:	9407ec25 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130c90:	f9016a7f 	str	xzr, [x19,#720]
 2130c94:	910b0263 	add	x3, x19, #0x2c0
 2130c98:	390b627f 	strb	wzr, [x19,#728]
 2130c9c:	f9017276 	str	x22, [x19,#736]
 2130ca0:	9111c262 	add	x2, x19, #0x470
 2130ca4:	7905d274 	strh	w20, [x19,#744]
 2130ca8:	91104261 	add	x1, x19, #0x410
 2130cac:	b902ee7b 	str	w27, [x19,#748]
 2130cb0:	910bc260 	add	x0, x19, #0x2f0
 2130cb4:	a9007c7f 	stp	xzr, xzr, [x3]
 2130cb8:	9115c263 	add	x3, x19, #0x570
 2130cbc:	b000d0ba 	adrp	x26, 3b45000 <stdout@@GLIBC_2.17+0x3f40>
 2130cc0:	a9090be1 	stp	x1, x2, [sp,#144]
 2130cc4:	91180357 	add	x23, x26, #0x600
 2130cc8:	f90057e3 	str	x3, [sp,#168]
 2130ccc:	9407ec15 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130cd0:	910c8267 	add	x7, x19, #0x320
 2130cd4:	91150264 	add	x4, x19, #0x540
 2130cd8:	9117c265 	add	x5, x19, #0x5f0
 2130cdc:	91170266 	add	x6, x19, #0x5c0
 2130ce0:	91100261 	add	x1, x19, #0x400
 2130ce4:	f9019a7f 	str	xzr, [x19,#816]
 2130ce8:	390ce27f 	strb	wzr, [x19,#824]
 2130cec:	910d4260 	add	x0, x19, #0x350
 2130cf0:	f901a276 	str	x22, [x19,#832]
 2130cf4:	79069274 	strh	w20, [x19,#840]
 2130cf8:	b9034e75 	str	w21, [x19,#844]
 2130cfc:	a9007cff 	stp	xzr, xzr, [x7]
 2130d00:	f90037e1 	str	x1, [sp,#104]
 2130d04:	f9003fe6 	str	x6, [sp,#120]
 2130d08:	f90047e4 	str	x4, [sp,#136]
 2130d0c:	f90053e5 	str	x5, [sp,#160]
 2130d10:	9407ec04 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130d14:	910e0267 	add	x7, x19, #0x380
 2130d18:	f901ca7f 	str	xzr, [x19,#912]
 2130d1c:	390e627f 	strb	wzr, [x19,#920]
 2130d20:	910ec260 	add	x0, x19, #0x3b0
 2130d24:	f901d276 	str	x22, [x19,#928]
 2130d28:	d2800016 	mov	x22, #0x0                   	// #0
 2130d2c:	79075274 	strh	w20, [x19,#936]
 2130d30:	b903ae7c 	str	w28, [x19,#940]
 2130d34:	a9007cff 	stp	xzr, xzr, [x7]
 2130d38:	f9003bf8 	str	x24, [sp,#112]
 2130d3c:	9407ebf9 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130d40:	910f8268 	add	x8, x19, #0x3e0
 2130d44:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130d48:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130d4c:	910f0007 	add	x7, x0, #0x3c0
 2130d50:	91106021 	add	x1, x1, #0x418
 2130d54:	91108260 	add	x0, x19, #0x420
 2130d58:	a9007d1f 	stp	xzr, xzr, [x8]
 2130d5c:	f901fa7f 	str	xzr, [x19,#1008]
 2130d60:	390fe27f 	strb	wzr, [x19,#1016]
 2130d64:	f9020267 	str	x7, [x19,#1024]
 2130d68:	b9040a7f 	str	wzr, [x19,#1032]
 2130d6c:	79081a7f 	strh	wzr, [x19,#1036]
 2130d70:	f9020a61 	str	x1, [x19,#1040]
 2130d74:	3910627f 	strb	wzr, [x19,#1048]
 2130d78:	f9005fe7 	str	x7, [sp,#184]
 2130d7c:	9407ebe9 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130d80:	91114261 	add	x1, x19, #0x450
 2130d84:	91120260 	add	x0, x19, #0x480
 2130d88:	a9007c3f 	stp	xzr, xzr, [x1]
 2130d8c:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130d90:	91106021 	add	x1, x1, #0x418
 2130d94:	f902327f 	str	xzr, [x19,#1120]
 2130d98:	3911a27f 	strb	wzr, [x19,#1128]
 2130d9c:	f9023a61 	str	x1, [x19,#1136]
 2130da0:	3911e27f 	strb	wzr, [x19,#1144]
 2130da4:	9407ebdf 	bl	232bd20 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1a3c08>
 2130da8:	f902627f 	str	xzr, [x19,#1216]
 2130dac:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130db0:	9100a021 	add	x1, x1, #0x28
 2130db4:	f9026a61 	str	x1, [x19,#1232]
 2130db8:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130dbc:	91028021 	add	x1, x1, #0xa0
 2130dc0:	f9027a61 	str	x1, [x19,#1264]
 2130dc4:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130dc8:	9103e021 	add	x1, x1, #0xf8
 2130dcc:	f9028a61 	str	x1, [x19,#1296]
 2130dd0:	d0006881 	adrp	x1, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130dd4:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130dd8:	910ce022 	add	x2, x1, #0x338
 2130ddc:	91018000 	add	x0, x0, #0x60
 2130de0:	52800101 	mov	w1, #0x8                   	// #8
 2130de4:	f9027260 	str	x0, [x19,#1248]
 2130de8:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130dec:	91034000 	add	x0, x0, #0xd0
 2130df0:	3914ea61 	strb	w1, [x19,#1338]
 2130df4:	9112c261 	add	x1, x19, #0x4b0
 2130df8:	f9028260 	str	x0, [x19,#1280]
 2130dfc:	d0006880 	adrp	x0, 2e42000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87f1a8>
 2130e00:	9104a000 	add	x0, x0, #0x128
 2130e04:	3913227f 	strb	wzr, [x19,#1224]
 2130e08:	7909b27b 	strh	w27, [x19,#1240]
 2130e0c:	39136a7f 	strb	wzr, [x19,#1242]
 2130e10:	7909f27f 	strh	wzr, [x19,#1272]
 2130e14:	3914227f 	strb	wzr, [x19,#1288]
 2130e18:	790a327b 	strh	w27, [x19,#1304]
 2130e1c:	f9029260 	str	x0, [x19,#1312]
 2130e20:	52a04000 	mov	w0, #0x2000000             	// #33554432
 2130e24:	b904ea60 	str	w0, [x19,#1256]
 2130e28:	91150260 	add	x0, x19, #0x540
 2130e2c:	790a527c 	strh	w28, [x19,#1320]
 2130e30:	b000689c 	adrp	x28, 2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x87e1a8>
 2130e34:	3914aa7f 	strb	wzr, [x19,#1322]
 2130e38:	911ec39c 	add	x28, x28, #0x7b0
 2130e3c:	f9029a62 	str	x2, [x19,#1328]
