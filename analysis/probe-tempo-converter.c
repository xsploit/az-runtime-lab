/* Original converter execution; supplied code stays in temporary files. */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
typedef struct { uint64_t vt; uint32_t id; uint8_t initialized,pad[3]; float lo,hi; uint32_t cached_a,cached_b,filtered_b,filtered_a,threshold,adjust; } Adapter;
typedef struct {uint32_t valid,b,a;} Event;
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *want=(void*)0x216b000;
 void *p=mmap(want,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
 if(p==MAP_FAILED||p!=want)return 4;
 if(fread(p,1,8192,f)!=8192)return 5;
 fclose(f);if(mprotect(p,8192,PROT_READ|PROT_EXEC))return 6;
 __builtin___clear_cache(p,(char*)p+8192);
 float (*convert)(void*,void*)=(void*)0x216bff8;
 for(unsigned a=0;a<1024;a++){
  Adapter s={.lo=-1,.hi=1,.threshold=96,.adjust=48};Event e={1,512*64,a*64};
  printf("fresh,%u,%.9g\n",a,convert(&s,&e));
 }
 Adapter s={.lo=-1,.hi=1,.threshold=96,.adjust=48};
 unsigned seq[]={512,513,512,511,510,511,512,514,513,512};
 for(unsigned i=0;i<sizeof(seq)/sizeof(seq[0]);i++){
  Event e={1,512*64,seq[i]*64};float v=convert(&s,&e);
  printf("sequence,%u,%.9g\n",seq[i],v);
 }
 return 0;
}
