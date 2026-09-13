
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

00000000021345f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934768>:
 21345f0:	91002000 	add	x0, x0, #0x8
 21345f4:	08dffc01 	ldarb	w1, [x0]
 21345f8:	12001c21 	and	w1, w1, #0xff
 21345fc:	321d0022 	orr	w2, w1, #0x8
 2134600:	085ffc03 	ldaxrb	w3, [x0]
 2134604:	6b01007f 	cmp	w3, w1
 2134608:	54000061 	b.ne	2134614 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93478c>
 213460c:	0804fc02 	stlxrb	w4, w2, [x0]
 2134610:	35ffff84 	cbnz	w4, 2134600 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934778>
 2134614:	54ffff01 	b.ne	21345f4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93476c>
 2134618:	d65f03c0 	ret
 213461c:	00000000 	.inst	0x00000000 ; undefined
 2134620:	91002000 	add	x0, x0, #0x8
 2134624:	08dffc01 	ldarb	w1, [x0]
 2134628:	12001c21 	and	w1, w1, #0xff
 213462c:	321e0022 	orr	w2, w1, #0x4
 2134630:	085ffc03 	ldaxrb	w3, [x0]
 2134634:	6b01007f 	cmp	w3, w1
 2134638:	54000061 	b.ne	2134644 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9347bc>
 213463c:	0804fc02 	stlxrb	w4, w2, [x0]
 2134640:	35ffff84 	cbnz	w4, 2134630 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9347a8>
 2134644:	54ffff01 	b.ne	2134624 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93479c>
 2134648:	d65f03c0 	ret
 213464c:	00000000 	.inst	0x00000000 ; undefined
 2134650:	91002000 	add	x0, x0, #0x8
 2134654:	08dffc01 	ldarb	w1, [x0]
 2134658:	12001c21 	and	w1, w1, #0xff
 213465c:	321f0022 	orr	w2, w1, #0x2
 2134660:	085ffc03 	ldaxrb	w3, [x0]
 2134664:	6b01007f 	cmp	w3, w1
 2134668:	54000061 	b.ne	2134674 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9347ec>
 213466c:	0804fc02 	stlxrb	w4, w2, [x0]
 2134670:	35ffff84 	cbnz	w4, 2134660 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9347d8>
 2134674:	54ffff01 	b.ne	2134654 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9347cc>
 2134678:	d65f03c0 	ret
 213467c:	00000000 	.inst	0x00000000 ; undefined
 2134680:	91002000 	add	x0, x0, #0x8
 2134684:	08dffc01 	ldarb	w1, [x0]
 2134688:	12001c21 	and	w1, w1, #0xff
 213468c:	32000022 	orr	w2, w1, #0x1
 2134690:	085ffc03 	ldaxrb	w3, [x0]
 2134694:	6b01007f 	cmp	w3, w1
 2134698:	54000061 	b.ne	21346a4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x93481c>
 213469c:	0804fc02 	stlxrb	w4, w2, [x0]
 21346a0:	35ffff84 	cbnz	w4, 2134690 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x934808>
 21346a4:	54ffff01 	b.ne	2134684 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9347fc>
 21346a8:	d65f03c0 	ret
 21346ac:	00000000 	.inst	0x00000000 ; undefined
