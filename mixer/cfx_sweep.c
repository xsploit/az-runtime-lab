#include "cfx_sweep.h"
#include <string.h>
float sweep_float(const Sweep *s,unsigned o){float f;memcpy(&f,&s->word[o/4],4);return f;}
void sweep_put_float(Sweep *s,unsigned o,float f){memcpy(&s->word[o/4],&f,4);}
static float bits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static double dbits(uint64_t u){double d;memcpy(&d,&u,8);return d;}
void sweep_gate_parameters(Sweep *s,float step){
 float parameter=sweep_float(s,32);
 float scale=bits(0x3e8f5c29)+parameter*bits(0x3fb851ec);
 float release=parameter>=.5f?1+(parameter-.5f)*3:scale;
 s->word[176/4]=s->word[180/4]=0x3f7ff427;
 s->word[184/4]=0x3aae427b;s->word[188/4]=0x3f800000;
 s->word[168/4]=s->word[172/4]=0x3f800000;
 unsigned char *b=(void*)s;
 if(step>107){
  b[261]=0;s->word[160/4]=0x3e75c28f;s->word[164/4]=0x3ea8f5c3;
  s->word[192/4]=s->word[196/4]=0x3f7ffa13;return;
 }
 b[261]=1;
 float pos=step*bits(0x3c191f1a);
 float inverse_square=1-pos*pos;
 float left=(1-pos)*(1-pos);
 double right=(double)inverse_square*dbits(UINT64_C(0x3fcdc28f5c28f5c3));
 right=dbits(UINT64_C(0x3fd51eb860000000))+right*(double)scale;
 sweep_put_float(s,160,bits(0x3e75c28f)+(inverse_square*bits(0x3eb851ec))*scale);
 sweep_put_float(s,164,(float)right);
 sweep_put_float(s,192,bits(0x3f7ffa13)-(left*bits(0x3ac18174))*release);
 sweep_put_float(s,196,bits(0x3f7ffa13)-(left*bits(0x39bb3836))*release);
}
void sweep_prepare_gain(Sweep *s,float difference,unsigned side,int frames){
 float step;float count;
 if(difference<.015625f&&difference>-.015625f){step=difference*sweep_float(s,112);count=(float)frames;}
 else{step=difference*.0078125f;count=128;}
 sweep_put_float(s,148+4*side,step);
 sweep_put_float(s,140+4*side,sweep_float(s,132+4*side)-step*count);
 s->word[156/4]=(uint32_t)frames;
}

static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000)){u&=0x80000000;memcpy(&x,&u,4);}return x;}
void sweep_gate_process(Sweep *s,Stereo bands[2][64],const float levels[2][64],int n){
 for(unsigned side=0;side<2;side++){
  unsigned o=4*side;
  float target=sweep_float(s,132+o),current=sweep_float(s,140+o);
  float difference=target-current;
  if(difference<0x1p-16f&&difference>-0x1p-16f){
   s->word[156/4]=0;sweep_put_float(s,148+o,0);sweep_put_float(s,140+o,target);
  }else if(s->word[156/4])s->word[156/4]+=(unsigned)n;
  else sweep_prepare_gain(s,difference,side,n);
  float peak=sweep_float(s,116+o),gain=sweep_float(s,124+o);
  for(int i=0;i<n;i++){
   current=sweep_float(s,140+o)+sweep_float(s,148+o);sweep_put_float(s,140+o,current);
   float threshold=current*sweep_float(s,160+o),level=levels[side][i];
   if(peak<level)peak=peak+(level-peak)*sweep_float(s,168+o);
   else peak=peak*sweep_float(s,176+o);
   if(peak>threshold){float attack=sweep_float(s,184+o);gain=(attack+gain)-gain*attack;}
   else gain=gain*sweep_float(s,192+o);
   bands[side][i].l=fz(fz(bands[side][i].l)*fz(gain));
   bands[side][i].r=fz(fz(bands[side][i].r)*fz(gain));
  }
  if(peak<0x1p-23f)peak=0;
  if(gain<0x1p-23f)gain=0;
  sweep_put_float(s,116+o,peak);sweep_put_float(s,124+o,gain);
 }
}
static void coeff_pair(SweepCoefficients *c,unsigned high,float frequency,float resonance){
 float square=(frequency*frequency)*bits(0x32ae5ec9);
 for(unsigned stage=0;stage<2;stage++){
  float damping=stage==0?(frequency*(resonance+resonance))*bits(0x39155ff9):(frequency*bits(0x400f9e4d))*bits(0x39155ff9);
  float inv=1/((damping+square)+4);
  float *out=c->coeff[high*2+stage];
  float first=high?inv*4:square*inv;
  out[0]=out[2]=first;out[1]=high?first*-2:first+first;
  float double_diff=(square-4)+(square-4);
  out[3]=inv*double_diff;out[4]=inv*((square-damping)+4);
  c->updates[high*2+stage]++;
 }
}
void sweep_parameters(Sweep *s,SweepCoefficients *c,float step){
 unsigned char *b=(void*)s;
 if(step<=130){
  b[261]=0;
  if(sweep_float(s,224)!=20000){for(unsigned i=0;i<2;i++){memcpy(c->coeff[i],c->endpoint[0],20);c->updates[i]++;}sweep_put_float(s,224,20000);}
  if(sweep_float(s,228)!=20){for(unsigned i=2;i<4;i++){memcpy(c->coeff[i],c->endpoint[1],20);c->updates[i]++;}sweep_put_float(s,228,20);}
  s->word[264/4]=0;return;
 }
 float parameter=sweep_float(s,32),distance=step-130;
 float spread=1-distance*bits(0x3c031203);
 float octave,base;
 if(parameter<.5f){octave=parameter*bits(0x40549a78);octave=octave+octave;base=200;}
 else{octave=(parameter-.5f)*4;base=2000;}
 int power=(int)octave;float fraction=octave-(float)power;
 if(power>0)base=base*(float)(1u<<power);
 float width=bits(0x3fb33333)+(spread*16)*spread;
 float centre=((1+fraction*bits(0x3f282799))+(fraction*fraction)*bits(0x3eafb0ce))*base;
 float low=centre*width,high=centre*(1/width);
 float resonance=bits(0x3f353bef);
 if(step<162){
  float mix=distance*.03125f;
  low=(1-mix)*20000+mix*low;high=(1-mix)*20+mix*high;
  resonance=resonance+((162-step)*bits(0x3e99999a))*.03125f;
 }
 if(s->word[264/4]==1){
  if(sweep_float(s,228)!=high){coeff_pair(c,1,high,resonance);sweep_put_float(s,228,high);s->word[264/4]=sweep_float(s,224)!=low?2:0;}
  else if(sweep_float(s,224)!=low){coeff_pair(c,0,low,resonance);sweep_put_float(s,224,low);s->word[264/4]=0;}
  else s->word[264/4]=0;
 }else{
  if(sweep_float(s,224)!=low){coeff_pair(c,0,low,resonance);sweep_put_float(s,224,low);s->word[264/4]=1;}
  else if(sweep_float(s,228)!=high){coeff_pair(c,1,high,resonance);sweep_put_float(s,228,high);s->word[264/4]=0;}
  else s->word[264/4]=0;
 }
 b[261]=1;
}
void sweep_detect_envelopes(Sweep *s,const Stereo bands[][64],float levels[][64],float memory[][60],int n){
 for(unsigned side=0;side<2;side++)for(int i=0;i<n;i++){
  float l=bands[side][i].l,r=bands[side][i].r;if(l<0)l=-l;if(r<0)r=-r;levels[side][i]=l<r?r:l;
 }
 /* Native extrema intentionally accumulate across both bands, not reset per band. */
 float minimum=0,maximum=0;
 for(unsigned side=0;side<2;side++){
  unsigned o=side*4;
  for(int i=0;i<n;i++)for(unsigned channel=0;channel<2;channel++){
   float v=channel?bands[side][i].r:bands[side][i].l;
   if(v>maximum)maximum=v;else if(v<minimum)minimum=v;
  }
  if(maximum+minimum<0)maximum=-minimum;
  if(sweep_float(s,208+o)<maximum)sweep_put_float(s,208+o,maximum);
  s->word[(236+o)/4]+=(unsigned)n;
  if((int32_t)s->word[(236+o)/4]<=1471)continue;
  s->word[(236+o)/4]=0;
  float long_peak=0,short_peak=0;
  for(int i=59;i>=24;i--){memory[side][i]=memory[side][i-1];if(long_peak<memory[side][i-1])long_peak=memory[side][i-1];}
  for(int i=23;i>=1;i--){memory[side][i]=memory[side][i-1];if(short_peak<memory[side][i-1])short_peak=memory[side][i-1];}
  memory[side][0]=sweep_float(s,208+o);
  if(memory[side][0]>short_peak)short_peak=memory[side][0];
  if(long_peak<short_peak)long_peak=short_peak;
  sweep_put_float(s,216+o,long_peak);sweep_put_float(s,200+o,short_peak);
  float target=sweep_float(s,132+o);
  if(target<short_peak){sweep_put_float(s,132+o,short_peak);s->word[(244+o)/4]=0;sweep_put_float(s,200+o,0);}
  else if(target*.75f<=short_peak)s->word[(244+o)/4]=0;
  else if((int32_t)s->word[(244+o)/4]>59){sweep_put_float(s,132+o,long_peak);s->word[(244+o)/4]=0;sweep_put_float(s,200+o,0);}
  else s->word[(244+o)/4]++;
  sweep_put_float(s,208+o,0);
 }
}
void sweep_filter_set(SweepFilter *f,const float *c){for(unsigned i=0;i<5;i++)f->coeff[i]=(Stereo){c[i],c[i]};f->updates++;}
static void filter_clear(SweepFilter *f){memset(f->x,0,sizeof f->x);memset(f->y,0,sizeof f->y);f->clears++;}
static void filter_process(SweepFilter *f,const Stereo *in,Stereo *out,int n){iir_reconstructed(in,out,f->coeff,f->x,f->y,(unsigned)n);}
static void sync_coefficients(SweepRuntime *r){for(unsigned i=0;i<4;i++)if(r->filter[5+i].updates!=r->coefficients.updates[i]){sweep_filter_set(&r->filter[5+i],r->coefficients.coeff[i]);r->filter[5+i].updates=r->coefficients.updates[i];}}
static void update(SweepRuntime *r,float step){if(step<=127)sweep_gate_parameters(&r->state,step);else{sweep_parameters(&r->state,&r->coefficients,step);sync_coefficients(r);}((unsigned char*)&r->state)[260]=0;}
void sweep_runtime_init(SweepRuntime *r){
 Sweep *s=&r->state;
 filter_clear(&r->filter[4]);
 for(unsigned i=0;i<4;i++){
  memcpy(r->coefficients.coeff[i],r->coefficients.endpoint[i/2],20);r->coefficients.updates[i]++;
  sweep_filter_set(&r->filter[5+i],r->coefficients.coeff[i]);filter_clear(&r->filter[5+i]);
 }
 sweep_put_float(s,224,20000);sweep_put_float(s,228,20);sweep_put_float(s,232,0);
 int step=(int)(sweep_float(s,28)*1023)>>2;s->word[63]=s->word[64]=(uint32_t)step;
 sweep_put_float(s,108,1);update(r,(float)step);
 if(((unsigned char*)s)[261]&&step>126)sweep_put_float(s,108,0);
}
void sweep_runtime_detect(SweepRuntime *r,const Stereo *in,int n){
 for(unsigned side=0;side<2;side++){
  filter_process(&r->filter[side*2],in,r->temporary[side],n);
  filter_process(&r->filter[side*2+1],r->temporary[side],r->bands[side],n);
 }
 sweep_detect_envelopes(&r->state,r->bands,r->levels,r->memory,n);
}
static void sweep_process(SweepRuntime *r,const Stereo *in,int n){
 Stereo temporary[64];Sweep *s=&r->state;
 for(int i=0;i<n;i++){
  float mix=sweep_float(s,232)+.0078125f,weight;
  sweep_put_float(s,232,mix);
  if(mix>1){sweep_put_float(s,232,1);weight=1;}else weight=(mix*mix)*(3-(mix+mix));
  r->output[i]=(Stereo){fz(fz(weight)*fz(in[i].l)),fz(fz(weight)*fz(in[i].r))};
 }
 filter_process(&r->filter[5],r->output,temporary,n);
 filter_process(&r->filter[6],temporary,r->output,n);
 filter_process(&r->filter[7],r->output,temporary,n);
 filter_process(&r->filter[8],temporary,r->output,n);
}
void sweep_runtime_execute(SweepRuntime *r,const Stereo *in,Stereo *out,int n){
 Sweep *s=&r->state;int old=(int32_t)s->word[63],target=(int32_t)s->word[64];
 if(old!=target){s->word[63]=(unsigned)(old+(old<target?1:-1));update(r,(float)(int32_t)s->word[63]);}
 else if(((unsigned char*)s)[260])update(r,(float)old);
 else if(s->word[66]){sweep_parameters(s,&r->coefficients,(float)old);sync_coefficients(r);}
 unsigned gate=old<127;
 if(gate)sweep_gate_process(s,r->bands,r->levels,n);else sweep_process(r,in,n);
 for(int i=0;i<n;i++){
  Stereo processed;
  if(gate){Stereo one;filter_process(&r->filter[4],&r->bands[0][i],&one,1);processed=(Stereo){fz(fz(one.l)+fz(r->bands[1][i].l)),fz(fz(one.r)+fz(r->bands[1][i].r))};}
  else processed=r->output[i];
  float mix=sweep_float(s,108);
  if(((unsigned char*)s)[261]){mix-=.00390625f;sweep_put_float(s,108,mix);if(mix<0){mix=0;sweep_put_float(s,108,0);if(gate)sweep_put_float(s,232,0);}}
  else{mix+=.00390625f;sweep_put_float(s,108,mix);if(mix>1){mix=1;sweep_put_float(s,108,1);if(gate)sweep_put_float(s,232,0);}}
  float weight=(3-(mix+mix))*(mix*mix),wet=fz(1-fz(weight));
  out[i]=(Stereo){fz(fz(fz(in[i].l)*fz(weight))+fz(fz(processed.l)*wet)),fz(fz(fz(in[i].r)*fz(weight))+fz(fz(processed.r)*wet))};
 }
}

void sweep_runtime_construct(SweepRuntime *r){
 memset(r,0,sizeof *r);
 /* RX3 fixed LPF/HPF endpoint and detector coefficients, 0x42d2f0..0x42d34c. */
 static const uint32_t coefficient_bits[4][5]={
  {0x3ee94f84,0x3f694f84,0x3ee94f84,0x3eecc05d,0x3eb87db4},
  {0x3f7fa2a1,0xbfffa2a1,0x3f7fa2a1,0xbfffa27f,0x3f7f4585},
  {0x39d09a83,0x3a509a83,0x39d09a83,0xbff8ad64,0x3f71c315},
  {0x3f78c777,0xbff8c777,0x3f78c777,0xbff8ad64,0x3f71c315},
 };
 float coefficients[4][5];memcpy(coefficients,coefficient_bits,sizeof coefficients);
 memcpy(r->coefficients.endpoint,coefficients,40);
 Sweep *s=&r->state;s->word[1]=s->word[2]=44100;s->word[4]=s->word[5]=64;sweep_put_float(s,12,1.0f/44100);sweep_put_float(s,28,.5f);sweep_put_float(s,32,.5f);sweep_put_float(s,112,1.0f/64);
 for(unsigned i=0;i<5;i++){sweep_filter_set(&r->filter[i],coefficients[i<2||i==4?2:3]);r->filter[i].clears=i==4?0:1;}
 sweep_runtime_init(r);
}
