/* Diagnostic-only C allocation tracing of the main executable's import slots.
 * Resolve originals before changing slots. No global malloc interposition,
 * no loader recursion, no allocator replacement. Supports three RELA imports
 * on one mapped page; preserves its original permissions. No file writes.
 */
#define _GNU_SOURCE
#include <link.h>
#include <dlfcn.h>
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <errno.h>
/* Use the legacy ABI available in the firmware, not host C23 redirection. */
extern int lab_sscanf(const char *,const char *,...) __asm__("sscanf");
struct record {uint64_t ready,kind,size,argument2,caller,result;};
struct record lab_c_alloc_events[512];
uint64_t lab_c_alloc_count,lab_c_trace_installed,lab_c_trace_error;
uint64_t lab_c_trace_page,lab_c_trace_permissions;
static void *(*original_malloc)(size_t),*(*original_calloc)(size_t,size_t);
static void *(*original_realloc)(void*,size_t);
static uintptr_t slots[3];
#define BIN_PREFIX lab_bin_c_
#include "allocation-bin-trace.h"
static void record(uint64_t kind,size_t n,uintptr_t extra,void *caller,void *result){
 record_bin(kind,n,caller,result);
 if(n<8u*1024u*1024u)return;
 uint64_t i=__atomic_fetch_add(&lab_c_alloc_count,1,__ATOMIC_RELAXED);
 if(i>=512)return;
 struct record *r=&lab_c_alloc_events[i];
 r->kind=kind;r->size=n;r->argument2=extra;r->caller=(uintptr_t)caller;r->result=(uintptr_t)result;
 __atomic_store_n(&r->ready,1,__ATOMIC_RELEASE);
}
#define CALLER __builtin_extract_return_addr(__builtin_return_address(0))
static void *trace_malloc(size_t n){void *r=original_malloc(n);record(1,n,0,CALLER,r);return r;}
static void *trace_calloc(size_t n,size_t s){void *r=original_calloc(n,s);record(2,s&&n>SIZE_MAX/s?SIZE_MAX:n*s,n,CALLER,r);return r;}
static void *trace_realloc(void *p,size_t n){void *r=original_realloc(p,n);record(3,n,(uintptr_t)p,CALLER,r);return r;}
static int locate(struct dl_phdr_info *info,size_t n,void *arg){
 (void)n;(void)arg;
 if(info->dlpi_name && *info->dlpi_name)return 0;
 ElfW(Dyn) *dynamic=NULL;
 for(unsigned i=0;i<info->dlpi_phnum;i++)if(info->dlpi_phdr[i].p_type==PT_DYNAMIC)
  dynamic=(void*)(info->dlpi_addr+info->dlpi_phdr[i].p_vaddr);
 if(!dynamic)return 1;
 ElfW(Rela) *rel=NULL;ElfW(Sym) *sym=NULL;const char *str=NULL;size_t bytes=0;long type=0;
 for(ElfW(Dyn)*d=dynamic;d->d_tag!=DT_NULL;d++){
  if(d->d_tag==DT_JMPREL)rel=(void*)d->d_un.d_ptr;
  if(d->d_tag==DT_PLTRELSZ)bytes=d->d_un.d_val;
  if(d->d_tag==DT_PLTREL)type=d->d_un.d_val;
  if(d->d_tag==DT_SYMTAB)sym=(void*)d->d_un.d_ptr;
  if(d->d_tag==DT_STRTAB)str=(void*)d->d_un.d_ptr;
 }
 if(!rel||!sym||!str||type!=DT_RELA||bytes%sizeof(*rel)||bytes>1024*1024)return 1;
 for(size_t i=0;i<bytes/sizeof(*rel);i++){
  const char *name=str+sym[ELF64_R_SYM(rel[i].r_info)].st_name;
  int k=strcmp(name,"calloc")==0?0:strcmp(name,"realloc")==0?1:strcmp(name,"malloc")==0?2:-1;
  if(k>=0)slots[k]=info->dlpi_addr+rel[i].r_offset;
 }
 return 1;
}
__attribute__((constructor)) static void install(void){
 original_malloc=dlsym(RTLD_DEFAULT,"malloc");original_calloc=dlsym(RTLD_DEFAULT,"calloc");original_realloc=dlsym(RTLD_DEFAULT,"realloc");
 if(!original_malloc||!original_calloc||!original_realloc){lab_c_trace_error=ENOENT;return;}
 dl_iterate_phdr(locate,NULL);
 long length=sysconf(_SC_PAGESIZE);
 if(length<=0 || (length&(length-1)) || !slots[0] || !slots[1] || !slots[2]){lab_c_trace_error=EINVAL;return;}
 uintptr_t page=slots[0]&~((uintptr_t)length-1);
 for(int i=0;i<3;i++)if((slots[i]&~((uintptr_t)length-1))!=page || slots[i]%sizeof(uintptr_t)){
  lab_c_trace_error=ENOTSUP;return;
 }
 FILE *maps=fopen("/proc/self/maps","r");if(!maps){lab_c_trace_error=errno;return;}
 char line[512],mode[5];unsigned long lo,hi;int permissions=0;
 while(fgets(line,sizeof(line),maps))if(lab_sscanf(line,"%lx-%lx %4s",&lo,&hi,mode)==3 && lo<=page && hi>=page+length){
  permissions=(mode[0]=='r'?PROT_READ:0)|(mode[1]=='w'?PROT_WRITE:0)|(mode[2]=='x'?PROT_EXEC:0);break;
 }
 fclose(maps);
 if(!(permissions&PROT_READ)){lab_c_trace_error=EACCES;return;}
 lab_c_trace_page=page;lab_c_trace_permissions=permissions;
 if(mprotect((void*)page,(size_t)length,permissions|PROT_WRITE)){lab_c_trace_error=errno;return;}
 __atomic_store_n((uintptr_t*)slots[0],(uintptr_t)trace_calloc,__ATOMIC_RELEASE);
 __atomic_store_n((uintptr_t*)slots[1],(uintptr_t)trace_realloc,__ATOMIC_RELEASE);
 __atomic_store_n((uintptr_t*)slots[2],(uintptr_t)trace_malloc,__ATOMIC_RELEASE);
 lab_c_trace_installed=7;
 if(mprotect((void*)page,(size_t)length,permissions))lab_c_trace_error=errno;
}
