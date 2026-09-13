
runtime-lab/xdjaz/rootfs/home/root/pdj/EP147:     file format elf64-littleaarch64


Disassembly of section .text:

000000000072cd80 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x33fd8>:
  72cd80:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
  72cd84:	d28a3fc1 	mov	x1, #0x51fe                	// #20990
  72cd88:	f2b4fec1 	movk	x1, #0xa7f6, lsl #16
  72cd8c:	910003fd 	mov	x29, sp
  72cd90:	f9402002 	ldr	x2, [x0,#64]
  72cd94:	f2c15801 	movk	x1, #0xac0, lsl #32
  72cd98:	f2e021a1 	movk	x1, #0x10d, lsl #48
  72cd9c:	f9000bf3 	str	x19, [sp,#16]
  72cda0:	f90013e1 	str	x1, [sp,#32]
  72cda4:	9100e003 	add	x3, x0, #0x38
  72cda8:	aa0803f3 	mov	x19, x8
  72cdac:	aa0303e1 	mov	x1, x3
  72cdb0:	b40004a2 	cbz	x2, 72ce44 <_ZNSt7__cxx1115basic_stringbufIcSt11char_traitsIcESaIcEED0Ev@@Base+0x3409c>
  72cdb4:	d28a3fa5 	mov	x5, #0x51fd                	// #20989
  72cdb8:	f2b4fec5 	movk	x5, #0xa7f6, lsl #16
  72cdbc:	f2c15805 	movk	x5, #0xac0, lsl #32
  72cdc0:	f2e021a5 	movk	x5, #0x10d, lsl #48
  72cdc4:	d503201f 	nop
  72cdc8:	f9401044 	ldr	x4, [x2,#32]
  72cdcc:	eb05009f 	cmp	x4, x5
