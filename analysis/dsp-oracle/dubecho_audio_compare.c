#include "dubecho.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_dub_init(DubEcho*),native_dub_execute(DubEcho*,const Stereo*,Stereo*,int);
extern void iir_native(const Stereo*,Stereo*,const Stereo*,Stereo*,Stereo*,unsigned long);
extern const float dub_coefficients[4][5];
typedef struct {uint32_t vt;DubFilter f;} NF;
typedef struct {int write,length;Stereo *data;} ND;
static uint32_t vt[7];static DubRuntime *native_runtime;static unsigned allocation;
void *dub_alloc(unsigned size){if(size!=512)abort();return native_runtime->buffer[allocation++%6];}
void dub_free(void*p){(void)p;}
static void clear(NF*f){memset(f->f.x,0,32);f->f.clears++;}
static void process(NF*f,const Stereo*in,Stereo*out,int n){iir_native(in,out,f->f.coeff,f->f.x,f->f.y,(unsigned)n);}
#endif
static unsigned seed=195673,errors;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
static void compare(const void*x,const void*y,size_t size,unsigned call,const char*what){const uint32_t*a=x,*b=y;for(unsigned i=0;i<size/4;i++)if(a[i]!=b[i]){if(errors<15)fprintf(stderr,"%s call%u word%u %08x != %08x\n",what,call,i,a[i],b[i]);errors++;}}
int main(int argc,char**argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 FILE*f=fopen(argv[1],"rb");
#else
 FILE*f=fopen(argv[1],"wb");vt[5]=(uint32_t)process;vt[6]=(uint32_t)clear;
#endif
 if(!f)return 2;
 float constants[4][5];
#ifndef HOST_REPLAY
 memcpy(constants,dub_coefficients,sizeof constants);fwrite(constants,sizeof constants,1,f);
#else
 if(fread(constants,sizeof constants,1,f)!=1)return 3;
#endif
 static DubRuntime s,ref,saved;dub_runtime_construct(&s,constants);ref=s;
#ifndef HOST_REPLAY
 NF filters[4]={0};ND delay[2];native_runtime=&ref;
 for(unsigned i=0;i<4;i++){filters[i].vt=(uint32_t)vt;filters[i].f=s.filter[i];ref.state.word[10+i]=(uint32_t)&filters[i];}
 for(unsigned i=0;i<6;i++)ref.state.word[14+i]=(uint32_t)ref.buffer[i];
 for(unsigned i=0;i<2;i++){delay[i]=(ND){0,(int)s.length[i],ref.ring[i]};ref.state.word[20+i]=(uint32_t)&delay[i];}
 native_dub_init(&ref.state);
#endif
 dub_runtime_init(&s);
 for(unsigned call=0;call<1600;call++){
  if(call%47==0){float color=(float)(rnd()%256)/255;dub_put_float(&s.state,28,color);dub_put_float(&ref.state,28,color);dub_color(&s.state);dub_color(&ref.state);}
  if(call%61==0){float p=(float)(rnd()%10001)/10000;dub_put_float(&s.state,32,p);dub_put_float(&ref.state,32,p);dub_parameter(&s.state);dub_parameter(&ref.state);}
  if(call==750||call==1320){
#ifndef HOST_REPLAY
   native_dub_init(&ref.state);
#endif
   dub_runtime_init(&s);
  }
  if(call%293==201){dub_off(&s.state);dub_off(&ref.state);}if(call%293==231){dub_on(&s.state);dub_on(&ref.state);}
  Stereo input[66]={0},out[64],expected[64];for(unsigned i=0;i<64;i++)input[i]=(Stereo){((int)(rnd()%10001)-5000)*.00001f,((int)(rnd()%10001)-5000)*.00001f};
#ifndef HOST_REPLAY
  native_dub_execute(&ref.state,input,expected,64);saved=ref;for(unsigned i=10;i<=21;i++)saved.state.word[i]=0;for(unsigned i=0;i<4;i++)saved.filter[i]=filters[i].f;for(unsigned i=0;i<2;i++)saved.write[i]=(unsigned)delay[i].write;fwrite(&saved,sizeof saved,1,f);fwrite(expected,sizeof expected,1,f);
#else
  if(fread(&saved,sizeof saved,1,f)!=1||fread(expected,sizeof expected,1,f)!=1)return 3;
#endif
  dub_runtime_execute(&s,input,out,64);compare(&s,&saved,sizeof s,call,"runtime");compare(out,expected,sizeof out,call,"audio");
 }
 fclose(f);printf("{\"calls\":1600,\"frames\":102400,\"mismatches\":%u}\n",errors);return errors?1:0;
}
