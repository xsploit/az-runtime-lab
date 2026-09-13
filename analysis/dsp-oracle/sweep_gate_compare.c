#include "sweep.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_sweep_gate_parameters(Sweep *,float);
extern void native_sweep_gate_process(Sweep *,const Stereo *,int);
extern void native_sweep_prepare_gain(Sweep *,float,unsigned,int);
#endif
static uint32_t seed=712321;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");
#endif
if(!f)return 2;
unsigned errors=0;Sweep s={{0}},r;
for(unsigned call=0;call<18000;call++){
 sweep_put_float(&s,32,(float)(rnd()%10001)/10000);
 sweep_put_float(&s,112,1.0f/(float)(1+rnd()%64));
 unsigned side=rnd()%2;int frames=(int)(rnd()%65);
 sweep_put_float(&s,132+side*4,(float)(rnd()%10001)/10000);
 float value=call%3==0?(float)(call%256):((int)(rnd()%10001)-5000)/100000.0f;
 Stereo bands[2][64],reference[2][64];float levels[2][64];
 for(unsigned a=0;a<2;a++)for(unsigned i=0;i<64;i++){
  float x=(float)(rnd()%10001)/10000;
  bands[a][i]=(Stereo){x-.5f,.5f-x};levels[a][i]=x;
 }
 memcpy(reference,bands,sizeof bands);
 sweep_put_float(&s,132,(float)(rnd()%10001)/10000);
 sweep_put_float(&s,136,(float)(rnd()%10001)/10000);
 r=s;
#ifndef HOST_REPLAY
 if(call%3==0)native_sweep_gate_parameters(&r,value);else native_sweep_prepare_gain(&r,value,side,frames);
 for(unsigned a=0;a<2;a++){r.word[18+a]=(uint32_t)reference[a];r.word[23+a]=(uint32_t)levels[a];}
 native_sweep_gate_process(&r,reference[0],frames);
 for(unsigned a=0;a<2;a++){r.word[18+a]=r.word[23+a]=0;}
 if(fwrite(&r,sizeof r,1,f)!=1||fwrite(reference,sizeof reference,1,f)!=1)return 3;
#else
 if(fread(&r,sizeof r,1,f)!=1||fread(reference,sizeof reference,1,f)!=1)return 3;
#endif
 if(call%3==0)sweep_gate_parameters(&s,value);else sweep_prepare_gain(&s,value,side,frames);
 sweep_gate_process(&s,bands,levels,frames);
 if(memcmp(bands,reference,sizeof bands)){if(errors<8)fprintf(stderr,"audio call%u\n",call);errors++;}
 for(unsigned k=0;k<67;k++)if(s.word[k]!=r.word[k]){if(errors<8)fprintf(stderr,"call%u word%u %08x != %08x\n",call,k,s.word[k],r.word[k]);errors++;}
}
fclose(f);printf("{\"calls\":18000,\"words\":1206000,\"mismatches\":%u}\n",errors);return errors?1:0;}
