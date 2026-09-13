
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 198f468: f940a801     	ldr	x1, [x0, #0x150]
 198f46c: 90011240     	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 198f470: 911bc000     	add	x0, x0, #0x6f0
 198f474: f100003f     	cmp	x1, #0x0
 198f478: 9103e021     	add	x1, x1, #0xf8
 198f47c: 9a810000     	csel	x0, x0, x1, eq
 198f480: d65f03c0     	ret
 198f484: d503201f     	nop
 198f488: f9401401     	ldr	x1, [x0, #0x28]
 198f48c: 90011240     	adrp	x0, 0x3bd7000 <stdout+0x95f40>
 198f490: 911bc000     	add	x0, x0, #0x6f0
 198f494: f100003f     	cmp	x1, #0x0
 198f498: 9103e021     	add	x1, x1, #0xf8
