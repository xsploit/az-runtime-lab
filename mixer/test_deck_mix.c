#include "deck_mix.h"
#include <assert.h>
#include <math.h>
#include <stdio.h>
static void near(float a,float b){assert(fabsf(a-b)<1e-6f);}
int main(void){
 LabMix s={.channel_gain={1,1,1,1},.cross_position=.5f,.master_gain=1,.headphones_gain=1};
 float input[10]={.1f,.2f,.3f,.4f,.5f,.6f,.7f,.8f,1000,2000},out[4];
 assert(lab_mix_valid(&s));lab_mix(&s,input,out,1);near(out[0],1.6f);near(out[1],2);near(out[2],0);
 /* Distinct single-channel signals verify every input pair and stereo side. */
 for(int c=0;c<4;c++){
  for(int j=0;j<4;j++)s.channel_gain[j]=j==c;
  s.cue_mask=1u<<((c+1)%4);lab_mix(&s,input,out,1);
  near(out[0],input[c*2]);near(out[1],input[c*2+1]);near(out[2],input[((c+1)%4)*2]);near(out[3],input[((c+1)%4)*2+1]);
 }
 /* Cue still hears deck1 with its fader closed; deck4 feeds master only. */
 s.cue_mask=1;s.channel_gain[3]=.5f;s.master_gain=.5f;s.headphones_gain=.25f;
 lab_mix(&s,input,out,1);near(out[0],.175f);near(out[2],.025f);
 s.cue_master_mix=1;lab_mix(&s,input,out,1);near(out[2],.04375f);
 s.cue_master_mix=0;s.cross_assign[3]=-1;s.cross_position=1;lab_mix(&s,input,out,1);near(out[0],0);near(out[2],.025f);
 s.cross_assign[3]=1;s.cross_position=0;lab_mix(&s,input,out,1);near(out[0],0);
 s.cross_position=.5f;lab_mix(&s,input,out,1);near(out[0],.175f*sqrtf(.5f));
 s.master_gain=NAN;assert(!lab_mix_valid(&s));
 puts("PASS: four stereo pairs, aux exclusion, unclipped sum, pre-fader cue, gains, cue/master blend, crossfader endpoints/center");
}
