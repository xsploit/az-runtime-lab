
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
