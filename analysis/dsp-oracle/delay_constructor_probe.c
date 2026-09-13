#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
uint32_t fixture_rate;
void fixture_string(void *p,const char *s){(void)p;(void)s;}
void fixture_destroy(void *p){(void)p;}
void *fixture_allocate(unsigned n){void *p=malloc(n);if(!p)abort();memset(p,0xa5,n);return p;}
void fixture_cleanup(void){abort();}
extern void delay_constructor(void*);
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
int main(void){
 unsigned rates[]={1,100,1000,44100,48000,96000,192000};
 printf("{\"cases\":[");
 for(unsigned k=0;k<sizeof rates/sizeof *rates;k++){
  fixture_rate=rates[k];uint32_t o[38];memset(o,0xa5,sizeof o);delay_constructor(o);
  if(o[1]!=fixture_rate||o[2]!=fixture_rate||o[8]!=0||o[9]!=500||o[10]!=4000||o[11]!=1||o[17]!=5||o[18]!=9||o[28]!=1||o[29]||o[30]||o[31]||o[32]!=1||(o[34]&255))return 1;
  printf("%s{\"rate\":%u,\"ramps\":[",k?",":"",fixture_rate);
  unsigned offsets[]={33,35,36,37};
  for(unsigned r=0;r<4;r++){
   uint32_t *p=(uint32_t*)o[offsets[r]];
   float ms=r==1?0x1.167e8cp+2f:0x1.aaaaaap+1f;
   float product=(float)fixture_rate*ms,frames=product/1000.0f;
   unsigned n=(unsigned)frames;if(!n)n=1;
   uint32_t value=r==2?bits(1):0;
   if(p[0]||p[1]||p[2]!=value||p[3]!=value||p[4]!=value||p[5]!=value||p[6]||p[7]!=n||p[8]!=bits(1.0f/n)||(p[9]&255)!=1)return 2;
   printf("%s{\"length\":%u,\"inverse_bits\":%u,\"value_bits\":%u}",r?",":"",p[7],p[8],value);free(p);
  }
  printf("]}");
 }
 puts("],\"passed\":true,\"scope\":\"Original constructor instructions with allocator/string fixtures; numeric/default fields only.\"}");return 0;
}
