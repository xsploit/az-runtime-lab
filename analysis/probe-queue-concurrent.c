/* Original AZ queue instructions; only operator-new call redirected to counted calloc.
   Four producers and one consumer; constructed queue. No proprietary code embedded in this source. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <string.h>
#include <pthread.h>
#include <sched.h>
#include <stdatomic.h>
static atomic_uint allocations;
static uint64_t queue[24];
static atomic_uint ready, go;
static int(*enqueue)(void*,void*)=(void*)0x22122d0;
static void *producer(void *arg) {
 uintptr_t id=(uintptr_t)arg;
 atomic_fetch_add(&ready,1);
 while(!atomic_load(&go))sched_yield();
 for(uintptr_t i=1;i<=50000;i++) {
  uintptr_t value=(id<<32)|i;
  if(!enqueue(queue,&value))abort();
 }
 return NULL;
}
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
 void*dummy=calloc(1,64);queue[0]=queue[8]=(uintptr_t)dummy;
 pthread_t threads[4];
 for(uintptr_t i=0;i<4;i++)if(pthread_create(&threads[i],NULL,producer,(void*)i))return 5;
 while(atomic_load(&ready)!=4)sched_yield();
 atomic_store(&go,1);
 unsigned next[4]={1,1,1,1};
 for(unsigned n=0;n<200000;) {
  uintptr_t value=0;
  if(!pop(queue,&value)){sched_yield();continue;}
  unsigned id=value>>32, seq=value&0xffffffff;
  if(id>=4||seq!=next[id]++)return 6;
  n++;
 }
 for(unsigned i=0;i<4;i++)if(pthread_join(threads[i],NULL)||next[i]!=50001)return 7;
 uintptr_t value=0;if(pop(queue,&value))return 8;
 printf("{\"producers\":4,\"consumers\":1,\"pushes\":200000,\"pops\":200000,\"growth_allocations\":%u,\"mismatches\":0}\n",atomic_load(&allocations));
 return 0;
}
