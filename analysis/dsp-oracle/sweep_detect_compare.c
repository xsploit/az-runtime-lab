#include "sweep.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_sweep_detect(Sweep *,const Stereo *,int);
typedef struct {uint32_t vt;unsigned band;} NF;
static uint32_t vt[6];static Stereo supplied[2][64];
static void process(NF *f,const Stereo *in,Stereo *out,int n){(void)in;memcpy(out,supplied[f->band],n*sizeof(Stereo));}
#endif
static unsigned seed=73121;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");vt[5]=(uint32_t)process;NF filters[4];for(unsigned k=0;k<4;k++)filters[k]=(NF){(uint32_t)vt,k/2};
#endif
if(!f)return 2;
Sweep s={{0}},r;float memory[2][60]={{0}},levels[2][64]={{0}},rm[2][60]={{0}},rl[2][64]={{0}};unsigned errors=0;
for(unsigned call=0;call<18000;call++){
 int n=call%37==0?0:64;
 Stereo bands[2][64]={0};
 float amplitude=call%4000<2000?.001f:.5f;
 for(unsigned a=0;a<2;a++)for(int i=0;i<n;i++)bands[a][i]=(Stereo){amplitude*((int)(rnd()%10001)-5000),amplitude*((int)(rnd()%10001)-5000)};
 r=s;
#ifndef HOST_REPLAY
 Stereo temporary[2][64]={0},result[2][64]={0};
 memcpy(supplied,bands,sizeof bands);
 for(unsigned k=0;k<4;k++)r.word[9+k]=(uint32_t)&filters[k];
 for(unsigned a=0;a<2;a++){r.word[18+a]=(uint32_t)result[a];r.word[20+a]=(uint32_t)temporary[a];r.word[23+a]=(uint32_t)rl[a];r.word[25+a]=(uint32_t)rm[a];}
 native_sweep_detect(&r,bands[0],n);
 for(unsigned k=9;k<=26;k++)r.word[k]=0;
 fwrite(&r,sizeof r,1,f);fwrite(rl,sizeof rl,1,f);fwrite(rm,sizeof rm,1,f);
#else
 if(fread(&r,sizeof r,1,f)!=1||fread(rl,sizeof rl,1,f)!=1||fread(rm,sizeof rm,1,f)!=1)return 3;
#endif
 sweep_detect_envelopes(&s,bands,levels,memory,n);
 for(unsigned k=0;k<67;k++)if(s.word[k]!=r.word[k]){if(errors<8)fprintf(stderr,"state call%u word%u %08x != %08x\n",call,k,s.word[k],r.word[k]);errors++;}
 if(memcmp(memory,rm,sizeof rm)||memcmp(levels,rl,sizeof rl)){if(errors<8)fprintf(stderr,"buffers call%u\n",call);errors++;}
}
fclose(f);printf("{\"calls\":18000,\"mismatches\":%u}\n",errors);return errors?1:0;
}
