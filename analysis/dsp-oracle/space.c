#include "space.h"
#include <string.h>
#include <assert.h>
static float bits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
float space_float(const Space*s,unsigned o){float f;memcpy(&f,&s->word[o/4],4);return f;}
void space_put_float(Space*s,unsigned o,float f){memcpy(&s->word[o/4],&f,4);}
static void clear(SpaceFilter*f){memset(f->x,0,16);f->clears++;}
static void set(SpaceFilter*f,const float*c){memcpy(f->coeff,c,20);f->updates++;}
static void filter(SpaceFilter*f,const float*in,float*out,int n){for(int i=0;i<n;i++){float v=f->coeff[1]*f->x[1];v+=f->coeff[0]*in[i];v+=f->coeff[2]*f->x[0];v-=f->coeff[3]*f->y[1];v-=f->coeff[4]*f->y[0];out[i]=v;f->x[0]=f->x[1];f->x[1]=in[i];f->y[0]=f->y[1];f->y[1]=v;}}
void space_construct(SpaceRuntime*r,const float c[4][5]){memset(r,0,sizeof *r);memcpy(r->coefficients,c,sizeof r->coefficients);r->state.word[1]=r->state.word[2]=44100;r->state.word[6]=2;space_put_float(&r->state,12,1.0f/44100);space_put_float(&r->state,28,.5f);space_put_float(&r->state,32,.5f);((unsigned char*)&r->state)[36]=1;}
static int clamp_step(int n){return n<0?0:n>255?255:n;}
void space_init(SpaceRuntime*r){Space*s=&r->state;int color=clamp_step((int)(space_float(s,28)*bits(0x437fe666)));s->word[13]=(unsigned)color;s->word[12]=0;s->word[20]=0;s->word[21]=1;for(unsigned i=22;i<=26;i++)s->word[i]=0;
 unsigned right=color>115;s->word[11]=right;const unsigned delays[2][4]={{1223,1876,3246,1679},{1099,1686,2916,1508}};for(unsigned i=0;i<4;i++)s->word[27+i]=delays[right][i];set(&r->filter[0],r->coefficients[right*2]);set(&r->filter[1],r->coefficients[right*2+1]);clear(&r->filter[0]);clear(&r->filter[1]);s->word[31]=8723;s->word[32]=13882;s->word[37]=s->word[38]=s->word[39]=s->word[42]=0;s->word[43]=0x3bdee95c;((unsigned char*)s)[36]=0;s->word[40]=0x3f800000;
}
int space_on(Space*s){s->word[43]=0x3bdee95c;return 1;}int space_off(Space*s){s->word[43]=0xbbdee95c;return 1;}
static void read_ring(SpaceRuntime*r,unsigned stage,unsigned write,unsigned delay,float*out,int n){unsigned pos=(write-delay)&32767;for(int i=0;i<n;i++)out[i]=r->ring[stage][(pos+(unsigned)i)&32767];}
static void write_ring(SpaceRuntime*r,unsigned stage,unsigned write,const float*in,int n){for(int i=0;i<n;i++)r->ring[stage][(write+(unsigned)i)&32767]=in[i];}
void space_execute(SpaceRuntime*r,const Stereo*in,Stereo*out,int n){assert(n==64);Space*s=&r->state;if(((unsigned char*)s)[36])space_init(r);
 float gate=space_float(s,168),gatestep=space_float(s,172);for(int i=0;i<n;i++){gate+=gatestep;if(gate>1)gate=1;else if(gate<0)gate=0;r->scratch[2][i]=gate;}space_put_float(s,168,gate);
 float scale=bits(0x437fe666);float parameter=space_float(s,32)*scale;int p=clamp_step((int)(parameter*scale)),target=clamp_step((int)(space_float(s,28)*scale)),color=(int)s->word[13];
 if(target>color)color++;else if(target<color)color--;
 unsigned right=s->word[11];if(right){if(color<=115){color=116;s->word[12]=1;}}else if(color>139){color=139;s->word[12]=1;}s->word[13]=(unsigned)color;
 float a=bits(right?0x3f2dcd7a:0x3f29c0fe),b=bits(right?0x3f48877b:0x3f425f20);
 if(p<=115){float v=(float)p*bits(0x3c0d3dcb);a=v*a;b=v*b;}else if(p>139){float v=(float)(p-139)*bits(0x3c0d3dcb);a+=v*bits(0x3d75c28f);b+=v*bits(0x3dcccccd);}
 float inputgain=0,feedbacka=bits(0x3e8295e4),feedbackb=bits(0x3de8c4aa);
 if((!right&&color<=115)||(right&&color>139)){float v=(float)(right?255-color:color)*bits(0x3c0d3dcb);v=1-v*v;feedbacka+=v*a;feedbackb+=b*v;inputgain=(float)(right?color-139:116-color)*bits(0x3d0d3dcb);if(inputgain>1)inputgain=1;}
 space_put_float(s,140,feedbacka);space_put_float(s,144,feedbackb);set(&r->filter[0],r->coefficients[right*2]);set(&r->filter[1],r->coefficients[right*2+1]);
 const unsigned desired[2][4]={{1223,1876,3246,1679},{1099,1686,2916,1508}};
 float smoothing=space_float(s,160),smoothstep=bits(s->word[27]==desired[right][0]?0x3d0b51d8:0xbd0b51d8);for(int i=0;i<n;i++){smoothing+=smoothstep;if(smoothing>1)smoothing=1;else if(smoothing<0)smoothing=0;r->scratch[3][i]=smoothing;}space_put_float(s,160,smoothing);
 float gain=space_float(s,156),gainstep=(inputgain-gain)*bits(0x3d0b51da);for(int i=0;i<n;i++){gain+=gainstep;float v=(right?bits(0x3f333333):.5f)*gain;v*=r->scratch[2][i];v=(in[i].l+in[i].r)*v;r->scratch[4][i]=v;}space_put_float(s,156,inputgain);
 filter(&r->filter[0],r->scratch[4],r->scratch[5],n);filter(&r->filter[1],r->scratch[5],r->scratch[4],n);
 unsigned write=(unsigned)(int)space_float(s,80);
 for(unsigned stage=0;stage<4;stage++){
  unsigned ready=stage==3?3:stage+1;
  if(s->word[21]<=ready){
   if(stage<3){const unsigned thresholds[]={1234,1895,3262};s->word[22+stage]+=(unsigned)n;if(s->word[22+stage]>thresholds[stage])s->word[21]=stage+2;}
   if(stage==0){memcpy(r->scratch[1],r->scratch[4],(unsigned)n*4);memcpy(r->scratch[0],r->scratch[4],(unsigned)n*4);}else memcpy(r->scratch[1],r->scratch[0],(unsigned)n*4);
  }else{
   read_ring(r,stage,write,s->word[27+stage],r->scratch[6],n);
   for(int i=0;i<n;i++){float d=r->scratch[6][i],smooth=r->scratch[3][i],x=stage==0?r->scratch[4][i]:r->scratch[0][i];float v=x-(d*.8f)*smooth;r->scratch[1][i]=v;r->scratch[0][i]=v+d*smooth;}
  }
  write_ring(r,stage,write,r->scratch[1],n);
  if(stage==2)for(int i=0;i<n;i++)r->scratch[7][i]=r->scratch[0][i]-r->scratch[4][i];
  if(stage==3)for(int i=0;i<n;i++)r->scratch[0][i]-=r->scratch[4][i];
 }
 float dampa=bits(right?0x3f507b71:0x3f2dc3ae),dampb=bits(right?0x3e3e123d:0x3ea478a3);
 for(unsigned side=0;side<2;side++){
  unsigned stage=4+side,slot=side?7:0;float history=space_float(s,148+4*side),fb=space_float(s,140+4*side);int reads=s->word[21]>stage;
  if(!reads){s->word[25+side]+=(unsigned)n;if(s->word[25+side]>(side?13891u:8731u))s->word[21]=stage+1;}else read_ring(r,stage,write,s->word[31+side],r->scratch[6],n);
  for(int i=0;i<n;i++){float v=r->scratch[slot][i];if(reads)v+=fb*r->scratch[6][i];v=v*dampa+history*dampb;history=v;r->scratch[slot][i]=r->scratch[1][i]=v;}
  space_put_float(s,148+4*side,history);write_ring(r,stage,write,r->scratch[1],n);
 }
 space_put_float(s,80,(float)((write+(unsigned)n)&32767));for(int i=0;i<n;i++){float l=r->scratch[0][i],rr=r->scratch[7][i];out[i]=(Stereo){(l+l)+in[i].l,(rr+rr)+in[i].r};}
 if(s->word[12]==1){s->word[11]=!s->word[11];clear(&r->filter[0]);clear(&r->filter[1]);s->word[12]=0;}
 if(space_float(s,160)<.03125f){space_put_float(s,160,0);for(unsigned i=0;i<4;i++)s->word[27+i]=desired[right][i];s->word[31]=8723;s->word[32]=13882;}
}

void space_default(SpaceRuntime*r){static const uint32_t words[4][5]={
 {0x3b96dd23,0x3c16dd23,0x3b96dd23,0xbfe648cb,0x3f51487e},
 {0x3f7ae4b8,0xbffae4b8,0x3f7ae4b8,0xbffad7ae,0x3f75e385},
 {0x3e12eff4,0x3e92eff4,0x3e12eff4,0xbf2e4506,0x3e8269f3},
 {0x3f3d10df,0xbfbd10df,0x3f3d10df,0xbfb42923,0x3f0bf139}
 };float coeff[4][5];memcpy(coeff,words,sizeof coeff);space_construct(r,coeff);space_init(r);}
