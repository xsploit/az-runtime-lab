#define _GNU_SOURCE
#include <sys/mman.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
float headphone_tables[776];
static float output[258];
float* fixture_output(int index){return index==7?output:0;}
void portable_audio(unsigned char*,int,const float*,const float*,float*,const float*);
#ifndef HOST_REPLAY
void native_audio(unsigned char*,int);
#endif
static uint32_t rng=7;
static uint32_t next(void){rng=rng*1664525u+1013904223u;return rng;}
static void su(unsigned char*s,unsigned o,uint32_t v){memcpy(s+o,&v,4);}
static void sf(unsigned char*s,unsigned o,float v){memcpy(s+o,&v,4);}
int main(int argc,char**argv){assert(argc==2);
#ifdef HOST_REPLAY
 FILE*fp=fopen(argv[1],"rb");
#else
 FILE*fp=fopen(argv[1],"wb");
#endif
 assert(fp);
 unsigned char*mem=mmap((void*)0x30000000,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(mem==(void*)0x30000000);
 float*master=(float*)(mem+256),*cue=(float*)(mem+2048);
 su(mem,32,0x30000100);su(mem+64,32,0x30000800);
 void*global=mmap((void*)0x1149000,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(global==(void*)0x1149000);
 float*split=(float*)((unsigned char*)global+0x680);
 unsigned long frames_total=0;
 for(unsigned i=0;i<6000;i++){
  unsigned char a[256],n[256];memset(a,0,sizeof a);
  su(a,4,0x30000000);su(a,16,0x30000040);su(a,12,7);
  su(a,200,i%2);su(a,204,(i/2)%2);su(a,248,i%3);
  unsigned bases[]={24,72,112,160,208};
  for(unsigned j=0;j<5;j++){unsigned b=bases[j];for(unsigned k=0;k<6;k++)sf(a,b+4*k,((int)(next()%2001)-1000)/10000.f);
   su(a,b+24,next()%65);su(a,b+28,next()%65);sf(a,b+32,1.f/(1+next()%128));a[b+36]=next()%2;
  }
  split[0]=(1+next()%100)/100.f;split[1]=(1+next()%100)/100.f;
  for(unsigned j=0;j<258;j++){master[j]=((int)(next()%2001)-1000)/10000.f;cue[j]=((int)(next()%2001)-1000)/10000.f;}
  for(unsigned block=0;block<4;block++){
   int frames=(i+block)%130-1;float expected[258],got[258];memset(expected,0x55,sizeof expected);memset(output,0x55,sizeof output);memcpy(n,a,256);
#ifdef HOST_REPLAY
   assert(fread(n,1,256,fp)==256);assert(fread(got,1,sizeof got,fp)==sizeof got);
#else
   native_audio(n,frames);memcpy(got,output,sizeof got);assert(fwrite(n,1,256,fp)==256);assert(fwrite(got,1,sizeof got,fp)==sizeof got);
#endif
   portable_audio(a,frames,master,cue,expected,split);
   if(memcmp(a,n,256)||memcmp(expected,got,sizeof got)){fprintf(stderr,"Mismatch case%u block%u frames%d state%d audio%d\n",i,block,frames,memcmp(a,n,256),memcmp(expected,got,sizeof got));return 1;}
   if(frames>0)frames_total+=frames;
  }
 }
 fclose(fp);printf("PASS 24000 persistent blocks, %lu frames, full state and output guards\n",frames_total);
}
