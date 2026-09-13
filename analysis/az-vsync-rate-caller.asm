
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:	file format elf64-littleaarch64

Disassembly of section .text:

00000000017ffe88 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_>:
 2101d40:      	ldr	x19, [x20, #0x68]
 2101d44:      	mov	x1, x19
 2101d48:      	ldp	x19, x20, [sp, #0x10]
 2101d4c:      	adrp	x0, 0x2e32000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86f1a8>
 2101d50:      	ldp	x29, x30, [sp], #0x20
 2101d54:      	add	x0, x0, #0xc70
 2101d58:      	add	x0, x0, #0x658
 2101d5c:      	b	0x2104470 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9045e8>
 2101d60:      	mov	x1, #0x28               // =40
 2101d64:      	mov	x20, x0
 2101d68:      	mov	x0, x19
 2101d6c:      	bl	0x426660 <_ZdlPvm@plt>
 2101d70:      	mov	x0, x20
 2101d74:      	bl	0x424d10 <_Unwind_Resume@plt>
 2101d78:      	stp	x29, x30, [sp, #-0x30]!
 2101d7c:      	mov	x29, sp
 2101d80:      	stp	x19, x20, [sp, #0x10]
 2101d84:      	mov	x19, x0
 2101d88:      	mov	x0, #0x8                // =8
 2101d8c:      	bl	0x424d40 <_Znwm@plt>
 2101d90:      	mov	x1, x0
 2101d94:      	ldr	x0, [x19, #0x50]
 2101d98:      	adrp	x2, 0x2e41000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x87e1a8>
 2101d9c:      	add	x2, x2, #0x478
 2101da0:      	str	x2, [x1]
 2101da4:      	str	x1, [x19, #0x50]
 2101da8:      	cbz	x0, 0x2101dbc <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x901f34>
 2101dac:      	ldr	x1, [x0]
 2101db0:      	ldr	x1, [x1, #0x8]
 2101db4:      	blr	x1
 2101db8:      	ldr	x1, [x19, #0x50]
 2101dbc:      	adrp	x20, 0x2e32000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x86f1a8>
 2101dc0:      	add	x20, x20, #0xc70
 2101dc4:      	add	x0, x20, #0x830
 2101dc8:      	bl	0x2104af8 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x904c70>
 2101dcc:      	adrp	x0, 0x2e33000 <_ZZNSt19_Sp_make_shared_tag5_S_tiEvE5__tag+0x8701a8>
 2101dd0:      	add	x8, sp, #0x28
 2101dd4:      	ldr	d0, [x0, #0xa40]
 2101dd8:      	bl	0x212f880 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x92f9f8>
 2101ddc:      	ldr	x0, [x19, #0x80]
 2101de0:      	ldr	x1, [sp, #0x28]
 2101de4:      	str	xzr, [sp, #0x28]
 2101de8:      	str	x1, [x19, #0x80]
 2101dec:      	cbz	x0, 0x2101e14 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x901f8c>
 2101df0:      	ldr	x1, [x0]
 2101df4:      	ldr	x1, [x1, #0x8]
 2101df8:      	blr	x1
 2101dfc:      	ldr	x0, [sp, #0x28]
 2101e00:      	cbz	x0, 0x2101e10 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x901f88>
 2101e04:      	ldr	x1, [x0]
 2101e08:      	ldr	x1, [x1, #0x8]
 2101e0c:      	blr	x1
 2101e10:      	ldr	x1, [x19, #0x80]
 2101e14:      	add	x0, x20, #0x830
 2101e18:      	bl	0x2105048 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EEPKS5_OS8_+0x9051c0>
 2101e1c:      	ldp	x19, x20, [sp, #0x10]
