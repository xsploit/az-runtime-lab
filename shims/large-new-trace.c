/* Opt-in C++ allocation call log. Forward all calls unchanged via RTLD_NEXT.
 * Only C++ new is interposed: dynamic-loader C allocation is not intercepted,
 * avoiding malloc/dlsym recursion. The ring records returned calls >=8MiB,
 * including null returns, not exceptions or a live allocation inventory.
 * Build with unwind tables so exceptions can cross the C forwarding frames.
 */
#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#define LIMIT 512
struct event { uint64_t ready, kind, size, argument2, caller, result; };
struct event lab_alloc_events[LIMIT];
uint64_t lab_alloc_count;
#define BIN_PREFIX lab_bin_new_
#include "allocation-bin-trace.h"
static void record(uint64_t kind,size_t size,void *caller,void *result) {
 record_bin(kind,size,caller,result);
 if(size<8u*1024u*1024u)return;
 uint64_t n=__atomic_fetch_add(&lab_alloc_count,1,__ATOMIC_RELAXED);
 if(n>=LIMIT)return;
 struct event *e=&lab_alloc_events[n];
 e->kind=kind;e->size=size;e->argument2=0;e->caller=(uintptr_t)caller;e->result=(uintptr_t)result;
 __atomic_store_n(&e->ready,1,__ATOMIC_RELEASE);
}
#define CALLER __builtin_extract_return_addr(__builtin_return_address(0))
#define NEW(name,kind_) \
 void *name(size_t size) { \
  static void *(*cached)(size_t); \
  void *(*next)(size_t)=__atomic_load_n(&cached,__ATOMIC_ACQUIRE); \
  if(!next){next=dlsym(RTLD_NEXT,#name);__atomic_store_n(&cached,next,__ATOMIC_RELEASE);} \
  if(!next)abort(); \
  void *r=next(size);record(kind_,size,CALLER,r);return r; }
#define NEW_NT(name,kind_) \
 void *name(size_t size,void *tag) { \
  static void *(*cached)(size_t,void*); \
  void *(*next)(size_t,void*)=__atomic_load_n(&cached,__ATOMIC_ACQUIRE); \
  if(!next){next=dlsym(RTLD_NEXT,#name);__atomic_store_n(&cached,next,__ATOMIC_RELEASE);} \
  if(!next)abort(); \
  void *r=next(size,tag);record(kind_,size,CALLER,r);return r; }
NEW(_Znwm,4)
NEW(_Znam,5)
NEW_NT(_ZnwmRKSt9nothrow_t,6)
NEW_NT(_ZnamRKSt9nothrow_t,7)
