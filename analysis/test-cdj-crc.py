from pathlib import Path
import struct, subprocess, json
p=Path('runtime-lab/analysis')
b=Path('runtime-lab/cdj3000x/rootfs/home/root/pdj/EP145').read_bytes()
# Resolve virtual addresses from ELF program headers.
phoff=struct.unpack_from('<Q',b,32)[0]; size,count=struct.unpack_from('<HH',b,54)
def va(a,n):
 for i in range(count):
  typ,flags,off,v,_,fs,ms,align=struct.unpack_from('<IIQQQQQQ',b,phoff+i*size)
  if typ==1 and v<=a and a+n<=v+fs:return b[off+a-v:off+a-v+n]
 raise ValueError(hex(a))
(p/'cdj-crc-body.bin').write_bytes(va(0x225f958,0x225faec-0x225f958))
constants=va(0x29df270,16)+va(0x30374f0,16)
(p/'cdj-crc-constants.bin').write_bytes(constants)
(p/'test-cdj-crc.S').write_text('''.text
.global native_crc
.type native_crc,%function
native_crc:
 sub sp,sp,#544
 stp x19,x20,[sp]
 mov x19,x0
 add x20,sp,#16
 mov x0,x20
 add x1,x20,#512
 mov w3,#62
 adr x2,constants
 ldr q3,[x2]
 ldr q1,[x2,#16]
 movi v6.4s,#8
 movi v5.4s,#4
 movi v2.8h,#1
.incbin "runtime-lab/analysis/cdj-crc-body.bin"
 mov w0,w1
 ldp x19,x20,[sp]
 add sp,sp,#544
 ret
.balign 16
constants:
.incbin "runtime-lab/analysis/cdj-crc-constants.bin"
.section .note.GNU-stack,"",@progbits
''')
(p/'test-cdj-crc.c').write_text('''#include <stdint.h>
#include <stdio.h>
extern unsigned native_crc(const unsigned char*);
int main(void){unsigned char b[62];uint32_t s=1234567;unsigned trials=10000;
for(unsigned t=0;t<trials;t++){unsigned crc=65535;
for(unsigned i=0;i<62;i++){s=s*1664525u+1013904223u;b[i]=s>>24;crc^=b[i];for(int k=0;k<8;k++)crc=(crc>>1)^((crc&1)?0x8408:0);}
crc=(~crc)&65535;unsigned actual=native_crc(b);if(actual!=crc){printf("mismatch %u %u %u\\n",t,actual,crc);return 1;}}
printf("%u packets matched native CRC instructions\\n",trials);return 0;}
''')
cc='rx3-research/xdj-az/XDJ-AZ/prebuilts/gcc/linux-x86/aarch64/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc'
subprocess.run([cc,'-static','-O2',str(p/'test-cdj-crc.c'),str(p/'test-cdj-crc.S'),'-o',str(p/'test-cdj-crc')],check=True)
r=subprocess.run(['qemu-aarch64-static',str(p/'test-cdj-crc')],text=True,capture_output=True,check=True)
print(r.stdout)
report={'native_range':'0x225f958..0x225fae8','packets':10000,'result':r.stdout.strip(),'scope':'Extracted CRC instructions only; full validator and live transport not tested','polynomial_reflected':'0x8408','init':'0xffff','xorout':'0xffff','coverage_bytes':62,'checksum_offset':62,'byte_order':'little'}
(p/'cdj3000x-crc-verified.json').write_text(json.dumps(report,indent=2)+'\n')
