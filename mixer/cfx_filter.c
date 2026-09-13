#include "cfx_filter.h"
#include <stdint.h>
#include <string.h>
static float iir_fz(float x) {
/* Native-compatible flush is mandatory in this module. */
#if 1
    uint32_t u;memcpy(&u,&x,4);
    if ((u&0x7f800000u)==0) {u&=0x80000000u;memcpy(&x,&u,4);}
#endif
    return x;
}
static float iir_mul(float a,float b){return iir_fz(iir_fz(a)*iir_fz(b));}
static float iir_add(float a,float b){return iir_fz(iir_fz(a)+iir_fz(b));}
static float iir_sub(float a,float b){return iir_fz(iir_fz(a)-iir_fz(b));}
/* Build with FP contraction disabled. RX3's first two frames use two separate
 * feedback subtractions; later frames sum feedback products first. Keeping
 * this distinction matters for bit-level agreement and block partitioning. */
static float iir_step(float in, float x1, float x2, float y1, float y2,
                  float b0,float b1,float b2,float a1,float a2,int early) {
    float v = iir_add(iir_mul(b0,in),iir_mul(b1,x1));
    v = iir_add(v,iir_mul(b2,x2));
    if (early) { v = iir_sub(v,iir_mul(a1,y1)); v = iir_sub(v,iir_mul(a2,y2)); }
    else { float feedback = iir_add(iir_mul(a1,y1),iir_mul(a2,y2)); v = iir_sub(v,feedback); }
    return v;
}
void iir_reconstructed(const Stereo *in, Stereo *out, const Stereo *c,
                       Stereo *xh, Stereo *yh, size_t n) {
    for (size_t i=0;i<n;i++) {
        Stereo v = {
            iir_step(in[i].l,xh[1].l,xh[0].l,yh[1].l,yh[0].l,
                 c[0].l,c[1].l,c[2].l,c[3].l,c[4].l,i<2),
            iir_step(in[i].r,xh[1].r,xh[0].r,yh[1].r,yh[0].r,
                 c[0].r,c[1].r,c[2].r,c[3].r,c[4].r,i<2)
        };
        xh[0]=xh[1];xh[1]=in[i];yh[0]=yh[1];yh[1]=v;out[i]=v;
    }
}

#include "cfx_filter.h"
#include <string.h>
static float constant(uint32_t u){float f;memcpy(&f,&u,4);return f;}
void cfx_filter_color(CfxFilter *s,float color){
 s->color=color;s->target=((int32_t)(color*1023.0f))>>2;
}
void cfx_filter_parameter(CfxFilter *s,float parameter){s->parameter=parameter;s->dirty=1;}
static void coefficients(float *c,float f,float q,int high){
 float fq=f*q;
 float ff=f*f;
 float linear=fq*constant(0x39155ff9u);
 float square=ff*constant(0x32ae5ec9u);
 float denominator=linear+square;denominator=denominator+4.0f;
 float inv=1.0f/denominator;
 float minus=square-linear;
 float second=square-4.0f;
 if(high){
  second=second+second;float first=inv*4.0f;minus=minus+4.0f;
  c[0]=first;c[2]=first;c[3]=inv*second;c[1]=first*-2.0f;c[4]=inv*minus;
 }else{
  float first=square*inv;minus=minus+4.0f;
  c[0]=first;c[2]=first;second=second+second;c[3]=inv*second;c[4]=inv*minus;c[1]=first+first;
 }
}
void cfx_filter_calc(CfxFilter *s){
 if(s->step<s->target)s->step+=(s->target-s->step>1?2:1);
 else if(s->step>s->target)s->step-=(s->step-s->target>1?2:1);
 float k=(float)s->step,lp,hp,dry,minq=0;
 if(k<126.0f){
  float t=k*constant(0x3c020821u);float cube=t*t;cube=cube*t;
  lp=100.0f+cube*21000.0f;hp=20.0f;
  dry=k<110.0f?0.0f:(k-110.0f)*0.0625f;
 }else if(k<=130.0f){lp=21100.0f;hp=20.0f;dry=1.0f;}
 else{
  float t=(k-130.0f)*constant(0x3c020821u);float cube=t*t;cube=cube*t;
  hp=20.0f+cube*8200.0f;lp=21100.0f;
  if(hp<249.0f){
   float t2=1.0f-(hp-20.0f)*constant(0x3b8e7835u);
   float cube2=t2*4.0f;cube2=cube2*t2;
   minq=constant(0x3cf5c28fu)+cube2*t2;if(minq>2.0f)minq=2.0f;
  }
  dry=k>146.0f?0.0f:(146.0f-k)*0.0625f;
 }
 float p=s->parameter,q;
 if(p<0.5f){float t=p+p;t=1.0f-t;float shape=1.0f-t*t;q=4.0f-3.5f*shape;}
 else {float t=p-0.5f;t=t+t;q=0.5f-t*0.46875f;}
 if(q<minq)q=minq;
 float qgain;
 if(q<0.5f){q=q+q;qgain=q;}else{qgain=1.0f;q=q+q;}
 float midpoint=k>127.0f?192.0f:64.0f;
 float dist=k<midpoint?midpoint-k:k-midpoint;
 float weight=0.5f+(dist*0.5f)*0.015625f;
 if(k>127.0f){
  coefficients(s->coefficients[1],hp,q,1);s->hpf=hp;
  if(s->lpf!=lp||s->dirty){coefficients(s->coefficients[0],lp,q,0);s->lpf=lp;}
  s->low_side=0;
 }else{
  coefficients(s->coefficients[0],lp,q,0);s->lpf=lp;
  if(s->hpf!=hp||s->dirty){coefficients(s->coefficients[1],hp,q,1);s->hpf=hp;}
  s->low_side=1;
 }
 s->dry_target=dry;s->dirty=0;
 s->gain_target=(1.0f-weight)+weight*qgain;
 s->dry_step=(dry-s->dry)*constant(0x3b149b93u);
}
void cfx_filter_initialize(CfxFilter *s){
 s->lpf=0;s->hpf=0;s->gain=0;s->dry_step=0;
 s->step=s->target=((int32_t)(s->color*1023.0f))>>2;
 cfx_filter_calc(s);s->dry_step=0;s->dirty=1;s->dry=s->dry_target;s->blend=s->low_side?1.0f:0.0f;
}

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
