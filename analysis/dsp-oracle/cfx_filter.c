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
