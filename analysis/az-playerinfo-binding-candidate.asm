
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002130650 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9307c8>:
 2130650:	d29d0001 	mov	x1, #0xe800                	// #59392
 2130654:	12001c63 	and	w3, w3, #0xff
 2130658:	f2b49001 	movk	x1, #0xa480, lsl #16
 213065c:	f2dd0f21 	movk	x1, #0xe879, lsl #32
 2130660:	f2ed0be1 	movk	x1, #0x685f, lsl #48
 2130664:	eb01005f 	cmp	x2, x1
 2130668:	54000140 	b.eq	2130690 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930808>
 213066c:	d29d0021 	mov	x1, #0xe801                	// #59393
 2130670:	f2b49001 	movk	x1, #0xa480, lsl #16
 2130674:	f2dd0f21 	movk	x1, #0xe879, lsl #32
 2130678:	f2ed0be1 	movk	x1, #0x685f, lsl #48
 213067c:	eb01005f 	cmp	x2, x1
 2130680:	54000040 	b.eq	2130688 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930800>
 2130684:	d65f03c0 	ret
 2130688:	39004003 	strb	w3, [x0,#16]
 213068c:	d65f03c0 	ret
 2130690:	39003c03 	strb	w3, [x0,#15]
 2130694:	d65f03c0 	ret
 2130698:	f9400422 	ldr	x2, [x1,#8]
 213069c:	f9000402 	str	x2, [x0,#8]
 21306a0:	b4000202 	cbz	x2, 21306e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930858>
 21306a4:	91002042 	add	x2, x2, #0x8
 21306a8:	b9400043 	ldr	w3, [x2]
 21306ac:	34000263 	cbz	w3, 21306f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930870>
 21306b0:	11000464 	add	w4, w3, #0x1
 21306b4:	885ffc45 	ldaxr	w5, [x2]
 21306b8:	6b0300bf 	cmp	w5, w3
 21306bc:	54000061 	b.ne	21306c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930840>
 21306c0:	8806fc44 	stlxr	w6, w4, [x2]
 21306c4:	710000df 	cmp	w6, #0x0
 21306c8:	540001c1 	b.ne	2130700 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930878>
 21306cc:	f9400402 	ldr	x2, [x0,#8]
 21306d0:	b4000082 	cbz	x2, 21306e0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930858>
 21306d4:	91002042 	add	x2, x2, #0x8
 21306d8:	b9400042 	ldr	w2, [x2]
 21306dc:	35000082 	cbnz	w2, 21306ec <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x930864>
