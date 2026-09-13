
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000002143f40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9440b8>:
 2143f40:	7945d000 	ldrh	w0, [x0,#744]
 2143f44:	d65f03c0 	ret
 2143f48:	b900081f 	str	wzr, [x0,#8]
 2143f4c:	d2800301 	mov	x1, #0x18                  	// #24
 2143f50:	178b89c4 	b	426660 <_ZdlPvm@plt>
 2143f54:	00000000 	.inst	0x00000000 ; undefined
 2143f58:	b900081f 	str	wzr, [x0,#8]
 2143f5c:	d65f03c0 	ret
 2143f60:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 2143f64:	910003fd 	mov	x29, sp
 2143f68:	a90153f3 	stp	x19, x20, [sp,#16]
 2143f6c:	aa0003f3 	mov	x19, x0
 2143f70:	91056014 	add	x20, x0, #0x158
 2143f74:	f90013f5 	str	x21, [sp,#32]
 2143f78:	91046015 	add	x21, x0, #0x118
 2143f7c:	d503201f 	nop
 2143f80:	f9400281 	ldr	x1, [x20]
 2143f84:	aa0103e0 	mov	x0, x1
 2143f88:	b40017c1 	cbz	x1, 2144280 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9443f8>
 2143f8c:	f9400021 	ldr	x1, [x1]
 2143f90:	d1002294 	sub	x20, x20, #0x8
 2143f94:	f9400421 	ldr	x1, [x1,#8]
 2143f98:	d63f0020 	blr	x1
 2143f9c:	eb15029f 	cmp	x20, x21
 2143fa0:	54ffff01 	b.ne	2143f80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9440f8>
 2143fa4:	f9408e60 	ldr	x0, [x19,#280]
 2143fa8:	b4000080 	cbz	x0, 2143fb8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944130>
 2143fac:	f9400001 	ldr	x1, [x0]
 2143fb0:	f9400421 	ldr	x1, [x1,#8]
 2143fb4:	d63f0020 	blr	x1
 2143fb8:	f9408a60 	ldr	x0, [x19,#272]
 2143fbc:	b4000080 	cbz	x0, 2143fcc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944144>
 2143fc0:	f9400001 	ldr	x1, [x0]
 2143fc4:	f9400421 	ldr	x1, [x1,#8]
 2143fc8:	d63f0020 	blr	x1
 2143fcc:	f9408660 	ldr	x0, [x19,#264]
 2143fd0:	b4000080 	cbz	x0, 2143fe0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944158>
 2143fd4:	f9400001 	ldr	x1, [x0]
 2143fd8:	f9400421 	ldr	x1, [x1,#8]
 2143fdc:	d63f0020 	blr	x1
 2143fe0:	f9408260 	ldr	x0, [x19,#256]
 2143fe4:	b4000080 	cbz	x0, 2143ff4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94416c>
 2143fe8:	f9400001 	ldr	x1, [x0]
 2143fec:	f9400421 	ldr	x1, [x1,#8]
 2143ff0:	d63f0020 	blr	x1
 2143ff4:	f9407e60 	ldr	x0, [x19,#248]
 2143ff8:	b4000080 	cbz	x0, 2144008 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944180>
 2143ffc:	f9400001 	ldr	x1, [x0]
 2144000:	f9400421 	ldr	x1, [x1,#8]
 2144004:	d63f0020 	blr	x1
 2144008:	f9407a60 	ldr	x0, [x19,#240]
 214400c:	b4000080 	cbz	x0, 214401c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944194>
 2144010:	f9400001 	ldr	x1, [x0]
 2144014:	f9400421 	ldr	x1, [x1,#8]
 2144018:	d63f0020 	blr	x1
 214401c:	f9407660 	ldr	x0, [x19,#232]
 2144020:	b4000080 	cbz	x0, 2144030 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9441a8>
 2144024:	f9400001 	ldr	x1, [x0]
 2144028:	f9400421 	ldr	x1, [x1,#8]
 214402c:	d63f0020 	blr	x1
 2144030:	f9407260 	ldr	x0, [x19,#224]
 2144034:	b4000080 	cbz	x0, 2144044 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9441bc>
 2144038:	f9400001 	ldr	x1, [x0]
 214403c:	f9400421 	ldr	x1, [x1,#8]
 2144040:	d63f0020 	blr	x1
 2144044:	f9406e60 	ldr	x0, [x19,#216]
 2144048:	b4000080 	cbz	x0, 2144058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9441d0>
 214404c:	f9400001 	ldr	x1, [x0]
 2144050:	f9400421 	ldr	x1, [x1,#8]
 2144054:	d63f0020 	blr	x1
 2144058:	f9406a60 	ldr	x0, [x19,#208]
 214405c:	b4000080 	cbz	x0, 214406c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9441e4>
 2144060:	f9400001 	ldr	x1, [x0]
 2144064:	f9400421 	ldr	x1, [x1,#8]
 2144068:	d63f0020 	blr	x1
 214406c:	f9406660 	ldr	x0, [x19,#200]
 2144070:	b4000080 	cbz	x0, 2144080 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9441f8>
 2144074:	f9400001 	ldr	x1, [x0]
 2144078:	f9400421 	ldr	x1, [x1,#8]
 214407c:	d63f0020 	blr	x1
 2144080:	f9406260 	ldr	x0, [x19,#192]
 2144084:	b4000080 	cbz	x0, 2144094 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94420c>
 2144088:	f9400001 	ldr	x1, [x0]
 214408c:	f9400421 	ldr	x1, [x1,#8]
 2144090:	d63f0020 	blr	x1
 2144094:	f9405e60 	ldr	x0, [x19,#184]
 2144098:	b4000080 	cbz	x0, 21440a8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944220>
 214409c:	f9400001 	ldr	x1, [x0]
 21440a0:	f9400421 	ldr	x1, [x1,#8]
 21440a4:	d63f0020 	blr	x1
 21440a8:	f9405a60 	ldr	x0, [x19,#176]
 21440ac:	b4000080 	cbz	x0, 21440bc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944234>
 21440b0:	f9400001 	ldr	x1, [x0]
 21440b4:	f9400421 	ldr	x1, [x1,#8]
 21440b8:	d63f0020 	blr	x1
 21440bc:	f9405660 	ldr	x0, [x19,#168]
 21440c0:	b4000080 	cbz	x0, 21440d0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944248>
 21440c4:	f9400001 	ldr	x1, [x0]
 21440c8:	f9400421 	ldr	x1, [x1,#8]
 21440cc:	d63f0020 	blr	x1
 21440d0:	f9405260 	ldr	x0, [x19,#160]
 21440d4:	b4000080 	cbz	x0, 21440e4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94425c>
 21440d8:	f9400001 	ldr	x1, [x0]
 21440dc:	f9400421 	ldr	x1, [x1,#8]
 21440e0:	d63f0020 	blr	x1
 21440e4:	f9404e60 	ldr	x0, [x19,#152]
 21440e8:	b4000080 	cbz	x0, 21440f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944270>
 21440ec:	f9400001 	ldr	x1, [x0]
 21440f0:	f9400421 	ldr	x1, [x1,#8]
 21440f4:	d63f0020 	blr	x1
 21440f8:	f9404a60 	ldr	x0, [x19,#144]
 21440fc:	b4000080 	cbz	x0, 214410c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944284>
 2144100:	f9400001 	ldr	x1, [x0]
 2144104:	f9400421 	ldr	x1, [x1,#8]
 2144108:	d63f0020 	blr	x1
 214410c:	f9404660 	ldr	x0, [x19,#136]
 2144110:	b4000080 	cbz	x0, 2144120 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944298>
 2144114:	f9400001 	ldr	x1, [x0]
 2144118:	f9400421 	ldr	x1, [x1,#8]
 214411c:	d63f0020 	blr	x1
 2144120:	f9404260 	ldr	x0, [x19,#128]
 2144124:	b4000080 	cbz	x0, 2144134 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9442ac>
 2144128:	f9400001 	ldr	x1, [x0]
 214412c:	f9400421 	ldr	x1, [x1,#8]
 2144130:	d63f0020 	blr	x1
 2144134:	f9403e60 	ldr	x0, [x19,#120]
 2144138:	b4000080 	cbz	x0, 2144148 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9442c0>
 214413c:	f9400001 	ldr	x1, [x0]
 2144140:	f9400421 	ldr	x1, [x1,#8]
 2144144:	d63f0020 	blr	x1
 2144148:	f9403a60 	ldr	x0, [x19,#112]
 214414c:	b4000080 	cbz	x0, 214415c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9442d4>
 2144150:	f9400001 	ldr	x1, [x0]
 2144154:	f9400421 	ldr	x1, [x1,#8]
 2144158:	d63f0020 	blr	x1
 214415c:	f9403660 	ldr	x0, [x19,#104]
 2144160:	b4000080 	cbz	x0, 2144170 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9442e8>
 2144164:	f9400001 	ldr	x1, [x0]
 2144168:	f9400421 	ldr	x1, [x1,#8]
 214416c:	d63f0020 	blr	x1
 2144170:	f9403260 	ldr	x0, [x19,#96]
 2144174:	b4000080 	cbz	x0, 2144184 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9442fc>
 2144178:	f9400001 	ldr	x1, [x0]
 214417c:	f9400421 	ldr	x1, [x1,#8]
 2144180:	d63f0020 	blr	x1
 2144184:	f9402e60 	ldr	x0, [x19,#88]
 2144188:	b4000080 	cbz	x0, 2144198 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944310>
 214418c:	f9400001 	ldr	x1, [x0]
 2144190:	f9400421 	ldr	x1, [x1,#8]
 2144194:	d63f0020 	blr	x1
 2144198:	f9402a60 	ldr	x0, [x19,#80]
 214419c:	b4000080 	cbz	x0, 21441ac <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944324>
 21441a0:	f9400001 	ldr	x1, [x0]
 21441a4:	f9400421 	ldr	x1, [x1,#8]
 21441a8:	d63f0020 	blr	x1
 21441ac:	f9402660 	ldr	x0, [x19,#72]
 21441b0:	b4000080 	cbz	x0, 21441c0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944338>
 21441b4:	f9400001 	ldr	x1, [x0]
 21441b8:	f9400421 	ldr	x1, [x1,#8]
 21441bc:	d63f0020 	blr	x1
 21441c0:	f9402260 	ldr	x0, [x19,#64]
 21441c4:	b4000080 	cbz	x0, 21441d4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94434c>
 21441c8:	f9400001 	ldr	x1, [x0]
 21441cc:	f9400421 	ldr	x1, [x1,#8]
 21441d0:	d63f0020 	blr	x1
 21441d4:	f9401e60 	ldr	x0, [x19,#56]
 21441d8:	b4000080 	cbz	x0, 21441e8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944360>
 21441dc:	f9400001 	ldr	x1, [x0]
 21441e0:	f9400421 	ldr	x1, [x1,#8]
 21441e4:	d63f0020 	blr	x1
 21441e8:	f9401a60 	ldr	x0, [x19,#48]
 21441ec:	b4000080 	cbz	x0, 21441fc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944374>
 21441f0:	f9400001 	ldr	x1, [x0]
 21441f4:	f9400421 	ldr	x1, [x1,#8]
 21441f8:	d63f0020 	blr	x1
 21441fc:	f9401660 	ldr	x0, [x19,#40]
 2144200:	b4000080 	cbz	x0, 2144210 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944388>
 2144204:	f9400001 	ldr	x1, [x0]
 2144208:	f9400421 	ldr	x1, [x1,#8]
 214420c:	d63f0020 	blr	x1
 2144210:	f9401260 	ldr	x0, [x19,#32]
 2144214:	b4000080 	cbz	x0, 2144224 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94439c>
 2144218:	f9400001 	ldr	x1, [x0]
 214421c:	f9400421 	ldr	x1, [x1,#8]
 2144220:	d63f0020 	blr	x1
 2144224:	f9400e60 	ldr	x0, [x19,#24]
 2144228:	b4000080 	cbz	x0, 2144238 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9443b0>
 214422c:	f9400001 	ldr	x1, [x0]
 2144230:	f9400421 	ldr	x1, [x1,#8]
 2144234:	d63f0020 	blr	x1
 2144238:	f9400a60 	ldr	x0, [x19,#16]
 214423c:	b4000080 	cbz	x0, 214424c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9443c4>
 2144240:	f9400001 	ldr	x1, [x0]
 2144244:	f9400421 	ldr	x1, [x1,#8]
 2144248:	d63f0020 	blr	x1
 214424c:	f9400660 	ldr	x0, [x19,#8]
 2144250:	b4000080 	cbz	x0, 2144260 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9443d8>
 2144254:	f9400001 	ldr	x1, [x0]
 2144258:	f9400421 	ldr	x1, [x1,#8]
 214425c:	d63f0020 	blr	x1
 2144260:	f9400260 	ldr	x0, [x19]
 2144264:	b4000160 	cbz	x0, 2144290 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944408>
 2144268:	f9400001 	ldr	x1, [x0]
 214426c:	a94153f3 	ldp	x19, x20, [sp,#16]
 2144270:	f94013f5 	ldr	x21, [sp,#32]
 2144274:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2144278:	f9400421 	ldr	x1, [x1,#8]
 214427c:	d61f0020 	br	x1
 2144280:	d1002294 	sub	x20, x20, #0x8
 2144284:	eb15029f 	cmp	x20, x21
 2144288:	54ffe7c1 	b.ne	2143f80 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9440f8>
 214428c:	17ffff46 	b	2143fa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94411c>
 2144290:	a94153f3 	ldp	x19, x20, [sp,#16]
 2144294:	f94013f5 	ldr	x21, [sp,#32]
 2144298:	a8c37bfd 	ldp	x29, x30, [sp],#48
 214429c:	d65f03c0 	ret
 21442a0:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 21442a4:	b0006801 	adrp	x1, 2e45000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8821a8>
 21442a8:	911d6021 	add	x1, x1, #0x758
 21442ac:	910003fd 	mov	x29, sp
 21442b0:	a90153f3 	stp	x19, x20, [sp,#16]
 21442b4:	aa0003f3 	mov	x19, x0
 21442b8:	aa1303f4 	mov	x20, x19
 21442bc:	b0006800 	adrp	x0, 2e45000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x8821a8>
 21442c0:	911c6000 	add	x0, x0, #0x718
 21442c4:	f81f8260 	stur	x0, [x19,#-8]
 21442c8:	91062260 	add	x0, x19, #0x188
 21442cc:	f81f8681 	str	x1, [x20],#-8
 21442d0:	97ffff24 	bl	2143f60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9440d8>
 21442d4:	9100a260 	add	x0, x19, #0x28
 21442d8:	97ffff22 	bl	2143f60 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9440d8>
 21442dc:	f9401260 	ldr	x0, [x19,#32]
 21442e0:	b4000080 	cbz	x0, 21442f0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944468>
 21442e4:	f9400001 	ldr	x1, [x0]
 21442e8:	f9400421 	ldr	x1, [x1,#8]
 21442ec:	d63f0020 	blr	x1
 21442f0:	f9400e60 	ldr	x0, [x19,#24]
 21442f4:	b4000080 	cbz	x0, 2144304 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x94447c>
 21442f8:	f9400001 	ldr	x1, [x0]
 21442fc:	f9400421 	ldr	x1, [x1,#8]
 2144300:	d63f0020 	blr	x1
 2144304:	f9400a60 	ldr	x0, [x19,#16]
 2144308:	b4000080 	cbz	x0, 2144318 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x944490>
 214430c:	f9400001 	ldr	x1, [x0]
 2144310:	f9400421 	ldr	x1, [x1,#8]
 2144314:	d63f0020 	blr	x1
 2144318:	f9400660 	ldr	x0, [x19,#8]
 214431c:	b4000080 	cbz	x0, 214432c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x9444a4>
 2144320:	f9400001 	ldr	x1, [x0]
 2144324:	f9400421 	ldr	x1, [x1,#8]
 2144328:	d63f0020 	blr	x1
 214432c:	aa1403e0 	mov	x0, x20
 2144330:	d2805f01 	mov	x1, #0x2f8                 	// #760
 2144334:	a94153f3 	ldp	x19, x20, [sp,#16]
 2144338:	a8c27bfd 	ldp	x29, x30, [sp],#32
 214433c:	178b88c9 	b	426660 <_ZdlPvm@plt>
