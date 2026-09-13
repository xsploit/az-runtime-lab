/* Compile-time opt-in counts for requests mapping to the 14,336-byte bin.
 * No allocation, I/O, stack unwinding or allocator calls in the recorder.
 * Historical returned-call counts, never a live-object inventory.
 * BIN_PREFIX must uniquely name each DSO's exported diagnostic symbols.
 */
#ifndef LAB_TRACE_SMALL_BIN
#define LAB_TRACE_SMALL_BIN 0
#endif
#if LAB_TRACE_SMALL_BIN
#define LAB_JOIN_INNER(a,b) a##b
#define LAB_JOIN(a,b) LAB_JOIN_INNER(a,b)
#define BIN_NAME(n) LAB_JOIN(BIN_PREFIX,n)
struct bin_event {uint64_t caller,size,kind,count,success,failed,first_result,last_result;};
struct bin_event BIN_NAME(events)[256];
uint64_t BIN_NAME(sequence),BIN_NAME(used),BIN_NAME(overflow);
static unsigned bin_busy;
static void record_bin(uint64_t kind,size_t size,void *caller,void *result) {
 if(size<=12288 || size>14336)return;
 while(__atomic_exchange_n(&bin_busy,1,__ATOMIC_ACQUIRE)){}
 __atomic_fetch_add(&BIN_NAME(sequence),1,__ATOMIC_SEQ_CST);
 uint64_t used=BIN_NAME(used),i;
 for(i=0;i<used;i++) {
  struct bin_event *r=&BIN_NAME(events)[i];
  if(r->caller==(uintptr_t)caller && r->size==size && r->kind==kind)break;
 }
 if(i==256)BIN_NAME(overflow)++;
 else {
  struct bin_event *r=&BIN_NAME(events)[i];
  if(i==used){r->caller=(uintptr_t)caller;r->size=size;r->kind=kind;r->first_result=(uintptr_t)result;BIN_NAME(used)=used+1;}
  r->count++;if(result)r->success++;else r->failed++;
  r->last_result=(uintptr_t)result;
 }
 __atomic_fetch_add(&BIN_NAME(sequence),1,__ATOMIC_SEQ_CST);
 __atomic_store_n(&bin_busy,0,__ATOMIC_RELEASE);
}
#else
#define record_bin(kind,size,caller,result) ((void)0)
#endif
