#include "dubecho.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#ifndef HOST_REPLAY
extern void native_dub_color(DubEcho*),native_dub_parameter(DubEcho*),native_dub_calculate(DubEcho*),native_dub_inner(DubEcho*),native_dub_feedback(DubEcho*);
extern int native_dub_on(DubEcho*),native_dub_off(DubEcho*);
#endif
static unsigned seed=813923;
static unsigned rnd(void){seed=seed*1664525u+1013904223u;return seed;}
int main(int argc,char **argv){if(argc!=2)return 2;
#ifdef HOST_REPLAY
FILE*f=fopen(argv[1],"rb");
#else
FILE*f=fopen(argv[1],"wb");
#endif
if(!f)return 2;
DubEcho s={{0}},r;unsigned errors=0;
for(unsigned call=0;call<32000;call++){
 dub_put_float(&s,28,(float)(rnd()%256)/255);dub_put_float(&s,32,(float)(rnd()%10001)/10000);
 unsigned op=call%7;
 if(call%13==0){unsigned char*b=(void*)&s;b[161]=b[162]=0;dub_put_float(&s,88,dub_float(&s,92));dub_put_float(&s,96,dub_float(&s,100));}
 if(call%97==0)s.word[9]=rnd()%4;
 r=s;int ret=0,expected=0;
#ifndef HOST_REPLAY
 switch(op){case 0:native_dub_color(&r);break;case 1:native_dub_inner(&r);break;case 2:native_dub_parameter(&r);break;case 3:native_dub_feedback(&r);break;case 4:native_dub_calculate(&r);break;case 5:expected=native_dub_on(&r);break;case 6:expected=native_dub_off(&r);break;}
 fwrite(&r,sizeof r,1,f);fwrite(&expected,sizeof expected,1,f);
#else
 if(fread(&r,sizeof r,1,f)!=1||fread(&expected,sizeof expected,1,f)!=1)return 3;
#endif
 switch(op){case 0:dub_color(&s);break;case 1:dub_calculate_inner(&s);break;case 2:dub_parameter(&s);break;case 3:dub_feedback(&s);break;case 4:dub_calculate(&s);break;case 5:ret=dub_on(&s);break;case 6:ret=dub_off(&s);break;}
 for(unsigned k=0;k<44;k++)if(s.word[k]!=r.word[k]){if(errors<10)fprintf(stderr,"call%u op%u word%u %08x != %08x\n",call,op,k,s.word[k],r.word[k]);errors++;}
 if(ret!=expected)errors++;
}
fclose(f);printf("{\"calls\":32000,\"state_words\":1408000,\"mismatches\":%u}\n",errors);return errors?1:0;
}
