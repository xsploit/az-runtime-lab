#include "cfx_crush.h"
#include <math.h>
#include <string.h>
static float bits(uint32_t n){float f;memcpy(&f,&n,4);return f;}
static float fz(float x){uint32_t n;memcpy(&n,&x,4);if(!(n&0x7f800000)){n&=0x80000000;memcpy(&x,&n,4);}return x;}
static float add(float a,float b){return fz(fz(a)+fz(b));}static float mul(float a,float b){return fz(fz(a)*fz(b));}static float sub(float a,float b){return fz(fz(a)-fz(b));}
void crush_color(Crush *s){int i=(int)(s->color*bits(0x437fe666));s->color_step=i<0?0:i>255?255:i;}
void crush_parameter(Crush *s){int i=(int)(s->parameter*bits(0x437fe666));s->param_step=i<0?0:i>255?255:i;if(i<0)s->hold=bits(0x40930000);else if(i>255)s->hold=bits(0x4203f499);else if(i<=127)s->hold=bits(0x40930000)+((float)i*.0078125f)*bits(0x418ba666);else s->hold=(bits(0x418ba666)+(((float)(i-128)*.0078125f)*.5f)*bits(0x41b06666))+bits(0x40930000);}
void crush_coeff(Crush *s,int c){float *v=s->coef;memset(v,0,32);v[0]=1;
 if(c>255)c=255;
 if(c>=124&&c<=131)return;
 if(c>115&&c<=123){uint32_t k[]={0x3f5030c1,0x3fd030c1,0x3f5030c1,0x3fcbafbc,0x3f29638c,0x3e034d65,0xbe034d65,0x3f3e594d};for(unsigned i=0;i<8;i++)v[i]=bits(k[i]);return;}
 float w,p;
 if(c<=115){if(c<0)c=0;p=powf(bits(0x3f87ead3),(float)c);w=(p*96.0f)*bits(0x40c90fdb);}
 else{p=powf(bits(0x3f848801),(float)(c-132));w=(p*60.0f)*bits(0x40c90fdb);}
 float square=w*w,root=w*bits(0x403504f3),q=root*bits(0x37be37c6),a=square*bits(0x300d56d6),b=w*bits(0x37be37c6),inv=1.0f/((a+q)+4),one=1.0f/(b+2);
 if(c<=115){v[0]=a*inv;v[1]=v[0]+v[0];v[2]=v[0];v[3]=inv*((a-4)+(a-4));v[4]=inv*((a-q)+4);v[5]=one+one;v[6]=-v[5];v[7]=one*(b-2);}
 else{v[0]=inv*4;v[1]=v[0]*-2;v[2]=v[0];v[3]=((a-4)+(a-4))*inv;v[4]=((a-q)+4)*inv;v[5]=b*one;v[6]=v[5];v[7]=(b-2)*one;}
}
void crush_init(Crush *s){crush_color(s);crush_parameter(s);s->count=1;s->phase=0;s->held=(Stereo){0,0};s->flip=0;s->mode=s->color_step>123;s->blend=1;
 if(s->color_step>131){float f=(float)(s->color_step-132)*bits(0x3b853408);f=f+f;s->blend=f<.5f?1-(f+f):0;}
 crush_coeff(s,s->color_step);memset(s->history,0,sizeof s->history);s->feedback=0;s->dirty=0;
}
static void filter(Crush *s,Stereo *out,unsigned n){for(unsigned i=0;i<n;i++)for(unsigned side=0;side<2;side++){
 float *v=s->coef;float h0=side?s->history[0].r:s->history[0].l,h1=side?s->history[1].r:s->history[1].l,h2=side?s->history[2].r:s->history[2].l,h3=side?s->history[3].r:s->history[3].l;
 float x=add(side?out[i].r:out[i].l,mul(s->feedback,h3));float y=add(mul(v[0],x),h0);float z=add(mul(v[5],y),h2);
 h0=add(sub(mul(v[1],x),mul(v[3],y)),h1);h1=sub(mul(v[2],x),mul(v[4],y));h2=sub(mul(v[6],y),mul(v[7],z));h3=z;
 if(side){out[i].r=y;s->history[0].r=h0;s->history[1].r=h1;s->history[2].r=h2;s->history[3].r=h3;}else{out[i].l=y;s->history[0].l=h0;s->history[1].l=h1;s->history[2].l=h2;s->history[3].l=h3;}
}}
void crush_execute(Crush *s,const Stereo *in,Stereo *out,unsigned n){if(s->dirty)crush_init(s);int color=s->color_step,param=s->param_step,index=-1;float factor=0;Stereo tmp[64];
 if(!s->mode){if(color<=124)factor=(float)(124-color)*bits(0x3c042108);else s->flip=1;}
 else{if(color>=124&&color<=130)color=131;else if(color<=123){s->flip=1;color=131;}else{index=color-132;factor=(float)(color-131)*bits(0x3c042108);}}
 float threshold=s->hold*factor;uint32_t mask=UINT32_MAX;
 if(param>144){if(threshold>bits(0x40930000))mask<<=((unsigned)(param-128)>>4)+16;}
 else if(param<=7)threshold*=((float)param*.125f);
 for(unsigned i=0;i<n;i++){
  Stereo sample;uint32_t bits2[2];memcpy(bits2,&in[i],8);bits2[0]&=mask;bits2[1]&=mask;memcpy(&sample,bits2,8);
  float count=(float)s->count;
  if(count<=threshold&&s->count!=1)s->count++;
  else{s->count++;if(threshold<count){s->phase+=(threshold+1)-count;s->count=2;if(s->phase>=1){s->phase-=1;s->count=1;}else s->held=sample;}else s->held=sample;}
  out[i]=tmp[i]=s->held;
 }
 if(s->mode){crush_coeff(s,color);float target;
  if(color==131){s->feedback=0;target=1;}else{float x=(float)index*bits(0x3b853408),y=1-(x+x);y=y*y;y=y*y;y=y*y;s->feedback=(1-y*y)*bits(0x3fa660cc);float z=(x+.5f)-.5f;z=z+z;target=z<.5f?1-(z+z):0;}
  float step=(target-s->blend)*.015625f;filter(s,out,n);
  for(unsigned i=0;i<n;i++){s->blend+=step;float dry=s->blend*s->blend;out[i].l=add(mul(out[i].l,sub(1,dry)),mul(tmp[i].l,dry));out[i].r=add(mul(out[i].r,sub(1,dry)),mul(tmp[i].r,dry));}
  float absstep=fabsf(step),limit=1-absstep;if(absstep>s->blend)s->blend=0;if(limit<s->blend)s->blend=1;
 }
 if(s->flip==1){memset(s->history,0,sizeof s->history);s->mode=1-s->mode;s->count=1;s->phase=0;s->held=(Stereo){0,0};s->flip=0;}
}
