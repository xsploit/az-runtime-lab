#include <stdint.h>
#include <stdio.h>
extern unsigned native_crc(const unsigned char*);
int main(void){unsigned char b[62];uint32_t s=1234567;unsigned trials=10000;
for(unsigned t=0;t<trials;t++){unsigned crc=65535;
for(unsigned i=0;i<62;i++){s=s*1664525u+1013904223u;b[i]=s>>24;crc^=b[i];for(int k=0;k<8;k++)crc=(crc>>1)^((crc&1)?0x8408:0);}
crc=(~crc)&65535;unsigned actual=native_crc(b);if(actual!=crc){printf("mismatch %u %u %u\n",t,actual,crc);return 1;}}
printf("%u packets matched native CRC instructions\n",trials);return 0;}
