#include "sweep.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_sweep_init(Sweep *),native_sweep_execute(Sweep *,const Stereo *,Stereo *,int),native_sweep_detect(Sweep *,const Stereo *,int);
extern void iir_native(const Stereo*,Stereo*,const Stereo*,Stereo*,Stereo*,unsigned long);
extern const float sweep_lpf_endpoint[5],sweep_hpf_endpoint[5],sweep_detector_lpf[5],sweep_detector_hpf[5];
typedef struct {uint32_t vt;SweepFilter f;} NF;
static uint32_t vt[7];
static void setcoeff(NF *f,const float *c){sweep_filter_set(&f->f,c);}
static void clear(NF *f){memset(f->f.x,0,32);f->f.clears++;}
static void process(NF *f,const Stereo *in,Stereo *out,int n){iir_native(in,out,f->f.coeff,f->f.x,f->f.y,(unsigned)n);}
#endif
static unsigned seed=7321231,errors=0;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
static void compare(const void *x,const void *y,size_t size,unsigned call,const char *what){const uint32_t *a=x,*b=y;for(unsigned i=0;i<size/4;i++)if(a[i]!=b[i]){if(errors<12)fprintf(stderr,"%s call%u word%u %08x != %08x\n",what,call,i,a[i],b[i]);errors++;}}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");vt[2]=(uint32_t)setcoeff;vt[5]=(uint32_t)process;vt[6]=(uint32_t)clear;
#endif
if(!f)return 2;
SweepRuntime s={0},ref={0};float constants[4][5];
#ifndef HOST_REPLAY
memcpy(constants[0],sweep_lpf_endpoint,20);memcpy(constants[1],sweep_hpf_endpoint,20);memcpy(constants[2],sweep_detector_lpf,20);memcpy(constants[3],sweep_detector_hpf,20);fwrite(constants,sizeof constants,1,f);
#else
if(fread(constants,sizeof constants,1,f)!=1)return 3;
#endif
memcpy(s.coefficients.endpoint,constants,40);s.state.word[1]=s.state.word[2]=44100;s.state.word[4]=s.state.word[5]=64;sweep_put_float(&s.state,12,1.0f/44100);sweep_put_float(&s.state,28,.5f);sweep_put_float(&s.state,32,.5f);sweep_put_float(&s.state,112,1.0f/64);
for(unsigned i=0;i<5;i++){sweep_filter_set(&s.filter[i],constants[i<2||i==4?2:3]);s.filter[i].clears=i==4?0:1;}
ref=s;
#ifndef HOST_REPLAY
NF filters[9]={0};
for(unsigned i=0;i<9;i++){filters[i].vt=(uint32_t)vt;filters[i].f=s.filter[i];ref.state.word[9+i]=(uint32_t)&filters[i];}
for(unsigned a=0;a<2;a++){ref.state.word[18+a]=(uint32_t)ref.bands[a];ref.state.word[20+a]=(uint32_t)ref.temporary[a];ref.state.word[23+a]=(uint32_t)ref.levels[a];ref.state.word[25+a]=(uint32_t)ref.memory[a];}
ref.state.word[22]=(uint32_t)ref.output;
native_sweep_init(&ref.state);
#endif
sweep_runtime_init(&s);
for(unsigned call=0;call<6000;call++){
 if(call%31==0){float color=(float)(rnd()%256)/255;sweep_put_float(&s.state,28,color);s.state.word[64]=(unsigned)((int)(color*1023)>>2);sweep_put_float(&ref.state,28,color);ref.state.word[64]=s.state.word[64];}
 if(call%37==0){float parameter=(float)(rnd()%10001)/10000;sweep_put_float(&s.state,32,parameter);sweep_put_float(&ref.state,32,parameter);((unsigned char*)&s.state)[260]=((unsigned char*)&ref.state)[260]=1;}
 if(call%251==0){
#ifndef HOST_REPLAY
 native_sweep_init(&ref.state);
#endif
 sweep_runtime_init(&s);
 }
 int n=64;Stereo in[66]={0},out[64]={0},expected[64]={0};
 for(int i=0;i<n;i++)in[i]=(Stereo){((int)(rnd()%10001)-5000)*.00001f,((int)(rnd()%10001)-5000)*.00001f};
#ifndef HOST_REPLAY
 native_sweep_detect(&ref.state,in,n);native_sweep_execute(&ref.state,in,expected,n);
 SweepRuntime saved=ref;for(unsigned k=9;k<=26;k++)saved.state.word[k]=0;
 for(unsigned k=0;k<9;k++)saved.filter[k]=filters[k].f;
 for(unsigned k=0;k<4;k++){for(unsigned j=0;j<5;j++)saved.coefficients.coeff[k][j]=filters[k+5].f.coeff[j].l;saved.coefficients.updates[k]=filters[k+5].f.updates;}
 fwrite(&saved,sizeof saved,1,f);fwrite(expected,sizeof expected,1,f);
#else
 SweepRuntime saved;if(fread(&saved,sizeof saved,1,f)!=1||fread(expected,sizeof expected,1,f)!=1)return 3;
#endif
 sweep_runtime_detect(&s,in,n);sweep_runtime_execute(&s,in,out,n);
 compare(&s,&saved,sizeof s,call,"runtime");compare(out,expected,sizeof out,call,"audio");
}
fclose(f);printf("{\"calls\":6000,\"frames\":384000,\"mismatches\":%u}\n",errors);return errors?1:0;
}
