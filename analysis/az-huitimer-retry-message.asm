
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>:
 21f6040:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f6044:	9000cf01 	adrp	x1, 3bd6000 <stdout@@GLIBC_2.17+0x94f40>
 21f6048:	910003fd 	mov	x29, sp
 21f604c:	f946dc22 	ldr	x2, [x1,#3512]
 21f6050:	b40000c2 	cbz	x2, 21f6068 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df50>
 21f6054:	aa0003e1 	mov	x1, x0
 21f6058:	aa0203e0 	mov	x0, x2
 21f605c:	94001885 	bl	21fc270 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x74158>
 21f6060:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f6064:	d65f03c0 	ret
 21f6068:	b9401002 	ldr	w2, [x0,#16]
 21f606c:	5289eb01 	mov	w1, #0x4f58                	// #20312
 21f6070:	72aa4861 	movk	w1, #0x5243, lsl #16
 21f6074:	f9000bf3 	str	x19, [sp,#16]
 21f6078:	f90017e0 	str	x0, [sp,#40]
 21f607c:	6b01005f 	cmp	w2, w1
 21f6080:	54000220 	b.eq	21f60c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6dfac>
 21f6084:	9100a3e0 	add	x0, sp, #0x28
 21f6088:	c89ffc1f 	stlr	xzr, [x0]
 21f608c:	c8dffc13 	ldar	x19, [x0]
 21f6090:	b4000133 	cbz	x19, 21f60b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df9c>
 21f6094:	aa1303e0 	mov	x0, x19
 21f6098:	9792eb48 	bl	6b0db8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x20228>
 21f609c:	72001c1f 	tst	w0, #0xff
 21f60a0:	540000a0 	b.eq	21f60b4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df9c>
 21f60a4:	f9400261 	ldr	x1, [x19]
 21f60a8:	aa1303e0 	mov	x0, x19
 21f60ac:	f9400421 	ldr	x1, [x1,#8]
 21f60b0:	d63f0020 	blr	x1
 21f60b4:	d2800000 	mov	x0, #0x0                   	// #0
 21f60b8:	f9400bf3 	ldr	x19, [sp,#16]
 21f60bc:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f60c0:	d65f03c0 	ret
 21f60c4:	91003000 	add	x0, x0, #0xc
 21f60c8:	885ffc01 	ldaxr	w1, [x0]
 21f60cc:	11000421 	add	w1, w1, #0x1
 21f60d0:	8802fc01 	stlxr	w2, w1, [x0]
 21f60d4:	35ffffa2 	cbnz	w2, 21f60c8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6dfb0>
 21f60d8:	9100a3e0 	add	x0, sp, #0x28
 21f60dc:	17ffffec 	b	21f608c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df74>
 21f60e0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21f60e4:	910003fd 	mov	x29, sp
 21f60e8:	a90153f3 	stp	x19, x20, [sp,#16]
 21f60ec:	aa0003f4 	mov	x20, x0
 21f60f0:	aa0103f3 	mov	x19, x1
 21f60f4:	f9400400 	ldr	x0, [x0,#8]
 21f60f8:	b40002e0 	cbz	x0, 21f6154 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e03c>
 21f60fc:	f9400c34 	ldr	x20, [x1,#24]
 21f6100:	eb14001f 	cmp	x0, x20
 21f6104:	54000200 	b.eq	21f6144 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e02c>
 21f6108:	b9401002 	ldr	w2, [x0,#16]
 21f610c:	5289eb01 	mov	w1, #0x4f58                	// #20312
 21f6110:	72aa4861 	movk	w1, #0x5243, lsl #16
 21f6114:	6b01005f 	cmp	w2, w1
 21f6118:	540005c0 	b.eq	21f61d0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e0b8>
 21f611c:	f9000e60 	str	x0, [x19,#24]
 21f6120:	b4000134 	cbz	x20, 21f6144 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e02c>
 21f6124:	aa1403e0 	mov	x0, x20
 21f6128:	9792eb24 	bl	6b0db8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x20228>
 21f612c:	72001c1f 	tst	w0, #0xff
 21f6130:	540000a0 	b.eq	21f6144 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e02c>
 21f6134:	f9400281 	ldr	x1, [x20]
 21f6138:	aa1403e0 	mov	x0, x20
 21f613c:	f9400421 	ldr	x1, [x1,#8]
 21f6140:	d63f0020 	blr	x1
 21f6144:	aa1303e0 	mov	x0, x19
 21f6148:	a94153f3 	ldp	x19, x20, [sp,#16]
 21f614c:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21f6150:	17ffffbc 	b	21f6040 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6df28>
 21f6154:	d2800400 	mov	x0, #0x20                  	// #32
 21f6158:	f90013f5 	str	x21, [sp,#32]
 21f615c:	9788baf9 	bl	424d40 <_Znwm@plt>
 21f6160:	aa0003f5 	mov	x21, x0
 21f6164:	9792f011 	bl	6b21a8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE15_M_weak_releaseEv@@Base+0x21618>
 21f6168:	d0006361 	adrp	x1, 2e64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8a11a8>
 21f616c:	910ce021 	add	x1, x1, #0x338
 21f6170:	b9000aa0 	str	w0, [x21,#8]
 21f6174:	5289eb02 	mov	w2, #0x4f58                	// #20312
 21f6178:	72aa4862 	movk	w2, #0x5243, lsl #16
 21f617c:	f90002a1 	str	x1, [x21]
 21f6180:	f9400680 	ldr	x0, [x20,#8]
 21f6184:	b9000ebf 	str	wzr, [x21,#12]
 21f6188:	b90012a2 	str	w2, [x21,#16]
 21f618c:	910032a3 	add	x3, x21, #0xc
 21f6190:	f9000eb4 	str	x20, [x21,#24]
 21f6194:	eb0002bf 	cmp	x21, x0
 21f6198:	54000100 	b.eq	21f61b8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e0a0>
 21f619c:	b94012a1 	ldr	w1, [x21,#16]
 21f61a0:	6b02003f 	cmp	w1, w2
 21f61a4:	54000300 	b.eq	21f6204 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e0ec>
 21f61a8:	f9000695 	str	x21, [x20,#8]
 21f61ac:	b4000200 	cbz	x0, 21f61ec <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e0d4>
 21f61b0:	97ffe62c 	bl	21efa60 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x67948>
 21f61b4:	f9400680 	ldr	x0, [x20,#8]
 21f61b8:	f9400e74 	ldr	x20, [x19,#24]
 21f61bc:	eb14001f 	cmp	x0, x20
 21f61c0:	540002e0 	b.eq	21f621c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e104>
 21f61c4:	f94013f5 	ldr	x21, [sp,#32]
 21f61c8:	b4fffaa0 	cbz	x0, 21f611c <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6e004>
 21f61cc:	17ffffcf 	b	21f6108 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x6dff0>
