#define _GNU_SOURCE
#include <sys/mman.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
float headphone_tables[776];
void portable_level(unsigned char*,float);void portable_mix(unsigned char*,float);
void portable_master(unsigned char*,uint32_t);void portable_mode(unsigned char*,uint32_t);
#ifndef HOST_REPLAY
void native_level(unsigned char*,float);void native_mix(unsigned char*,float);
void native_master(unsigned char*,uint32_t);void native_mode(unsigned char*,uint32_t);
#endif
static uint32_t rng=42;
static uint32_t next(void){rng=rng*1664525u+1013904223u;return rng;}
static void sf(unsigned char*s,unsigned off,float v){memcpy(s+off,&v,4);}
int main(int argc,char**argv){assert(argc==2);
#ifdef HOST_REPLAY
 FILE*file=fopen(argv[1],"rb");
#else
 FILE*file=fopen(argv[1],"wb");
#endif
 assert(file);unsigned calls=0;
 FILE*tf=fopen("tables.bin","rb");assert(tf);assert(fread(headphone_tables,1,sizeof headphone_tables,tf)==sizeof headphone_tables);fclose(tf);
#ifndef HOST_REPLAY
 void* mapped=mmap((void*)0x419000,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(mapped==(void*)0x419000);
 memcpy((unsigned char*)mapped+0x3b0,headphone_tables,sizeof headphone_tables);
#endif
 for(unsigned i=0;i<12000;i++){
  unsigned char a[256],n[256];for(unsigned j=0;j<256;j++)a[j]=(unsigned char)next();
  a[152]=i%2;uint32_t mode=i%3;memcpy(a+200,&mode,4);
  unsigned bases[]={24,72,112,160,208};
  for(unsigned bi=0;bi<5;bi++){unsigned b=bases[bi];
   for(unsigned lane=0;lane<6;lane++)sf(a,b+4*lane,((int)(next()%20001)-10000)/10000.f);
   sf(a,b+32,1.f/(1+next()%1024));
  }
  for(unsigned op=0;op<8;op++){
   uint32_t value=(i+op)%2;float knob=(i%1025)/1024.f;memcpy(n,a,256);
#ifdef HOST_REPLAY
   assert(fread(n,1,256,file)==256);
#else
   switch(op%4){case 0:native_master(n,value);break;case 1:native_mode(n,value);break;case 2:native_level(n,knob);break;case 3:native_mix(n,knob);break;}
   assert(fwrite(n,1,256,file)==256);
#endif
   switch(op%4){case 0:portable_master(a,value);break;case 1:portable_mode(a,value);break;case 2:portable_level(a,knob);break;case 3:portable_mix(a,knob);break;}
   if(memcmp(a,n,256)){for(unsigned k=0;k<256;k++)if(a[k]!=n[k]){fprintf(stderr,"case%u op%u byte%u portable%u native%u\n",i,op,k,a[k],n[k]);break;}return 1;}
   calls++;
  }
 }
 fclose(file);printf("PASS %u calls, full256-byte state comparison\n",calls);
}
