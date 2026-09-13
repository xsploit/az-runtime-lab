#include "isolator.h"
#include <string.h>
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000u)){u&=0x80000000u;memcpy(&x,&u,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
void isolator_reset(Isolator*s){for(unsigned i=0;i<8;i++){memset(s->filter[i].x,0,sizeof s->filter[i].x);memset(s->filter[i].y,0,sizeof s->filter[i].y);}}
void isolator_setup(Isolator*s,const float coeff[4][5],unsigned rate){
 memset(s,0,sizeof*s);for(unsigned i=0;i<8;i++)for(unsigned j=0;j<5;j++)s->filter[i].coefficients[j]=(Stereo){coeff[i/2][j],coeff[i/2][j]};
 for(unsigned i=0;i<3;i++){EqGainRamp*g=&s->gain[i];uint32_t bits=0x3eb5a965;float initial;memcpy(&initial,&bits,4);g->target[0]=g->target[1]=g->current[0]=g->current[1]=initial;g->length=(unsigned)((float)rate*3.3f/1000.f);if(!g->length)g->length=1;g->inverse=1.f/(float)g->length;g->done=1;}
}
static void process(EqIir*f,const Stereo*in,Stereo*out,unsigned n){iir_reconstructed(in,out,f->coefficients,f->x,f->y,n);}
void isolator_execute(Isolator*s,const Stereo*in,Stereo*out,unsigned n){
 process(&s->filter[0],in,s->scratch[0],n);process(&s->filter[1],s->scratch[0],s->scratch[2],n);
 process(&s->filter[2],in,s->scratch[0],n);process(&s->filter[3],s->scratch[0],s->scratch[1],n);
 process(&s->filter[4],s->scratch[1],s->scratch[0],n);process(&s->filter[5],s->scratch[0],s->scratch[3],n);
 process(&s->filter[6],in,s->scratch[0],n);process(&s->filter[7],s->scratch[0],s->scratch[4],n);
 for(unsigned i=0;i<n;i++){
  out[i].l=add(add(mul(s->scratch[2][i].l,s->gain[0].current[0]),mul(s->scratch[3][i].l,s->gain[1].current[0])),mul(s->scratch[4][i].l,s->gain[2].current[0]));
  out[i].r=add(add(mul(s->scratch[2][i].r,s->gain[0].current[1]),mul(s->scratch[3][i].r,s->gain[1].current[1])),mul(s->scratch[4][i].r,s->gain[2].current[1]));
  for(unsigned j=0;j<3;j++){EqGainRamp*g=&s->gain[j];if(!g->done){for(unsigned k=0;k<2;k++)g->current[k]=add(g->current[k],g->step[k]);if(g->count>=g->length){memcpy(g->current,g->target,8);g->done=1;}g->count++;}}
 }
}
