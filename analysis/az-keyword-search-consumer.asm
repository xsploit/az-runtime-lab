
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1eb5138: a9bb7bfd     	stp	x29, x30, [sp, #-0x50]!
 1eb513c: 910003fd     	mov	x29, sp
 1eb5140: a9025bf5     	stp	x21, x22, [sp, #0x20]
 1eb5144: f9400c16     	ldr	x22, [x0, #0x18]
 1eb5148: a90153f3     	stp	x19, x20, [sp, #0x10]
 1eb514c: b4000316     	cbz	x22, 0x1eb51ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b5324>
 1eb5150: 910123f3     	add	x19, sp, #0x48
 1eb5154: aa0003f5     	mov	x21, x0
 1eb5158: 910103f4     	add	x20, sp, #0x40
 1eb515c: aa1303e0     	mov	x0, x19
 1eb5160: 941168f4     	bl	0x230f530 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x187418>
 1eb5164: aa1603e0     	mov	x0, x22
 1eb5168: aa1303e1     	mov	x1, x19
 1eb516c: aa1403e8     	mov	x8, x20
 1eb5170: 97ffdf02     	bl	0x1eacd78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6acef0>
 1eb5174: aa1303e0     	mov	x0, x19
 1eb5178: 94111d22     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eb517c: aa1403e1     	mov	x1, x20
 1eb5180: aa1503e0     	mov	x0, x21
 1eb5184: 97fff72f     	bl	0x1eb2e40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b2fb8>
 1eb5188: f94023e0     	ldr	x0, [sp, #0x40]
 1eb518c: b4000080     	cbz	x0, 0x1eb519c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b5314>
 1eb5190: f9400001     	ldr	x1, [x0]
 1eb5194: f9400421     	ldr	x1, [x1, #0x8]
 1eb5198: d63f0020     	blr	x1
 1eb519c: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eb51a0: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 1eb51a4: a8c57bfd     	ldp	x29, x30, [sp], #0x50
 1eb51a8: d65f03c0     	ret
 1eb51ac: d00077e1     	adrp	x1, 0x2db3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7f01a8>
 1eb51b0: 9100c3e0     	add	x0, sp, #0x30
 1eb51b4: 91176021     	add	x1, x1, #0x5d8
 1eb51b8: 9411faca     	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1eb51bc: 9100e3e8     	add	x8, sp, #0x38
 1eb51c0: 9411de88     	bl	0x232cbe0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1a4ac8>
 1eb51c4: 910103f4     	add	x20, sp, #0x40
 1eb51c8: 9100e3e1     	add	x1, sp, #0x38
 1eb51cc: aa1403e8     	mov	x8, x20
 1eb51d0: 52800003     	mov	w3, #0x0                // =0
 1eb51d4: 52800002     	mov	w2, #0x0                // =0
 1eb51d8: 9100c3e0     	add	x0, sp, #0x30
 1eb51dc: 94122091     	bl	0x233d420 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1b5308>
 1eb51e0: aa1403e0     	mov	x0, x20
 1eb51e4: 94119277     	bl	0x2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x191aa8>
 1eb51e8: 910123f3     	add	x19, sp, #0x48
 1eb51ec: aa0003f5     	mov	x21, x0
 1eb51f0: d00077e1     	adrp	x1, 0x2db3000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7f01a8>
 1eb51f4: aa1303e0     	mov	x0, x19
 1eb51f8: 9119c021     	add	x1, x1, #0x670
 1eb51fc: 9411fab9     	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1eb5200: aa1303e0     	mov	x0, x19
 1eb5204: 9411926f     	bl	0x2319bc0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x191aa8>
 1eb5208: aa0003e3     	mov	x3, x0
 1eb520c: aa1503e1     	mov	x1, x21
 1eb5210: 900077a0     	adrp	x0, 0x2da9000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7e61a8>
 1eb5214: 52801fa2     	mov	w2, #0xfd               // =253
 1eb5218: 91120000     	add	x0, x0, #0x480
 1eb521c: 940d29f1     	bl	0x21ff9e0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x778c8>
 1eb5220: aa1303e0     	mov	x0, x19
 1eb5224: 94111cf7     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eb5228: aa1403e0     	mov	x0, x20
 1eb522c: 94111cf5     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eb5230: 9100c3e0     	add	x0, sp, #0x30
 1eb5234: 94111cf3     	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1eb5238: a94153f3     	ldp	x19, x20, [sp, #0x10]
 1eb523c: a9425bf5     	ldp	x21, x22, [sp, #0x20]
 1eb5240: a8c57bfd     	ldp	x29, x30, [sp], #0x50
 1eb5244: d65f03c0     	ret
 1eb5248: aa0003f3     	mov	x19, x0
 1eb524c: 14000010     	b	0x1eb528c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b5404>
 1eb5250: f94023e1     	ldr	x1, [sp, #0x40]
 1eb5254: aa0003f3     	mov	x19, x0
 1eb5258: b40000a1     	cbz	x1, 0x1eb526c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x6b53e4>
 1eb525c: f9400022     	ldr	x2, [x1]
 1eb5260: aa0103e0     	mov	x0, x1
 1eb5264: f9400441     	ldr	x1, [x2, #0x8]
 1eb5268: d63f0020     	blr	x1
 1eb526c: aa1303e0     	mov	x0, x19
 1eb5270: 9795bea8     	bl	0x424d10 <_Unwind_Resume@plt>
 1eb5274: aa0003e1     	mov	x1, x0
