
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000207af98 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b110>:
 207af98:	f9417802 	ldr	x2, [x0,#752]
 207af9c:	12001c63 	and	w3, w3, #0xff
 207afa0:	f9417c05 	ldr	x5, [x0,#760]
 207afa4:	eb05005f 	cmp	x2, x5
 207afa8:	540001a0 	b.eq	207afdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b154>
 207afac:	f9400044 	ldr	x4, [x2]
 207afb0:	39408080 	ldrb	w0, [x4,#32]
 207afb4:	6b03001f 	cmp	w0, w3
 207afb8:	54000160 	b.eq	207afe4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b15c>
 207afbc:	91002040 	add	x0, x2, #0x8
 207afc0:	14000005 	b	207afd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b14c>
 207afc4:	f8408404 	ldr	x4, [x0],#8
 207afc8:	39408082 	ldrb	w2, [x4,#32]
 207afcc:	6b03005f 	cmp	w2, w3
 207afd0:	540000a0 	b.eq	207afe4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b15c>
 207afd4:	eb0000bf 	cmp	x5, x0
 207afd8:	54ffff61 	b.ne	207afc4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b13c>
 207afdc:	d2800000 	mov	x0, #0x0                   	// #0
 207afe0:	d65f03c0 	ret
 207afe4:	a9409082 	ldp	x2, x4, [x4,#8]
 207afe8:	eb04005f 	cmp	x2, x4
 207afec:	54ffff80 	b.eq	207afdc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b154>
 207aff0:	f9400040 	ldr	x0, [x2]
 207aff4:	b9406803 	ldr	w3, [x0,#104]
 207aff8:	6b03003f 	cmp	w1, w3
 207affc:	54ffff20 	b.eq	207afe0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b158>
 207b000:	91002042 	add	x2, x2, #0x8
 207b004:	14000005 	b	207b018 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b190>
 207b008:	f8408440 	ldr	x0, [x2],#8
 207b00c:	b9406803 	ldr	w3, [x0,#104]
 207b010:	6b03003f 	cmp	w1, w3
 207b014:	54fffe60 	b.eq	207afe0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b158>
 207b018:	eb02009f 	cmp	x4, x2
 207b01c:	54ffff61 	b.ne	207b008 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b180>
 207b020:	d2800000 	mov	x0, #0x0                   	// #0
 207b024:	17ffffef 	b	207afe0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x87b158>
