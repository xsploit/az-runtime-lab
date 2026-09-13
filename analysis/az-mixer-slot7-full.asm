
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021b2070 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x29f58>:
 21b2070:	a9b17bfd 	stp	x29, x30, [sp,#-240]!
 21b2074:	b202e7e3 	mov	x3, #0xcccccccccccccccc    	// #-3689348814741910324
 21b2078:	f29999a3 	movk	x3, #0xcccd
 21b207c:	910003fd 	mov	x29, sp
 21b2080:	b9400022 	ldr	w2, [x1]
 21b2084:	a9025bf5 	stp	x21, x22, [sp,#32]
 21b2088:	aa0003f6 	mov	x22, x0
 21b208c:	a90153f3 	stp	x19, x20, [sp,#16]
 21b2090:	aa0103f3 	mov	x19, x1
 21b2094:	f9409c00 	ldr	x0, [x0,#312]
 21b2098:	a9046bf9 	stp	x25, x26, [sp,#64]
 21b209c:	f940a2c1 	ldr	x1, [x22,#320]
 21b20a0:	a90573fb 	stp	x27, x28, [sp,#80]
 21b20a4:	cb000021 	sub	x1, x1, x0
 21b20a8:	9343fc21 	asr	x1, x1, #3
 21b20ac:	9b037c21 	mul	x1, x1, x3
 21b20b0:	531f7821 	lsl	w1, w1, #1
 21b20b4:	6b02003f 	cmp	w1, w2
 21b20b8:	54000a6c 	b.gt	21b2204 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a0ec>
 21b20bc:	9102c3f4 	add	x20, sp, #0xb0
 21b20c0:	910343fa 	add	x26, sp, #0xd0
 21b20c4:	a90363f7 	stp	x23, x24, [sp,#48]
 21b20c8:	b9800662 	ldrsw	x2, [x19,#4]
 21b20cc:	3904827f 	strb	wzr, [x19,#288]
 21b20d0:	aa1a03e1 	mov	x1, x26
 21b20d4:	f9400a77 	ldr	x23, [x19,#16]
 21b20d8:	52800053 	mov	w19, #0x2                   	// #2
 21b20dc:	f90033e2 	str	x2, [sp,#96]
 21b20e0:	f9005bf7 	str	x23, [sp,#176]
 21b20e4:	b900bbf3 	str	w19, [sp,#184]
 21b20e8:	a90c0bff 	stp	xzr, x2, [sp,#192]
 21b20ec:	390343ff 	strb	wzr, [sp,#208]
 21b20f0:	f9006ff4 	str	x20, [sp,#216]
 21b20f4:	97cbe32b 	bl	14aada0 <_ZNSt15recursive_mutex4lockEv@@Base+0x1f1f8>
 21b20f8:	a95386c0 	ldp	x0, x1, [x22,#312]
 21b20fc:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
 21b2100:	f29999a2 	movk	x2, #0xcccd
 21b2104:	cb000021 	sub	x1, x1, x0
 21b2108:	9343fc21 	asr	x1, x1, #3
 21b210c:	9b027c21 	mul	x1, x1, x2
 21b2110:	7100043f 	cmp	w1, #0x1
 21b2114:	540006ad 	b.le	21b21e8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a0d0>
 21b2118:	910042f7 	add	x23, x23, #0x10
 21b211c:	910263fb 	add	x27, sp, #0x98
 21b2120:	910562c1 	add	x1, x22, #0x158
 21b2124:	d2800519 	mov	x25, #0x28                  	// #40
 21b2128:	52800038 	mov	w24, #0x1                   	// #1
 21b212c:	f90037e1 	str	x1, [sp,#104]
 21b2130:	b90077f3 	str	w19, [sp,#116]
 21b2134:	f9003fe2 	str	x2, [sp,#120]
 21b2138:	f94037e2 	ldr	x2, [sp,#104]
 21b213c:	a90a0bfa 	stp	x26, x2, [sp,#160]
 21b2140:	b94077e2 	ldr	w2, [sp,#116]
 21b2144:	b900dbe2 	str	w2, [sp,#216]
 21b2148:	8b190000 	add	x0, x0, x25
 21b214c:	f94033e2 	ldr	x2, [sp,#96]
 21b2150:	aa1b03e1 	mov	x1, x27
 21b2154:	390263ff 	strb	wzr, [sp,#152]
 21b2158:	d280001c 	mov	x28, #0x0                   	// #0
 21b215c:	f9006bf7 	str	x23, [sp,#208]
 21b2160:	f90073ff 	str	xzr, [sp,#224]
 21b2164:	f90077e2 	str	x2, [sp,#232]
 21b2168:	94000c06 	bl	21b5180 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2d068>
 21b216c:	a95682d4 	ldp	x20, x0, [x22,#360]
 21b2170:	b940bbe1 	ldr	w1, [sp,#184]
 21b2174:	f94067f3 	ldr	x19, [sp,#200]
 21b2178:	f940aed5 	ldr	x21, [x22,#344]
 21b217c:	eb00027f 	cmp	x19, x0
 21b2180:	d37ef694 	lsl	x20, x20, #2
 21b2184:	9a809273 	csel	x19, x19, x0, ls
 21b2188:	340001c1 	cbz	w1, 21b21c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a0a8>
 21b218c:	d503201f 	nop
 21b2190:	f9405be0 	ldr	x0, [sp,#176]
 21b2194:	2a1303e2 	mov	w2, w19
 21b2198:	f94063e4 	ldr	x4, [sp,#192]
 21b219c:	f87c7800 	ldr	x0, [x0,x28,lsl #3]
 21b21a0:	f87c7aa1 	ldr	x1, [x21,x28,lsl #3]
 21b21a4:	9100079c 	add	x28, x28, #0x1
 21b21a8:	8b040800 	add	x0, x0, x4, lsl #2
 21b21ac:	8b140021 	add	x1, x1, x20
 21b21b0:	940203ac 	bl	2233060 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0xaaf48>
 21b21b4:	b940bbe0 	ldr	w0, [sp,#184]
 21b21b8:	eb1c001f 	cmp	x0, x28
 21b21bc:	54fffea8 	b.hi	21b2190 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a078>
 21b21c0:	a95386c0 	ldp	x0, x1, [x22,#312]
 21b21c4:	11000718 	add	w24, w24, #0x1
 21b21c8:	f9403fe2 	ldr	x2, [sp,#120]
 21b21cc:	9100a339 	add	x25, x25, #0x28
 21b21d0:	910042f7 	add	x23, x23, #0x10
 21b21d4:	cb000021 	sub	x1, x1, x0
 21b21d8:	9343fc21 	asr	x1, x1, #3
 21b21dc:	9b027c21 	mul	x1, x1, x2
 21b21e0:	6b01031f 	cmp	w24, w1
 21b21e4:	54fffaab 	b.lt	21b2138 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a020>
 21b21e8:	a94153f3 	ldp	x19, x20, [sp,#16]
 21b21ec:	a9425bf5 	ldp	x21, x22, [sp,#32]
 21b21f0:	a94363f7 	ldp	x23, x24, [sp,#48]
 21b21f4:	a9446bf9 	ldp	x25, x26, [sp,#64]
 21b21f8:	a94573fb 	ldp	x27, x28, [sp,#80]
 21b21fc:	a8cf7bfd 	ldp	x29, x30, [sp],#240
 21b2200:	d65f03c0 	ret
 21b2204:	910223e0 	add	x0, sp, #0x88
 21b2208:	f0002061 	adrp	x1, 25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE@@Base+0x4d0>
 21b220c:	9136a021 	add	x1, x1, #0xda8
 21b2210:	940606b4 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21b2214:	b0006521 	adrp	x1, 2e57000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8941a8>
 21b2218:	9100c021 	add	x1, x1, #0x30
 21b221c:	91166021 	add	x1, x1, #0x598
 21b2220:	910223e0 	add	x0, sp, #0x88
 21b2224:	910243e8 	add	x8, sp, #0x90
 21b2228:	94058672 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21b222c:	910263fb 	add	x27, sp, #0x98
 21b2230:	b00030c1 	adrp	x1, 27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x2081a8>
 21b2234:	aa1b03e8 	mov	x8, x27
 21b2238:	91366021 	add	x1, x1, #0xd98
 21b223c:	910243e0 	add	x0, sp, #0x90
 21b2240:	9405866c 	bl	2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18bad8>
 21b2244:	9102c3f4 	add	x20, sp, #0xb0
 21b2248:	b0006521 	adrp	x1, 2e57000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8941a8>
 21b224c:	aa1403e0 	mov	x0, x20
 21b2250:	91286021 	add	x1, x1, #0xa18
 21b2254:	940606a3 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21b2258:	910343fa 	add	x26, sp, #0xd0
 21b225c:	aa1403e1 	mov	x1, x20
 21b2260:	aa1a03e8 	mov	x8, x26
 21b2264:	aa1b03e0 	mov	x0, x27
 21b2268:	9405860a 	bl	2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x18b978>
 21b226c:	52800022 	mov	w2, #0x1                   	// #1
 21b2270:	52800001 	mov	w1, #0x0                   	// #0
 21b2274:	aa1a03e0 	mov	x0, x26
 21b2278:	9401385a 	bl	22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x782c8>
 21b227c:	aa1a03e0 	mov	x0, x26
 21b2280:	a90363f7 	stp	x23, x24, [sp,#48]
 21b2284:	940528df 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b2288:	aa1403e0 	mov	x0, x20
 21b228c:	940528dd 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b2290:	aa1b03e0 	mov	x0, x27
 21b2294:	940528db 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b2298:	910243e0 	add	x0, sp, #0x90
 21b229c:	940528d9 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22a0:	910223e0 	add	x0, sp, #0x88
 21b22a4:	940528d7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22a8:	f9409ec0 	ldr	x0, [x22,#312]
 21b22ac:	17ffff87 	b	21b20c8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x29fb0>
 21b22b0:	aa0003f3 	mov	x19, x0
 21b22b4:	1400000a 	b	21b22dc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a1c4>
 21b22b8:	aa0003f3 	mov	x19, x0
 21b22bc:	aa1a03e0 	mov	x0, x26
 21b22c0:	940528d0 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22c4:	aa1403e0 	mov	x0, x20
 21b22c8:	940528ce 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22cc:	aa1b03e0 	mov	x0, x27
 21b22d0:	940528cc 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22d4:	910243e0 	add	x0, sp, #0x90
 21b22d8:	940528ca 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22dc:	910223e0 	add	x0, sp, #0x88
 21b22e0:	a90363f7 	stp	x23, x24, [sp,#48]
 21b22e4:	940528c7 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21b22e8:	aa1303e0 	mov	x0, x19
 21b22ec:	9789ca89 	bl	424d10 <_Unwind_Resume@plt>
 21b22f0:	aa0003f3 	mov	x19, x0
 21b22f4:	17fffff6 	b	21b22cc <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a1b4>
 21b22f8:	aa0003f3 	mov	x19, x0
 21b22fc:	17fffff2 	b	21b22c4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a1ac>
 21b2300:	aa0003f3 	mov	x19, x0
 21b2304:	17fffff4 	b	21b22d4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x2a1bc>
 21b2308:	d503201f 	nop
 21b230c:	d503201f 	nop
