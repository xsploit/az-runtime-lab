#include "headphone_dsp.h"
#include <math.h>
#include <stdint.h>
#include <string.h>
static float f(const unsigned char*s,unsigned o){float v;memcpy(&v,s+o,4);return v;}
static void sf(unsigned char*s,unsigned o,float v){memcpy(s+o,&v,4);}
static uint32_t u(const unsigned char*s,unsigned o){uint32_t v;memcpy(&v,s+o,4);return v;}
static void su(unsigned char*s,unsigned o,uint32_t v){memcpy(s+o,&v,4);}
static void target(unsigned char*s,unsigned base,float value){
 float inv=f(s,base+32);
 for(unsigned lane=0;lane<2;lane++){
  float next=f(s,base+lane*4)+f(s,base+16+lane*4);
  sf(s,base+8+lane*4,value);sf(s,base+lane*4,(value-next)*inv);
 }
 su(s,base+24,0);s[base+36]=0;
}
static void portable_master(unsigned char*s,uint32_t value){
 if(s[152]==value)return;
 s[152]=(unsigned char)value;target(s,160,value?1.f:0.f);
}
static void portable_mode(unsigned char*s,uint32_t value){
 if(u(s,200)==value)return;
 su(s,200,value);su(s,248,1);target(s,208,0.f);
}


static void portable_level(unsigned char*s,float value,const float*headphone_tables){
 unsigned index=(uint16_t)(uint32_t)(0.5f+value*255.f);
 sf(s,20,value);target(s,24,headphone_tables[8+index]);
}
static void portable_mix(unsigned char*s,float value,const float*headphone_tables){
 unsigned index=(uint16_t)(uint32_t)(0.5f+value*255.f);
 sf(s,64,value);target(s,72,headphone_tables[264+index]);target(s,112,headphone_tables[520+index]);
}
static void portable_audio(unsigned char*s,int frames,const float*master,const float*cue,float*out,const float split[2]){
 if(!master||!cue||!out)return;
 uint32_t cb=0xc0eff755;float calibration;memcpy(&calibration,&cb,4);
 const unsigned ramps[]={112,72,160,24,208};
 for(int i=0;i<frames;i++){
  float m[2],c[2],v[2];
  for(unsigned l=0;l<2;l++){m[l]=(master[2*i+l]*f(s,88+4*l))*f(s,176+4*l);c[l]=cue[2*i+l]*f(s,128+4*l);}
  if(u(s,204)==0){v[0]=(c[0]+c[1])*split[0];v[1]=(m[0]+m[1])*split[1];}
  else{v[0]=c[0]+m[0];v[1]=c[1]+m[1];}
  for(unsigned l=0;l<2;l++)out[2*i+l]=((v[l]*calibration)*f(s,40+4*l))*f(s,224+4*l);
  for(unsigned j=0;j<5;j++){unsigned b=ramps[j];if(s[b+36])continue;
   uint32_t count=u(s,b+24),length=u(s,b+28);
   for(unsigned l=0;l<2;l++){float next=f(s,b+16+4*l)+f(s,b+4*l);sf(s,b+16+4*l,count>=length?f(s,b+8+4*l):next);}
   if(count>=length){s[b+36]=1;}
   su(s,b+24,count+1);
  }
 }
 if(u(s,248)==1&&s[244]){su(s,204,u(s,200));target(s,208,1.f);su(s,248,2);}
 else if(u(s,248)==2&&s[244])su(s,248,0);
}
static void portable_ctor(unsigned char*s,uint32_t sample_rate){
 su(s,0,0x4193b8);su(s,4,0);su(s,8,0);su(s,12,1);su(s,16,0);
 sf(s,20,0.f);sf(s,64,0.f);s[152]=0;su(s,200,1);su(s,204,1);su(s,248,0);
 unsigned bases[]={24,72,112,160,208};
 for(unsigned j=0;j<5;j++){
  unsigned b=bases[j];float ms=j==4?10.158730506896973f:3.299999952316284f;
  uint32_t length=(uint32_t)(((float)sample_rate*ms)/1000.f);if(!length)length=1;
  for(unsigned l=0;l<2;l++){sf(s,b+4*l,0.f);sf(s,b+8+4*l,j==4?1.f:0.f);sf(s,b+16+4*l,j==4?1.f:0.f);}
  su(s,b+24,0);su(s,b+28,length);sf(s,b+32,1.f/(float)length);s[b+36]=1;
 }
}

#define HP_READY UINT32_C(0x48503130)
static int ready(const LabHeadphoneDsp*h){return h&&h->ready==HP_READY;}
static int unit(float v){return isfinite(v)&&v>=0.f&&v<=1.f;}
int lab_headphone_init(LabHeadphoneDsp*h,unsigned rate,const float*t,size_t count){
 if(!h||!t||count!=776||(rate!=44100&&rate!=48000))return 0;
 for(unsigned curve=0;curve<3;curve++){unsigned base=curve==0?8:curve==1?264:520;for(unsigned i=0;i<256;i++)if(!unit(t[base+i]))return 0;}
 /* Allow initialization from the instance's own retained table. */
 memmove(h->tables,t,sizeof h->tables);memset(h->state,0,sizeof h->state);
 portable_ctor(h->state,rate);h->ready=HP_READY;return 1;
}
int lab_headphone_level(LabHeadphoneDsp*h,float v){if(!ready(h)||!unit(v))return 0;portable_level(h->state,v,h->tables);return 1;}
int lab_headphone_mix(LabHeadphoneDsp*h,float v){if(!ready(h)||!unit(v))return 0;portable_mix(h->state,v,h->tables);return 1;}
int lab_headphone_master_cue(LabHeadphoneDsp*h,unsigned v){if(!ready(h)||v>1)return 0;portable_master(h->state,v);return 1;}
int lab_headphone_mode(LabHeadphoneDsp*h,unsigned v){if(!ready(h)||v>1)return 0;portable_mode(h->state,1-v);return 1;}
static int overlap(const void*a,const void*b,size_t bytes){uintptr_t x=(uintptr_t)a,y=(uintptr_t)b;return x<=y?y-x<bytes:x-y<bytes;}
int lab_headphone_process(LabHeadphoneDsp*h,const float*m,const float*c,float*out,size_t n){
 if(!ready(h)||!m||!c||!out||!n||n>4096)return 0;
 size_t bytes=2*n*sizeof(float);if(overlap(m,out,bytes)||overlap(c,out,bytes))return 0;
 for(size_t i=0;i<2*n;i++)if(!isfinite(m[i])||!isfinite(c[i]))return 0;
 const float split[2]={.5f,.5f};portable_audio(h->state,(int)n,m,c,out,split);return 1;
}
