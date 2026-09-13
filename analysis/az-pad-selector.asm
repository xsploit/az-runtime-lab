
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

0000000001df5f40 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f60b8>:
 1df5f40:	f944f015 	ldr	x21, [x0,#2528]
 1df5f44:	b40001b5 	cbz	x21, 1df5f78 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f60f0>
 1df5f48:	91002281 	add	x1, x20, #0x8
 1df5f4c:	885ffc20 	ldaxr	w0, [x1]
 1df5f50:	51000402 	sub	w2, w0, #0x1
 1df5f54:	8803fc22 	stlxr	w3, w2, [x1]
 1df5f58:	35ffffa3 	cbnz	w3, 1df5f4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f60c4>
 1df5f5c:	7100041f 	cmp	w0, #0x1
 1df5f60:	54000160 	b.eq	1df5f8c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6104>
 1df5f64:	f94013f5 	ldr	x21, [sp,#32]
 1df5f68:	aa1303e0 	mov	x0, x19
 1df5f6c:	a94153f3 	ldp	x19, x20, [sp,#16]
 1df5f70:	a8c37bfd 	ldp	x29, x30, [sp],#48
 1df5f74:	141a6fd7 	b	2491ed0 <_ZNSt8functionIFvvEEC1ERKS1_@@Base+0x11cab0>
 1df5f78:	b9400a80 	ldr	w0, [x20,#8]
 1df5f7c:	51000401 	sub	w1, w0, #0x1
 1df5f80:	b9000a81 	str	w1, [x20,#8]
 1df5f84:	7100041f 	cmp	w0, #0x1
 1df5f88:	54fffee1 	b.ne	1df5f64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f60dc>
 1df5f8c:	f9400281 	ldr	x1, [x20]
 1df5f90:	aa1403e0 	mov	x0, x20
 1df5f94:	f9400821 	ldr	x1, [x1,#16]
 1df5f98:	d63f0020 	blr	x1
 1df5f9c:	b40001d5 	cbz	x21, 1df5fd4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f614c>
 1df5fa0:	91003281 	add	x1, x20, #0xc
 1df5fa4:	885ffc20 	ldaxr	w0, [x1]
 1df5fa8:	51000402 	sub	w2, w0, #0x1
 1df5fac:	8803fc22 	stlxr	w3, w2, [x1]
 1df5fb0:	35ffffa3 	cbnz	w3, 1df5fa4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f611c>
 1df5fb4:	7100041f 	cmp	w0, #0x1
 1df5fb8:	54fffd61 	b.ne	1df5f64 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f60dc>
 1df5fbc:	f9400281 	ldr	x1, [x20]
 1df5fc0:	aa1403e0 	mov	x0, x20
 1df5fc4:	f9400c21 	ldr	x1, [x1,#24]
 1df5fc8:	d63f0020 	blr	x1
 1df5fcc:	f94013f5 	ldr	x21, [sp,#32]
 1df5fd0:	17ffffe6 	b	1df5f68 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f60e0>
 1df5fd4:	b9400e80 	ldr	w0, [x20,#12]
 1df5fd8:	51000401 	sub	w1, w0, #0x1
 1df5fdc:	b9000e81 	str	w1, [x20,#12]
 1df5fe0:	17fffff5 	b	1df5fb4 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f612c>
 1df5fe4:	d503201f 	nop
 1df5fe8:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 1df5fec:	910003fd 	mov	x29, sp
 1df5ff0:	f9000bf3 	str	x19, [sp,#16]
 1df5ff4:	aa0003f3 	mov	x19, x0
 1df5ff8:	97ffff7a 	bl	1df5de0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f5f58>
 1df5ffc:	aa1303e0 	mov	x0, x19
 1df6000:	d2802301 	mov	x1, #0x118                 	// #280
 1df6004:	f9400bf3 	ldr	x19, [sp,#16]
 1df6008:	a8c27bfd 	ldp	x29, x30, [sp],#32
 1df600c:	1798c195 	b	426660 <_ZdlPvm@plt>
 1df6010:	a9bb7bfd 	stp	x29, x30, [sp,#-80]!
 1df6014:	910003fd 	mov	x29, sp
 1df6018:	a90153f3 	stp	x19, x20, [sp,#16]
 1df601c:	aa0003f3 	mov	x19, x0
 1df6020:	f9406800 	ldr	x0, [x0,#208]
 1df6024:	a9025bf5 	stp	x21, x22, [sp,#32]
 1df6028:	a90363f7 	stp	x23, x24, [sp,#48]
 1df602c:	f90023f9 	str	x25, [sp,#64]
 1df6030:	9406c67e 	bl	1fa7a28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x7a7ba0>
 1df6034:	7100501f 	cmp	w0, #0x14
 1df6038:	540006c9 	b.ls	1df6110 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6288>
 1df603c:	52800014 	mov	w20, #0x0                   	// #0
 1df6040:	52800015 	mov	w21, #0x0                   	// #0
 1df6044:	52800016 	mov	w22, #0x0                   	// #0
 1df6048:	52800017 	mov	w23, #0x0                   	// #0
 1df604c:	52800018 	mov	w24, #0x0                   	// #0
 1df6050:	52800019 	mov	w25, #0x0                   	// #0
 1df6054:	52800001 	mov	w1, #0x0                   	// #0
 1df6058:	f9407262 	ldr	x2, [x19,#224]
 1df605c:	aa0203e0 	mov	x0, x2
 1df6060:	f9400042 	ldr	x2, [x2]
 1df6064:	f9403042 	ldr	x2, [x2,#96]
 1df6068:	d63f0040 	blr	x2
 1df606c:	f9407662 	ldr	x2, [x19,#232]
 1df6070:	2a1903e1 	mov	w1, w25
 1df6074:	aa0203e0 	mov	x0, x2
 1df6078:	f9400042 	ldr	x2, [x2]
 1df607c:	f9403042 	ldr	x2, [x2,#96]
 1df6080:	d63f0040 	blr	x2
 1df6084:	f9407a62 	ldr	x2, [x19,#240]
 1df6088:	2a1803e1 	mov	w1, w24
 1df608c:	aa0203e0 	mov	x0, x2
 1df6090:	f9400042 	ldr	x2, [x2]
 1df6094:	f9403042 	ldr	x2, [x2,#96]
 1df6098:	d63f0040 	blr	x2
 1df609c:	f9407e62 	ldr	x2, [x19,#248]
 1df60a0:	2a1703e1 	mov	w1, w23
 1df60a4:	aa0203e0 	mov	x0, x2
 1df60a8:	f9400042 	ldr	x2, [x2]
 1df60ac:	f9403042 	ldr	x2, [x2,#96]
 1df60b0:	d63f0040 	blr	x2
 1df60b4:	f9408262 	ldr	x2, [x19,#256]
 1df60b8:	2a1603e1 	mov	w1, w22
 1df60bc:	aa0203e0 	mov	x0, x2
 1df60c0:	f9400042 	ldr	x2, [x2]
 1df60c4:	f9403042 	ldr	x2, [x2,#96]
 1df60c8:	d63f0040 	blr	x2
 1df60cc:	f9408662 	ldr	x2, [x19,#264]
 1df60d0:	2a1503e1 	mov	w1, w21
 1df60d4:	aa0203e0 	mov	x0, x2
 1df60d8:	f9400042 	ldr	x2, [x2]
 1df60dc:	f9403042 	ldr	x2, [x2,#96]
 1df60e0:	d63f0040 	blr	x2
 1df60e4:	f9408a62 	ldr	x2, [x19,#272]
 1df60e8:	2a1403e1 	mov	w1, w20
 1df60ec:	a94153f3 	ldp	x19, x20, [sp,#16]
 1df60f0:	aa0203e0 	mov	x0, x2
 1df60f4:	f9400042 	ldr	x2, [x2]
 1df60f8:	a9425bf5 	ldp	x21, x22, [sp,#32]
 1df60fc:	a94363f7 	ldp	x23, x24, [sp,#48]
 1df6100:	f94023f9 	ldr	x25, [sp,#64]
 1df6104:	a8c57bfd 	ldp	x29, x30, [sp],#80
 1df6108:	f9403042 	ldr	x2, [x2,#96]
 1df610c:	d61f0040 	br	x2
 1df6110:	b0007cc1 	adrp	x1, 2d8f000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag@@Base+0x7cc1a8>
 1df6114:	91206021 	add	x1, x1, #0x818
 1df6118:	38604820 	ldrb	w0, [x1,w0,uxtw]
 1df611c:	10000061 	adr	x1, 1df6128 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f62a0>
 1df6120:	8b208820 	add	x0, x1, w0, sxtb #2
 1df6124:	d61f0000 	br	x0
 1df6128:	f9407e60 	ldr	x0, [x19,#248]
 1df612c:	52800014 	mov	w20, #0x0                   	// #0
 1df6130:	52800015 	mov	w21, #0x0                   	// #0
 1df6134:	52800016 	mov	w22, #0x0                   	// #0
 1df6138:	52800037 	mov	w23, #0x1                   	// #1
 1df613c:	52800018 	mov	w24, #0x0                   	// #0
 1df6140:	97fff178 	bl	1df2720 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f2898>
 1df6144:	52800019 	mov	w25, #0x0                   	// #0
 1df6148:	52800001 	mov	w1, #0x0                   	// #0
 1df614c:	17ffffc3 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
 1df6150:	f9408260 	ldr	x0, [x19,#256]
 1df6154:	52800014 	mov	w20, #0x0                   	// #0
 1df6158:	52800015 	mov	w21, #0x0                   	// #0
 1df615c:	52800036 	mov	w22, #0x1                   	// #1
 1df6160:	52800017 	mov	w23, #0x0                   	// #0
 1df6164:	52800018 	mov	w24, #0x0                   	// #0
 1df6168:	97fffd98 	bl	1df57c8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f5940>
 1df616c:	52800019 	mov	w25, #0x0                   	// #0
 1df6170:	52800001 	mov	w1, #0x0                   	// #0
 1df6174:	17ffffb9 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
 1df6178:	f9407660 	ldr	x0, [x19,#232]
 1df617c:	52800014 	mov	w20, #0x0                   	// #0
 1df6180:	52800015 	mov	w21, #0x0                   	// #0
 1df6184:	52800016 	mov	w22, #0x0                   	// #0
 1df6188:	52800017 	mov	w23, #0x0                   	// #0
 1df618c:	52800018 	mov	w24, #0x0                   	// #0
 1df6190:	97ffd41e 	bl	1deb208 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5eb380>
 1df6194:	52800039 	mov	w25, #0x1                   	// #1
 1df6198:	52800001 	mov	w1, #0x0                   	// #0
 1df619c:	17ffffaf 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
 1df61a0:	f9407260 	ldr	x0, [x19,#224]
 1df61a4:	52800014 	mov	w20, #0x0                   	// #0
 1df61a8:	52800015 	mov	w21, #0x0                   	// #0
 1df61ac:	52800016 	mov	w22, #0x0                   	// #0
 1df61b0:	52800017 	mov	w23, #0x0                   	// #0
 1df61b4:	52800018 	mov	w24, #0x0                   	// #0
 1df61b8:	97ffd634 	bl	1deba88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5ebc00>
 1df61bc:	52800019 	mov	w25, #0x0                   	// #0
 1df61c0:	52800021 	mov	w1, #0x1                   	// #1
 1df61c4:	17ffffa5 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
 1df61c8:	f9407a60 	ldr	x0, [x19,#240]
 1df61cc:	52800014 	mov	w20, #0x0                   	// #0
 1df61d0:	52800015 	mov	w21, #0x0                   	// #0
 1df61d4:	52800016 	mov	w22, #0x0                   	// #0
 1df61d8:	52800017 	mov	w23, #0x0                   	// #0
 1df61dc:	52800038 	mov	w24, #0x1                   	// #1
 1df61e0:	97ffe2f0 	bl	1deeda0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5eef18>
 1df61e4:	52800019 	mov	w25, #0x0                   	// #0
 1df61e8:	52800001 	mov	w1, #0x0                   	// #0
 1df61ec:	17ffff9b 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
 1df61f0:	f9408660 	ldr	x0, [x19,#264]
 1df61f4:	52800014 	mov	w20, #0x0                   	// #0
 1df61f8:	52800035 	mov	w21, #0x1                   	// #1
 1df61fc:	52800016 	mov	w22, #0x0                   	// #0
 1df6200:	52800017 	mov	w23, #0x0                   	// #0
 1df6204:	52800018 	mov	w24, #0x0                   	// #0
 1df6208:	97ffdb7a 	bl	1decff0 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5ed168>
 1df620c:	52800019 	mov	w25, #0x0                   	// #0
 1df6210:	52800001 	mov	w1, #0x0                   	// #0
 1df6214:	17ffff91 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
 1df6218:	f9408a60 	ldr	x0, [x19,#272]
 1df621c:	52800034 	mov	w20, #0x1                   	// #1
 1df6220:	52800015 	mov	w21, #0x0                   	// #0
 1df6224:	52800016 	mov	w22, #0x0                   	// #0
 1df6228:	52800017 	mov	w23, #0x0                   	// #0
 1df622c:	52800018 	mov	w24, #0x0                   	// #0
 1df6230:	940001f2 	bl	1df69f8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f6b70>
 1df6234:	52800019 	mov	w25, #0x0                   	// #0
 1df6238:	52800001 	mov	w1, #0x0                   	// #0
 1df623c:	17ffff87 	b	1df6058 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_@@Base+0x5f61d0>
