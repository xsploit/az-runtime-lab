
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 1dde000:      	mov	w1, #0x0                // =0
 1dde004:      	b	0x1dde00c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de184>
 1dde008:      	ldr	x0, [sp, #0x78]
 1dde00c:      	add	x0, x0, w1, sxtw #3
 1dde010:      	mov	x1, x21
 1dde014:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1dde018:      	ldr	w1, [sp, #0x88]
 1dde01c:      	add	x21, x21, #0x8
 1dde020:      	cmp	x25, x21
 1dde024:      	add	w1, w1, #0x1
 1dde028:      	str	w1, [sp, #0x88]
 1dde02c:      	b.ne	0x1dde008 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de180>
 1dde030:      	mov	x0, #0xf0               // =240
 1dde034:      	bl	0x424d40 <_Znwm@plt>
 1dde038:      	mov	x25, x0
 1dde03c:      	add	x26, x0, #0xd0
 1dde040:      	add	x1, sp, #0x70
 1dde044:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1dde048:      	ldr	w21, [sp, #0x88]
 1dde04c:      	str	x22, [x25]
 1dde050:      	str	wzr, [x25, #0xc8]
 1dde054:      	cmp	w21, #0x0
 1dde058:      	str	xzr, [x25, #0xd0]
 1dde05c:      	str	wzr, [x26, #0x8]
 1dde060:      	str	w21, [x26, #0x10]
 1dde064:      	b.eq	0x1dde0ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de224>
 1dde068:      	b.le	0x1dde46c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de5e4>
 1dde06c:      	sbfiz	x0, x21, #3, #32
 1dde070:      	bl	0x424fd0 <malloc@plt>
 1dde074:      	str	x0, [x25, #0xd0]
 1dde078:      	str	w21, [x26, #0x8]
 1dde07c:      	mov	x21, #0x0               // =0
 1dde080:      	b	0x1dde088 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de200>
 1dde084:      	ldr	x0, [x25, #0xd0]
 1dde088:      	lsl	x1, x21, #3
 1dde08c:      	ldr	x2, [sp, #0x78]
 1dde090:      	add	x0, x0, x1
 1dde094:      	add	x21, x21, #0x1
 1dde098:      	add	x1, x2, x1
 1dde09c:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1dde0a0:      	ldr	w0, [x26, #0x10]
 1dde0a4:      	cmp	w0, w21
 1dde0a8:      	b.gt	0x1dde084 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de1fc>
 1dde0ac:      	add	x21, x25, #0xe8
 1dde0b0:      	mov	x0, x21
 1dde0b4:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1dde0b8:      	mov	x1, x23
 1dde0bc:      	add	x0, sp, #0x68
 1dde0c0:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1dde0c4:      	mov	w1, #0x100              // =256
 1dde0c8:      	add	x2, sp, #0x68
 1dde0cc:      	mov	x0, x25
 1dde0d0:      	movk	w1, #0x7000, lsl #16
 1dde0d4:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1dde0d8:      	add	x0, sp, #0x68
 1dde0dc:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde0e0:      	ldr	x0, [x20, #0xf0]
 1dde0e4:      	str	x25, [x20, #0xf0]
 1dde0e8:      	cbz	x0, 0x1dde0f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de270>
 1dde0ec:      	ldr	x1, [x0]
 1dde0f0:      	ldr	x1, [x1, #0x8]
 1dde0f4:      	blr	x1
 1dde0f8:      	ldr	w0, [sp, #0x88]
 1dde0fc:      	mov	x21, #0x0               // =0
 1dde100:      	cmp	w0, #0x0
 1dde104:      	b.le	0x1dde124 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de29c>
 1dde108:      	ldr	x0, [sp, #0x78]
 1dde10c:      	add	x0, x0, x21, lsl #3
 1dde110:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde114:      	ldr	w0, [sp, #0x88]
 1dde118:      	add	x21, x21, #0x1
 1dde11c:      	cmp	w0, w21
 1dde120:      	b.gt	0x1dde108 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de280>
 1dde124:      	ldr	x0, [sp, #0x78]
 1dde128:      	add	x21, sp, #0xe0
 1dde12c:      	bl	0x424af0 <free@plt>
 1dde130:      	sub	x21, x21, #0x8
 1dde134:      	mov	x0, x21
 1dde138:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde13c:      	cmp	x21, x19
 1dde140:      	b.ne	0x1dde130 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de2a8>
 1dde144:      	add	x0, sp, #0x70
 1dde148:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1dde14c:      	ldr	x1, [x20, #0xf0]
 1dde150:      	mov	w2, #-0x1               // =-1
 1dde154:      	mov	x0, x20
 1dde158:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1dde15c:      	ldr	x21, [x20, #0xf0]
 1dde160:      	mov	w1, #0x0                // =0
 1dde164:      	mov	x0, x19
 1dde168:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1dde16c:      	mov	w1, #0x100              // =256
 1dde170:      	mov	x2, x19
 1dde174:      	mov	x0, x21
 1dde178:      	movk	w1, #0x7000, lsl #16
 1dde17c:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1dde180:      	mov	x0, x19
 1dde184:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde188:      	ldr	x0, [x20, #0xf0]
 1dde18c:      	mov	w4, #0x13               // =19
 1dde190:      	mov	w3, #0xd                // =13
 1dde194:      	mov	w2, w4
 1dde198:      	mov	w1, #0x69               // =105
 1dde19c:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1dde1a0:      	adrp	x1, 0x264d000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x8a1a8>
 1dde1a4:      	add	x0, sp, #0x70
 1dde1a8:      	add	x1, x1, #0x718
 1dde1ac:      	bl	0x2333ce0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1abbc8>
 1dde1b0:      	ldr	x0, [x24, #0x10]
 1dde1b4:      	mov	x8, x19
 1dde1b8:      	mov	w1, #0x109              // =265
 1dde1bc:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde1c0:      	ldr	x0, [x24, #0x18]
 1dde1c4:      	add	x8, sp, #0x98
 1dde1c8:      	mov	w1, #0x8b               // =139
 1dde1cc:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde1d0:      	ldr	x0, [x24, #0x20]
 1dde1d4:      	add	x8, sp, #0xa0
 1dde1d8:      	mov	w1, #0x10a              // =266
 1dde1dc:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde1e0:      	ldr	x0, [x24, #0x28]
 1dde1e4:      	add	x8, sp, #0xa8
 1dde1e8:      	mov	w1, #0x116              // =278
 1dde1ec:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde1f0:      	ldr	x0, [x24, #0x30]
 1dde1f4:      	add	x8, sp, #0xb0
 1dde1f8:      	mov	w1, #0xf2               // =242
 1dde1fc:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde200:      	ldr	x0, [x24, #0x38]
 1dde204:      	add	x8, sp, #0xb8
 1dde208:      	mov	w1, #0x114              // =276
 1dde20c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde210:      	ldr	x0, [x24, #0x40]
 1dde214:      	add	x8, sp, #0xc0
 1dde218:      	mov	w1, #0x12b              // =299
 1dde21c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde220:      	ldr	x0, [x24, #0x48]
 1dde224:      	add	x8, sp, #0xc8
 1dde228:      	mov	w1, #0xe2               // =226
 1dde22c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde230:      	ldr	x0, [x24, #0x50]
 1dde234:      	add	x8, sp, #0xd0
 1dde238:      	mov	w1, #0x133              // =307
 1dde23c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde240:      	ldr	x0, [x24, #0x58]
 1dde244:      	add	x8, sp, #0xd8
 1dde248:      	mov	w1, #0x135              // =309
 1dde24c:      	bl	0x23ed7c0 <_ZNSt8functionIFvvEEC2ERKS1_+0x783a0>
 1dde250:      	mov	x0, #0x80               // =128
 1dde254:      	str	wzr, [sp, #0x88]
 1dde258:      	bl	0x424fd0 <malloc@plt>
 1dde25c:      	add	x24, sp, #0xe0
 1dde260:      	mov	w2, #0x10               // =16
 1dde264:      	mov	x21, x19
 1dde268:      	mov	w1, #0x0                // =0
 1dde26c:      	str	x0, [sp, #0x78]
 1dde270:      	str	w2, [sp, #0x80]
 1dde274:      	b	0x1dde27c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de3f4>
 1dde278:      	ldr	x0, [sp, #0x78]
 1dde27c:      	add	x0, x0, w1, sxtw #3
 1dde280:      	mov	x1, x21
 1dde284:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1dde288:      	ldr	w1, [sp, #0x88]
 1dde28c:      	add	x21, x21, #0x8
 1dde290:      	cmp	x24, x21
 1dde294:      	add	w1, w1, #0x1
 1dde298:      	str	w1, [sp, #0x88]
 1dde29c:      	b.ne	0x1dde278 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de3f0>
 1dde2a0:      	mov	x0, #0xf0               // =240
 1dde2a4:      	bl	0x424d40 <_Znwm@plt>
 1dde2a8:      	mov	x24, x0
 1dde2ac:      	add	x25, x0, #0xd0
 1dde2b0:      	add	x1, sp, #0x70
 1dde2b4:      	bl	0x243d150 <_ZNSt8functionIFvvEEC2ERKS1_+0xc7d30>
 1dde2b8:      	ldr	w26, [sp, #0x88]
 1dde2bc:      	str	x22, [x24]
 1dde2c0:      	str	wzr, [x24, #0xc8]
 1dde2c4:      	cmp	w26, #0x0
 1dde2c8:      	str	xzr, [x24, #0xd0]
 1dde2cc:      	str	wzr, [x25, #0x8]
 1dde2d0:      	str	w26, [x25, #0x10]
 1dde2d4:      	b.eq	0x1dde31c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de494>
 1dde2d8:      	b.le	0x1dde45c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de5d4>
 1dde2dc:      	sbfiz	x0, x26, #3, #32
 1dde2e0:      	bl	0x424fd0 <malloc@plt>
 1dde2e4:      	str	x0, [x24, #0xd0]
 1dde2e8:      	mov	x21, #0x0               // =0
 1dde2ec:      	str	w26, [x25, #0x8]
 1dde2f0:      	b	0x1dde2f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de470>
 1dde2f4:      	ldr	x0, [x24, #0xd0]
 1dde2f8:      	lsl	x1, x21, #3
 1dde2fc:      	ldr	x2, [sp, #0x78]
 1dde300:      	add	x0, x0, x1
 1dde304:      	add	x21, x21, #0x1
 1dde308:      	add	x1, x2, x1
 1dde30c:      	bl	0x23b1410 <_ZNSt8functionIFvvEEC2ERKS1_+0x3bff0>
 1dde310:      	ldr	w0, [x25, #0x10]
 1dde314:      	cmp	w0, w21
 1dde318:      	b.gt	0x1dde2f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de46c>
 1dde31c:      	add	x21, x24, #0xe8
 1dde320:      	mov	x0, x21
 1dde324:      	bl	0x23b12b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x3be90>
 1dde328:      	mov	x1, x23
 1dde32c:      	add	x0, sp, #0x68
 1dde330:      	bl	0x23a5010 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fbf0>
 1dde334:      	mov	w1, #0x100              // =256
 1dde338:      	add	x2, sp, #0x68
 1dde33c:      	mov	x0, x24
 1dde340:      	movk	w1, #0x7000, lsl #16
 1dde344:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1dde348:      	add	x0, sp, #0x68
 1dde34c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde350:      	ldr	x0, [x20, #0xf8]
 1dde354:      	str	x24, [x20, #0xf8]
 1dde358:      	cbz	x0, 0x1dde368 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de4e0>
 1dde35c:      	ldr	x1, [x0]
 1dde360:      	ldr	x1, [x1, #0x8]
 1dde364:      	blr	x1
 1dde368:      	ldr	w0, [sp, #0x88]
 1dde36c:      	mov	x21, #0x0               // =0
 1dde370:      	cmp	w0, #0x0
 1dde374:      	b.le	0x1dde394 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de50c>
 1dde378:      	ldr	x0, [sp, #0x78]
 1dde37c:      	add	x0, x0, x21, lsl #3
 1dde380:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde384:      	ldr	w0, [sp, #0x88]
 1dde388:      	add	x21, x21, #0x1
 1dde38c:      	cmp	w0, w21
 1dde390:      	b.gt	0x1dde378 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de4f0>
 1dde394:      	ldr	x0, [sp, #0x78]
 1dde398:      	add	x21, sp, #0xe0
 1dde39c:      	bl	0x424af0 <free@plt>
 1dde3a0:      	sub	x21, x21, #0x8
 1dde3a4:      	mov	x0, x21
 1dde3a8:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde3ac:      	cmp	x21, x19
 1dde3b0:      	b.ne	0x1dde3a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de518>
 1dde3b4:      	add	x0, sp, #0x70
 1dde3b8:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1dde3bc:      	ldr	x1, [x20, #0xf8]
 1dde3c0:      	mov	w2, #-0x1               // =-1
 1dde3c4:      	mov	x0, x20
 1dde3c8:      	bl	0x249d6b0 <_ZNSt8functionIFvvEEC2ERKS1_+0x128290>
 1dde3cc:      	ldr	x21, [x20, #0xf8]
 1dde3d0:      	mov	w1, #0x0                // =0
 1dde3d4:      	mov	x0, x19
 1dde3d8:      	bl	0x23a5070 <_ZNSt8functionIFvvEEC2ERKS1_+0x2fc50>
 1dde3dc:      	mov	w1, #0x100              // =256
 1dde3e0:      	mov	x2, x19
 1dde3e4:      	mov	x0, x21
 1dde3e8:      	movk	w1, #0x7000, lsl #16
 1dde3ec:      	bl	0x243dc60 <_ZNSt8functionIFvvEEC2ERKS1_+0xc8840>
 1dde3f0:      	mov	x0, x19
 1dde3f4:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde3f8:      	ldr	x0, [x20, #0xf8]
 1dde3fc:      	mov	w4, #0x13               // =19
 1dde400:      	mov	w3, #0xd                // =13
 1dde404:      	mov	w2, w4
 1dde408:      	mov	w1, #0x76               // =118
 1dde40c:      	bl	0x249efe0 <_ZNSt8functionIFvvEEC2ERKS1_+0x129bc0>
 1dde410:      	mov	w2, #0x39               // =57
 1dde414:      	mov	w1, #0xb0               // =176
 1dde418:      	mov	x0, x20
 1dde41c:      	bl	0x249f200 <_ZNSt8functionIFvvEEC2ERKS1_+0x129de0>
 1dde420:      	ldp	x19, x20, [sp, #0x10]
 1dde424:      	ldp	x21, x22, [sp, #0x20]
 1dde428:      	ldp	x23, x24, [sp, #0x30]
 1dde42c:      	ldp	x25, x26, [sp, #0x40]
 1dde430:      	ldr	x27, [sp, #0x50]
 1dde434:      	ldp	x29, x30, [sp], #0xe0
 1dde438:      	ret
 1dde43c:      	ldr	w1, [x0, #0x8]
 1dde440:      	add	w1, w1, #0x1
 1dde444:      	str	w1, [x0, #0x8]
 1dde448:      	b	0x1ddd940 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ddab8>
 1dde44c:      	str	w23, [x26, #0x8]
 1dde450:      	b	0x1ddda24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ddb9c>
 1dde454:      	str	w27, [x26, #0x8]
 1dde458:      	b	0x1dddbdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ddd54>
 1dde45c:      	str	w26, [x25, #0x8]
 1dde460:      	b	0x1dde31c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de494>
 1dde464:      	str	w21, [x26, #0x8]
 1dde468:      	b	0x1ddde3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ddfb4>
 1dde46c:      	str	w21, [x26, #0x8]
 1dde470:      	b	0x1dde0ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de224>
 1dde474:      	mov	x19, x0
 1dde478:      	ldr	x0, [x20, #0xf8]
 1dde47c:      	cbz	x0, 0x1dde48c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de604>
 1dde480:      	ldr	x1, [x0]
 1dde484:      	ldr	x1, [x1, #0x8]
 1dde488:      	blr	x1
 1dde48c:      	ldr	x0, [x20, #0xf0]
 1dde490:      	cbz	x0, 0x1dde4a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de618>
 1dde494:      	ldr	x1, [x0]
 1dde498:      	ldr	x1, [x1, #0x8]
 1dde49c:      	blr	x1
 1dde4a0:      	ldr	x0, [x20, #0xe8]
 1dde4a4:      	cbz	x0, 0x1dde4b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de62c>
 1dde4a8:      	ldr	x1, [x0]
 1dde4ac:      	ldr	x1, [x1, #0x8]
 1dde4b0:      	blr	x1
 1dde4b4:      	ldr	x0, [x20, #0xe0]
 1dde4b8:      	cbz	x0, 0x1dde4c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de640>
 1dde4bc:      	ldr	x1, [x0]
 1dde4c0:      	ldr	x1, [x1, #0x8]
 1dde4c4:      	blr	x1
 1dde4c8:      	ldr	x0, [x20, #0xd8]
 1dde4cc:      	cbz	x0, 0x1dde4dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de654>
 1dde4d0:      	ldr	x1, [x0]
 1dde4d4:      	ldr	x1, [x1, #0x8]
 1dde4d8:      	blr	x1
 1dde4dc:      	ldr	x0, [x20, #0xd0]
 1dde4e0:      	cbz	x0, 0x1dde4e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de660>
 1dde4e4:      	bl	0x6742d8 <_ZNSt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv>
 1dde4e8:      	mov	x0, x20
 1dde4ec:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde4f0:      	mov	x0, x19
 1dde4f4:      	bl	0x424d10 <_Unwind_Resume@plt>
 1dde4f8:      	mov	x21, x0
 1dde4fc:      	mov	x22, #0xa               // =10
 1dde500:      	add	x0, sp, #0x78
 1dde504:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde508:      	sub	x22, x22, #0x1
 1dde50c:      	cmn	x22, #0x1
 1dde510:      	b.ne	0x1dde5dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de754>
 1dde514:      	mov	x19, x21
 1dde518:      	add	x0, sp, #0x70
 1dde51c:      	bl	0x22fc600 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x1744e8>
 1dde520:      	b	0x1dde478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de5f0>
 1dde524:      	mov	x19, x0
 1dde528:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde52c:      	mov	x22, x0
 1dde530:      	add	x0, sp, #0x68
 1dde534:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde538:      	mov	x0, x21
 1dde53c:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde540:      	mov	x0, x26
 1dde544:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde548:      	mov	x0, x25
 1dde54c:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde550:      	mov	x21, x22
 1dde554:      	mov	x0, x25
 1dde558:      	mov	x1, #0xf0               // =240
 1dde55c:      	bl	0x426660 <_ZdlPvm@plt>
 1dde560:      	mov	x22, #0xa               // =10
 1dde564:      	add	x0, sp, #0x78
 1dde568:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde56c:      	sub	x22, x22, #0x1
 1dde570:      	cmn	x22, #0x1
 1dde574:      	b.eq	0x1dde514 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de68c>
 1dde578:      	add	x0, x19, x22, lsl #3
 1dde57c:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde580:      	b	0x1dde56c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de6e4>
 1dde584:      	mov	x22, x0
 1dde588:      	add	x0, sp, #0x68
 1dde58c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde590:      	mov	x0, x21
 1dde594:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde598:      	mov	x0, x25
 1dde59c:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde5a0:      	mov	x0, x24
 1dde5a4:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde5a8:      	mov	x21, x22
 1dde5ac:      	mov	x0, x24
 1dde5b0:      	mov	x1, #0xf0               // =240
 1dde5b4:      	bl	0x426660 <_ZdlPvm@plt>
 1dde5b8:      	mov	x22, #0xa               // =10
 1dde5bc:      	add	x0, sp, #0x78
 1dde5c0:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde5c4:      	sub	x22, x22, #0x1
 1dde5c8:      	cmn	x22, #0x1
 1dde5cc:      	b.eq	0x1dde514 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de68c>
 1dde5d0:      	add	x0, x19, x22, lsl #3
 1dde5d4:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde5d8:      	b	0x1dde5c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de73c>
 1dde5dc:      	add	x0, x19, x22, lsl #3
 1dde5e0:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde5e4:      	b	0x1dde508 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de680>
 1dde5e8:      	mov	x22, x0
 1dde5ec:      	mov	x0, x19
 1dde5f0:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde5f4:      	mov	x19, x22
 1dde5f8:      	add	x0, sp, #0x78
 1dde5fc:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde600:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde604:      	mov	x22, x0
 1dde608:      	add	x0, sp, #0x68
 1dde60c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde610:      	mov	x0, x19
 1dde614:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde618:      	mov	x0, x26
 1dde61c:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde620:      	mov	x0, x21
 1dde624:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde628:      	mov	x19, x22
 1dde62c:      	mov	x0, x21
 1dde630:      	mov	x1, #0xf0               // =240
 1dde634:      	bl	0x426660 <_ZdlPvm@plt>
 1dde638:      	add	x0, sp, #0x90
 1dde63c:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde640:      	add	x0, sp, #0x78
 1dde644:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde648:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde64c:      	mov	x19, x0
 1dde650:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde654:      	mov	x1, x0
 1dde658:      	mov	x0, x19
 1dde65c:      	mov	x19, x1
 1dde660:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde664:      	b	0x1dde478 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de5f0>
 1dde668:      	mov	x19, x0
 1dde66c:      	b	0x1dde638 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de7b0>
 1dde670:      	mov	x19, x0
 1dde674:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde678:      	b	0x1dde654 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de7cc>
 1dde67c:      	mov	x21, x0
 1dde680:      	b	0x1dde560 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de6d8>
 1dde684:      	mov	x22, x0
 1dde688:      	add	x0, sp, #0x68
 1dde68c:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde690:      	mov	x0, x21
 1dde694:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde698:      	mov	x0, x26
 1dde69c:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde6a0:      	mov	x0, x25
 1dde6a4:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde6a8:      	mov	x0, x25
 1dde6ac:      	mov	x1, #0xf0               // =240
 1dde6b0:      	bl	0x426660 <_ZdlPvm@plt>
 1dde6b4:      	b	0x1dde5ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de764>
 1dde6b8:      	mov	x22, x0
 1dde6bc:      	add	x0, sp, #0x68
 1dde6c0:      	bl	0x239fef0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2aad0>
 1dde6c4:      	mov	x0, x21
 1dde6c8:      	bl	0x23a45f0 <_ZNSt8functionIFvvEEC2ERKS1_+0x2f1d0>
 1dde6cc:      	mov	x0, x26
 1dde6d0:      	bl	0x19e3200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x1e3378>
 1dde6d4:      	mov	x0, x25
 1dde6d8:      	bl	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde6dc:      	mov	x21, x22
 1dde6e0:      	mov	x0, x25
 1dde6e4:      	mov	x1, #0xf0               // =240
 1dde6e8:      	bl	0x426660 <_ZdlPvm@plt>
 1dde6ec:      	b	0x1dde4fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de674>
 1dde6f0:      	mov	x19, x0
 1dde6f4:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde6f8:      	b	0x1dde654 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de7cc>
 1dde6fc:      	mov	x19, x0
 1dde700:      	b	0x1dde518 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de690>
 1dde704:      	b	0x1dde654 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de7cc>
 1dde708:      	mov	x21, x0
 1dde70c:      	b	0x1dde5b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de730>
 1dde710:      	b	0x1dde654 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de7cc>
 1dde714:      	udf	#0x0
 1dde718:      	ret
 1dde71c:      	nop
 1dde720:      	ret
 1dde724:      	nop
 1dde728:      	stp	x29, x30, [sp, #-0x30]!
 1dde72c:      	adrp	x2, 0x2d6c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a91a8>
 1dde730:      	adrp	x1, 0x2d6c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a91a8>
 1dde734:      	mov	x29, sp
 1dde738:      	stp	x19, x20, [sp, #0x10]
 1dde73c:      	mov	x19, x0
 1dde740:      	add	x2, x2, #0x498
 1dde744:      	ldr	x0, [x0, #0x150]
 1dde748:      	add	x1, x1, #0x608
 1dde74c:      	str	x2, [x19]
 1dde750:      	str	x1, [x19, #0xc8]
 1dde754:      	str	xzr, [x19, #0x150]
 1dde758:      	cbz	x0, 0x1dde768 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de8e0>
 1dde75c:      	ldr	x1, [x0]
 1dde760:      	ldr	x1, [x1, #0x8]
 1dde764:      	blr	x1
 1dde768:      	ldr	x0, [x19, #0x158]
 1dde76c:      	str	xzr, [x19, #0x158]
 1dde770:      	cbz	x0, 0x1dde780 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de8f8>
 1dde774:      	ldr	x1, [x0]
 1dde778:      	ldr	x1, [x1, #0x8]
 1dde77c:      	blr	x1
 1dde780:      	ldr	x0, [x19, #0x160]
 1dde784:      	str	xzr, [x19, #0x160]
 1dde788:      	cbz	x0, 0x1dde798 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de910>
 1dde78c:      	ldr	x1, [x0]
 1dde790:      	ldr	x1, [x1, #0x8]
 1dde794:      	blr	x1
 1dde798:      	ldr	x0, [x19, #0x168]
 1dde79c:      	str	xzr, [x19, #0x168]
 1dde7a0:      	cbz	x0, 0x1dde7b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de928>
 1dde7a4:      	ldr	x1, [x0]
 1dde7a8:      	ldr	x1, [x1, #0x8]
 1dde7ac:      	blr	x1
 1dde7b0:      	ldr	x0, [x19, #0x170]
 1dde7b4:      	str	xzr, [x19, #0x170]
 1dde7b8:      	cbz	x0, 0x1dde7dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de954>
 1dde7bc:      	ldr	x1, [x0]
 1dde7c0:      	ldr	x1, [x1, #0x8]
 1dde7c4:      	blr	x1
 1dde7c8:      	ldr	x0, [x19, #0x170]
 1dde7cc:      	cbz	x0, 0x1dde7dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de954>
 1dde7d0:      	ldr	x1, [x0]
 1dde7d4:      	ldr	x1, [x1, #0x8]
 1dde7d8:      	blr	x1
 1dde7dc:      	ldr	x0, [x19, #0x168]
 1dde7e0:      	cbz	x0, 0x1dde7f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de968>
 1dde7e4:      	ldr	x1, [x0]
 1dde7e8:      	ldr	x1, [x1, #0x8]
 1dde7ec:      	blr	x1
 1dde7f0:      	ldr	x0, [x19, #0x160]
 1dde7f4:      	cbz	x0, 0x1dde804 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de97c>
 1dde7f8:      	ldr	x1, [x0]
 1dde7fc:      	ldr	x1, [x1, #0x8]
 1dde800:      	blr	x1
 1dde804:      	ldr	x0, [x19, #0x158]
 1dde808:      	cbz	x0, 0x1dde818 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de990>
 1dde80c:      	ldr	x1, [x0]
 1dde810:      	ldr	x1, [x1, #0x8]
 1dde814:      	blr	x1
 1dde818:      	ldr	x0, [x19, #0x150]
 1dde81c:      	cbz	x0, 0x1dde82c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de9a4>
 1dde820:      	ldr	x1, [x0]
 1dde824:      	ldr	x1, [x1, #0x8]
 1dde828:      	blr	x1
 1dde82c:      	ldr	x0, [x19, #0x140]
 1dde830:      	cbz	x0, 0x1dde840 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de9b8>
 1dde834:      	ldr	x1, [x0]
 1dde838:      	ldr	x1, [x1, #0x8]
 1dde83c:      	blr	x1
 1dde840:      	ldr	x0, [x19, #0x138]
 1dde844:      	cbz	x0, 0x1dde854 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de9cc>
 1dde848:      	ldr	x1, [x0]
 1dde84c:      	ldr	x1, [x1, #0x8]
 1dde850:      	blr	x1
 1dde854:      	ldr	x0, [x19, #0x130]
 1dde858:      	cbz	x0, 0x1dde868 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de9e0>
 1dde85c:      	ldr	x1, [x0]
 1dde860:      	ldr	x1, [x1, #0x8]
 1dde864:      	blr	x1
 1dde868:      	ldr	x0, [x19, #0x128]
 1dde86c:      	cbz	x0, 0x1dde87c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de9f4>
 1dde870:      	ldr	x1, [x0]
 1dde874:      	ldr	x1, [x1, #0x8]
 1dde878:      	blr	x1
 1dde87c:      	ldr	x0, [x19, #0x120]
 1dde880:      	cbz	x0, 0x1dde890 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea08>
 1dde884:      	ldr	x1, [x0]
 1dde888:      	ldr	x1, [x1, #0x8]
 1dde88c:      	blr	x1
 1dde890:      	ldr	x0, [x19, #0x118]
 1dde894:      	cbz	x0, 0x1dde8a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea1c>
 1dde898:      	ldr	x1, [x0]
 1dde89c:      	ldr	x1, [x1, #0x8]
 1dde8a0:      	blr	x1
 1dde8a4:      	ldr	x0, [x19, #0x110]
 1dde8a8:      	cbz	x0, 0x1dde8b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea30>
 1dde8ac:      	ldr	x1, [x0]
 1dde8b0:      	ldr	x1, [x1, #0x8]
 1dde8b4:      	blr	x1
 1dde8b8:      	ldr	x0, [x19, #0x108]
 1dde8bc:      	cbz	x0, 0x1dde8cc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea44>
 1dde8c0:      	ldr	x1, [x0]
 1dde8c4:      	ldr	x1, [x1, #0x8]
 1dde8c8:      	blr	x1
 1dde8cc:      	ldr	x20, [x19, #0x100]
 1dde8d0:      	cbz	x20, 0x1dde904 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea7c>
 1dde8d4:      	adrp	x0, 0x2d6c000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a91a8>
 1dde8d8:      	str	x21, [sp, #0x20]
 1dde8dc:      	ldr	x21, [x0, #0x620]
 1dde8e0:      	cbz	x21, 0x1dde91c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea94>
 1dde8e4:      	add	x1, x20, #0x8
 1dde8e8:      	ldaxr	w0, [x1]
 1dde8ec:      	sub	w2, w0, #0x1
 1dde8f0:      	stlxr	w3, w2, [x1]
 1dde8f4:      	cbnz	w3, 0x1dde8e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea60>
 1dde8f8:      	cmp	w0, #0x1
 1dde8fc:      	b.eq	0x1dde930 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5deaa8>
 1dde900:      	ldr	x21, [sp, #0x20]
 1dde904:      	add	x0, x19, #0xc8
 1dde908:      	bl	0x1e083c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x608538>
 1dde90c:      	mov	x0, x19
 1dde910:      	ldp	x19, x20, [sp, #0x10]
 1dde914:      	ldp	x29, x30, [sp], #0x30
 1dde918:      	b	0x2491ed0 <_ZNSt8functionIFvvEEC2ERKS1_+0x11cab0>
 1dde91c:      	ldr	w0, [x20, #0x8]
 1dde920:      	sub	w1, w0, #0x1
 1dde924:      	str	w1, [x20, #0x8]
 1dde928:      	cmp	w0, #0x1
 1dde92c:      	b.ne	0x1dde900 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea78>
 1dde930:      	ldr	x1, [x20]
 1dde934:      	mov	x0, x20
 1dde938:      	ldr	x1, [x1, #0x10]
 1dde93c:      	blr	x1
 1dde940:      	cbz	x21, 0x1dde978 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5deaf0>
 1dde944:      	add	x1, x20, #0xc
 1dde948:      	ldaxr	w0, [x1]
 1dde94c:      	sub	w2, w0, #0x1
 1dde950:      	stlxr	w3, w2, [x1]
 1dde954:      	cbnz	w3, 0x1dde948 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5deac0>
 1dde958:      	cmp	w0, #0x1
 1dde95c:      	b.ne	0x1dde900 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea78>
 1dde960:      	ldr	x1, [x20]
 1dde964:      	mov	x0, x20
 1dde968:      	ldr	x1, [x1, #0x18]
 1dde96c:      	blr	x1
 1dde970:      	ldr	x21, [sp, #0x20]
 1dde974:      	b	0x1dde904 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dea7c>
 1dde978:      	ldr	w0, [x20, #0xc]
 1dde97c:      	sub	w1, w0, #0x1
 1dde980:      	str	w1, [x20, #0xc]
 1dde984:      	b	0x1dde958 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dead0>
 1dde988:      	sub	x0, x0, #0xc8
 1dde98c:      	b	0x1dde728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de8a0>
 1dde990:      	stp	x29, x30, [sp, #-0x20]!
 1dde994:      	mov	x29, sp
 1dde998:      	str	x19, [sp, #0x10]
 1dde99c:      	mov	x19, x0
 1dde9a0:      	bl	0x1dde728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de8a0>
 1dde9a4:      	mov	x0, x19
 1dde9a8:      	mov	x1, #0x178              // =376
 1dde9ac:      	ldr	x19, [sp, #0x10]
 1dde9b0:      	ldp	x29, x30, [sp], #0x20
 1dde9b4:      	b	0x426660 <_ZdlPvm@plt>
 1dde9b8:      	stp	x29, x30, [sp, #-0x20]!
 1dde9bc:      	mov	x29, sp
 1dde9c0:      	str	x19, [sp, #0x10]
 1dde9c4:      	sub	x19, x0, #0xc8
 1dde9c8:      	mov	x0, x19
 1dde9cc:      	bl	0x1dde728 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5de8a0>
 1dde9d0:      	mov	x0, x19
 1dde9d4:      	mov	x1, #0x178              // =376
 1dde9d8:      	ldr	x19, [sp, #0x10]
 1dde9dc:      	ldp	x29, x30, [sp], #0x20
 1dde9e0:      	b	0x426660 <_ZdlPvm@plt>
 1dde9e4:      	nop
 1dde9e8:      	stp	x29, x30, [sp, #-0x70]!
 1dde9ec:      	and	w1, w1, #0xff
 1dde9f0:      	cmp	w1, #0x8
 1dde9f4:      	mov	x29, sp
 1dde9f8:      	stp	x19, x20, [sp, #0x10]
 1dde9fc:      	mov	x19, x0
 1ddea00:      	stp	x21, x22, [sp, #0x20]
 1ddea04:      	stp	x23, x24, [sp, #0x30]
 1ddea08:      	stp	x25, x26, [sp, #0x40]
 1ddea0c:      	stp	x27, x28, [sp, #0x50]
 1ddea10:      	b.hi	0x1ddeb90 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded08>
 1ddea14:      	cmp	w1, #0x6
 1ddea18:      	b.hs	0x1ddec94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dee0c>
 1ddea1c:      	cmp	w1, #0x4
 1ddea20:      	b.eq	0x1ddec58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dedd0>
 1ddea24:      	b.hi	0x1ddec24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded9c>
 1ddea28:      	mov	w20, #0x1               // =1
 1ddea2c:      	mov	w1, w20
 1ddea30:      	mov	w21, #0x0               // =0
 1ddea34:      	mov	w22, #0x0               // =0
 1ddea38:      	mov	w23, #0x0               // =0
 1ddea3c:      	mov	w24, #0x0               // =0
 1ddea40:      	mov	w25, #0x0               // =0
 1ddea44:      	mov	w26, #0x0               // =0
 1ddea48:      	mov	w27, #0x0               // =0
 1ddea4c:      	mov	w28, #0x0               // =0
 1ddea50:      	mov	w2, #0x0                // =0
 1ddea54:      	ldr	x3, [x19, #0x160]
 1ddea58:      	str	w2, [sp, #0x6c]
 1ddea5c:      	mov	x0, x3
 1ddea60:      	ldr	x3, [x3]
 1ddea64:      	ldr	x3, [x3, #0x60]
 1ddea68:      	blr	x3
 1ddea6c:      	ldr	x3, [x19, #0x108]
 1ddea70:      	ldr	w2, [sp, #0x6c]
 1ddea74:      	mov	x0, x3
 1ddea78:      	mov	w1, w2
 1ddea7c:      	ldr	x2, [x3]
 1ddea80:      	ldr	x2, [x2, #0x60]
 1ddea84:      	blr	x2
 1ddea88:      	ldr	x2, [x19, #0x110]
 1ddea8c:      	mov	w1, w28
 1ddea90:      	mov	x0, x2
 1ddea94:      	ldr	x2, [x2]
 1ddea98:      	ldr	x2, [x2, #0x60]
 1ddea9c:      	blr	x2
 1ddeaa0:      	ldr	x2, [x19, #0x118]
 1ddeaa4:      	mov	w1, w27
 1ddeaa8:      	mov	x0, x2
 1ddeaac:      	ldr	x2, [x2]
 1ddeab0:      	ldr	x2, [x2, #0x60]
 1ddeab4:      	blr	x2
 1ddeab8:      	ldr	x2, [x19, #0x120]
 1ddeabc:      	mov	w1, w26
 1ddeac0:      	mov	x0, x2
 1ddeac4:      	ldr	x2, [x2]
 1ddeac8:      	ldr	x2, [x2, #0x60]
 1ddeacc:      	blr	x2
 1ddead0:      	ldr	x2, [x19, #0x128]
 1ddead4:      	mov	w1, w25
 1ddead8:      	mov	x0, x2
 1ddeadc:      	ldr	x2, [x2]
 1ddeae0:      	ldr	x2, [x2, #0x60]
 1ddeae4:      	blr	x2
 1ddeae8:      	ldr	x2, [x19, #0x130]
 1ddeaec:      	mov	w1, w24
 1ddeaf0:      	mov	x0, x2
 1ddeaf4:      	ldr	x2, [x2]
 1ddeaf8:      	ldr	x2, [x2, #0x60]
 1ddeafc:      	blr	x2
 1ddeb00:      	ldr	x2, [x19, #0x138]
 1ddeb04:      	mov	w1, w23
 1ddeb08:      	mov	x0, x2
 1ddeb0c:      	ldr	x2, [x2]
 1ddeb10:      	ldr	x2, [x2, #0x60]
 1ddeb14:      	blr	x2
 1ddeb18:      	ldr	x2, [x19, #0x140]
 1ddeb1c:      	mov	w1, w22
 1ddeb20:      	mov	x0, x2
 1ddeb24:      	ldr	x2, [x2]
 1ddeb28:      	ldr	x2, [x2, #0x60]
 1ddeb2c:      	blr	x2
 1ddeb30:      	ldr	x2, [x19, #0x168]
 1ddeb34:      	mov	w1, w20
 1ddeb38:      	mov	x0, x2
 1ddeb3c:      	ldr	x2, [x2]
 1ddeb40:      	ldr	x2, [x2, #0x60]
 1ddeb44:      	blr	x2
 1ddeb48:      	ldr	x2, [x19, #0x150]
 1ddeb4c:      	mov	w1, w20
 1ddeb50:      	mov	x0, x2
 1ddeb54:      	ldr	x2, [x2]
 1ddeb58:      	ldr	x2, [x2, #0x60]
 1ddeb5c:      	blr	x2
 1ddeb60:      	ldr	x2, [x19, #0x170]
 1ddeb64:      	mov	w1, w21
 1ddeb68:      	ldp	x19, x20, [sp, #0x10]
 1ddeb6c:      	mov	x0, x2
 1ddeb70:      	ldr	x2, [x2]
 1ddeb74:      	ldp	x21, x22, [sp, #0x20]
 1ddeb78:      	ldp	x23, x24, [sp, #0x30]
 1ddeb7c:      	ldp	x25, x26, [sp, #0x40]
 1ddeb80:      	ldp	x27, x28, [sp, #0x50]
 1ddeb84:      	ldr	x2, [x2, #0x60]
 1ddeb88:      	ldp	x29, x30, [sp], #0x70
 1ddeb8c:      	br	x2
 1ddeb90:      	cmp	w1, #0xb
 1ddeb94:      	b.ls	0x1ddec04 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded7c>
 1ddeb98:      	cmp	w1, #0xc
 1ddeb9c:      	b.eq	0x1ddec3c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dedb4>
 1ddeba0:      	cmp	w1, #0xd
 1ddeba4:      	b.ne	0x1ddec70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dede8>
 1ddeba8:      	and	w2, w2, #0xff
 1ddebac:      	cmp	w2, #0x3
 1ddebb0:      	b.eq	0x1ddecc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dee3c>
 1ddebb4:      	cmp	w2, #0x4
 1ddebb8:      	b.eq	0x1dded24 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dee9c>
 1ddebbc:      	cmp	w2, #0x5
 1ddebc0:      	b.eq	0x1ddecf4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dee6c>
 1ddebc4:      	cmp	w2, #0x7
 1ddebc8:      	b.eq	0x1dded54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5deecc>
 1ddebcc:      	cmp	w2, #0x8
 1ddebd0:      	b.ne	0x1ddec70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dede8>
 1ddebd4:      	mov	w20, #0x1               // =1
 1ddebd8:      	mov	w24, w20
 1ddebdc:      	mov	w21, #0x0               // =0
 1ddebe0:      	mov	w22, #0x0               // =0
 1ddebe4:      	mov	w23, #0x0               // =0
 1ddebe8:      	mov	w25, #0x0               // =0
 1ddebec:      	mov	w26, #0x0               // =0
 1ddebf0:      	mov	w27, #0x0               // =0
 1ddebf4:      	mov	w28, #0x0               // =0
 1ddebf8:      	mov	w2, #0x0                // =0
 1ddebfc:      	mov	w1, #0x0                // =0
 1ddec00:      	b	0x1ddea54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5debcc>
 1ddec04:      	mov	w20, #0x1               // =1
 1ddec08:      	mov	w21, #0x0               // =0
 1ddec0c:      	cmp	w1, #0xa
 1ddec10:      	b.hs	0x1ddec48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dedc0>
 1ddec14:      	mov	w23, w20
 1ddec18:      	mov	w22, #0x0               // =0
 1ddec1c:      	mov	w24, #0x0               // =0
 1ddec20:      	b	0x1ddebe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded60>
 1ddec24:      	mov	w20, #0x0               // =0
 1ddec28:      	mov	w21, #0x1               // =1
 1ddec2c:      	mov	w22, #0x0               // =0
 1ddec30:      	mov	w23, #0x0               // =0
 1ddec34:      	mov	w24, #0x0               // =0
 1ddec38:      	b	0x1ddebe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded60>
 1ddec3c:      	mov	w20, #0x1               // =1
 1ddec40:      	mov	w21, #0x0               // =0
 1ddec44:      	b	0x1ddec14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded8c>
 1ddec48:      	mov	w22, w20
 1ddec4c:      	mov	w23, #0x0               // =0
 1ddec50:      	mov	w24, #0x0               // =0
 1ddec54:      	b	0x1ddebe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded60>
 1ddec58:      	mov	w20, #0x1               // =1
 1ddec5c:      	mov	w21, #0x0               // =0
 1ddec60:      	mov	w22, w20
 1ddec64:      	mov	w23, #0x0               // =0
 1ddec68:      	mov	w24, #0x0               // =0
 1ddec6c:      	b	0x1ddebe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded60>
 1ddec70:      	mov	x1, #0x0                // =0
 1ddec74:      	mov	w0, #0x0                // =0
 1ddec78:      	mov	w20, #0x1               // =1
 1ddec7c:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddec80:      	mov	w21, #0x0               // =0
 1ddec84:      	mov	w22, #0x0               // =0
 1ddec88:      	mov	w23, #0x0               // =0
 1ddec8c:      	mov	w24, #0x0               // =0
 1ddec90:      	b	0x1ddebe8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded60>
 1ddec94:      	mov	w20, #0x1               // =1
 1ddec98:      	mov	w21, #0x0               // =0
 1ddec9c:      	mov	w2, w20
 1ddeca0:      	mov	w22, #0x0               // =0
 1ddeca4:      	mov	w23, #0x0               // =0
 1ddeca8:      	mov	w24, #0x0               // =0
 1ddecac:      	mov	w25, #0x0               // =0
 1ddecb0:      	mov	w26, #0x0               // =0
 1ddecb4:      	mov	w27, #0x0               // =0
 1ddecb8:      	mov	w28, #0x0               // =0
 1ddecbc:      	mov	w1, #0x0                // =0
 1ddecc0:      	b	0x1ddea54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5debcc>
 1ddecc4:      	mov	w20, #0x1               // =1
 1ddecc8:      	mov	w21, #0x0               // =0
 1ddeccc:      	mov	w28, w20
 1ddecd0:      	mov	w22, #0x0               // =0
 1ddecd4:      	mov	w23, #0x0               // =0
 1ddecd8:      	mov	w24, #0x0               // =0
 1ddecdc:      	mov	w25, #0x0               // =0
 1ddece0:      	mov	w26, #0x0               // =0
 1ddece4:      	mov	w27, #0x0               // =0
 1ddece8:      	mov	w2, #0x0                // =0
 1ddecec:      	mov	w1, #0x0                // =0
 1ddecf0:      	b	0x1ddea54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5debcc>
 1ddecf4:      	mov	w20, #0x1               // =1
 1ddecf8:      	mov	w21, #0x0               // =0
 1ddecfc:      	mov	w26, w20
 1dded00:      	mov	w22, #0x0               // =0
 1dded04:      	mov	w23, #0x0               // =0
 1dded08:      	mov	w24, #0x0               // =0
 1dded0c:      	mov	w25, #0x0               // =0
 1dded10:      	mov	w27, #0x0               // =0
 1dded14:      	mov	w28, #0x0               // =0
 1dded18:      	mov	w2, #0x0                // =0
 1dded1c:      	mov	w1, #0x0                // =0
 1dded20:      	b	0x1ddea54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5debcc>
 1dded24:      	mov	w20, #0x1               // =1
 1dded28:      	mov	w21, #0x0               // =0
 1dded2c:      	mov	w27, w20
 1dded30:      	mov	w22, #0x0               // =0
 1dded34:      	mov	w23, #0x0               // =0
 1dded38:      	mov	w24, #0x0               // =0
 1dded3c:      	mov	w25, #0x0               // =0
 1dded40:      	mov	w26, #0x0               // =0
 1dded44:      	mov	w28, #0x0               // =0
 1dded48:      	mov	w2, #0x0                // =0
 1dded4c:      	mov	w1, #0x0                // =0
 1dded50:      	b	0x1ddea54 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5debcc>
 1dded54:      	mov	w20, #0x1               // =1
 1dded58:      	mov	w21, #0x0               // =0
 1dded5c:      	mov	w25, w20
 1dded60:      	mov	w22, #0x0               // =0
 1dded64:      	mov	w23, #0x0               // =0
 1dded68:      	mov	w24, #0x0               // =0
 1dded6c:      	b	0x1ddebec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ded64>
 1dded70:      	ldr	x2, [x0, #0xf8]
 1dded74:      	ldrb	w1, [x2, #0x51]
 1dded78:      	ldrb	w2, [x2, #0x58]
 1dded7c:      	strb	w1, [x0, #0x148]
 1dded80:      	strb	w2, [x0, #0x149]
 1dded84:      	b	0x1dde9e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5deb60>
 1dded88:      	ldr	x2, [x0, #0xf8]
 1dded8c:      	ldrb	w1, [x2, #0x51]
 1dded90:      	cmp	w1, #0xd
 1dded94:      	b.hi	0x1ddedd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5def4c>
 1dded98:      	ldrb	w3, [x2, #0x5d]
 1dded9c:      	and	x1, x1, #0xff
 1ddeda0:      	adrp	x2, 0x2d64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a11a8>
 1ddeda4:      	add	x2, x2, #0xbb0
 1ddeda8:      	ldr	w1, [x2, x1, lsl #2]
 1ddedac:      	cbnz	w3, 0x1ddedb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5def30>
 1ddedb0:      	ldr	w2, [x0, #0xf0]
 1ddedb4:      	add	w1, w1, w2
 1ddedb8:      	ldr	x0, [x0, #0x158]
 1ddedbc:      	ldr	w2, [x0, #0xc8]
 1ddedc0:      	cmp	w1, w2
 1ddedc4:      	b.eq	0x1ddedd0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5def48>
 1ddedc8:      	str	w1, [x0, #0xc8]
 1ddedcc:      	b	0x2488570 <_ZNSt8functionIFvvEEC2ERKS1_+0x113150>
 1ddedd0:      	ret
 1ddedd4:      	mov	x1, #0x0                // =0
 1ddedd8:      	mov	w0, #0x0                // =0
 1ddeddc:      	b	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddede0:      	ldr	x1, [x0, #0xf8]
 1ddede4:      	mov	w0, #0x42c80000         // =1120403456
 1ddede8:      	fmov	s2, w0
 1ddedec:      	mov	w0, #0x426c0000         // =1114374144
 1ddedf0:      	fmov	s1, w0
 1ddedf4:      	ldrsh	w0, [x1, #0x56]
 1ddedf8:      	scvtf	s0, w0
 1ddedfc:      	fdiv	s0, s0, s2
 1ddee00:      	fmul	s0, s0, s1
 1ddee04:      	fcvtzs	w0, s0
 1ddee08:      	ret
 1ddee0c:      	nop
 1ddee10:      	adrp	x5, 0x3b9f000 <stdout+0x5df40>
 1ddee14:      	add	x5, x5, #0x40
 1ddee18:      	ldr	x7, [x0, #0xf8]
 1ddee1c:      	ldr	x2, [x5, #0x10]
 1ddee20:      	ldrb	w3, [x7, #0x54]
 1ddee24:      	cbz	x2, 0x1ddef0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df084>
 1ddee28:      	mov	x1, x2
 1ddee2c:      	add	x6, x5, #0x8
 1ddee30:      	ldrb	w4, [x1, #0x20]
 1ddee34:      	cmp	w4, w3
 1ddee38:      	b.lo	0x1ddef00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df078>
 1ddee3c:      	mov	x6, x1
 1ddee40:      	ldr	x1, [x1, #0x10]
 1ddee44:      	cbnz	x1, 0x1ddee30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5defa8>
 1ddee48:      	add	x4, x5, #0x8
 1ddee4c:      	cmp	x6, x4
 1ddee50:      	b.eq	0x1ddef0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df084>
 1ddee54:      	ldrb	w1, [x6, #0x20]
 1ddee58:      	cmp	w1, w3
 1ddee5c:      	b.hi	0x1ddef0c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df084>
 1ddee60:      	stp	x29, x30, [sp, #-0x20]!
 1ddee64:      	mov	x29, sp
 1ddee68:      	stp	x19, x20, [sp, #0x10]
 1ddee6c:      	nop
 1ddee70:      	ldrb	w1, [x2, #0x20]
 1ddee74:      	cmp	w1, w3
 1ddee78:      	b.lo	0x1ddef10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df088>
 1ddee7c:      	mov	x4, x2
 1ddee80:      	ldr	x2, [x2, #0x10]
 1ddee84:      	cbnz	x2, 0x1ddee70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5defe8>
 1ddee88:      	add	x5, x5, #0x8
 1ddee8c:      	mov	x19, x0
 1ddee90:      	cmp	x4, x5
 1ddee94:      	b.eq	0x1ddefe4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df15c>
 1ddee98:      	ldrb	w0, [x4, #0x20]
 1ddee9c:      	cmp	w0, w3
 1ddeea0:      	b.hi	0x1ddefe4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df15c>
 1ddeea4:      	ldrb	w0, [x7, #0x55]
 1ddeea8:      	ldr	w20, [x4, #0x24]
 1ddeeac:      	cbz	w0, 0x1ddef1c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df094>
 1ddeeb0:      	ldrsh	w0, [x7, #0x56]
 1ddeeb4:      	mov	w1, #0x42c80000         // =1120403456
 1ddeeb8:      	fmov	s2, w1
 1ddeebc:      	mov	w1, #0x426c0000         // =1114374144
 1ddeec0:      	fmov	s1, w1
 1ddeec4:      	mov	w1, #-0x1               // =-1
 1ddeec8:      	scvtf	s0, w0
 1ddeecc:      	fdiv	s0, s0, s2
 1ddeed0:      	fmul	s0, s0, s1
 1ddeed4:      	fcvtzs	w0, s0
 1ddeed8:      	sub	w20, w20, w0
 1ddeedc:      	ldr	x0, [x19, #0x160]
 1ddeee0:      	bl	0x1dc1160 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5c12d8>
 1ddeee4:      	ldr	x2, [x19, #0x160]
 1ddeee8:      	mov	w1, w20
 1ddeeec:      	ldp	x19, x20, [sp, #0x10]
 1ddeef0:      	mov	x0, x2
 1ddeef4:      	ldp	x29, x30, [sp], #0x20
 1ddeef8:      	ldr	w2, [x2, #0x24]
 1ddeefc:      	b	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1ddef00:      	ldr	x1, [x1, #0x18]
 1ddef04:      	cbnz	x1, 0x1ddee30 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5defa8>
 1ddef08:      	b	0x1ddee48 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5defc0>
 1ddef0c:      	ret
 1ddef10:      	ldr	x2, [x2, #0x18]
 1ddef14:      	cbnz	x2, 0x1ddee70 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5defe8>
 1ddef18:      	b	0x1ddee88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df000>
 1ddef1c:      	cmp	w3, #0x8
 1ddef20:      	b.eq	0x1ddefdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df154>
 1ddef24:      	b.ls	0x1ddef6c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df0e4>
 1ddef28:      	cmp	w3, #0xc
 1ddef2c:      	b.eq	0x1ddefd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df14c>
 1ddef30:      	b.ls	0x1ddefb0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df128>
 1ddef34:      	cmp	w3, #0x10
 1ddef38:      	mov	w1, #0xa                // =10
 1ddef3c:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddef40:      	cmp	w3, #0x11
 1ddef44:      	mov	w1, #0xb                // =11
 1ddef48:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddef4c:      	cmp	w3, #0xe
 1ddef50:      	mov	w1, #0x9                // =9
 1ddef54:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddef58:      	mov	x1, #0x0                // =0
 1ddef5c:      	mov	w0, #0x0                // =0
 1ddef60:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddef64:      	mov	w1, #-0x1               // =-1
 1ddef68:      	b	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddef6c:      	cmp	w3, #0x5
 1ddef70:      	b.eq	0x1ddefcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df144>
 1ddef74:      	b.ls	0x1ddef94 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df10c>
 1ddef78:      	cmp	w3, #0x6
 1ddef7c:      	mov	w1, #0x3                // =3
 1ddef80:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddef84:      	cmp	w3, #0x7
 1ddef88:      	mov	w1, #0x4                // =4
 1ddef8c:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddef90:      	b	0x1ddef58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df0d0>
 1ddef94:      	cmp	w3, #0x1
 1ddef98:      	mov	w1, #0x0                // =0
 1ddef9c:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefa0:      	cmp	w3, #0x3
 1ddefa4:      	mov	w1, #0x1                // =1
 1ddefa8:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefac:      	b	0x1ddef58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df0d0>
 1ddefb0:      	cmp	w3, #0x9
 1ddefb4:      	mov	w1, #0x6                // =6
 1ddefb8:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefbc:      	cmp	w3, #0xa
 1ddefc0:      	mov	w1, #0x7                // =7
 1ddefc4:      	b.eq	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefc8:      	b	0x1ddef58 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df0d0>
 1ddefcc:      	mov	w1, #0x2                // =2
 1ddefd0:      	b	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefd4:      	mov	w1, #0x8                // =8
 1ddefd8:      	b	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefdc:      	mov	w1, #0x5                // =5
 1ddefe0:      	b	0x1ddeedc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df054>
 1ddefe4:      	adrp	x0, 0x25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x14d0>
 1ddefe8:      	add	x0, x0, #0xbf0
 1ddefec:      	bl	0x424c50 <_ZSt20__throw_out_of_rangePKc@plt>
 1ddeff0:      	adrp	x5, 0x3b9f000 <stdout+0x5df40>
 1ddeff4:      	add	x5, x5, #0x40
 1ddeff8:      	ldr	x7, [x0, #0xf8]
 1ddeffc:      	ldr	x2, [x5, #0x40]
 1ddf000:      	ldrb	w3, [x7, #0x54]
 1ddf004:      	cbz	x2, 0x1ddf0ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df264>
 1ddf008:      	mov	x1, x2
 1ddf00c:      	add	x6, x5, #0x38
 1ddf010:      	ldrb	w4, [x1, #0x20]
 1ddf014:      	cmp	w4, w3
 1ddf018:      	b.lo	0x1ddf0e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df258>
 1ddf01c:      	mov	x6, x1
 1ddf020:      	ldr	x1, [x1, #0x10]
 1ddf024:      	cbnz	x1, 0x1ddf010 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df188>
 1ddf028:      	add	x4, x5, #0x38
 1ddf02c:      	cmp	x6, x4
 1ddf030:      	b.eq	0x1ddf0ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df264>
 1ddf034:      	ldrb	w1, [x6, #0x20]
 1ddf038:      	cmp	w1, w3
 1ddf03c:      	b.hi	0x1ddf0ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df264>
 1ddf040:      	stp	x29, x30, [sp, #-0x20]!
 1ddf044:      	mov	x29, sp
 1ddf048:      	stp	x19, x20, [sp, #0x10]
 1ddf04c:      	nop
 1ddf050:      	ldrb	w1, [x2, #0x20]
 1ddf054:      	cmp	w1, w3
 1ddf058:      	b.lo	0x1ddf0f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df268>
 1ddf05c:      	mov	x4, x2
 1ddf060:      	ldr	x2, [x2, #0x10]
 1ddf064:      	cbnz	x2, 0x1ddf050 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df1c8>
 1ddf068:      	add	x5, x5, #0x38
 1ddf06c:      	mov	x19, x0
 1ddf070:      	cmp	x4, x5
 1ddf074:      	b.eq	0x1ddf1b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df330>
 1ddf078:      	ldrb	w0, [x4, #0x20]
 1ddf07c:      	cmp	w0, w3
 1ddf080:      	b.hi	0x1ddf1b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df330>
 1ddf084:      	ldrb	w0, [x7, #0x55]
 1ddf088:      	ldr	w20, [x4, #0x24]
 1ddf08c:      	cbz	w0, 0x1ddf0fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df274>
 1ddf090:      	ldrsh	w0, [x7, #0x56]
 1ddf094:      	mov	w1, #0x42c80000         // =1120403456
 1ddf098:      	fmov	s2, w1
 1ddf09c:      	mov	w1, #0x426c0000         // =1114374144
 1ddf0a0:      	fmov	s1, w1
 1ddf0a4:      	mov	w1, #-0x1               // =-1
 1ddf0a8:      	scvtf	s0, w0
 1ddf0ac:      	fdiv	s0, s0, s2
 1ddf0b0:      	fmul	s0, s0, s1
 1ddf0b4:      	fcvtzs	w0, s0
 1ddf0b8:      	sub	w20, w20, w0
 1ddf0bc:      	ldr	x0, [x19, #0x108]
 1ddf0c0:      	bl	0x1dc34f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5c3670>
 1ddf0c4:      	ldr	x2, [x19, #0x108]
 1ddf0c8:      	mov	w1, w20
 1ddf0cc:      	ldp	x19, x20, [sp, #0x10]
 1ddf0d0:      	mov	x0, x2
 1ddf0d4:      	ldp	x29, x30, [sp], #0x20
 1ddf0d8:      	ldr	w2, [x2, #0x24]
 1ddf0dc:      	b	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1ddf0e0:      	ldr	x1, [x1, #0x18]
 1ddf0e4:      	cbnz	x1, 0x1ddf010 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df188>
 1ddf0e8:      	b	0x1ddf028 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df1a0>
 1ddf0ec:      	ret
 1ddf0f0:      	ldr	x2, [x2, #0x18]
 1ddf0f4:      	cbnz	x2, 0x1ddf050 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df1c8>
 1ddf0f8:      	b	0x1ddf068 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df1e0>
 1ddf0fc:      	cmp	w3, #0xc
 1ddf100:      	b.eq	0x1ddf1b0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df328>
 1ddf104:      	b.ls	0x1ddf15c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df2d4>
 1ddf108:      	cmp	w3, #0x11
 1ddf10c:      	b.eq	0x1ddf1a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df320>
 1ddf110:      	b.hi	0x1ddf140 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df2b8>
 1ddf114:      	cmp	w3, #0xe
 1ddf118:      	mov	w1, #0x6                // =6
 1ddf11c:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf120:      	cmp	w3, #0x10
 1ddf124:      	mov	w1, #0x7                // =7
 1ddf128:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf12c:      	mov	x1, #0x0                // =0
 1ddf130:      	mov	w0, #0x0                // =0
 1ddf134:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddf138:      	mov	w1, #-0x1               // =-1
 1ddf13c:      	b	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf140:      	cmp	w3, #0x12
 1ddf144:      	mov	w1, #0x9                // =9
 1ddf148:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf14c:      	cmp	w3, #0x13
 1ddf150:      	mov	w1, #0xa                // =10
 1ddf154:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf158:      	b	0x1ddf12c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df2a4>
 1ddf15c:      	cmp	w3, #0x5
 1ddf160:      	b.eq	0x1ddf1a0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df318>
 1ddf164:      	b.hi	0x1ddf184 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df2fc>
 1ddf168:      	cmp	w3, #0x1
 1ddf16c:      	mov	w1, #0x0                // =0
 1ddf170:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf174:      	cmp	w3, #0x3
 1ddf178:      	mov	w1, #0x1                // =1
 1ddf17c:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf180:      	b	0x1ddf12c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df2a4>
 1ddf184:      	cmp	w3, #0x7
 1ddf188:      	mov	w1, #0x3                // =3
 1ddf18c:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf190:      	cmp	w3, #0xa
 1ddf194:      	mov	w1, #0x4                // =4
 1ddf198:      	b.eq	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf19c:      	b	0x1ddf12c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df2a4>
 1ddf1a0:      	mov	w1, #0x2                // =2
 1ddf1a4:      	b	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf1a8:      	mov	w1, #0x8                // =8
 1ddf1ac:      	b	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf1b0:      	mov	w1, #0x5                // =5
 1ddf1b4:      	b	0x1ddf0bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df234>
 1ddf1b8:      	adrp	x0, 0x25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x14d0>
 1ddf1bc:      	add	x0, x0, #0xbf0
 1ddf1c0:      	bl	0x424c50 <_ZSt20__throw_out_of_rangePKc@plt>
 1ddf1c4:      	nop
 1ddf1c8:      	adrp	x5, 0x3b9f000 <stdout+0x5df40>
 1ddf1cc:      	add	x5, x5, #0x40
 1ddf1d0:      	ldr	x7, [x0, #0xf8]
 1ddf1d4:      	ldr	x2, [x5, #0x70]
 1ddf1d8:      	ldrb	w4, [x7, #0x54]
 1ddf1dc:      	cbz	x2, 0x1ddf2c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df43c>
 1ddf1e0:      	mov	x1, x2
 1ddf1e4:      	add	x6, x5, #0x68
 1ddf1e8:      	ldrb	w3, [x1, #0x20]
 1ddf1ec:      	cmp	w3, w4
 1ddf1f0:      	b.lo	0x1ddf2b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df430>
 1ddf1f4:      	mov	x6, x1
 1ddf1f8:      	ldr	x1, [x1, #0x10]
 1ddf1fc:      	cbnz	x1, 0x1ddf1e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df360>
 1ddf200:      	add	x3, x5, #0x68
 1ddf204:      	cmp	x6, x3
 1ddf208:      	b.eq	0x1ddf2c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df43c>
 1ddf20c:      	ldrb	w1, [x6, #0x20]
 1ddf210:      	cmp	w1, w4
 1ddf214:      	b.hi	0x1ddf2c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df43c>
 1ddf218:      	stp	x29, x30, [sp, #-0x20]!
 1ddf21c:      	mov	x29, sp
 1ddf220:      	stp	x19, x20, [sp, #0x10]
 1ddf224:      	nop
 1ddf228:      	ldrb	w1, [x2, #0x20]
 1ddf22c:      	cmp	w1, w4
 1ddf230:      	b.lo	0x1ddf2c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df440>
 1ddf234:      	mov	x3, x2
 1ddf238:      	ldr	x2, [x2, #0x10]
 1ddf23c:      	cbnz	x2, 0x1ddf228 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df3a0>
 1ddf240:      	add	x5, x5, #0x68
 1ddf244:      	mov	x19, x0
 1ddf248:      	cmp	x3, x5
 1ddf24c:      	b.eq	0x1ddf39c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df514>
 1ddf250:      	ldrb	w0, [x3, #0x20]
 1ddf254:      	cmp	w0, w4
 1ddf258:      	b.hi	0x1ddf39c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df514>
 1ddf25c:      	ldrb	w0, [x7, #0x55]
 1ddf260:      	ldr	w20, [x3, #0x24]
 1ddf264:      	cbz	w0, 0x1ddf2d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df44c>
 1ddf268:      	ldrsh	w0, [x7, #0x56]
 1ddf26c:      	mov	w1, #0x42c80000         // =1120403456
 1ddf270:      	fmov	s2, w1
 1ddf274:      	mov	w1, #0x426c0000         // =1114374144
 1ddf278:      	fmov	s1, w1
 1ddf27c:      	mov	w1, #-0x1               // =-1
 1ddf280:      	scvtf	s0, w0
 1ddf284:      	fdiv	s0, s0, s2
 1ddf288:      	fmul	s0, s0, s1
 1ddf28c:      	fcvtzs	w0, s0
 1ddf290:      	sub	w20, w20, w0
 1ddf294:      	ldr	x0, [x19, #0x110]
 1ddf298:      	bl	0x1dc5c40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5c5db8>
 1ddf29c:      	ldr	x2, [x19, #0x110]
 1ddf2a0:      	mov	w1, w20
 1ddf2a4:      	ldp	x19, x20, [sp, #0x10]
 1ddf2a8:      	mov	x0, x2
 1ddf2ac:      	ldp	x29, x30, [sp], #0x20
 1ddf2b0:      	ldr	w2, [x2, #0x24]
 1ddf2b4:      	b	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1ddf2b8:      	ldr	x1, [x1, #0x18]
 1ddf2bc:      	cbnz	x1, 0x1ddf1e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df360>
 1ddf2c0:      	b	0x1ddf200 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df378>
 1ddf2c4:      	ret
 1ddf2c8:      	ldr	x2, [x2, #0x18]
 1ddf2cc:      	cbnz	x2, 0x1ddf228 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df3a0>
 1ddf2d0:      	b	0x1ddf240 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df3b8>
 1ddf2d4:      	sub	w4, w4, #0x1
 1ddf2d8:      	cmp	w4, #0x1d
 1ddf2dc:      	b.ls	0x1ddf2f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df46c>
 1ddf2e0:      	mov	x1, #0x0                // =0
 1ddf2e4:      	mov	w0, #0x0                // =0
 1ddf2e8:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddf2ec:      	mov	w1, #-0x1               // =-1
 1ddf2f0:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf2f4:      	adrp	x0, 0x2d64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a11a8>
 1ddf2f8:      	add	x0, x0, #0xb10
 1ddf2fc:      	ldrb	w0, [x0, w4, uxtw]
 1ddf300:      	adr	x1, 0x1ddf30c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df484>
 1ddf304:      	add	x0, x1, w0, sxtb #2
 1ddf308:      	br	x0
 1ddf30c:      	mov	w1, #0x2                // =2
 1ddf310:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf314:      	mov	w1, #0x9                // =9
 1ddf318:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf31c:      	mov	w1, #0x8                // =8
 1ddf320:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf324:      	mov	w1, #0xa                // =10
 1ddf328:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf32c:      	mov	w1, #0x3                // =3
 1ddf330:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf334:      	mov	w1, #0x13               // =19
 1ddf338:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf33c:      	mov	w1, #0x12               // =18
 1ddf340:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf344:      	mov	w1, #0x7                // =7
 1ddf348:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf34c:      	mov	w1, #0x6                // =6
 1ddf350:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf354:      	mov	w1, #0x5                // =5
 1ddf358:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf35c:      	mov	w1, #0x4                // =4
 1ddf360:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf364:      	mov	w1, #0x11               // =17
 1ddf368:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf36c:      	mov	w1, #0x10               // =16
 1ddf370:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf374:      	mov	w1, #0xf                // =15
 1ddf378:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf37c:      	mov	w1, #0xe                // =14
 1ddf380:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf384:      	mov	w1, #0xd                // =13
 1ddf388:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf38c:      	mov	w1, #0xc                // =12
 1ddf390:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf394:      	mov	w1, #0xb                // =11
 1ddf398:      	b	0x1ddf294 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df40c>
 1ddf39c:      	adrp	x0, 0x25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x14d0>
 1ddf3a0:      	add	x0, x0, #0xbf0
 1ddf3a4:      	bl	0x424c50 <_ZSt20__throw_out_of_rangePKc@plt>
 1ddf3a8:      	adrp	x5, 0x3b9f000 <stdout+0x5df40>
 1ddf3ac:      	add	x5, x5, #0x40
 1ddf3b0:      	ldr	x7, [x0, #0xf8]
 1ddf3b4:      	ldr	x2, [x5, #0xa0]
 1ddf3b8:      	ldrb	w4, [x7, #0x54]
 1ddf3bc:      	cbz	x2, 0x1ddf4a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df61c>
 1ddf3c0:      	mov	x1, x2
 1ddf3c4:      	add	x6, x5, #0x98
 1ddf3c8:      	ldrb	w3, [x1, #0x20]
 1ddf3cc:      	cmp	w3, w4
 1ddf3d0:      	b.lo	0x1ddf498 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df610>
 1ddf3d4:      	mov	x6, x1
 1ddf3d8:      	ldr	x1, [x1, #0x10]
 1ddf3dc:      	cbnz	x1, 0x1ddf3c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df540>
 1ddf3e0:      	add	x3, x5, #0x98
 1ddf3e4:      	cmp	x6, x3
 1ddf3e8:      	b.eq	0x1ddf4a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df61c>
 1ddf3ec:      	ldrb	w1, [x6, #0x20]
 1ddf3f0:      	cmp	w1, w4
 1ddf3f4:      	b.hi	0x1ddf4a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df61c>
 1ddf3f8:      	stp	x29, x30, [sp, #-0x20]!
 1ddf3fc:      	mov	x29, sp
 1ddf400:      	stp	x19, x20, [sp, #0x10]
 1ddf404:      	nop
 1ddf408:      	ldrb	w1, [x2, #0x20]
 1ddf40c:      	cmp	w1, w4
 1ddf410:      	b.lo	0x1ddf4a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df620>
 1ddf414:      	mov	x3, x2
 1ddf418:      	ldr	x2, [x2, #0x10]
 1ddf41c:      	cbnz	x2, 0x1ddf408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df580>
 1ddf420:      	add	x5, x5, #0x98
 1ddf424:      	mov	x19, x0
 1ddf428:      	cmp	x3, x5
 1ddf42c:      	b.eq	0x1ddf58c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df704>
 1ddf430:      	ldrb	w0, [x3, #0x20]
 1ddf434:      	cmp	w0, w4
 1ddf438:      	b.hi	0x1ddf58c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df704>
 1ddf43c:      	ldrb	w0, [x7, #0x55]
 1ddf440:      	ldr	w20, [x3, #0x24]
 1ddf444:      	cbz	w0, 0x1ddf4b4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df62c>
 1ddf448:      	ldrsh	w0, [x7, #0x56]
 1ddf44c:      	mov	w1, #0x42c80000         // =1120403456
 1ddf450:      	fmov	s2, w1
 1ddf454:      	mov	w1, #0x426c0000         // =1114374144
 1ddf458:      	fmov	s1, w1
 1ddf45c:      	mov	w1, #-0x1               // =-1
 1ddf460:      	scvtf	s0, w0
 1ddf464:      	fdiv	s0, s0, s2
 1ddf468:      	fmul	s0, s0, s1
 1ddf46c:      	fcvtzs	w0, s0
 1ddf470:      	sub	w20, w20, w0
 1ddf474:      	ldr	x0, [x19, #0x118]
 1ddf478:      	bl	0x1dc9d00 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5c9e78>
 1ddf47c:      	ldr	x2, [x19, #0x118]
 1ddf480:      	mov	w1, w20
 1ddf484:      	ldp	x19, x20, [sp, #0x10]
 1ddf488:      	mov	x0, x2
 1ddf48c:      	ldp	x29, x30, [sp], #0x20
 1ddf490:      	ldr	w2, [x2, #0x24]
 1ddf494:      	b	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1ddf498:      	ldr	x1, [x1, #0x18]
 1ddf49c:      	cbnz	x1, 0x1ddf3c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df540>
 1ddf4a0:      	b	0x1ddf3e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df558>
 1ddf4a4:      	ret
 1ddf4a8:      	ldr	x2, [x2, #0x18]
 1ddf4ac:      	cbnz	x2, 0x1ddf408 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df580>
 1ddf4b0:      	b	0x1ddf420 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df598>
 1ddf4b4:      	sub	w4, w4, #0x1
 1ddf4b8:      	cmp	w4, #0x1d
 1ddf4bc:      	b.ls	0x1ddf4d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df64c>
 1ddf4c0:      	mov	x1, #0x0                // =0
 1ddf4c4:      	mov	w0, #0x0                // =0
 1ddf4c8:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddf4cc:      	mov	w1, #-0x1               // =-1
 1ddf4d0:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf4d4:      	adrp	x0, 0x2d64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a11a8>
 1ddf4d8:      	add	x0, x0, #0xb30
 1ddf4dc:      	ldrb	w0, [x0, w4, uxtw]
 1ddf4e0:      	adr	x1, 0x1ddf4ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df664>
 1ddf4e4:      	add	x0, x1, w0, sxtb #2
 1ddf4e8:      	br	x0
 1ddf4ec:      	mov	w1, #0xb                // =11
 1ddf4f0:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf4f4:      	mov	w1, #0xa                // =10
 1ddf4f8:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf4fc:      	mov	w1, #0x9                // =9
 1ddf500:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf504:      	mov	w1, #0x8                // =8
 1ddf508:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf50c:      	mov	w1, #0x7                // =7
 1ddf510:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf514:      	mov	w1, #0x6                // =6
 1ddf518:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf51c:      	mov	w1, #0x5                // =5
 1ddf520:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf524:      	mov	w1, #0x4                // =4
 1ddf528:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf52c:      	mov	w1, #0x3                // =3
 1ddf530:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf534:      	mov	w1, #0x2                // =2
 1ddf538:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf53c:      	mov	w1, #0x15               // =21
 1ddf540:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf544:      	mov	w1, #0x14               // =20
 1ddf548:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf54c:      	mov	w1, #0x13               // =19
 1ddf550:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf554:      	mov	w1, #0x12               // =18
 1ddf558:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf55c:      	mov	w1, #0x11               // =17
 1ddf560:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf564:      	mov	w1, #0x10               // =16
 1ddf568:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf56c:      	mov	w1, #0xf                // =15
 1ddf570:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf574:      	mov	w1, #0xe                // =14
 1ddf578:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf57c:      	mov	w1, #0xd                // =13
 1ddf580:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf584:      	mov	w1, #0xc                // =12
 1ddf588:      	b	0x1ddf474 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df5ec>
 1ddf58c:      	adrp	x0, 0x25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x14d0>
 1ddf590:      	add	x0, x0, #0xbf0
 1ddf594:      	bl	0x424c50 <_ZSt20__throw_out_of_rangePKc@plt>
 1ddf598:      	adrp	x5, 0x3b9f000 <stdout+0x5df40>
 1ddf59c:      	add	x5, x5, #0x40
 1ddf5a0:      	ldr	x7, [x0, #0xf8]
 1ddf5a4:      	ldr	x2, [x5, #0xd0]
 1ddf5a8:      	ldrb	w4, [x7, #0x54]
 1ddf5ac:      	cbz	x2, 0x1ddf694 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df80c>
 1ddf5b0:      	mov	x1, x2
 1ddf5b4:      	add	x6, x5, #0xc8
 1ddf5b8:      	ldrb	w3, [x1, #0x20]
 1ddf5bc:      	cmp	w3, w4
 1ddf5c0:      	b.lo	0x1ddf688 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df800>
 1ddf5c4:      	mov	x6, x1
 1ddf5c8:      	ldr	x1, [x1, #0x10]
 1ddf5cc:      	cbnz	x1, 0x1ddf5b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df730>
 1ddf5d0:      	add	x3, x5, #0xc8
 1ddf5d4:      	cmp	x6, x3
 1ddf5d8:      	b.eq	0x1ddf694 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df80c>
 1ddf5dc:      	ldrb	w1, [x6, #0x20]
 1ddf5e0:      	cmp	w1, w4
 1ddf5e4:      	b.hi	0x1ddf694 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df80c>
 1ddf5e8:      	stp	x29, x30, [sp, #-0x20]!
 1ddf5ec:      	mov	x29, sp
 1ddf5f0:      	stp	x19, x20, [sp, #0x10]
 1ddf5f4:      	nop
 1ddf5f8:      	ldrb	w1, [x2, #0x20]
 1ddf5fc:      	cmp	w1, w4
 1ddf600:      	b.lo	0x1ddf698 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df810>
 1ddf604:      	mov	x3, x2
 1ddf608:      	ldr	x2, [x2, #0x10]
 1ddf60c:      	cbnz	x2, 0x1ddf5f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df770>
 1ddf610:      	add	x5, x5, #0xc8
 1ddf614:      	mov	x19, x0
 1ddf618:      	cmp	x3, x5
 1ddf61c:      	b.eq	0x1ddf78c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df904>
 1ddf620:      	ldrb	w0, [x3, #0x20]
 1ddf624:      	cmp	w0, w4
 1ddf628:      	b.hi	0x1ddf78c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df904>
 1ddf62c:      	ldrb	w0, [x7, #0x55]
 1ddf630:      	ldr	w20, [x3, #0x24]
 1ddf634:      	cbz	w0, 0x1ddf6a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df81c>
 1ddf638:      	ldrsh	w0, [x7, #0x56]
 1ddf63c:      	mov	w1, #0x42c80000         // =1120403456
 1ddf640:      	fmov	s2, w1
 1ddf644:      	mov	w1, #0x426c0000         // =1114374144
 1ddf648:      	fmov	s1, w1
 1ddf64c:      	mov	w1, #-0x1               // =-1
 1ddf650:      	scvtf	s0, w0
 1ddf654:      	fdiv	s0, s0, s2
 1ddf658:      	fmul	s0, s0, s1
 1ddf65c:      	fcvtzs	w0, s0
 1ddf660:      	sub	w20, w20, w0
 1ddf664:      	ldr	x0, [x19, #0x120]
 1ddf668:      	bl	0x1dce338 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5ce4b0>
 1ddf66c:      	ldr	x2, [x19, #0x120]
 1ddf670:      	mov	w1, w20
 1ddf674:      	ldp	x19, x20, [sp, #0x10]
 1ddf678:      	mov	x0, x2
 1ddf67c:      	ldp	x29, x30, [sp], #0x20
 1ddf680:      	ldr	w2, [x2, #0x24]
 1ddf684:      	b	0x249fc80 <_ZNSt8functionIFvvEEC2ERKS1_+0x12a860>
 1ddf688:      	ldr	x1, [x1, #0x18]
 1ddf68c:      	cbnz	x1, 0x1ddf5b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df730>
 1ddf690:      	b	0x1ddf5d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df748>
 1ddf694:      	ret
 1ddf698:      	ldr	x2, [x2, #0x18]
 1ddf69c:      	cbnz	x2, 0x1ddf5f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df770>
 1ddf6a0:      	b	0x1ddf610 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df788>
 1ddf6a4:      	sub	w4, w4, #0x1
 1ddf6a8:      	cmp	w4, #0x1d
 1ddf6ac:      	b.ls	0x1ddf6c4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df83c>
 1ddf6b0:      	mov	x1, #0x0                // =0
 1ddf6b4:      	mov	w0, #0x0                // =0
 1ddf6b8:      	bl	0x22006c0 <_ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKNSt7__cxx1112basic_stringIS3_St11char_traitsIS3_ESaIS3_EEESE_+0x785a8>
 1ddf6bc:      	mov	w1, #-0x1               // =-1
 1ddf6c0:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf6c4:      	adrp	x0, 0x2d64000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x7a11a8>
 1ddf6c8:      	add	x0, x0, #0xb50
 1ddf6cc:      	ldrb	w0, [x0, w4, uxtw]
 1ddf6d0:      	adr	x1, 0x1ddf6dc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df854>
 1ddf6d4:      	add	x0, x1, w0, sxtb #2
 1ddf6d8:      	br	x0
 1ddf6dc:      	mov	w1, #0xc                // =12
 1ddf6e0:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf6e4:      	mov	w1, #0xb                // =11
 1ddf6e8:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf6ec:      	mov	w1, #0xa                // =10
 1ddf6f0:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf6f4:      	mov	w1, #0x9                // =9
 1ddf6f8:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf6fc:      	mov	w1, #0x8                // =8
 1ddf700:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf704:      	mov	w1, #0x7                // =7
 1ddf708:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf70c:      	mov	w1, #0x6                // =6
 1ddf710:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf714:      	mov	w1, #0x5                // =5
 1ddf718:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf71c:      	mov	w1, #0x4                // =4
 1ddf720:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf724:      	mov	w1, #0x3                // =3
 1ddf728:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf72c:      	mov	w1, #0x2                // =2
 1ddf730:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf734:      	mov	w1, #0x17               // =23
 1ddf738:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf73c:      	mov	w1, #0x16               // =22
 1ddf740:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf744:      	mov	w1, #0x15               // =21
 1ddf748:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf74c:      	mov	w1, #0x14               // =20
 1ddf750:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf754:      	mov	w1, #0x13               // =19
 1ddf758:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf75c:      	mov	w1, #0x12               // =18
 1ddf760:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf764:      	mov	w1, #0x11               // =17
 1ddf768:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf76c:      	mov	w1, #0x10               // =16
 1ddf770:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf774:      	mov	w1, #0xf                // =15
 1ddf778:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf77c:      	mov	w1, #0xe                // =14
 1ddf780:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf784:      	mov	w1, #0xd                // =13
 1ddf788:      	b	0x1ddf664 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df7dc>
 1ddf78c:      	adrp	x0, 0x25c2000 <_ZTISt16_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE+0x14d0>
 1ddf790:      	add	x0, x0, #0xbf0
 1ddf794:      	bl	0x424c50 <_ZSt20__throw_out_of_rangePKc@plt>
 1ddf798:      	adrp	x5, 0x3b9f000 <stdout+0x5df40>
 1ddf79c:      	add	x5, x5, #0x40
 1ddf7a0:      	ldr	x7, [x0, #0xf8]
 1ddf7a4:      	ldr	x2, [x5, #0x100]
 1ddf7a8:      	ldrb	w4, [x7, #0x54]
 1ddf7ac:      	cbz	x2, 0x1ddf894 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dfa0c>
 1ddf7b0:      	mov	x1, x2
 1ddf7b4:      	add	x6, x5, #0xf8
 1ddf7b8:      	ldrb	w3, [x1, #0x20]
 1ddf7bc:      	cmp	w3, w4
 1ddf7c0:      	b.lo	0x1ddf888 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dfa00>
 1ddf7c4:      	mov	x6, x1
 1ddf7c8:      	ldr	x1, [x1, #0x10]
 1ddf7cc:      	cbnz	x1, 0x1ddf7b8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5df930>
 1ddf7d0:      	add	x3, x5, #0xf8
 1ddf7d4:      	cmp	x6, x3
 1ddf7d8:      	b.eq	0x1ddf894 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dfa0c>
 1ddf7dc:      	ldrb	w1, [x6, #0x20]
 1ddf7e0:      	cmp	w1, w4
 1ddf7e4:      	b.hi	0x1ddf894 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x5dfa0c>
 1ddf7e8:      	stp	x29, x30, [sp, #-0x20]!
 1ddf7ec:      	mov	x29, sp
 1ddf7f0:      	stp	x19, x20, [sp, #0x10]
 1ddf7f4:      	nop
 1ddf7f8:      	ldrb	w1, [x2, #0x20]
 1ddf7fc:      	cmp	w1, w4
