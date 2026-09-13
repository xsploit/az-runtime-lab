/* Private opt-in AZ1.30 experiment. Installs allocation/release imports and
 * guard-store omission together before main. No firmware file is modified.
 * Full source hash is checked by the launcher; this checks live ELF/imports
 * and instructions. Intentionally incompatible with main-allocation-trace.
 */
#define _GNU_SOURCE
#include "pcm-template-allocation.h"
#include <dlfcn.h>
#include <errno.h>
#include <link.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#ifndef __aarch64__
#error Native AArch64 only
#endif
extern int lab_sscanf(const char *,const char *,...) __asm__("sscanf");
struct pcm_store lab_pcm_store;
unsigned long lab_pcm_installed,lab_pcm_init_error,lab_pcm_allocations;
unsigned long lab_pcm_releases,lab_pcm_reallocations;
static void *(*normal_malloc)(size_t);
static void (*normal_free)(void*);
static void *(*normal_realloc)(void*,size_t);
static uintptr_t slots[3]; /* malloc,free,realloc */
static int valid_main;
static void fatal(void) {
    static const char message[]="[pcm-template] installation or ownership validation failed\n";
    (void)write(2,message,sizeof(message)-1);
    _exit(125);
}
static int owned(void *p) {
    uintptr_t a=(uintptr_t)p,b=(uintptr_t)lab_pcm_store.arena;
    if (!b || !p || a<b || a-b>=lab_pcm_store.capacity*lab_pcm_store.stride) return 0;
    if ((a-b)%lab_pcm_store.stride || !atomic_load(&lab_pcm_store.active[(a-b)/lab_pcm_store.stride])) fatal();
    return 1;
}
static void *hook_malloc(size_t n) {
    uintptr_t caller=(uintptr_t)__builtin_extract_return_addr(__builtin_return_address(0));
    if(caller==0x777b00) __atomic_fetch_add(&lab_pcm_allocations,1,__ATOMIC_RELAXED);
    return pcm_template_allocate(&lab_pcm_store,n,caller,normal_malloc);
}
static void hook_free(void *p) {
    int result=pcm_store_release(&lab_pcm_store,p);
    if(result<0) fatal();
    if(result) __atomic_fetch_add(&lab_pcm_releases,1,__ATOMIC_RELAXED);
    else normal_free(p);
}
static void *hook_realloc(void *p,size_t n) {
    if(!owned(p)) return normal_realloc(p,n);
    /* Ordinary realloc semantics for the raw requested bytes. This is an
     * ownership escape fallback, not a PCM capacity/guard-policy change. */
    __atomic_fetch_add(&lab_pcm_reallocations,1,__ATOMIC_RELAXED);
    if(!n) { hook_free(p); return NULL; }
    void *next=normal_malloc(n);
    if(!next) return NULL;
    memcpy(next,p,n<PCM_STORE_BYTES?n:PCM_STORE_BYTES);
    hook_free(p);
    return next;
}
static int locate(struct dl_phdr_info *info,size_t length,void *arg) {
    (void)length; (void)arg;
    if(info->dlpi_name && *info->dlpi_name) return 0;
    if(info->dlpi_addr) return 1; /* This pinned executable is ET_EXEC. */
    ElfW(Dyn) *dynamic=NULL;
    int guards=0,imports=0;
    for(unsigned i=0;i<info->dlpi_phnum;++i) {
        const ElfW(Phdr) *p=&info->dlpi_phdr[i];
        if(p->p_type==PT_DYNAMIC) dynamic=(void*)p->p_vaddr;
        if(p->p_type!=PT_LOAD) continue;
        if((p->p_flags&PF_X) && p->p_vaddr<=0x777afc && p->p_vaddr+p->p_memsz>=0x777b48) guards=1;
        if((p->p_flags&PF_R) && p->p_vaddr<=0x3b25368 && p->p_vaddr+p->p_memsz>=0x3b25908) imports=1;
    }
    if(!dynamic || !guards || !imports) return 1;
    ElfW(Rela) *rel=NULL; ElfW(Sym) *sym=NULL; const char *str=NULL;
    size_t bytes=0; long type=0;
    for(ElfW(Dyn)*d=dynamic;d->d_tag!=DT_NULL;++d) {
        if(d->d_tag==DT_JMPREL) rel=(void*)d->d_un.d_ptr;
        if(d->d_tag==DT_PLTRELSZ) bytes=d->d_un.d_val;
        if(d->d_tag==DT_PLTREL) type=d->d_un.d_val;
        if(d->d_tag==DT_SYMTAB) sym=(void*)d->d_un.d_ptr;
        if(d->d_tag==DT_STRTAB) str=(void*)d->d_un.d_ptr;
    }
    if(!rel || !sym || !str || type!=DT_RELA || bytes%sizeof(*rel) || bytes>1024*1024) return 1;
    for(size_t i=0;i<bytes/sizeof(*rel);++i) {
        const char *name=str+sym[ELF64_R_SYM(rel[i].r_info)].st_name;
        int k=!strcmp(name,"malloc")?0:!strcmp(name,"free")?1:!strcmp(name,"realloc")?2:-1;
        if(k>=0) {
            if(ELF64_R_TYPE(rel[i].r_info)!=R_AARCH64_JUMP_SLOT || slots[k]) return 1;
            slots[k]=rel[i].r_offset;
        }
    }
    valid_main=slots[0]==0x3b25900 && slots[1]==0x3b25690 && slots[2]==0x3b25368;
    return 1;
}
static int permissions(uintptr_t page,size_t length) {
    FILE *f=fopen("/proc/self/maps","r");
    if(!f) return -1;
    char line[512],mode[5]; unsigned long low,high; int result=-1;
    while(fgets(line,sizeof(line),f)) {
        if(lab_sscanf(line,"%lx-%lx %4s",&low,&high,mode)==3 && low<=page && high>=page+length) {
            result=(mode[0]=='r'?PROT_READ:0)|(mode[1]=='w'?PROT_WRITE:0)|(mode[2]=='x'?PROT_EXEC:0);
            break;
        }
    }
    fclose(f); return result;
}
__attribute__((constructor)) static void install(void) {
    const char *enable=getenv("LAB_AZ_PCM_TEMPLATE");
    if(!enable) return;
    /* LD_PRELOAD/env propagate into firmware shell/helper subprocesses.
     * They must remain ordinary programs; only EP147 is our patch target. */
    char executable[1024];
    ssize_t n=readlink("/proc/self/exe",executable,sizeof(executable)-1);
    if(n<0 || n>=(ssize_t)sizeof(executable)-1) fatal();
    executable[n]=0;
    const char *name=strrchr(executable,'/');
    if(strcmp(name?name+1:executable,"EP147")) return;
    if(strcmp(enable,"1") || sysconf(_SC_PAGESIZE)!=16384) fatal();
    dl_iterate_phdr(locate,NULL);
    if(!valid_main || *(uint32_t*)0x777b40!=0x293f0401 || *(uint32_t*)0x777b44!=0xf822d803) fatal();
    /* Verify exact malloc branch target, not only the following guards. */
    int32_t delta=(int32_t)(0x424fd0-0x777afc);
    if(*(uint32_t*)0x777afc!=(0x94000000u|(((uint32_t)(delta/4))&0x03ffffffu))) fatal();
    normal_malloc=dlsym(RTLD_DEFAULT,"malloc");
    normal_free=dlsym(RTLD_DEFAULT,"free");
    normal_realloc=dlsym(RTLD_DEFAULT,"realloc");
    if(!normal_malloc || !normal_free || !normal_realloc) fatal();
    lab_pcm_init_error=(unsigned long)pcm_store_init(&lab_pcm_store,PCM_STORE_CAPACITY);
    /* Init failure safely uses guarded normal allocations, preserving startup. */
    uintptr_t code=0x774000,got=0x3b24000;
    int cp=permissions(code,16384),gp=permissions(got,16384);
    if(cp!=(PROT_READ|PROT_EXEC) || gp<0 || !(gp&PROT_READ)) fatal();
    if(mprotect((void*)got,16384,gp|PROT_WRITE)) fatal();
    if(mprotect((void*)code,16384,cp|PROT_WRITE)) fatal();
    __atomic_store_n((uintptr_t*)slots[0],(uintptr_t)hook_malloc,__ATOMIC_RELEASE);
    __atomic_store_n((uintptr_t*)slots[1],(uintptr_t)hook_free,__ATOMIC_RELEASE);
    __atomic_store_n((uintptr_t*)slots[2],(uintptr_t)hook_realloc,__ATOMIC_RELEASE);
    *(uint32_t*)0x777b40=0xd503201f; *(uint32_t*)0x777b44=0xd503201f;
    __builtin___clear_cache((char*)0x777b40,(char*)0x777b48);
    if(mprotect((void*)code,16384,cp) || mprotect((void*)got,16384,gp)) fatal();
    lab_pcm_installed=1;
    static const char message[]="[pcm-template] coupled imports and guard stores installed\n";
    (void)write(2,message,sizeof(message)-1);
}
