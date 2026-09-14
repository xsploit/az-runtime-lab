/* One bounded scratch allocation, leased until synchronous XPutImage returns.
 * Contention/reentrancy and oversized requests use ordinary private allocations.
 * No TLS or pthread ABI dependency; switch only with caller threads stopped.
 */
#ifndef LAB_SCRATCH_CACHE_H
#define LAB_SCRATCH_CACHE_H
#include <stdlib.h>
#include <stddef.h>
int lab_scratch_enabled=1;
unsigned long lab_scratch_hits,lab_scratch_allocations,lab_scratch_fallbacks;
static void *lab_scratch_data;
static size_t lab_scratch_capacity;
static int lab_scratch_busy;
static void *lab_scratch_alloc(size_t size){
 int expected=0;
 if(!lab_scratch_enabled || size>4u*1024u*1024u ||
    !__atomic_compare_exchange_n(&lab_scratch_busy,&expected,1,0,__ATOMIC_ACQUIRE,__ATOMIC_RELAXED)){
  __atomic_fetch_add(&lab_scratch_fallbacks,1,__ATOMIC_RELAXED);
  return malloc(size);
 }
 if(size>lab_scratch_capacity){
  void *data=malloc(size);
  if(!data){__atomic_store_n(&lab_scratch_busy,0,__ATOMIC_RELEASE);return NULL;}
  free(__atomic_load_n(&lab_scratch_data,__ATOMIC_RELAXED));
  __atomic_store_n(&lab_scratch_data,data,__ATOMIC_RELEASE);
  lab_scratch_capacity=size;
  __atomic_fetch_add(&lab_scratch_allocations,1,__ATOMIC_RELAXED);
 }else __atomic_fetch_add(&lab_scratch_hits,1,__ATOMIC_RELAXED);
 return __atomic_load_n(&lab_scratch_data,__ATOMIC_RELAXED);
}
static void lab_scratch_free(void *data){
 if(data && data==__atomic_load_n(&lab_scratch_data,__ATOMIC_ACQUIRE))
  __atomic_store_n(&lab_scratch_busy,0,__ATOMIC_RELEASE);
 else free(data);
}
/* Normal process/library teardown is quiescent. A still-borrowed allocation
 * belongs to its outstanding call and must not be freed by this destructor. */
__attribute__((destructor)) static void lab_scratch_destroy(void){
 int expected=0;
 if(__atomic_compare_exchange_n(&lab_scratch_busy,&expected,1,0,__ATOMIC_ACQUIRE,__ATOMIC_RELAXED)){
  free(__atomic_load_n(&lab_scratch_data,__ATOMIC_RELAXED));
  __atomic_store_n(&lab_scratch_data,NULL,__ATOMIC_RELEASE);
  lab_scratch_capacity=0;
  __atomic_store_n(&lab_scratch_busy,0,__ATOMIC_RELEASE);
 }
}
#endif
