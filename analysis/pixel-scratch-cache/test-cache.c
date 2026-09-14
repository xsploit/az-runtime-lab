#include <assert.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "scratch-cache.h"
static void *worker(void *arg){
 uintptr_t n=(uintptr_t)arg;
 for(int i=0;i<5000;i++){
  size_t size=1+(i*73+n*431)%8192;unsigned char *a=lab_scratch_alloc(size);assert(a);
  memset(a,(unsigned char)n,size);
  /* A nested borrow must never alias an outstanding allocation. */
  unsigned char *b=lab_scratch_alloc(103);assert(b && b!=a);memset(b,99,103);
  for(size_t j=0;j<size;j++)assert(a[j]==(unsigned char)n);
  lab_scratch_free(b);lab_scratch_free(a);
 }
 return NULL;
}
int main(void){
 pthread_t threads[8];for(uintptr_t i=0;i<8;i++)assert(!pthread_create(&threads[i],NULL,worker,(void*)(i+1)));
 for(int i=0;i<8;i++)assert(!pthread_join(threads[i],NULL));
 void *big=lab_scratch_alloc(4u*1024u*1024u+1);assert(big);lab_scratch_free(big);
 lab_scratch_enabled=0;void *p=lab_scratch_alloc(99);assert(p);lab_scratch_free(p);lab_scratch_enabled=1;
 assert(!lab_scratch_busy);assert(lab_scratch_capacity<=4u*1024u*1024u);
 printf("eight threads, 40000 nested leases, oversized and disabled paths passed; retained=%zu hits=%lu fallbacks=%lu\n",lab_scratch_capacity,lab_scratch_hits,lab_scratch_fallbacks);
}
