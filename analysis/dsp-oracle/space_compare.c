#include "space.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_space_init(Space*),native_space_execute(Space*,const Stereo*,Stereo*,int),native_space_iir(void*,const float*,float*,unsigned);
extern int native_space_on(Space*),native_space_off(Space*);
extern const float native_space_coefficients[4][5];float native_space_scratch[8][64];
typedef struct {uint32_t word[18];SpaceFilter f;} NF;static uint32_t vt[7],svt[5];
static void clear(NF*f){memset(f->f.x,0,16);f->f.clears++;}static void set(NF*f,const float*c){memcpy(f->f.coeff,c,20);f->f.updates++;}
#endif
static unsigned seed=512251,errors;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
static void compare(const void*x,const void*y,size_t size,unsigned call,const char*what){const uint32_t*a=x,*b=y;for(unsigned i=0;i<size/4;i++)if(a[i]!=b[i]){if(errors<20)fprintf(stderr,"%s call%u word%u %08x != %08x\n",what,call,i,a[i],b[i]);errors++;}}
int main(int argc,char**argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
 FILE*f=fopen(argv[1],"rb");
#else
 FILE*f=fopen(argv[1],"wb");vt[2]=(uint32_t)set;vt[4]=(uint32_t)native_space_iir;vt[6]=(uint32_t)clear;svt[4]=(uint32_t)native_space_init;
#endif
 if(!f)return 2;
 float coeff[4][5];
#ifndef HOST_REPLAY
 memcpy(coeff,native_space_coefficients,sizeof coeff);fwrite(coeff,sizeof coeff,1,f);
#else
 if(fread(coeff,sizeof coeff,1,f)!=1)return 3;
#endif
 static SpaceRuntime s,ref,saved;space_construct(&s,coeff);ref=s;
#ifndef HOST_REPLAY
 NF filters[2]={0};ref.state.word[0]=(uint32_t)svt;for(unsigned i=0;i<2;i++){filters[i].word[0]=(uint32_t)vt;filters[i].word[7]=(uint32_t)filters[i].f.coeff;filters[i].word[9]=(uint32_t)filters[i].f.x;filters[i].word[10]=(uint32_t)filters[i].f.y;ref.state.word[33+i]=(uint32_t)&filters[i];}for(unsigned i=0;i<6;i++)ref.state.word[14+i]=(uint32_t)ref.ring[i];
#endif
 for(unsigned call=0;call<1600;call++){
  if(call%87==0){float color=(float)(rnd()%256)/255;space_put_float(&s.state,28,color);space_put_float(&ref.state,28,color);}
  if(call%37==0){float p=(float)(rnd()%10001)/10000;if(call%74==0)p/=255;space_put_float(&s.state,32,p);space_put_float(&ref.state,32,p);}
  if(call==751){
#ifndef HOST_REPLAY
   native_space_init(&ref.state);
#endif
   space_init(&s);
  }
  if(call%393==251){space_off(&s.state);
#ifndef HOST_REPLAY
   native_space_off(&ref.state);
#endif
  }if(call%393==281){space_on(&s.state);
#ifndef HOST_REPLAY
   native_space_on(&ref.state);
#endif
  }
  Stereo input[66]={0},out[64],expected[64];for(unsigned i=0;i<64;i++)input[i]=(Stereo){((int)(rnd()%10001)-5000)*.00001f,((int)(rnd()%10001)-5000)*.00001f};
#ifndef HOST_REPLAY
  native_space_execute(&ref.state,input,expected,64);saved=ref;saved.state.word[0]=0;for(unsigned i=14;i<=19;i++)saved.state.word[i]=0;saved.state.word[33]=saved.state.word[34]=0;for(unsigned i=0;i<2;i++)saved.filter[i]=filters[i].f;memcpy(saved.scratch,native_space_scratch,sizeof saved.scratch);fwrite(&saved,sizeof saved,1,f);fwrite(expected,sizeof expected,1,f);
#else
  if(fread(&saved,sizeof saved,1,f)!=1||fread(expected,sizeof expected,1,f)!=1)return 3;
#endif
  space_execute(&s,input,out,64);compare(&s,&saved,sizeof s,call,"runtime");compare(out,expected,sizeof out,call,"audio");
 }
 fclose(f);printf("{\"calls\":1600,\"frames\":102400,\"mismatches\":%u}\n",errors);return errors?1:0;
}
