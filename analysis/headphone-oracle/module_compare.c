#define _GNU_SOURCE
#include <sys/mman.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
float headphone_tables[776];
static float output[258];
float* fixture_output(int index){return index==7?output:0;}
void portable_level(unsigned char*,float);void portable_mix(unsigned char*,float);
void portable_master(unsigned char*,uint32_t);void portable_mode(unsigned char*,uint32_t);
void portable_audio(unsigned char*,int,const float*,const float*,float*,const float*);
#ifndef HOST_REPLAY
void native_level(unsigned char*,float);void native_mix(unsigned char*,float);
void native_master(unsigned char*,uint32_t);void native_mode(unsigned char*,uint32_t);
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
 FILE*tf=fopen("tables.bin","rb");assert(tf);assert(fread(headphone_tables,1,sizeof headphone_tables,tf)==sizeof headphone_tables);fclose(tf);
#ifndef HOST_REPLAY
 void*table=mmap((void*)0x419000,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(table==(void*)0x419000);memcpy((unsigned char*)table+0x3b0,headphone_tables,sizeof headphone_tables);
#endif
 unsigned char*mem=mmap((void*)0x30000000,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(mem==(void*)0x30000000);
 float*master=(float*)(mem+256),*cue=(float*)(mem+2048);
 su(mem,32,0x30000100);su(mem+64,32,0x30000800);
 void*global=mmap((void*)0x1149000,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);assert(global==(void*)0x1149000);
 float*split=(float*)((unsigned char*)global+0x680);
 unsigned long frames_total=0;
 for(unsigned i=0;i<1500;i++){
  unsigned char a[256],n[256];memset(a,0,sizeof a);
  su(a,4,0x30000000);su(a,16,0x30000040);su(a,12,7);
  su(a,200,i%2);su(a,204,(i/2)%2);su(a,248,i%3);
  unsigned bases[]={24,72,112,160,208};
  for(unsigned j=0;j<5;j++){unsigned b=bases[j];for(unsigned k=0;k<6;k++)sf(a,b+4*k,((int)(next()%2001)-1000)/10000.f);
   su(a,b+24,next()%65);su(a,b+28,next()%65);sf(a,b+32,1.f/(1+next()%128));a[b+36]=next()%2;
  }
  split[0]=.5f;split[1]=.5f;
  for(unsigned j=0;j<258;j++){master[j]=((int)(next()%2001)-1000)/10000.f;cue[j]=((int)(next()%2001)-1000)/10000.f;}
  for(unsigned block=0;block<32;block++){
   int frames=1+(i+block)%128;float expected[258],got[258];memset(expected,0x55,sizeof expected);memset(output,0x55,sizeof output);memcpy(n,a,256);
#ifdef HOST_REPLAY
   assert(fread(n,1,256,fp)==256);assert(fread(got,1,sizeof got,fp)==sizeof got);
#else
   float knob=((i+block*23)%1025)/1024.f;
   switch(block%5){case 0:native_level(n,knob);break;case 1:native_mix(n,knob);break;case 2:native_master(n,(i+block)%2);break;case 3:native_mode(n,(i+block/3)%2);break;default:break;}
   native_audio(n,frames);memcpy(got,output,sizeof got);assert(fwrite(n,1,256,fp)==256);assert(fwrite(got,1,sizeof got,fp)==sizeof got);
#endif
   float portable_knob=((i+block*23)%1025)/1024.f;
   switch(block%5){case 0:portable_level(a,portable_knob);break;case 1:portable_mix(a,portable_knob);break;case 2:portable_master(a,(i+block)%2);break;case 3:portable_mode(a,(i+block/3)%2);break;default:break;}
   portable_audio(a,frames,master,cue,expected,split);
   if(memcmp(a,n,256)||memcmp(expected,got,sizeof got)){fprintf(stderr,"Mismatch case%u block%u frames%d state%d audio%d\n",i,block,frames,memcmp(a,n,256),memcmp(expected,got,sizeof got));return 1;}
   if(frames>0)frames_total+=frames;
  }
 }
 fclose(fp);printf("PASS 48000 setter+audio persistent blocks, %lu frames, full state and output guards\n",frames_total);
}

#ifdef MODULE_REPLAY
#include "../../mixer/headphone_dsp.h"
static LabHeadphoneDsp hp;
static void begin(unsigned char*s){assert(lab_headphone_init(&hp,44100,headphone_tables,776));memcpy(hp.state,s,256);}
static void end(unsigned char*s){memcpy(s,hp.state,256);}
void portable_level(unsigned char*s,float v){begin(s);assert(lab_headphone_level(&hp,v));end(s);}
void portable_mix(unsigned char*s,float v){begin(s);assert(lab_headphone_mix(&hp,v));end(s);}
void portable_master(unsigned char*s,uint32_t v){begin(s);assert(lab_headphone_master_cue(&hp,v));end(s);}
void portable_mode(unsigned char*s,uint32_t v){begin(s);assert(lab_headphone_mode(&hp,1-v));end(s);}
void portable_audio(unsigned char*s,int n,const float*m,const float*c,float*out,const float*split){(void)split;begin(s);assert(lab_headphone_process(&hp,m,c,out,(size_t)n));end(s);}
#endif
