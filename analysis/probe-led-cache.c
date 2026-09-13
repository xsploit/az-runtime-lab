/* Execute original AZ cache writer/readout. No player/device initialization. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
static int page(const char *path, uintptr_t address) {
 FILE *f=fopen(path,"rb"); if(!f)return 1;
 void *p=mmap((void*)address,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED,-1,0);
 if(p==MAP_FAILED)return 2;
 if(fread(p,1,4096,f)!=4096)return 3;
 fclose(f); if(mprotect(p,4096,PROT_READ|PROT_EXEC))return 4;
 __builtin___clear_cache(p,(char*)p+4096); return 0;
}
int main(int argc,char **argv) {
 if(argc!=3 || page(argv[1],0x21f0000) || page(argv[2],0x21ed000))return 2;
 unsigned char object[80] __attribute__((aligned(16)));
 int (*write_state)(void*,unsigned,void*,unsigned)=(void*)0x21f0020;
 uint64_t (*read_state)(void*)=(void*)0x21edba0;
 unsigned count=0;
 for(unsigned initial=0;initial<4;initial++)for(unsigned target=0;target<4;target++)
 for(unsigned changed=0;changed<2;changed++) {
  memset(object,0,sizeof object); object[48]=initial;
  uint32_t color=changed?0x12345678:0, metadata=changed?7:0;
  int result=write_state(object,target,&color,metadata);
  uint64_t readback=read_state(object);
  uint32_t cache_color,cache_metadata,encoded;
  memcpy(&cache_color,object+56,4);memcpy(&cache_metadata,object+52,4);memcpy(&encoded,object+60,4);
  if(result!=1 || object[48]!=target || (readback&255)!=target || cache_color!=color || cache_metadata!=metadata || encoded!=color)return 3;
  /* Repeat identical update to exercise the unchanged fast path. */
  if(write_state(object,target,&color,metadata)!=1 || (read_state(object)&255)!=target)return 4;
  count++;
 }
 printf("%u\n",count);return 0;
}
