#include "eq_channel.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
unsigned native_eq_rate;
uint32_t native_eq_iir_vtable[7];
extern void native_eq_ctor(void*),native_iso_ctor(void*),native_eq_resources(void*,int),native_iso_resources(void*,int),native_eq_iir_set(void*,const float*);
static void*allocations[256];static unsigned allocated;
void*native_eq_alloc(unsigned n){void*p=malloc(n+16);if(!p||allocated==256)abort();memset(p,0,n+16);allocations[allocated++]=p;return p;}
void native_eq_string(void*p,...){(void)p;}
void native_eq_abort(void){abort();}
static void snapshot_filter(EqIir*out,uint32_t*p){memcpy(out->coefficients,(void*)(uintptr_t)p[8],40);memcpy(out->x,(void*)(uintptr_t)p[11],16);memcpy(out->y,(void*)(uintptr_t)p[12],16);}
#endif

#ifndef HOST_REPLAY
extern void native_eq_execute(void*,const Stereo*,Stereo*,int),native_iso_execute(void*,const Stereo*,Stereo*,int),native_eq_reset(void*),native_iso_reset(void*),native_eq_volume(void*,int,float),native_iso_volume(void*,int,float);
extern void native_channel_execute(void*,int),native_channel_mode(void*,int),native_channel_volume(void*,int,float);
extern void iir_native(const Stereo*,Stereo*,const Stereo*,Stereo*,Stereo*,unsigned long);
static uint32_t eq_vt[8],iso_vt[8],*eq_object,*iso_object;static unsigned resets[2];
static void eq_reset_hook(void*p){resets[0]++;native_eq_reset(p);}
static void iso_reset_hook(void*p){resets[1]++;native_iso_reset(p);}
static void iir_process(uint32_t*p,const Stereo*in,Stereo*out,int n){iir_native(in,out,(void*)(uintptr_t)p[8],(void*)(uintptr_t)p[11],(void*)(uintptr_t)p[12],(unsigned)n);}
static void iir_clear(uint32_t*p){memset((void*)(uintptr_t)p[11],0,16);memset((void*)(uintptr_t)p[12],0,16);}
int native_channel_no_effect(void*p){(void)p;return -1;}
static void snapshot(EqChannel*s,uint32_t*ch){
 uint32_t*a=eq_object,*b=iso_object;
 for(unsigned j=0;j<3;j++){snapshot_filter(&s->eq.filter[j],(void*)(uintptr_t)a[9+j]);memcpy(&s->eq.index[j],(void*)(uintptr_t)a[14+j],28);memcpy(&s->iso.gain[j],(void*)(uintptr_t)b[27+j],40);}
 memcpy(s->eq.cached,(char*)a+68,6);for(unsigned j=0;j<2;j++)memcpy(s->eq.scratch[j],(void*)(uintptr_t)a[12+j],512);
 unsigned slots[8]={9,10,13,14,15,16,17,18};for(unsigned j=0;j<8;j++)snapshot_filter(&s->iso.filter[j],(void*)(uintptr_t)b[slots[j]]);
 for(unsigned j=0;j<5;j++)memcpy(s->iso.scratch[j],(void*)(uintptr_t)b[21+j],512);
 memcpy(&s->mode_gain,(char*)ch+440,40);s->requested=(int)ch[108];s->pending=((unsigned char*)ch)[436];s->active=ch[107]==(uint32_t)iso_object;memcpy(s->resets,resets,8);memcpy(s->volume,a+6,12);
 if(memcmp(a+6,b+6,12))abort();
}
#endif
static unsigned seed=4223344,errors;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
static void compare(const void*x,const void*y,size_t bytes,unsigned call,const char*label){const unsigned char*a=x,*b=y;for(size_t i=0;i<bytes;i++)if(a[i]!=b[i]){if(errors<10)fprintf(stderr,"%s call %u byte %zu %02x != %02x\n",label,call,i,a[i],b[i]);errors++;}}
int main(int argc,char**argv){if(argc!=4)return 2;float tables[276],eqtables[3][256][5];FILE*t=fopen(argv[2],"rb");if(!t||fread(tables,sizeof tables,1,t)!=1)return 2;fclose(t);t=fopen(argv[3],"rb");if(!t||fread(eqtables,sizeof eqtables,1,t)!=1)return 2;fclose(t);
#ifdef HOST_REPLAY
FILE*f=fopen(argv[1],"rb");
#else
FILE*f=fopen(argv[1],"wb");native_eq_iir_vtable[2]=(uint32_t)native_eq_iir_set;native_eq_iir_vtable[5]=(uint32_t)iir_process;native_eq_iir_vtable[6]=(uint32_t)iir_clear;
eq_vt[2]=(uint32_t)native_eq_execute;eq_vt[5]=(uint32_t)eq_reset_hook;eq_vt[7]=(uint32_t)native_eq_volume;
iso_vt[2]=(uint32_t)native_iso_execute;iso_vt[5]=(uint32_t)iso_reset_hook;iso_vt[7]=(uint32_t)native_iso_volume;
#endif
if(!f)return 2;
EqChannel s,ref={0};eq_channel_setup(&s,(const float(*)[5])(tables+256),44100,0);
#ifndef HOST_REPLAY
uint32_t a[19]={0},b[30]={0},ch[136]={0};Stereo native_audio[66]={0},post[66]={0},cue[66]={0};native_eq_rate=44100;native_eq_ctor(a);native_iso_ctor(b);native_eq_resources(a,64);native_iso_resources(b,64);eq_object=a;iso_object=b;a[0]=(uint32_t)eq_vt;b[0]=(uint32_t)iso_vt;
ch[105]=(uint32_t)a;ch[106]=(uint32_t)b;ch[107]=(uint32_t)a;ch[7]=(uint32_t)native_audio;ch[8]=(uint32_t)post;ch[9]=(uint32_t)cue;memcpy((char*)ch+440,&s.mode_gain,40);((unsigned char*)ch)[436]=(unsigned char)s.pending;
for(unsigned k=0;k<2;k++){ch[28+k]=ch[40+k]=ch[126+k]=0x3f800000;}((unsigned char*)ch)[132]=((unsigned char*)ch)[180]=((unsigned char*)ch)[524]=1;
#endif
unsigned frames=0;
for(unsigned call=0;call<8000;call++){
 if(call%7==0){unsigned band=rnd()%3;float v=(float)(rnd()%10001)/10000.f;
#ifndef HOST_REPLAY
 native_channel_volume(ch,(int)band,v);
#endif
 eq_channel_volume(&s,band,v,tables);
 }
 if(call%97==0||call%97<12){int mode=(int)(rnd()%5)-1;
#ifndef HOST_REPLAY
 native_channel_mode(ch,mode);
#endif
 eq_channel_mode(&s,mode);
 }
 const unsigned sizes[]={1,2,3,7,31,63,64};unsigned n=sizes[call%7];frames+=n;Stereo in[66]={0},out[64]={0},expected[64]={0};
 for(unsigned i=0;i<n;i++)in[i]=(Stereo){((int)(rnd()%10001)-5000)*.0001f,((int)(rnd()%10001)-5000)*.0001f};
#ifndef HOST_REPLAY
 memcpy(native_audio,in,sizeof in);native_channel_execute(ch,(int)n);memcpy(expected,native_audio,n*8);snapshot(&ref,ch);fwrite(&ref,sizeof ref,1,f);fwrite(expected,sizeof expected,1,f);
#else
 if(fread(&ref,sizeof ref,1,f)!=1||fread(expected,sizeof expected,1,f)!=1)return 3;
#endif
 eq_channel_execute(&s,eqtables,in,out,n);compare(&s,&ref,sizeof s,call,"state");compare(out,expected,sizeof out,call,"audio");
}
#ifndef HOST_REPLAY
while(allocated)free(allocations[--allocated]);
#endif
fclose(f);printf("{\"blocks\":8000,\"frames\":%u,\"eq_resets\":%u,\"isolator_resets\":%u,\"mismatches\":%u}\n",frames,s.resets[0],s.resets[1],errors);return errors?1:0;}
