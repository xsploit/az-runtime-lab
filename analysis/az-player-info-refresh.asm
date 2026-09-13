
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1e27190:      	add	x3, x19, #0x28
 1e27194:      	ldr	x4, [x20, #0x30]
 1e27198:      	ldr	x1, [x3, #0x30]
 1e2719c:      	eor	x1, x1, x4
 1e271a0:      	tst	x1, #0xffffffffff
 1e271a4:      	b.ne	0x1e26fdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627154>
 1e271a8:      	ldr	x3, [x3, #0x38]
 1e271ac:      	ldr	x1, [x20, #0x38]
 1e271b0:      	cmp	x3, x1
 1e271b4:      	b.ne	0x1e26fdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627154>
 1e271b8:      	b	0x1e27060 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6271d8>
 1e271bc:      	mov	x19, x0
 1e271c0:      	mov	x0, x21
 1e271c4:      	bl	0x1e21ae8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x621c60>
 1e271c8:      	mov	x0, x19
 1e271cc:      	bl	0x424d10 <_Unwind_Resume@plt>
 1e271d0:      	ldr	x1, [sp, #0x80]
 1e271d4:      	mov	x19, x0
 1e271d8:      	cbz	x1, 0x1e271fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627374>
 1e271dc:      	tbnz	w1, #0x0, 0x1e271fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627374>
 1e271e0:      	and	x1, x1, #0xfffffffffffffffe
 1e271e4:      	ldr	x3, [x1]
 1e271e8:      	cbz	x3, 0x1e271fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627374>
 1e271ec:      	add	x1, sp, #0x88
 1e271f0:      	mov	w2, #0x2                // =2
 1e271f4:      	mov	x0, x1
 1e271f8:      	blr	x3
 1e271fc:      	ldr	x1, [sp, #0x60]
 1e27200:      	cbz	x1, 0x1e271c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627338>
 1e27204:      	tbnz	w1, #0x0, 0x1e271c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627338>
 1e27208:      	and	x1, x1, #0xfffffffffffffffe
 1e2720c:      	ldr	x3, [x1]
 1e27210:      	cbz	x3, 0x1e271c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627338>
 1e27214:      	add	x1, sp, #0x68
 1e27218:      	mov	w2, #0x2                // =2
 1e2721c:      	mov	x0, x1
 1e27220:      	blr	x3
 1e27224:      	b	0x1e271c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627338>
 1e27228:      	stp	x29, x30, [sp, #-0x100]!
 1e2722c:      	mov	x29, sp
 1e27230:      	stp	x19, x20, [sp, #0x10]
 1e27234:      	mov	x19, x0
 1e27238:      	bl	0x232dc50 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a5b38>
 1e2723c:      	mov	x20, x0
 1e27240:      	bl	0x2395bf0 <_ZNSt8functionIFvvEEC2ERKS1_+0x207d0>
 1e27244:      	cbz	x0, 0x1e2724c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6273c4>
 1e27248:      	ldr	x0, [x0, #0x10]
 1e2724c:      	cmp	x20, x0
 1e27250:      	b.ne	0x1e27364 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6274dc>
 1e27254:      	ldr	x0, [x19, #0xb0]
 1e27258:      	bl	0x14983b0 <_ZNSt15recursive_mutex4lockEv+0xc808>
 1e2725c:      	tst	w0, #0xff
 1e27260:      	b.ne	0x1e27270 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6273e8>
 1e27264:      	ldp	x19, x20, [sp, #0x10]
 1e27268:      	ldp	x29, x30, [sp], #0x100
 1e2726c:      	ret
 1e27270:      	stp	x21, x22, [sp, #0x20]
 1e27274:      	add	x22, x19, #0x80
 1e27278:      	mov	w1, #0x1                // =1
 1e2727c:      	mov	x0, x22
 1e27280:      	stp	x23, x24, [sp, #0x30]
 1e27284:      	bl	0x75d770 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev+0x649c8>
 1e27288:      	tst	w0, #0xff
 1e2728c:      	b.eq	0x1e272a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627420>
 1e27290:      	add	x24, x19, #0x90
 1e27294:      	mov	w1, #0x1                // =1
 1e27298:      	mov	x0, x24
 1e2729c:      	bl	0xafe218 <_ZSt20__throw_bad_weak_ptrv+0x1f3600>
 1e272a0:      	tst	w0, #0xff
 1e272a4:      	b.ne	0x1e273f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x627568>
 1e272a8:      	add	x19, sp, #0x68
 1e272ac:      	adrp	x1, 0x25c1000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x4d0>
 1e272b0:      	mov	x0, x19
 1e272b4:      	add	x1, x1, #0xda8
 1e272b8:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e272bc:      	add	x22, sp, #0x70
 1e272c0:      	adrp	x1, 0x2da4000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7e11a8>
 1e272c4:      	add	x1, x1, #0x700
 1e272c8:      	add	x1, x1, #0x300
 1e272cc:      	mov	x0, x19
 1e272d0:      	mov	x8, x22
 1e272d4:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e272d8:      	add	x23, sp, #0x78
 1e272dc:      	adrp	x1, 0x27cb000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x2081a8>
 1e272e0:      	mov	x8, x23
 1e272e4:      	add	x1, x1, #0xd98
 1e272e8:      	mov	x0, x22
 1e272ec:      	bl	0x2313bf0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18bad8>
 1e272f0:      	add	x20, sp, #0x80
 1e272f4:      	adrp	x1, 0x2da4000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7e11a8>
 1e272f8:      	mov	x0, x20
 1e272fc:      	add	x1, x1, #0xbd0
 1e27300:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1e27304:      	add	x21, sp, #0xc0
 1e27308:      	mov	x1, x20
 1e2730c:      	mov	x8, x21
 1e27310:      	mov	x0, x23
 1e27314:      	bl	0x2313a90 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x18b978>
 1e27318:      	mov	w2, #0x1                // =1
 1e2731c:      	mov	w1, #0x0                // =0
 1e27320:      	mov	x0, x21
 1e27324:      	bl	0x22003e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x782c8>
 1e27328:      	mov	x0, x21
 1e2732c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27330:      	mov	x0, x20
 1e27334:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27338:      	mov	x0, x23
 1e2733c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27340:      	mov	x0, x22
 1e27344:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1e27348:      	mov	x0, x19
 1e2734c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
