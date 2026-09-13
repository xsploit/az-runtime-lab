#include "dubecho.h"
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
