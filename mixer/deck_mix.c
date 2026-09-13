#include "deck_mix.h"
#include <math.h>
static int unit(float x){return isfinite(x)&&x>=0&&x<=1;}
int lab_mix_valid(const LabMix *s){
 if(!s||s->cue_mask>15||!unit(s->cross_position)||!unit(s->master_gain)||!unit(s->headphones_gain)||!unit(s->cue_master_mix))return 0;
 for(int c=0;c<4;c++)if(!unit(s->channel_gain[c])||s->cross_assign[c]<-1||s->cross_assign[c]>1)return 0;
 return 1;
}
void lab_mix(const LabMix *s,const float *input,float *out,size_t frames){
 float left=cosf(s->cross_position*1.5707963267948966f),right=sinf(s->cross_position*1.5707963267948966f),g[4];
 if(s->cross_position==0)right=0;
 if(s->cross_position==1)left=0;
 for(int c=0;c<4;c++)g[c]=s->channel_gain[c]*(s->cross_assign[c]<0?left:s->cross_assign[c]>0?right:1);
 for(size_t n=0;n<frames;n++)for(int side=0;side<2;side++){
  float master=0,cue=0;
  for(int c=0;c<4;c++){
   float x=input[n*10+c*2+side];master+=x*g[c];
   if(s->cue_mask&(1u<<c))cue+=x;
  }
  master*=s->master_gain;
  out[n*4+side]=master;
  out[n*4+2+side]=s->headphones_gain*((1-s->cue_master_mix)*cue+s->cue_master_mix*master);
 }
}
static void matrix(const LabMix *s,float *m){
 float left=cosf(s->cross_position*1.5707963267948966f),right=sinf(s->cross_position*1.5707963267948966f);
 if(s->cross_position==0)right=0;
 if(s->cross_position==1)left=0;
 for(int c=0;c<4;c++){
  m[c]=s->channel_gain[c]*s->master_gain*(s->cross_assign[c]<0?left:s->cross_assign[c]>0?right:1);
  m[4+c]=s->headphones_gain*((s->cue_mask&(1u<<c)?1-s->cue_master_mix:0)+s->cue_master_mix*m[c]);
 }
}
int lab_mix_ramp_init(LabMixRamp *r,const LabMix *s){
 if(!r||!lab_mix_valid(s))return 0;
 matrix(s,r->current);
 for(int i=0;i<8;i++){r->target[i]=r->current[i];r->step[i]=0;}
 r->remaining=0;return 1;
}
int lab_mix_ramp_target(LabMixRamp *r,const LabMix *s,size_t frames){
 if(!r||!lab_mix_valid(s))return 0;
 matrix(s,r->target);r->remaining=frames;
 for(int i=0;i<8;i++){
  r->step[i]=frames?(r->target[i]-r->current[i])/(float)frames:0;
  if(!frames)r->current[i]=r->target[i];
 }
 return 1;
}
void lab_mix_ramped(LabMixRamp *r,const float *in,float *out,size_t frames){
 for(size_t n=0;n<frames;n++){
  if(r->remaining){
   r->remaining--;
   for(int i=0;i<8;i++)r->current[i]=r->remaining?r->current[i]+r->step[i]:r->target[i];
  }
  for(int side=0;side<2;side++){
   float master=0,phones=0;
   for(int c=0;c<4;c++){
    float x=in[n*10+c*2+side];master+=x*r->current[c];phones+=x*r->current[4+c];
   }
   out[n*4+side]=master;out[n*4+2+side]=phones;
  }
 }
}
