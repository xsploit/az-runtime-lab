#include "cfx_dubecho.h"
#include <string.h>
float dub_float(const DubEcho*s,unsigned o){float f;memcpy(&f,&s->word[o/4],4);return f;}
void dub_put_float(DubEcho*s,unsigned o,float f){memcpy(&s->word[o/4],&f,4);}
static float fbits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
void dub_color(DubEcho*s){s->word[43]=(unsigned)((int)(dub_float(s,28)*1023)>>2);}
int dub_on(DubEcho*s){if(s->word[9]==3)s->word[9]=2;return 1;}
int dub_off(DubEcho*s){if(s->word[9]==2){s->word[9]=3;return 1;}s->word[9]=0;return 0;}
static float base_feedback(DubEcho*s){
 float p=dub_float(s,32),left,right,boost=1;
 if(p<fbits(0x3ee8e8e9)){float scale=p*fbits(0x400cb08d);left=scale*fbits(0x3f5eb852);right=scale*fbits(0x3f6147ae);}
 else if(p<fbits(0x3f0c8c8d)){left=fbits(0x3f5eb852);right=fbits(0x3f6147ae);}
 else{float v=(p-fbits(0x3f0b8b8c))*fbits(0x400cb08d);left=fbits(0x3f5eb852)+v*fbits(0x3df5c290);right=fbits(0x3f6147ae)+v*fbits(0x3de147b0);boost=(1-p)*fbits(0x400cb08d);}
 dub_put_float(s,132,left);dub_put_float(s,144,right);return boost;
}
void dub_feedback(DubEcho*s){
 float boost=base_feedback(s),step=(float)(int32_t)s->word[42],left=dub_float(s,132),right=dub_float(s,144);
 if(step>115&&step<=139){float v=fbits(0x3f7ae148)+boost*fbits(0x3ca3d70a);dub_put_float(s,132,v*left);dub_put_float(s,144,right*v);}
 else if(step<=115){float v=step*fbits(0x3b8d3dcb);v=1-(v+v);if(v>fbits(0x3e4ccccd)){v=(v-fbits(0x3e4ccccd))*fbits(0x3dcccccd);dub_put_float(s,132,left+v*boost);}}
 else if(step>139){float scale=fbits(0x3f7ae148)+boost*fbits(0x3ca3d70a);dub_put_float(s,132,scale*left);float v=(step-140)*fbits(0x3b8d3dcb);v=v+v;if(v>fbits(0x3e4ccccd)){v=(v-fbits(0x3e4ccccd))*fbits(0x3dcccccd);dub_put_float(s,144,right+v*boost);}}
}
void dub_parameter(DubEcho*s){unsigned char*b=(void*)s;if(b[161]||b[162])dub_feedback(s);else b[160]=1;}
void dub_calculate(DubEcho*s){unsigned char*b=(void*)s;if(b[161]||b[162])b[160]=1;else dub_calculate_inner(s);}
void dub_calculate_inner(DubEcho*s){
 int current=(int32_t)s->word[42],difference=(int32_t)s->word[43]-current;
 if(difference>0&&current<=115&&difference>=2)difference=2;
 if(difference<0&&current>139&&difference<-2)difference=-2;
 current+=difference;s->word[42]=(unsigned)current;unsigned char*b=(void*)s;b[160]=0;
 float boost=base_feedback(s),step=(float)current;
 float minimum=fbits(0x45179800),scale=fbits(0x3f7ae148)+boost*fbits(0x3ca3d70a);
 if(step>115&&step<=139){dub_put_float(s,116,0);dub_put_float(s,124,0);dub_put_float(s,92,minimum);dub_put_float(s,100,minimum);dub_put_float(s,132,dub_float(s,132)*scale);dub_put_float(s,144,dub_float(s,144)*scale);}
 else if(step<=115){
  float v=step*fbits(0x3b8d3dcb);v=1-(v+v);float input=v*fbits(0x40555555);
  dub_put_float(s,100,minimum);dub_put_float(s,124,0);dub_put_float(s,144,dub_float(s,144)*scale);dub_put_float(s,116,input<=1?input:1);
  if(v<=fbits(0x3e4ccccd))dub_put_float(s,92,minimum);
  else{v-=fbits(0x3e4ccccd);float delay=v*fbits(0x45b8ab33),feedback=v*fbits(0x3dcccccd);dub_put_float(s,132,dub_float(s,132)+boost*feedback);dub_put_float(s,92,minimum+delay*1.25f);}
 }else if(step>139){
  float v=(step-139)*fbits(0x3b8d3dcb);v=v+v;float input=v*fbits(0x40555555);
  dub_put_float(s,92,minimum);dub_put_float(s,116,0);dub_put_float(s,132,dub_float(s,132)*scale);dub_put_float(s,124,input>1?1:input);
  if(v<=fbits(0x3e4ccccd))dub_put_float(s,100,minimum);
  else{v-=fbits(0x3e4ccccd);float delay=v*fbits(0x4582ec00),feedback=v*fbits(0x3dcccccd);dub_put_float(s,144,dub_float(s,144)+boost*feedback);dub_put_float(s,100,minimum+delay*1.25f);}
 }
 if(dub_float(s,92)!=dub_float(s,88)){b[161]=1;dub_put_float(s,152,0);}
 if(dub_float(s,100)!=dub_float(s,96)){b[162]=1;dub_put_float(s,156,0);}
}

#include "cfx_dubecho.h"
#include <string.h>
#include <assert.h>
static float bits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static float fz(float x){uint32_t u;memcpy(&u,&x,4);if(!(u&0x7f800000)){u&=0x80000000;memcpy(&x,&u,4);}return x;}
static Stereo mul(Stereo a,float b){return (Stereo){fz(fz(a.l)*fz(b)),fz(fz(a.r)*fz(b))};}
static Stereo add(Stereo a,Stereo b){return (Stereo){fz(fz(a.l)+fz(b.l)),fz(fz(a.r)+fz(b.r))};}
static void process(DubFilter*f,const Stereo*in,Stereo*out,int n){iir_reconstructed(in,out,f->coeff,f->x,f->y,(unsigned)n);}
void dub_runtime_construct(DubRuntime*r,const float c[4][5]){
 memset(r,0,sizeof *r);DubEcho*s=&r->state;s->word[1]=s->word[2]=44100;dub_put_float(s,12,1.0f/44100);s->word[6]=2;dub_put_float(s,28,.5f);dub_put_float(s,32,.5f);
 for(unsigned i=0;i<4;i++)for(unsigned j=0;j<5;j++)r->filter[i].coeff[j]=(Stereo){c[i][j],c[i][j]};
 s->word[22]=0x46023f9a;s->word[24]=0x45cec000;r->length[0]=8448;r->length[1]=((unsigned)(int)dub_float(s,96)+128)&~63u;
}
void dub_runtime_init(DubRuntime*r){
 DubEcho*s=&r->state;s->word[9]=0;for(unsigned i=0;i<4;i++){memset(r->filter[i].x,0,32);r->filter[i].clears++;}
 dub_color(s);s->word[42]=s->word[43];unsigned char*b=(void*)s;b[161]=b[162]=0;
 const unsigned offsets[]={104,108,112,120,128,140,152,156,164};for(unsigned i=0;i<sizeof offsets/sizeof *offsets;i++)s->word[offsets[i]/4]=0;
 dub_calculate_inner(s);s->word[22]=s->word[23];s->word[24]=s->word[25];b[161]=b[162]=0;
}
static Stereo read_delay(DubRuntime*r,unsigned side,int delay,int i){int pos=(int)r->write[side]-delay+i;while(pos<0)pos+=(int)r->length[side];while(pos>=(int)r->length[side])pos-=(int)r->length[side];return r->ring[side][pos];}
void dub_runtime_execute(DubRuntime*r,const Stereo*in,Stereo*out,int n){
 assert(n==64);DubEcho*s=&r->state;unsigned char*b=(void*)s;Stereo temp[66]={0};
 if(s->word[9]==0&&s->word[41]==0)memset(r->buffer,0,sizeof r->buffer);
 float fade=dub_float(s,104);for(int i=0;i<n;i++){
  if(s->word[9]==3){fade-=bits(0x3baaab3a);if(fade<0)fade=0;}else if(fade<1){fade+=bits(0x3baaab3a);if(fade>1)fade=1;}
  r->buffer[0][i]=temp[i]=mul(in[i],fade);
 }dub_put_float(s,104,fade);if(s->word[9]==0&&fade>=1)s->word[9]=1;
 process(&r->filter[3],temp,r->buffer[1],n);process(&r->filter[0],r->buffer[0],temp,n);process(&r->filter[1],temp,r->buffer[0],n);
 if(s->word[42]!=s->word[43]||b[160])dub_calculate(s);
 for(unsigned side=0;side<2;side++){
  unsigned o=112+side*8;float gain=dub_float(s,o),target=dub_float(s,o+4);
  if(gain!=target){float step=(target-gain)*.015625f;gain+=step*.5f;for(int i=0;i<n;i++){r->buffer[side][i]=mul(r->buffer[side][i],gain);gain+=step;}dub_put_float(s,o,target);}
  else for(int i=0;i<n;i++)r->buffer[side][i]=mul(r->buffer[side][i],gain);
 }
 if(s->word[9]<=1){s->word[41]++;memset(r->buffer[2],0,64*sizeof(Stereo));memset(r->buffer[3],0,64*sizeof(Stereo));if(s->word[41]>130){s->word[9]=2;s->word[41]=0;}}
 else{
  for(unsigned side=0;side<2;side++)for(unsigned next=0;next<2;next++){
   float delay=dub_float(s,88+side*8+next*4);int integer=(int)(delay+1);float fraction=delay-(float)(int)delay;
   for(int i=0;i<n;i++)r->buffer[2+side+2*next][i]=add(mul(read_delay(r,side,integer,i),fraction),mul(read_delay(r,side,integer,i+1),1-fraction));
  }
  for(unsigned side=0;side<2;side++)if(b[161+side]){
   float alpha=dub_float(s,152+side*4);for(int i=0;i<n;i++){alpha+=bits(0x3b1f383f);if(alpha>=1)alpha=1;r->buffer[2+side][i]=add(mul(r->buffer[4+side][i],alpha),mul(r->buffer[2+side][i],1-alpha));}
   dub_put_float(s,152+side*4,alpha);if(alpha>=1){s->word[(88+side*8)/4]=s->word[(92+side*8)/4];dub_put_float(s,152+side*4,0);b[161+side]=0;}
  }
  for(unsigned side=0;side<2;side++){unsigned o=128+12*side;float current=dub_float(s,o),target=dub_float(s,o+4);dub_put_float(s,o+8,current==target?0:(target-current)*.015625f);}
  float outputfade=dub_float(s,108);
  for(int i=0;i<n;i++){
   if(outputfade<1)outputfade+=bits(0x3baaab3a);
   for(unsigned side=0;side<2;side++){unsigned o=128+side*12;float feedback=dub_float(s,o)+dub_float(s,o+8);dub_put_float(s,o,feedback);r->buffer[2+side][i]=mul(r->buffer[2+side][i],outputfade);r->buffer[side][i]=add(r->buffer[side][i],mul(r->buffer[2+side][i],feedback));}
  }dub_put_float(s,108,outputfade);s->word[32]=s->word[33];s->word[35]=s->word[36];
 }
 process(&r->filter[2],r->buffer[3],temp,n);
 for(int i=0;i<n;i++)out[i]=add(add(in[i],mul(r->buffer[2][i],bits(0x3f333333))),temp[i]);
 for(unsigned side=0;side<2;side++)for(int i=0;i<n;i++){r->ring[side][r->write[side]]=r->buffer[side][i];if(++r->write[side]>=r->length[side])r->write[side]=0;}
}

void dub_runtime_default(DubRuntime*r){
 static const uint32_t words[4][5]={
 {0x3cce3e24,0x3d4e3e24,0x3cce3e24,0xbfc07917,0x3f1ab9f2},
 {0x3f78c777,0xbff8c777,0x3f78c777,0xbff8ad64,0x3f71c315},
 {0x3e995dda,0x3f195dda,0x3e995dda,0x3e153a31,0x3d56d272},
 {0x3f46eb08,0xbfc6eb08,0x3f46eb08,0xbfc07917,0x3f1ab9f2}
 };float coeff[4][5];memcpy(coeff,words,sizeof coeff);dub_runtime_construct(r,coeff);dub_runtime_init(r);
}
