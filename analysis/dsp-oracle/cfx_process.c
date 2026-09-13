#include "cfx_filter.h"
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
static float output(float in,float lp,float hp,const CfxFilter *s){
 float filt=add(mul(s->blend,lp),mul(sub(1.0f,s->blend),hp));
 return add(mul(in,s->dry),mul(mul(s->gain,filt),sub(1.0f,s->dry)));
}
void cfx_filter_process(CfxFilter *s,CfxHistory *h,const Stereo *in,Stereo *out,Stereo *lp,Stereo *hp,size_t n){
 float gain_step=0;
 if(s->step!=s->target||s->dirty){cfx_filter_calc(s);gain_step=(s->gain_target-s->gain)*0.015625f;}
 float fade=0.0022675737272948027f,blend_step;
 if(s->low_side){if(s->blend<1.0f)blend_step=fade;else{s->blend=1;blend_step=0;}}
 else {if(s->blend<=0){s->blend=0;blend_step=0;}else blend_step=-fade;}
 Stereo coeff[5];
 for(int j=0;j<2;j++){
  for(int k=0;k<5;k++)coeff[k]=(Stereo){s->coefficients[j][k],s->coefficients[j][k]};
  iir_reconstructed(in,j?hp:lp,coeff,h->x[j],h->y[j],n);
 }
 for(size_t i=0;i<n;i++){
  s->gain=s->gain+gain_step;
  if(s->dry_step!=0){s->dry=s->dry+s->dry_step;float remaining=s->dry_target-s->dry;
   if(s->dry_step*remaining<=0){s->dry=s->dry_target;s->dry_step=0;}}
  s->blend=s->blend+blend_step;
  if(s->blend>=1){s->blend=1;blend_step=0;}else if(s->blend<=0){s->blend=0;blend_step=0;}
  out[i]=(Stereo){output(in[i].l,lp[i].l,hp[i].l,s),output(in[i].r,lp[i].r,hp[i].r,s)};
 }
}
