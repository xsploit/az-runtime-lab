/* Original AZ queue instructions; only operator-new call redirected to counted calloc.
   Single-threaded constructed queue. No proprietary code embedded in this source. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
static unsigned allocations;
static void *allocate(size_t n){if(n!=64)abort();allocations++;void*p=calloc(1,n);if(!p)abort();return p;}
int main(int argc,char**argv){
 if(argc!=2)return 2;
 FILE*f=fopen(argv[1],"rb");if(!f)return 2;
 unsigned char*p=mmap((void*)0x2212000,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
 if(p!=(void*)0x2212000 || fread(p,1,4096,f)!=4096)return 3;fclose(f);
 /* Replace only BL operator new with BL local trampoline, retaining original LR. */
 uint32_t bl=0x94000000|((0x2212f00-0x221244c)/4);
 memcpy(p+0x44c,&bl,4);
 uint32_t tramp[]={0x58000050,0xd61f0200}; /* ldr x16,pc+8; br x16 */
 memcpy(p+0xf00,tramp,8);uintptr_t addr=(uintptr_t)allocate;memcpy(p+0xf08,&addr,8);
 if(mprotect(p,4096,PROT_READ|PROT_EXEC))return 4;
 __builtin___clear_cache(p,(char*)p+4096);
 int(*push)(void*,void*)=(void*)0x22122d0;int(*pop)(void*,void*)=(void*)0x2212460;
 uint64_t q[24]={0};void*dummy=calloc(1,64);q[0]=q[8]=(uintptr_t)dummy;
 uintptr_t out=0; if(pop(q,&out))return 5;
 /* Exhaust empty reserve; duplicate payloads must each survive FIFO. */
 for(unsigned round=0;round<3;round++){
  for(uintptr_t i=0;i<3000;i++){uintptr_t value=i/3+1;if(!push(q,&value))return 6;}
  if(allocations!=3000)return 7;
  for(uintptr_t i=0;i<3000;i++){if(!pop(q,&out)||out!=i/3+1)return 8;}
  if(pop(q,&out))return 9;
 }
 printf("{\"pushes\":9000,\"pops\":9000,\"growth_allocations\":%u,\"rounds\":3,\"mismatches\":0}\n",allocations);
 return 0;
}
