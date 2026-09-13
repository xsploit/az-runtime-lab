
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000215e160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95e2d8>:
 215e160:	a9ba7bfd 	stp	x29, x30, [sp,#-96]!
 215e164:	d28d04c1 	mov	x1, #0x6826                	// #26662
 215e168:	f2b1a9c1 	movk	x1, #0x8d4e, lsl #16
 215e16c:	910003fd 	mov	x29, sp
 215e170:	a90153f3 	stp	x19, x20, [sp,#16]
 215e174:	aa0003f3 	mov	x19, x0
 215e178:	f2d8ad41 	movk	x1, #0xc56a, lsl #32
 215e17c:	a9025bf5 	stp	x21, x22, [sp,#32]
 215e180:	f2e03b81 	movk	x1, #0x1dc, lsl #48
 215e184:	d2800f00 	mov	x0, #0x78                  	// #120
 215e188:	a90363f7 	stp	x23, x24, [sp,#48]
 215e18c:	f90023f9 	str	x25, [sp,#64]
 215e190:	a9007e7f 	stp	xzr, xzr, [x19]
 215e194:	a9017e7f 	stp	xzr, xzr, [x19,#16]
 215e198:	a9027e7f 	stp	xzr, xzr, [x19,#32]
 215e19c:	a9037e7f 	stp	xzr, xzr, [x19,#48]
 215e1a0:	a9047e7f 	stp	xzr, xzr, [x19,#64]
 215e1a4:	a9057e7f 	stp	xzr, xzr, [x19,#80]
 215e1a8:	f900327f 	str	xzr, [x19,#96]
 215e1ac:	f9002fe1 	str	x1, [sp,#88]
 215e1b0:	978b1ae4 	bl	424d40 <_Znwm@plt>
 215e1b4:	aa0003f4 	mov	x20, x0
 215e1b8:	f000d295 	adrp	x21, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 215e1bc:	9127c2b5 	add	x21, x21, #0x9f0
 215e1c0:	08dffea0 	ldarb	w0, [x21]
 215e1c4:	f000d299 	adrp	x25, 3bb1000 <stdout@@GLIBC_2.17+0x6ff40>
 215e1c8:	36005620 	tbz	w0, #0, 215ec8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95ee04>
 215e1cc:	d29fe006 	mov	x6, #0xff00                	// #65280
 215e1d0:	b949fb28 	ldr	w8, [x25,#2552]
 215e1d4:	f2a01906 	movk	x6, #0xc8, lsl #16
 215e1d8:	d2a7f003 	mov	x3, #0x3f800000            	// #1065353216
 215e1dc:	d2a7f002 	mov	x2, #0x3f800000            	// #1065353216
 215e1e0:	52993427 	mov	w7, #0xc9a1                	// #51617
 215e1e4:	f2c01906 	movk	x6, #0xc8, lsl #32
 215e1e8:	d29ffa05 	mov	x5, #0xffd0                	// #65488
 215e1ec:	d29fe004 	mov	x4, #0xff00                	// #65280
 215e1f0:	f2c66663 	movk	x3, #0x3333, lsl #32
 215e1f4:	f2d999a2 	movk	x2, #0xcccd, lsl #32
 215e1f8:	b2091be1 	mov	x1, #0x3f8000003f800000    	// #4575657222473777152
 215e1fc:	90006797 	adrp	x23, 2e4e000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x88b1a8>
 215e200:	72a00907 	movk	w7, #0x48, lsl #16
 215e204:	912942f7 	add	x23, x23, #0xa50
 215e208:	f2e01fe6 	movk	x6, #0xff, lsl #48
 215e20c:	f2c01fe5 	movk	x5, #0xff, lsl #32
 215e210:	f2e01fe4 	movk	x4, #0xff, lsl #48
 215e214:	f2e7fe63 	movk	x3, #0x3ff3, lsl #48
 215e218:	f2e7a982 	movk	x2, #0x3d4c, lsl #48
 215e21c:	f9000297 	str	x23, [x20]
 215e220:	d2800800 	mov	x0, #0x40                  	// #64
 215e224:	b9000a88 	str	w8, [x20,#8]
 215e228:	b9000e87 	str	w7, [x20,#12]
 215e22c:	a9011686 	stp	x6, x5, [x20,#16]
 215e230:	a9020e84 	stp	x4, x3, [x20,#32]
 215e234:	a9030681 	stp	x1, x1, [x20,#48]
 215e238:	a9040681 	stp	x1, x1, [x20,#64]
 215e23c:	a9050681 	stp	x1, x1, [x20,#80]
 215e240:	a9060681 	stp	x1, x1, [x20,#96]
 215e244:	f9003a82 	str	x2, [x20,#112]
 215e248:	f9402ff6 	ldr	x22, [sp,#88]
 215e24c:	978b1abd 	bl	424d40 <_Znwm@plt>
 215e250:	aa0003f8 	mov	x24, x0
 215e254:	aa1603e1 	mov	x1, x22
 215e258:	52800063 	mov	w3, #0x3                   	// #3
 215e25c:	52800022 	mov	w2, #0x1                   	// #1
 215e260:	94024744 	bl	21eff70 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67e58>
 215e264:	f9400276 	ldr	x22, [x19]
 215e268:	f9000278 	str	x24, [x19]
 215e26c:	b4000356 	cbz	x22, 215e2d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95e44c>
 215e270:	f94002c1 	ldr	x1, [x22]
 215e274:	f0fffee0 	adrp	x0, 213d000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93d178>
 215e278:	911d8000 	add	x0, x0, #0x760
 215e27c:	f9400421 	ldr	x1, [x1,#8]
 215e280:	eb00003f 	cmp	x1, x0
 215e284:	540059c1 	b.ne	215edbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95ef34>
 215e288:	f9400ec0 	ldr	x0, [x22,#24]
 215e28c:	b0006821 	adrp	x1, 2e63000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a01a8>
 215e290:	91190021 	add	x1, x1, #0x640
 215e294:	f90002c1 	str	x1, [x22]
 215e298:	b4000140 	cbz	x0, 215e2c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95e438>
 215e29c:	f9400002 	ldr	x2, [x0]
 215e2a0:	f0fffee1 	adrp	x1, 213d000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93d178>
 215e2a4:	91184021 	add	x1, x1, #0x610
 215e2a8:	f9400442 	ldr	x2, [x2,#8]
 215e2ac:	eb01005f 	cmp	x2, x1
 215e2b0:	54005a61 	b.ne	215edfc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95ef74>
 215e2b4:	b900081f 	str	wzr, [x0,#8]
 215e2b8:	d2800f01 	mov	x1, #0x78                  	// #120
 215e2bc:	978b20e9 	bl	426660 <_ZdlPvm@plt>
 215e2c0:	b9000adf 	str	wzr, [x22,#8]
 215e2c4:	aa1603e0 	mov	x0, x22
 215e2c8:	d2800801 	mov	x1, #0x40                  	// #64
 215e2cc:	978b20e5 	bl	426660 <_ZdlPvm@plt>
 215e2d0:	f9400278 	ldr	x24, [x19]
 215e2d4:	aa1803e0 	mov	x0, x24
 215e2d8:	910143e1 	add	x1, sp, #0x50
 215e2dc:	f9002bf4 	str	x20, [sp,#80]
 215e2e0:	940247c0 	bl	21f01e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x680c8>
 215e2e4:	f9402be0 	ldr	x0, [sp,#80]
 215e2e8:	b4000140 	cbz	x0, 215e310 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95e488>
 215e2ec:	f9400002 	ldr	x2, [x0]
 215e2f0:	f0fffee1 	adrp	x1, 213d000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93d178>
 215e2f4:	91184021 	add	x1, x1, #0x610
 215e2f8:	f9400442 	ldr	x2, [x2,#8]
 215e2fc:	eb01005f 	cmp	x2, x1
 215e300:	540057a1 	b.ne	215edf4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95ef6c>
 215e304:	b900081f 	str	wzr, [x0,#8]
 215e308:	d2800f01 	mov	x1, #0x78                  	// #120
 215e30c:	978b20d5 	bl	426660 <_ZdlPvm@plt>
 215e310:	f9400261 	ldr	x1, [x19]
 215e314:	910163e0 	add	x0, sp, #0x58
 215e318:	97ff82ec 	bl	213eec8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93f040>
 215e31c:	d29fe221 	mov	x1, #0xff11                	// #65297
 215e320:	d2800f00 	mov	x0, #0x78                  	// #120
 215e324:	f2aeb801 	movk	x1, #0x75c0, lsl #16
 215e328:	f2d00dc1 	movk	x1, #0x806e, lsl #32
 215e32c:	f2e02141 	movk	x1, #0x10a, lsl #48
 215e330:	f9002be1 	str	x1, [sp,#80]
 215e334:	978b1a83 	bl	424d40 <_Znwm@plt>
 215e338:	aa0003f4 	mov	x20, x0
 215e33c:	08dffea0 	ldarb	w0, [x21]
 215e340:	36004cc0 	tbz	w0, #0, 215ecd8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x95ee50>
 215e344:	d29fe006 	mov	x6, #0xff00                	// #65280
 215e348:	b949fb28 	ldr	w8, [x25,#2552]
 215e34c:	f2a01906 	movk	x6, #0xc8, lsl #16
