#include "isolator.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_iso_execute(void*,const Stereo*,Stereo*,int),native_iso_reset(void*),native_iso_volume(void*,int,float);
extern void iir_native(const Stereo*,Stereo*,const Stereo*,Stereo*,Stereo*,unsigned long);
typedef struct{uint32_t vt;EqIir f;} NF;
static uint32_t vt[7];
static void clear(NF*f){memset(f->f.x,0,32);}
static void process(NF*f,const Stereo*in,Stereo*out,int n){iir_native(in,out,f->f.coefficients,f->f.x,f->f.y,(unsigned)n);}
#endif
static unsigned seed=2198293,errors;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
static void compare(const void*x,const void*y,size_t bytes,unsigned call,const char*label){const unsigned char*a=x,*b=y;for(size_t i=0;i<bytes;i++)if(a[i]!=b[i]){if(errors<8)fprintf(stderr,"%s call %u byte %zu %02x != %02x\n",label,call,i,a[i],b[i]);errors++;}}
int main(int argc,char**argv){if(argc!=3)return 2;float tables[276];FILE*t=fopen(argv[2],"rb");if(!t||fread(tables,sizeof tables,1,t)!=1)return 2;fclose(t);
#ifdef HOST_REPLAY
FILE*f=fopen(argv[1],"rb");
#else
FILE*f=fopen(argv[1],"wb");vt[5]=(uint32_t)process;vt[6]=(uint32_t)clear;
#endif
if(!f)return 2;
Isolator s,ref;isolator_setup(&s,(const float(*)[5])(tables+256),44100);ref=s;
#ifndef HOST_REPLAY
NF nf[8]={0};uint32_t obj[30]={0};unsigned slots[8]={9,10,13,14,15,16,17,18};
for(unsigned i=0;i<8;i++){nf[i].vt=(uint32_t)vt;nf[i].f=s.filter[i];obj[slots[i]]=(uint32_t)&nf[i];}
for(unsigned i=0;i<5;i++)obj[21+i]=(uint32_t)ref.scratch[i];
for(unsigned i=0;i<3;i++)obj[27+i]=(uint32_t)&ref.gain[i];
obj[26]=(uint32_t)tables;
#endif
unsigned frames=0;
for(unsigned call=0;call<8000;call++){
 if(call%13==0){unsigned band=rnd()%3;float value=(float)(rnd()%10001)/10000.f;
#ifndef HOST_REPLAY
 native_iso_volume(obj,(int)band,value);
#endif
 eq_gain_target(&s.gain[band],value,tables);
 }
 if(call%223==0){
#ifndef HOST_REPLAY
 native_iso_reset(obj);
#endif
 isolator_reset(&s);
 }
 const unsigned sizes[]={1,2,3,7,31,63,64};unsigned n=sizes[call%7];frames+=n;Stereo in[66]={0},out[64]={0},expected[64]={0};
 for(unsigned i=0;i<n;i++)in[i]=(Stereo){((int)(rnd()%10001)-5000)*.0001f,((int)(rnd()%10001)-5000)*.0001f};
 if(call%97<5)memset(in,0,sizeof in);
#ifndef HOST_REPLAY
 native_iso_execute(obj,in,expected,(int)n);for(unsigned j=0;j<8;j++)ref.filter[j]=nf[j].f;fwrite(&ref,sizeof ref,1,f);fwrite(expected,sizeof expected,1,f);
#else
 if(fread(&ref,sizeof ref,1,f)!=1||fread(expected,sizeof expected,1,f)!=1)return 3;
#endif
 isolator_execute(&s,in,out,n);compare(&s,&ref,sizeof s,call,"state");compare(out,expected,sizeof out,call,"audio");
}
fclose(f);printf("{\"blocks\":8000,\"frames\":%u,\"mismatches\":%u}\n",frames,errors);return errors?1:0;}
