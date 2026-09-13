#define _GNU_SOURCE
#include <sys/mman.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
float headphone_tables[776];
void fixture_string(void*a,const void*b){(void)a;(void)b;}
void fixture_exception(void){abort();}
void portable_ctor(unsigned char*,uint32_t);
#ifndef HOST_REPLAY
void native_ctor(unsigned char*);
#endif
int main(int argc,char**argv){assert(argc==2);
#ifdef HOST_REPLAY
 FILE*fp=fopen(argv[1],"rb");
#else
 FILE*fp=fopen(argv[1],"wb");
#endif
 assert(fp);
 unsigned char*mem=mmap((void*)0x417000,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(mem==(void*)0x417000);
 uint32_t rates[]={0,1,100,303,304,8000,11025,22050,32000,44100,48000,88200,96000,192000};
 for(unsigned i=0;i<10000;i++){
  uint32_t rate=i<14?rates[i]:i*23;memcpy(mem+0x2c0,&rate,4);
  unsigned char a[256],n[256];for(unsigned j=0;j<256;j++)a[j]=(unsigned char)(i*17+j*13);memcpy(n,a,256);
#ifdef HOST_REPLAY
  assert(fread(n,1,256,fp)==256);
#else
  native_ctor(n);assert(fwrite(n,1,256,fp)==256);
#endif
  portable_ctor(a,rate);if(memcmp(a,n,256)){for(unsigned j=0;j<256;j++)if(a[j]!=n[j]){fprintf(stderr,"rate%u byte%u portable%u native%u\n",rate,j,a[j],n[j]);break;}return 1;}
 }
 fclose(fp);puts("PASS 10000 constructors, full 256-byte state including untouched padding");
}
