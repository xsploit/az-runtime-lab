#include <stdint.h>
#include <stdio.h>
extern uint32_t native_mask(const uint32_t*,unsigned);
int main(void){unsigned cases=0;unsigned counts[]={4,6,20,21};for(unsigned j=0;j<4;j++)for(uint32_t m=0;m<4096;m++){
 unsigned n=counts[j];uint32_t expected=0;for(unsigned i=0;i<n;i++)expected|=((m>>(n-1-i))&1)<<i;
 uint32_t got=native_mask(&m,n);if(got!=expected){printf("FAIL %u %x %x %x\n",n,m,got,expected);return 1;}cases++;
 }printf("PASS %u original scalar-path cases; CPU-count call replaced with supplied count\n",cases);return 0;}
