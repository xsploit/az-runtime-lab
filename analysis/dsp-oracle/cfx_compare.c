#include "cfx_filter.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stddef.h>
static FILE *records;
static unsigned long calls,compared,mismatches;static double maxerr;
#ifndef HOST_REPLAY
typedef struct {void **vtable;float coeff[5];unsigned clears;Stereo x[2],y[2];} MockFilter;
typedef struct {
 uint32_t unused[7];float color,parameter;MockFilter *lp,*hp;
 float gain_target,gain,blend,dry_target,dry,dry_step,lpf,hpf;
 uint8_t low_side,dirty,pad[2];int32_t step,target;
} NativeFilter;
_Static_assert(offsetof(NativeFilter,color)==28,"ARM layout");
_Static_assert(offsetof(NativeFilter,gain_target)==44,"ARM layout");
_Static_assert(sizeof(NativeFilter)==88,"ARM layout");
extern void cfx_native_calc(NativeFilter *);
extern void cfx_native_initialize(NativeFilter *);
extern void cfx_native_execute(NativeFilter *,const Stereo *,Stereo *,int);
extern void iir_native(const Stereo *,Stereo *,const Stereo *,Stereo *,Stereo *,unsigned long);
static void set(MockFilter *f,const float *c){memcpy(f->coeff,c,5*sizeof(float));}
static void clear(MockFilter *f){f->clears++;memset(f->x,0,sizeof f->x);memset(f->y,0,sizeof f->y);}
static void process(MockFilter *f,const Stereo *in,Stereo *out,int n){
 Stereo c[5];for(int k=0;k<5;k++)c[k]=(Stereo){f->coeff[k],f->coeff[k]};
 iir_native(in,out,c,f->x,f->y,(unsigned long)n);
}
static void *vtable[7]={0,0,(void *)set,0,0,(void *)process,(void *)clear};
static NativeFilter native;
static MockFilter mocks[2];
static void reset_native(float color,float p){
 memset(&native,0,sizeof native);memset(mocks,0,sizeof mocks);
 mocks[0].vtable=mocks[1].vtable=vtable;native.lp=mocks;native.hp=mocks+1;
 native.color=color;native.parameter=p;native.blend=1;native.dry=1;native.dry_target=1;native.low_side=1;
}
#endif
static uint32_t bits(float f){uint32_t v;memcpy(&v,&f,4);return v;}
static void compare_float(float a,float b){
 compared++;if(bits(a)!=bits(b)){mismatches++;double d=fabs((double)a-b);if(d>maxerr)maxerr=d;
 if(mismatches<5)fprintf(stderr,"Cfx mismatch call %lu field %lu %08x vs %08x\n",calls,compared,bits(a),bits(b));}
}
static void check(CfxFilter *s){
 CfxFilter expected;memset(&expected,0,sizeof expected);
#ifndef HOST_REPLAY
 expected.color=native.color;expected.parameter=native.parameter;
 memcpy(&expected.gain_target,&native.gain_target,8*sizeof(float));
 expected.low_side=native.low_side;expected.dirty=native.dirty;expected.step=native.step;expected.target=native.target;
 memcpy(expected.coefficients[0],mocks[0].coeff,5*sizeof(float));
 memcpy(expected.coefficients[1],mocks[1].coeff,5*sizeof(float));
 if(fwrite(&expected,sizeof expected,1,records)!=1)exit(2);
#else
 if(fread(&expected,sizeof expected,1,records)!=1)exit(2);
#endif
 calls++;
 float af[10],bf[10];memcpy(af,&expected,sizeof af);memcpy(bf,s,sizeof bf);
 for(int i=0;i<10;i++)compare_float(af[i],bf[i]);
 for(int j=0;j<2;j++)for(int i=0;i<5;i++)compare_float(expected.coefficients[j][i],s->coefficients[j][i]);
 compared+=4;
 if(expected.low_side!=s->low_side||expected.dirty!=s->dirty||expected.step!=s->step||expected.target!=s->target){
 mismatches++;if(mismatches<5)fprintf(stderr,"Cfx integer mismatch call %lu step %d/%d target %d/%d\n",calls,expected.step,s->step,expected.target,s->target);
 }
}
static void init(CfxFilter *s,float color,float parameter){
 memset(s,0,sizeof *s);s->color=color;s->parameter=parameter;s->blend=s->dry=s->dry_target=1;s->low_side=1;
#ifndef HOST_REPLAY
 reset_native(color,parameter);cfx_native_initialize(&native);
 if(mocks[0].clears!=1||mocks[1].clears!=1){fputs("Missing native clear call\n",stderr);exit(2);}
#endif
 cfx_filter_initialize(s);check(s);
}
static void calc(CfxFilter *s){
#ifndef HOST_REPLAY
 native.color=s->color;native.parameter=s->parameter;native.target=s->target;native.dirty=s->dirty;
 cfx_native_calc(&native);
#endif
 cfx_filter_calc(s);check(s);
}
static unsigned long audio_calls,audio_frames;
static void audio(CfxFilter *s,CfxHistory *h,size_t n,unsigned seed){
 Stereo *input=calloc(n+1,sizeof(Stereo)),*exact=calloc(n?n:1,sizeof(Stereo));
 Stereo *actual=calloc(n?n:1,sizeof(Stereo)),*expected=calloc(n?n:1,sizeof(Stereo));
 Stereo *lp=calloc(n?n:1,sizeof(Stereo)),*hp=calloc(n?n:1,sizeof(Stereo));
 if(!input||!exact||!actual||!expected||!lp||!hp)exit(2);
 for(size_t k=0;k<n;k++){
  seed=seed*1664525u+1013904223u;input[k].l=((int)(seed&65535)-32768)/131072.0f;
  seed=seed*1664525u+1013904223u;input[k].r=((int)(seed&65535)-32768)/131072.0f;
 }
 if(seed%7==0)memset(input,0,n*sizeof(Stereo));
 memcpy(exact,input,n*sizeof(Stereo));
#ifndef HOST_REPLAY
 native.color=s->color;native.parameter=s->parameter;native.target=s->target;native.dirty=s->dirty;
 cfx_native_execute(&native,input,expected,(int)n);
#endif
 cfx_filter_process(s,h,exact,actual,lp,hp,n);check(s);
 CfxHistory nh;
#ifndef HOST_REPLAY
 for(int j=0;j<2;j++){memcpy(nh.x[j],mocks[j].x,sizeof mocks[j].x);memcpy(nh.y[j],mocks[j].y,sizeof mocks[j].y);}
 if(fwrite(expected,sizeof(Stereo),n,records)!=n||fwrite(&nh,sizeof nh,1,records)!=1)exit(2);
#else
 if(fread(expected,sizeof(Stereo),n,records)!=n||fread(&nh,sizeof nh,1,records)!=1)exit(2);
#endif
 for(size_t k=0;k<n;k++){compare_float(expected[k].l,actual[k].l);compare_float(expected[k].r,actual[k].r);}
 for(int j=0;j<2;j++)for(int k=0;k<2;k++){
  compare_float(nh.x[j][k].l,h->x[j][k].l);compare_float(nh.x[j][k].r,h->x[j][k].r);
  compare_float(nh.y[j][k].l,h->y[j][k].l);compare_float(nh.y[j][k].r,h->y[j][k].r);
 }
 audio_calls++;audio_frames+=n;free(input);free(exact);free(actual);free(expected);free(lp);free(hp);
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
#ifdef HOST_REPLAY
 records=fopen(argv[1],"rb");
#else
 records=fopen(argv[1],"wb");
#endif
 if(!records)return 2;
 CfxFilter s;
 /* Grid covers whole knob range, centre dead zone, parameter extremes. */
 for(int p=0;p<=32;p++)for(int color=0;color<=1023;color++){
  init(&s,color/1023.0f,p/32.0f);calc(&s);
 }
 /* Continuously slew targets, parameter dirty refresh, and reverse direction. */
 init(&s,0.5f,0.5f);
 for(int cycle=0;cycle<8;cycle++){
  cfx_filter_color(&s,cycle%2?0:1);
  for(int j=0;j<160;j++){
   if(j%17==0)cfx_filter_parameter(&s,((j+cycle)%33)/32.0f);
   calc(&s);
  }
 }
 CfxHistory history;memset(&history,0,sizeof history);init(&s,0.5f,0.5f);
 const size_t frames[]={0,1,2,3,16,63,64,65,128,256};
 for(int j=0;j<3000;j++){
  if(j%79==0)cfx_filter_color(&s,(j/79)%2?0:1);
  if(j%41==0)cfx_filter_parameter(&s,(j%33)/32.0f);
  if(j%701==0){float color=s.color,p=s.parameter;init(&s,color,p);memset(&history,0,sizeof history);}
  audio(&s,&history,frames[j%10],(unsigned)j+123u);
 }
#ifdef HOST_REPLAY
 if(fgetc(records)!=EOF)return 2;
#endif
 fclose(records);
 printf("{\"state_checks\":%lu,\"audio_calls\":%lu,\"audio_stereo_frames\":%lu,\"values_compared\":%lu,\"bit_mismatches\":%lu,\"max_abs_error\":%.17g}\n",calls,audio_calls,audio_frames,compared,mismatches,maxerr);
 return mismatches?1:0;
}
