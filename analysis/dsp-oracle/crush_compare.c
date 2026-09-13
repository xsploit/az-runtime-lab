#include "crush.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stddef.h>
_Static_assert(sizeof(Crush)==152,"Crush ABI");
#ifndef HOST_REPLAY
extern void native_crush_color(Crush*),native_crush_parameter(Crush*),native_crush_init(Crush*),native_crush_execute(Crush*,const Stereo*,Stereo*,int);
static uint32_t vt[12];
#endif
static unsigned differences,checks;static uint32_t rng=1;
static float rnd(void){rng=rng*1664525u+1013904223u;return ((int)(rng>>16)-32768)/131072.0f;}
static void compare(const void *a,const void *b,size_t bytes,unsigned block,const char *name){const uint32_t *x=a,*y=b;for(unsigned i=0;i<bytes/4;i++){checks++;if(x[i]!=y[i]){if(differences<16)fprintf(stderr,"%s block%u word%u %08x != %08x\n",name,block,i,x[i],y[i]);differences++;}}}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE *f=fopen(argv[1],"rb");
#else
FILE *f=fopen(argv[1],"wb");vt[4]=(uint32_t)native_crush_init;vt[6]=(uint32_t)native_crush_color;vt[7]=(uint32_t)native_crush_parameter;
#endif
if(!f)return 2;
unsigned long frames=0;
for(unsigned scenario=0;scenario<8;scenario++){
Crush s={0},ref={0};s.rate=s.rate2=44100;s.inverse=1.0f/44100;s.position=1;s.color=s.parameter=.5f;s.dirty=1;ref=s;
#ifndef HOST_REPLAY
ref.vtable=(uint32_t)vt;
#endif
for(unsigned block=0;block<300;block++){
 if(block%3==0){s.color=(float)((int)((block*17+scenario*37)%300)-20)/255.9f;
#ifndef HOST_REPLAY
ref.color=s.color;native_crush_color(&ref);
#endif
crush_color(&s);}
 if(block%7==0){s.parameter=(float)((int)((block*13+scenario*29)%300)-20)/255.9f;
#ifndef HOST_REPLAY
ref.parameter=s.parameter;native_crush_parameter(&ref);
#endif
crush_parameter(&s);}
 if(block%59==0){s.dirty=1;
#ifndef HOST_REPLAY
ref.dirty=1;
#endif
}
 unsigned n=block%11==0?0:block%11==1?1:64;Stereo input[64],out[64],expected[64];for(unsigned i=0;i<n;i++)input[i]=(Stereo){rnd(),rnd()};if(block%13==0)memset(input,0,sizeof input);
#ifndef HOST_REPLAY
native_crush_execute(&ref,input,expected,n);uint32_t save=ref.vtable;ref.vtable=0;fwrite(&ref,sizeof ref,1,f);fwrite(expected,sizeof(Stereo),n,f);ref.vtable=save;
#else
if(fread(&ref,sizeof ref,1,f)!=1||fread(expected,sizeof(Stereo),n,f)!=n)return 2;
#endif
crush_execute(&s,input,out,n);frames+=n;Crush snap=ref;snap.vtable=0;compare(&s,&snap,sizeof s,block,"state");compare(out,expected,n*sizeof(Stereo),block,"audio");
}}
fclose(f);printf("{\"calls\":2400,\"frames\":%lu,\"words\":%u,\"mismatches\":%u}\n",frames,checks,differences);return differences?1:0;}
