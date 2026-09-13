#include "noise.h"
#include <math.h>
#include <string.h>
static float b(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000)){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static float add(float a,float c){return fz(fz(a)+fz(c));}static float mul(float a,float c){return fz(fz(a)*fz(c));}
static void clear(NoiseFilter *f){memset(f->x,0,sizeof f->x);memset(f->y,0,sizeof f->y);f->clears++;}
void noise_color(Noise *s){s->target=((int)(s->color*1023.0f))>>2;}
void noise_coeff(int index,float *v){unsigned i=(unsigned)index&255;float freq=powf(b(0x3f856ac0),(float)(i>127?i-128:i))*75.0f;float resonance=1,lower=-1.5f,upper=-2.5f,scale=2;
 if(i>(i>127?244u:116u)){float p=powf(b(0x3f705dc7),(float)(i-(i>127?244:116)));p=p+p;scale=p;resonance=1.0f/p;resonance=resonance+resonance;lower=.5f-p;upper=-.5f-p;}
 float f=(freq*upper)/lower;freq=f-freq;float omega=(freq*scale)*b(0x40c90fdb),linear=(omega*resonance)*b(0x37be37c6),square=(omega*omega)*b(0x300d56d6),inv=1.0f/((square+linear)+4);
 v[0]=linear*inv;v[1]=0;v[2]=-v[0];v[3]=((square-4)+(square-4))*inv;v[4]=((square-linear)+4)*inv;
}
void noise_calc(Noise *s,NoiseFilter *filter){int old=s->current<=127;int step=s->target-s->current;if(step>3)step=3;if(step< -3)step=-3;s->current+=step;int side=s->current<=127;float x=(float)s->current,spread=0,mix=1,gain=0;int coef=s->current;
 if(x<=123){spread=x*b(0x3b853400);spread=1-(spread+spread);mix=spread<.25f?1-spread*4:0;float fall=1;if(x>40){float y=1-(x-40)*b(0x3ab78034);fall=y*y;for(unsigned i=0;i<6;i++)fall=fall*y;}gain=((124-x)*b(0x3c37d4dd))*fall;}
 else if(x<=132){coef=131;}
 else{spread=(x-132)*b(0x3b853400);spread=spread+spread;mix=spread<.25f?1-spread*4:0;float fall=1;if(x>180){float y=1-(x-180)*b(0x3b83126f);fall=y*y;for(unsigned i=0;i<6;i++)fall=fall*y;}
  if(x>131&&x<157){float y=(157-x)*b(0x3b83126f);gain=b(0x3f4ccccd)-(y*80)*y;}
  else if(x<182){uint64_t bits0=UINT64_C(0x3fe12bf5265d36e8),bits1=UINT64_C(0x3f8593908329f26b);double z,w;memcpy(&z,&bits0,8);memcpy(&w,&bits1,8);gain=(float)(z+(double)(182-x)*w);}
  else gain=((x-131)*b(0x3c37d4dd))*fall;
 }
 s->noise_gain=gain;float v[5];noise_coeff(coef,v);for(unsigned i=0;i<5;i++)filter->coeff[i]=(Stereo){v[i],v[i]};if(side!=old)clear(filter);
 s->mix_target=mix;float target=b(0x3f333333);if(gain==0){float y=spread*spread;y=y*y;y=y*y;y=y*y;target+=y*b(0x3dcccccd);}s->res_target=target;s->res_step=(s->inv_block+s->inv_block)*(target-s->res);s->mix_step=(mix-s->mix)*(s->inv_block+s->inv_block);
}
void noise_init(Noise *s,NoiseFilter *f){s->feedback=(Stereo){0,0};s->level=0;noise_color(s);s->current=s->target;noise_calc(s,f);s->mix=s->mix_target;s->res=s->res_target;s->mix_step=s->res_step=0;clear(f);}
static void chase(float *step,float target,float *current){if(*step!=0){*current+=*step;if((target-*current)* *step<=0){*current=target;*step=0;}}}
void noise_execute(Noise *s,NoiseFilter *f,const Stereo *input,Stereo *out,unsigned n){Stereo generated[64];for(unsigned i=0;i<n;i++)for(unsigned k=0;k<2;k++){float v=(float)(int32_t)s->seed[1]*b(0x30000000);s->seed[0]^=s->seed[1];s->seed[1]+=s->seed[0];if(k)generated[i].r=v;else generated[i].l=v;}
 float p=s->parameter,target=p*(p*4);if(p>=.5f){float d=p-.5f;float y=d*32;y=d*y;y=d*y;target=y+(p+p)*target;}target*=b(0x3e19999a);float step=(target-s->level)*(s->inv_block+s->inv_block);if(step<b(0x34000000)&&step>b(0xb4000000))step=0;s->level=target-((float)n*step)*.5f;
 unsigned half=n/2;
 for(unsigned segment=0;segment<2;segment++){
  if(s->current!=s->target)noise_calc(s,f);
  for(unsigned j=0;j<half;j++){unsigned i=segment*half+j;chase(&s->res_step,s->res_target,&s->res);s->feedback_gain=(Stereo){s->res,s->res};Stereo in={add(generated[i].l,mul(s->feedback.l,s->res)),add(generated[i].r,mul(s->feedback.r,s->res))},filtered;
   iir_reconstructed(&in,&filtered,f->coeff,f->x,f->y,1);s->feedback=filtered;chase(&s->mix_step,s->mix_target,&s->mix);
   float gain=(1-s->mix*s->mix)*s->noise_gain;if(!segment)s->level+=step;
   out[i].l=add(input[i].l,mul(mul(filtered.l,s->level),gain));out[i].r=add(input[i].r,mul(mul(filtered.r,s->level),gain));
  }
 }
}
