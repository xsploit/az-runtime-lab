#include "equalizer.h"
#include <string.h>
void equalizer_setup(Equalizer*s){memset(s,0,sizeof*s);for(unsigned i=0;i<3;i++){s->index[i].magnitude=1;s->index[i].timing=14;s->index[i].done=1;s->cached[i]=127;}}
void equalizer_reset(Equalizer*s){for(unsigned i=0;i<3;i++){memset(s->filter[i].x,0,16);memset(s->filter[i].y,0,16);}}
static void step(EqIndexRamp*r){if(r->done)return;if(r->target==r->current){r->count=0;r->done=1;return;}if(r->count%r->timing==0)r->current+=r->step;r->count++;}
static void segment(Equalizer*s,const float tables[3][256][5],const Stereo*in,Stereo*out,unsigned offset,unsigned n){
 for(unsigned i=0;i<3;i++)for(unsigned j=0;j<5;j++)s->filter[i].coefficients[j]=(Stereo){tables[i][s->cached[i]][j],tables[i][s->cached[i]][j]};
 for(unsigned i=0;i<3;i++){EqIir*f=&s->filter[i];iir_reconstructed(i?s->scratch[i-1]+offset:in+offset,i==2?out+offset:s->scratch[i]+offset,f->coefficients,f->x,f->y,n);}
}
void equalizer_execute(Equalizer*s,const float tables[3][256][5],const Stereo*in,Stereo*out,unsigned n){
 unsigned offset=0,pending=0;
 for(unsigned i=0;i+1<n;i++){
  int16_t current[3];for(unsigned j=0;j<3;j++)current[j]=(int16_t)s->index[j].current;
  if(memcmp(current,s->cached,6)){segment(s,tables,in,out,offset,pending);offset+=pending;pending=1;}else pending++;
  for(unsigned j=0;j<3;j++){step(&s->index[j]);s->cached[j]=current[j];}
 }
 int16_t current[3];for(unsigned j=0;j<3;j++)current[j]=(int16_t)s->index[j].current;
 segment(s,tables,in,out,offset,pending+1);
 for(unsigned j=0;j<3;j++){step(&s->index[j]);s->cached[j]=current[j];}
}
