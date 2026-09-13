
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 19871c0:      	cmp	w0, w21
 19871c4:      	b.le	0x1987190 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187308>
 19871c8:      	ldr	x0, [x20, #0x58]
 19871cc:      	ldr	x1, [x0, w21, sxtw #3]
 19871d0:      	mov	x0, x1
 19871d4:      	ldr	x1, [x1]
 19871d8:      	ldr	x1, [x1]
 19871dc:      	blr	x1
 19871e0:      	cmp	w21, #0x0
 19871e4:      	b.gt	0x19871b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187330>
 19871e8:      	ldr	x21, [x20, #0x90]
 19871ec:      	cbz	x21, 0x1987314 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x18748c>
 19871f0:      	stp	x27, x28, [sp, #0x50]
 19871f4:      	add	x27, x21, #0x8
 19871f8:      	ldr	w0, [x27]
 19871fc:      	cbz	w0, 0x1987310 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187488>
 1987200:      	add	w1, w0, #0x1
 1987204:      	ldaxr	w2, [x27]
 1987208:      	cmp	w2, w0
 198720c:      	b.ne	0x1987218 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187390>
 1987210:      	stlxr	w3, w1, [x27]
 1987214:      	cmp	w3, #0x0
 1987218:      	b.ne	0x1988574 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1886ec>
 198721c:      	ldr	w0, [x27]
 1987220:      	cbz	w0, 0x19872ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187464>
 1987224:      	ldr	x28, [x20, #0x88]
 1987228:      	cbz	x28, 0x19872ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187464>
 198722c:      	ldrb	w0, [x19, #0x408]
 1987230:      	cbz	w0, 0x1987288 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187400>
 1987234:      	ldr	x22, [x19, #0x410]
 1987238:      	cbz	x22, 0x1987c34 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187dac>
 198723c:      	bl	0x2221520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99408>
 1987240:      	add	x0, x0, #0x7d0
 1987244:      	add	x1, x22, #0x138
 1987248:      	stlr	x0, [x1]
 198724c:      	ldr	w1, [x22, #0x128]
 1987250:      	add	x0, x22, #0x128
 1987254:      	eor	w1, w1, w1, asr #31
 1987258:      	cmp	w1, #0x3
 198725c:      	b.gt	0x19873ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187564>
 1987260:      	adrp	x2, 0x29ca000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4071a8>
 1987264:      	add	x2, x2, #0x388
 1987268:      	add	x1, sp, #0x90
 198726c:      	str	wzr, [sp, #0x90]
 1987270:      	str	x2, [sp, #0x98]
 1987274:      	bl	0x1986b30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x186ca8>
 1987278:      	ldr	w0, [sp, #0x90]
 198727c:      	eor	w0, w0, w0, asr #31
 1987280:      	cmp	w0, #0x3
 1987284:      	b.gt	0x19873ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187564>
 1987288:      	mov	x0, x28
 198728c:      	bl	0x1fcc4f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x7cc668>
 1987290:      	ldrb	w0, [x19, #0x408]
 1987294:      	cbz	w0, 0x19872ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187464>
 1987298:      	ldr	x22, [x19, #0x410]
 198729c:      	cbz	x22, 0x1987ce0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187e58>
 19872a0:      	bl	0x2221520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99408>
 19872a4:      	add	x0, x0, #0x7d0
 19872a8:      	add	x1, x22, #0x138
 19872ac:      	stlr	x0, [x1]
 19872b0:      	ldr	w1, [x22, #0x128]
 19872b4:      	add	x0, x22, #0x128
 19872b8:      	eor	w1, w1, w1, asr #31
 19872bc:      	cmp	w1, #0x3
 19872c0:      	b.gt	0x19873ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187564>
 19872c4:      	adrp	x2, 0x29ca000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4071a8>
 19872c8:      	add	x2, x2, #0x3d0
 19872cc:      	add	x1, sp, #0xa0
 19872d0:      	str	wzr, [sp, #0xa0]
 19872d4:      	str	x2, [sp, #0xa8]
 19872d8:      	bl	0x1986b30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x186ca8>
 19872dc:      	ldr	w0, [sp, #0xa0]
 19872e0:      	eor	w0, w0, w0, asr #31
 19872e4:      	cmp	w0, #0x3
 19872e8:      	b.gt	0x19873ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187564>
 19872ec:      	adrp	x0, 0x29ca000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4071a8>
 19872f0:      	ldr	x22, [x0, #0x180]
 19872f4:      	cbz	x22, 0x19877fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187974>
 19872f8:      	ldaxr	w0, [x27]
 19872fc:      	sub	w1, w0, #0x1
 1987300:      	stlxr	w2, w1, [x27]
 1987304:      	cbnz	w2, 0x19872f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187470>
 1987308:      	cmp	w0, #0x1
 198730c:      	b.eq	0x1987810 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187988>
 1987310:      	ldp	x27, x28, [sp, #0x50]
 1987314:      	ldr	x0, [x20, #0x98]
 1987318:      	ldrb	w1, [x19, #0x408]
 198731c:      	ldrb	w2, [x0, #0x480]
 1987320:      	cbnz	w2, 0x19873f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187568>
 1987324:      	cbz	w1, 0x198737c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1874f4>
 1987328:      	ldr	x19, [x19, #0x410]
 198732c:      	cbz	x19, 0x1987ab8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187c30>
 1987330:      	bl	0x2221520 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x99408>
 1987334:      	add	x0, x0, #0x7d0
 1987338:      	add	x1, x19, #0x138
 198733c:      	stlr	x0, [x1]
 1987340:      	ldr	w1, [x19, #0x128]
 1987344:      	add	x0, x19, #0x128
 1987348:      	eor	w1, w1, w1, asr #31
 198734c:      	cmp	w1, #0x3
 1987350:      	b.gt	0x19873e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x187560>
 1987354:      	adrp	x2, 0x29ca000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x4071a8>
 1987358:      	add	x2, x2, #0x450
 198735c:      	add	x1, sp, #0xb0
 1987360:      	str	wzr, [sp, #0xb0]
 1987364:      	str	x2, [sp, #0xb8]
 1987368:      	bl	0x1986b30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x186ca8>
 198736c:      	ldr	w0, [sp, #0xb0]
