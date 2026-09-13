
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021c3f50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3be38>:
 21c3f50:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21c3f54:	910003fd 	mov	x29, sp
 21c3f58:	a90153f3 	stp	x19, x20, [sp,#16]
 21c3f5c:	aa0003f3 	mov	x19, x0
 21c3f60:	b9401000 	ldr	w0, [x0,#16]
 21c3f64:	37f80520 	tbnz	w0, #31, 21c4008 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bef0>
 21c3f68:	2a0103f4 	mov	w20, w1
 21c3f6c:	910093e2 	add	x2, sp, #0x24
 21c3f70:	d28e0061 	mov	x1, #0x7003                	// #28675
 21c3f74:	f2b00041 	movk	x1, #0x8002, lsl #16
 21c3f78:	b90027ff 	str	wzr, [sp,#36]
 21c3f7c:	97898d95 	bl	4275d0 <ioctl@plt>
 21c3f80:	37f80620 	tbnz	w0, #31, 21c4044 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bf2c>
 21c3f84:	b94027e0 	ldr	w0, [sp,#36]
 21c3f88:	6b14001f 	cmp	w0, w20
 21c3f8c:	540000a1 	b.ne	21c3fa0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3be88>
 21c3f90:	52800000 	mov	w0, #0x0                   	// #0
 21c3f94:	a94153f3 	ldp	x19, x20, [sp,#16]
 21c3f98:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c3f9c:	d65f03c0 	ret
 21c3fa0:	b9401260 	ldr	w0, [x19,#16]
 21c3fa4:	d28e0061 	mov	x1, #0x7003                	// #28675
 21c3fa8:	f2a80041 	movk	x1, #0x4002, lsl #16
 21c3fac:	910093e2 	add	x2, sp, #0x24
 21c3fb0:	b90027f4 	str	w20, [sp,#36]
 21c3fb4:	97898d87 	bl	4275d0 <ioctl@plt>
 21c3fb8:	36fffec0 	tbz	w0, #31, 21c3f90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3be78>
 21c3fbc:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3fc0:	91228021 	add	x1, x1, #0x8a0
 21c3fc4:	9100a3f3 	add	x19, sp, #0x28
 21c3fc8:	aa1303e0 	mov	x0, x19
 21c3fcc:	9405bf45 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c3fd0:	aa1303e0 	mov	x0, x19
 21c3fd4:	940556fb 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c3fd8:	f00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c3fdc:	9116c021 	add	x1, x1, #0x5b0
 21c3fe0:	aa0003e2 	mov	x2, x0
 21c3fe4:	91038021 	add	x1, x1, #0xe0
 21c3fe8:	90002ac0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c3fec:	91152000 	add	x0, x0, #0x548
 21c3ff0:	9400ee7c 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c3ff4:	d503201f 	nop
 21c3ff8:	aa1303e0 	mov	x0, x19
 21c3ffc:	9404e181 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4000:	12800000 	mov	w0, #0xffffffff            	// #-1
 21c4004:	17ffffe4 	b	21c3f94 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3be7c>
 21c4008:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c400c:	91200021 	add	x1, x1, #0x800
 21c4010:	9100a3f3 	add	x19, sp, #0x28
 21c4014:	aa1303e0 	mov	x0, x19
 21c4018:	9405bf32 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c401c:	aa1303e0 	mov	x0, x19
 21c4020:	940556e8 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4024:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4028:	9116c021 	add	x1, x1, #0x5b0
 21c402c:	aa0003e2 	mov	x2, x0
 21c4030:	91038021 	add	x1, x1, #0xe0
 21c4034:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c4038:	91152000 	add	x0, x0, #0x548
 21c403c:	9400ee69 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c4040:	17ffffee 	b	21c3ff8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bee0>
 21c4044:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4048:	9121e021 	add	x1, x1, #0x878
 21c404c:	9100a3f3 	add	x19, sp, #0x28
 21c4050:	aa1303e0 	mov	x0, x19
 21c4054:	9405bf23 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c4058:	aa1303e0 	mov	x0, x19
 21c405c:	940556d9 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4060:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4064:	9116c021 	add	x1, x1, #0x5b0
 21c4068:	aa0003e2 	mov	x2, x0
 21c406c:	91038021 	add	x1, x1, #0xe0
 21c4070:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c4074:	91152000 	add	x0, x0, #0x548
 21c4078:	9400ee5a 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c407c:	17ffffdf 	b	21c3ff8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bee0>
 21c4080:	aa0003f4 	mov	x20, x0
 21c4084:	aa1303e0 	mov	x0, x19
 21c4088:	9404e15e 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c408c:	aa1403e0 	mov	x0, x20
 21c4090:	97898320 	bl	424d10 <_Unwind_Resume@plt>
 21c4094:	17fffffb 	b	21c4080 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bf68>
 21c4098:	17fffffa 	b	21c4080 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bf68>
 21c409c:	d503201f 	nop
 21c40a0:	52800000 	mov	w0, #0x0                   	// #0
 21c40a4:	d65f03c0 	ret
 21c40a8:	d503201f 	nop
 21c40ac:	d503201f 	nop
 21c40b0:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21c40b4:	910003fd 	mov	x29, sp
 21c40b8:	a90153f3 	stp	x19, x20, [sp,#16]
 21c40bc:	aa0003f3 	mov	x19, x0
 21c40c0:	b9401000 	ldr	w0, [x0,#16]
 21c40c4:	37f80520 	tbnz	w0, #31, 21c4168 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c050>
 21c40c8:	2a0103f4 	mov	w20, w1
 21c40cc:	910093e2 	add	x2, sp, #0x24
 21c40d0:	d28e0081 	mov	x1, #0x7004                	// #28676
 21c40d4:	f2b00081 	movk	x1, #0x8004, lsl #16
 21c40d8:	b90027ff 	str	wzr, [sp,#36]
 21c40dc:	97898d3d 	bl	4275d0 <ioctl@plt>
 21c40e0:	37f80620 	tbnz	w0, #31, 21c41a4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c08c>
 21c40e4:	b94027e0 	ldr	w0, [sp,#36]
 21c40e8:	6b14001f 	cmp	w0, w20
 21c40ec:	540000a1 	b.ne	21c4100 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bfe8>
 21c40f0:	52800000 	mov	w0, #0x0                   	// #0
 21c40f4:	a94153f3 	ldp	x19, x20, [sp,#16]
 21c40f8:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c40fc:	d65f03c0 	ret
 21c4100:	b9401260 	ldr	w0, [x19,#16]
 21c4104:	d28e0081 	mov	x1, #0x7004                	// #28676
 21c4108:	f2a80081 	movk	x1, #0x4004, lsl #16
 21c410c:	910093e2 	add	x2, sp, #0x24
 21c4110:	b90027f4 	str	w20, [sp,#36]
 21c4114:	97898d2f 	bl	4275d0 <ioctl@plt>
 21c4118:	36fffec0 	tbz	w0, #31, 21c40f0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bfd8>
 21c411c:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4120:	9123c021 	add	x1, x1, #0x8f0
 21c4124:	9100a3f3 	add	x19, sp, #0x28
 21c4128:	aa1303e0 	mov	x0, x19
 21c412c:	9405beed 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c4130:	aa1303e0 	mov	x0, x19
 21c4134:	940556a3 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4138:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c413c:	9116c021 	add	x1, x1, #0x5b0
 21c4140:	aa0003e2 	mov	x2, x0
 21c4144:	91042021 	add	x1, x1, #0x108
 21c4148:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c414c:	91152000 	add	x0, x0, #0x548
 21c4150:	9400ee24 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c4154:	d503201f 	nop
 21c4158:	aa1303e0 	mov	x0, x19
 21c415c:	9404e129 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c4160:	12800000 	mov	w0, #0xffffffff            	// #-1
 21c4164:	17ffffe4 	b	21c40f4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3bfdc>
 21c4168:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c416c:	91200021 	add	x1, x1, #0x800
 21c4170:	9100a3f3 	add	x19, sp, #0x28
 21c4174:	aa1303e0 	mov	x0, x19
 21c4178:	9405beda 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c417c:	aa1303e0 	mov	x0, x19
 21c4180:	94055690 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4184:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4188:	9116c021 	add	x1, x1, #0x5b0
 21c418c:	aa0003e2 	mov	x2, x0
 21c4190:	91042021 	add	x1, x1, #0x108
 21c4194:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c4198:	91152000 	add	x0, x0, #0x548
 21c419c:	9400ee11 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c41a0:	17ffffee 	b	21c4158 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c040>
 21c41a4:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c41a8:	91232021 	add	x1, x1, #0x8c8
 21c41ac:	9100a3f3 	add	x19, sp, #0x28
 21c41b0:	aa1303e0 	mov	x0, x19
 21c41b4:	9405becb 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c41b8:	aa1303e0 	mov	x0, x19
 21c41bc:	94055681 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c41c0:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c41c4:	9116c021 	add	x1, x1, #0x5b0
 21c41c8:	aa0003e2 	mov	x2, x0
 21c41cc:	91042021 	add	x1, x1, #0x108
 21c41d0:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c41d4:	91152000 	add	x0, x0, #0x548
 21c41d8:	9400ee02 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c41dc:	17ffffdf 	b	21c4158 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c040>
 21c41e0:	aa0003f4 	mov	x20, x0
 21c41e4:	aa1303e0 	mov	x0, x19
 21c41e8:	9404e106 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c41ec:	aa1403e0 	mov	x0, x20
 21c41f0:	978982c8 	bl	424d10 <_Unwind_Resume@plt>
 21c41f4:	17fffffb 	b	21c41e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c0c8>
 21c41f8:	17fffffa 	b	21c41e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c0c8>
 21c41fc:	d503201f 	nop
 21c4200:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 21c4204:	910003fd 	mov	x29, sp
 21c4208:	a90153f3 	stp	x19, x20, [sp,#16]
 21c420c:	aa0003f3 	mov	x19, x0
 21c4210:	b9401000 	ldr	w0, [x0,#16]
 21c4214:	37f80520 	tbnz	w0, #31, 21c42b8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c1a0>
 21c4218:	2a0103f4 	mov	w20, w1
 21c421c:	910093e2 	add	x2, sp, #0x24
 21c4220:	d28e0041 	mov	x1, #0x7002                	// #28674
 21c4224:	f2b00081 	movk	x1, #0x8004, lsl #16
 21c4228:	b90027ff 	str	wzr, [sp,#36]
 21c422c:	97898ce9 	bl	4275d0 <ioctl@plt>
 21c4230:	37f80620 	tbnz	w0, #31, 21c42f4 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c1dc>
 21c4234:	b94027e0 	ldr	w0, [sp,#36]
 21c4238:	6b14001f 	cmp	w0, w20
 21c423c:	540000a1 	b.ne	21c4250 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c138>
 21c4240:	52800000 	mov	w0, #0x0                   	// #0
 21c4244:	a94153f3 	ldp	x19, x20, [sp,#16]
 21c4248:	a8c37bfd 	ldp	x29, x30, [sp],#48
 21c424c:	d65f03c0 	ret
 21c4250:	b9401260 	ldr	w0, [x19,#16]
 21c4254:	d28e0041 	mov	x1, #0x7002                	// #28674
 21c4258:	f2a80081 	movk	x1, #0x4004, lsl #16
 21c425c:	910093e2 	add	x2, sp, #0x24
 21c4260:	b90027f4 	str	w20, [sp,#36]
 21c4264:	97898cdb 	bl	4275d0 <ioctl@plt>
 21c4268:	36fffec0 	tbz	w0, #31, 21c4240 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c128>
 21c426c:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4270:	91252021 	add	x1, x1, #0x948
 21c4274:	9100a3f3 	add	x19, sp, #0x28
 21c4278:	aa1303e0 	mov	x0, x19
 21c427c:	9405be99 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c4280:	aa1303e0 	mov	x0, x19
 21c4284:	9405564f 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4288:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c428c:	9116c021 	add	x1, x1, #0x5b0
 21c4290:	aa0003e2 	mov	x2, x0
 21c4294:	91050021 	add	x1, x1, #0x140
 21c4298:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c429c:	91152000 	add	x0, x0, #0x548
 21c42a0:	9400edd0 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c42a4:	d503201f 	nop
 21c42a8:	aa1303e0 	mov	x0, x19
 21c42ac:	9404e0d5 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c42b0:	12800000 	mov	w0, #0xffffffff            	// #-1
 21c42b4:	17ffffe4 	b	21c4244 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c12c>
 21c42b8:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c42bc:	91200021 	add	x1, x1, #0x800
 21c42c0:	9100a3f3 	add	x19, sp, #0x28
 21c42c4:	aa1303e0 	mov	x0, x19
 21c42c8:	9405be86 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c42cc:	aa1303e0 	mov	x0, x19
 21c42d0:	9405563c 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c42d4:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c42d8:	9116c021 	add	x1, x1, #0x5b0
 21c42dc:	aa0003e2 	mov	x2, x0
 21c42e0:	91050021 	add	x1, x1, #0x140
 21c42e4:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c42e8:	91152000 	add	x0, x0, #0x548
 21c42ec:	9400edbd 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c42f0:	17ffffee 	b	21c42a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c190>
 21c42f4:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c42f8:	91246021 	add	x1, x1, #0x918
 21c42fc:	9100a3f3 	add	x19, sp, #0x28
 21c4300:	aa1303e0 	mov	x0, x19
 21c4304:	9405be77 	bl	2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1abbc8>
 21c4308:	aa1303e0 	mov	x0, x19
 21c430c:	9405562d 	bl	2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x191aa8>
 21c4310:	d00064a1 	adrp	x1, 2e5a000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8971a8>
 21c4314:	9116c021 	add	x1, x1, #0x5b0
 21c4318:	aa0003e2 	mov	x2, x0
 21c431c:	91050021 	add	x1, x1, #0x140
 21c4320:	f0002aa0 	adrp	x0, 271b000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x1581a8>
 21c4324:	91152000 	add	x0, x0, #0x548
 21c4328:	9400edae 	bl	21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x778c8>
 21c432c:	17ffffdf 	b	21c42a8 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c190>
 21c4330:	aa0003f4 	mov	x20, x0
 21c4334:	aa1303e0 	mov	x0, x19
 21c4338:	9404e0b2 	bl	22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x1744e8>
 21c433c:	aa1403e0 	mov	x0, x20
 21c4340:	97898274 	bl	424d10 <_Unwind_Resume@plt>
 21c4344:	17fffffb 	b	21c4330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c218>
 21c4348:	17fffffa 	b	21c4330 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_@@Base+0x3c218>
 21c434c:	d503201f 	nop
