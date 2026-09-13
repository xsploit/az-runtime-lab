#include "deck_mix.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
static void near(float a,float b){assert(fabsf(a-b)<2e-6f);}
int main(void){
 float in[1000]={0},out[400],split[400];
 for(int n=0;n<100;n++){in[n*10]=1;in[n*10+1]=.5f;}
 LabMix s={.channel_gain={0,0,0,0},.cross_position=.5f,.master_gain=1,.headphones_gain=1};
 LabMixRamp a,b;assert(lab_mix_ramp_init(&a,&s));s.channel_gain[0]=1;s.cue_mask=1;
 assert(lab_mix_ramp_target(&a,&s,100));b=a;
 lab_mix_ramped(&a,in,out,100);
 lab_mix_ramped(&b,in,split,17);lab_mix_ramped(&b,in+170,split+68,47);lab_mix_ramped(&b,in+640,split+256,36);
 assert(!memcmp(out,split,sizeof out));assert(!a.remaining);
 for(int n=0;n<100;n++){near(out[n*4],(n+1)/100.f);near(out[n*4+2],out[n*4]);near(out[n*4+1],out[n*4]*.5f);}
 /* Retarget halfway through a fade without jumping to its old target. */
 s.channel_gain[0]=0;s.cue_mask=0;assert(lab_mix_ramp_target(&a,&s,100));lab_mix_ramped(&a,in,out,50);near(out[196],.5f);
 s.channel_gain[0]=1;assert(lab_mix_ramp_target(&a,&s,50));lab_mix_ramped(&a,in,out,50);near(out[0],.51f);near(out[196],1);
 LabMixRamp saved=a;s.master_gain=NAN;assert(!lab_mix_ramp_target(&a,&s,100));assert(!memcmp(&saved,&a,sizeof a));
 s.master_gain=0;assert(lab_mix_ramp_target(&a,&s,0));lab_mix_ramped(&a,in,out,1);near(out[0],0);
 /* Settled matrix agrees with the original routing across mixed controls. */
 for(int k=0;k<64;k++){
  s.master_gain=(k%5)/4.f;s.headphones_gain=(k%7)/6.f;s.cue_master_mix=(k%9)/8.f;s.cross_position=(k%11)/10.f;s.cue_mask=k%16;
  for(int c=0;c<4;c++){s.channel_gain[c]=((k+c)%5)/4.f;s.cross_assign[c]=(k+c)%3-1;}
  float distinct[10]={.1f,.2f,.3f,.4f,.5f,.6f,.7f,.8f,90,100},expected[4];
  assert(lab_mix_ramp_init(&a,&s));lab_mix(&s,distinct,expected,1);lab_mix_ramped(&a,distinct,out,1);
  for(int c=0;c<4;c++)near(out[c],expected[c]);
 }
 puts("PASS: sample ramp, stereo lockstep, cue ramp, block-size invariance, mid-ramp retarget, invalid snapshot preservation, immediate update");
}
