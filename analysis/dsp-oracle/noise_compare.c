#include "noise.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
_Static_assert(sizeof(Noise)==112,"Noise ABI");
#ifndef HOST_REPLAY
extern void native_noise_coeff(Noise*,int,float*);
extern void native_noise_color(Noise*),native_noise_init(Noise*),native_noise_execute(Noise*,const Stereo*,Stereo*,int),iir_native(const Stereo*,Stereo*,const Stereo*,Stereo*,Stereo*,unsigned long);
typedef struct {uint32_t *vtable;NoiseFilter f;} NF;
static void coeff(NF *f,const Stereo *v){memcpy(f->f.coeff,v,40);}static void clear(NF *f){f->f.clears++;memset(f->f.x,0,32);}
static void process(NF *f,const Stereo *a,Stereo *b,unsigned n){iir_native(a,b,f->f.coeff,f->f.x,f->f.y,n);}
static uint32_t vt[8];
#endif
static unsigned mismatches,words;
static void compare(const void *a,const void *b,size_t sz,unsigned block,const char *name){const uint32_t *x=a,*y=b;for(unsigned i=0;i<sz/4;i++){words++;if(x[i]!=y[i]){if(mismatches<14)fprintf(stderr,"%s block%u word%u %08x != %08x\n",name,block,i,x[i],y[i]);mismatches++;}}}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");vt[3]=(uint32_t)coeff;vt[5]=(uint32_t)process;vt[6]=(uint32_t)clear;
#endif
if(!f)return 2;
unsigned calls=0,frames=0;
for(unsigned i=0;i<256;i++){float a[5],b[5];noise_coeff(i,a);
#ifndef HOST_REPLAY
 native_noise_coeff(NULL,i,b);fwrite(b,sizeof b,1,f);
#else
 if(fread(b,sizeof b,1,f)!=1)return 2;
#endif
 compare(a,b,sizeof a,i,"coefficients");}

for(unsigned scenario=0;scenario<8;scenario++){
Noise s={0},ref;s.rate=s.rate2=44100;s.inverse=1.0f/44100;s.block=s.allocated=64;s.color=s.parameter=.5f;s.mix_target=s.mix=1;s.res_target=s.res=.7f;s.feedback_gain=(Stereo){.7f,.7f};s.inv_block=1.0f/64;s.current=s.target=127;s.seed[0]=0x67452301;s.seed[1]=0xefcdab89;ref=s;(void)ref;NoiseFilter filter={0},expected_filter;
#ifndef HOST_REPLAY
NF nf={0};nf.vtable=vt;Stereo scratch[64];ref.filter=(uint32_t)&nf;ref.buffer=(uint32_t)scratch;native_noise_init(&ref);
#endif
noise_init(&s,&filter);
for(unsigned block=0;block<1000;block++){
 if(block%19==0){s.color=(float)((block*17+scenario*31)%256)/255;
#ifndef HOST_REPLAY
 ref.color=s.color;native_noise_color(&ref);
#endif
 noise_color(&s);}
 if(block%31==0){s.parameter=(float)((block+scenario*11)%129)/128;
#ifndef HOST_REPLAY
 ref.parameter=s.parameter;
#endif
 }
 if(block%251==0){
#ifndef HOST_REPLAY
 native_noise_init(&ref);
#endif
 noise_init(&s,&filter);}
 unsigned n=block%11==0?0:block%11==1?2:64;Stereo in[64]={0},out[64]={0},expected[64]={0};for(unsigned i=0;i<n;i++)in[i]=(Stereo){.1f,-.15f};
#ifndef HOST_REPLAY
 native_noise_execute(&ref,in,expected,n);Noise state=ref;state.filter=state.buffer=0;expected_filter=nf.f;fwrite(&state,sizeof state,1,f);fwrite(&expected_filter,sizeof expected_filter,1,f);fwrite(expected,sizeof *expected,n,f);
#else
 Noise state;if(fread(&state,sizeof state,1,f)!=1||fread(&expected_filter,sizeof expected_filter,1,f)!=1||fread(expected,sizeof *expected,n,f)!=n)return 2;
#endif
 noise_execute(&s,&filter,in,out,n);compare(&s,&state,sizeof s,block,"state");compare(&filter,&expected_filter,sizeof filter,block,"filter");compare(out,expected,n*sizeof *out,block,"audio");calls++;frames+=n;
}
}fclose(f);printf("{\"calls\":%u,\"frames\":%u,\"words\":%u,\"mismatches\":%u}\n",calls,frames,words,mismatches);return mismatches?1:0;}
