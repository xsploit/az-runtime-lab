#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
typedef struct {unsigned char bytes[48];} Result;
typedef Result (*Convert)(void *, void *);
static float f32(void *p){float f;memcpy(&f,p,4);return f;}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 int fd=open(argv[1],O_RDONLY);if(fd<0)return 3;
 void *code=mmap(0,16384,PROT_READ|PROT_EXEC,MAP_PRIVATE,fd,0);close(fd);if(code==MAP_FAILED)return 4;
 Convert cv=(Convert)((char*)code+0xb8);unsigned char state[16]={0},in[32]={0};
 uint32_t rng=12345;unsigned prev=0;
 for(int i=0;i<10000;i++){
  rng=rng*1664525+1013904223;uint16_t count=rng>>16;
  rng=rng*1664525+1013904223;uint16_t period=1+(rng>>16)%65535;
  in[4]=i&1;in[5]=(i>>1)&1;in[6]=(i>>2)&1;
  memcpy(in,&period,2);memcpy(in+2,&count,2);
  Result out=cv(state,in);int d=(int16_t)(uint16_t)(count-prev);prev=count;
  float c;uint32_t bits=0x440ae38e;memcpy(&c,&bits,4);
  float speed=period==65535?0:c/period;if(!in[5])speed=-speed;
  if(out.bytes[0]!=in[4]||fabsf(f32(out.bytes+16)-d/3240.f)>1e-7f||fabsf(f32(out.bytes+8)-speed)>1e-6f||out.bytes[20]!=in[5]||out.bytes[21]!=in[6]){fprintf(stderr,"Mismatch %d\n",i);return 5;}
 }
 puts("PASS: 10000 original ARM64 jog conversions: touch, signed counter wrap, speed, direction, extra flag");
 munmap(code,16384);return 0;
}
