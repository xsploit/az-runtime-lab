/* Original AZ allocation/wrapper/guard block plus native owner cleanup.
 * Requires privately extracted, SHA-pinned code supplied by its Python runner.
 */
#define _GNU_SOURCE
#include "../shims/pcm-template-allocation.h"
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
static struct pcm_store store;
static unsigned malloc_calls, free_owned, free_heap, wrapper_frees, entry_calls;
static int malloc_failure;
static void *normal_malloc(size_t n) {
    ++malloc_calls;
    if (malloc_failure) { errno=ENOMEM; return NULL; }
    void *p=malloc(n);
    if (p) memset(p,0xcc,n);
    return p;
}
static void *allocate(size_t n) {
    uintptr_t caller=(uintptr_t)__builtin_extract_return_addr(__builtin_return_address(0));
    assert(caller==0x777b00);
    ++entry_calls;
    return pcm_template_allocate(&store,n,caller,normal_malloc);
}
static void release(void *p) {
    int owner=pcm_store_release(&store,p);
    assert(owner>=0 && p);
    if (owner) ++free_owned;
    else { ++free_heap; free(p); }
}
static void sized_release(void *p,size_t n) {
    assert(n==16 && p); ++wrapper_frees; free(p);
}
static void allocation_failed(void) { _Exit(43); }
static void guard_failed(void) { _Exit(42); }
extern void invoke_constructor(void *wrapper,unsigned samples);
extern void finish_constructor(void);
__asm__(
".text\n"
".global invoke_constructor\n"
"invoke_constructor:\n"
" stp x29,x30,[sp,#-256]!\n"
" stp x23,x26,[sp,#16]\n"
" str x28,[sp,#32]\n"
" mov x23,x0\n"
" mov w0,w1\n"
" ldr x16,=0x777ae8\n"
" br x16\n"
".global finish_constructor\n"
"finish_constructor:\n"
" ldp x23,x26,[sp,#16]\n"
" ldr x28,[sp,#32]\n"
" ldp x29,x30,[sp],#256\n"
" ret\n"
);
static void map_code(uintptr_t a,const char *name) {
    void *p=mmap((void*)a,16384,PROT_READ|PROT_WRITE,
                 MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    assert(p==(void*)a);
    if(name) {
        FILE *f=fopen(name,"rb");
        assert(f && fread(p,1,16384,f)==16384 && !fclose(f));
    }
}
static void jump(uintptr_t a,void (*target)(void)) {
    uint32_t op[]={0x58000050,0xd61f0200};
    uintptr_t p=(uintptr_t)target;
    memcpy((void*)a,op,8); memcpy((void*)(a+8),&p,8);
}
static void executable(uintptr_t a) {
    __builtin___clear_cache((char*)a,(char*)a+16384);
    assert(!mprotect((void*)a,16384,PROT_READ|PROT_EXEC));
}
static int file_backed(void *p) {
    uint64_t value=0;
    int fd=open("/proc/self/pagemap",O_RDONLY|O_CLOEXEC);
    assert(fd>=0);
    assert(pread(fd,&value,8,(uintptr_t)p/16384*8)==8 && !close(fd));
    assert(value & (UINT64_C(1)<<63)); /* present after guard/data reads */
    return !!(value & (UINT64_C(1)<<61));
}
int main(int argc,char **argv) {
    assert(argc==3 && sysconf(_SC_PAGESIZE)==16384);
    int patched=atoi(argv[1]);
    assert(patched==0 || patched==1);
    const char *kind=argv[2];
    map_code(0x424000,NULL);
    map_code(0x76c000,"wrapper.bin");
    map_code(0x770000,"helper.bin");
    map_code(0x774000,"constructor.bin");
    jump(0x424fd0,(void(*)(void))allocate);
    jump(0x424af0,(void(*)(void))release);
    jump(0x426660,(void(*)(void))sized_release);
    jump(0x777b48,finish_constructor);
    jump(0x777f30,allocation_failed);
    jump(0x770658,guard_failed);
    if(patched) {
        uint32_t nop=0xd503201f;
        memcpy((void*)0x777b40,&nop,4); memcpy((void*)0x777b44,&nop,4);
    }
    executable(0x424000); executable(0x76c000); executable(0x770000); executable(0x774000);
    if(!strcmp(kind,"shared")) assert(!pcm_store_init(&store,4));
    if(!strcmp(kind,"exhausted")) assert(!pcm_store_init(&store,1));
    if(!strcmp(kind,"failure")) malloc_failure=1;
    void **vector=calloc(3,sizeof(void*));
    assert(vector);
    unsigned mapped=0, file_pages=0;
    for(unsigned i=0;i<3;++i) {
        unsigned samples=1764;
        if(!strcmp(kind,"variable")) { unsigned s[]={1,1763,1048576}; samples=s[i]; }
        unsigned char *wrapper=calloc(1,16);
        assert(wrapper); vector[i]=wrapper;
        invoke_constructor(wrapper,samples);
        void *payload=NULL; uint32_t count=0;
        memcpy(&payload,wrapper,8); memcpy(&count,wrapper+8,4);
        assert(payload && count==samples);
        unsigned char *raw=(unsigned char*)payload-8;
        int owned=store.arena && (uintptr_t)raw>=(uintptr_t)store.arena &&
            (uintptr_t)raw-(uintptr_t)store.arena<store.capacity*store.stride;
        size_t bytes=((size_t)samples+2)*8;
        for(size_t j=0;j<bytes;++j) assert(raw[j]==(j<8?0xaf:j>=bytes-8?0xef:owned?0:0xcc));
        if(owned) { ++mapped; file_pages+=file_backed(raw); }
    }
    assert(entry_calls==3 && malloc_calls==3-mapped);
    unsigned expected_mapped=!strcmp(kind,"shared")?3:!strcmp(kind,"exhausted")?1:0;
    assert(mapped==expected_mapped && file_pages==(patched?mapped:0));
    unsigned char owner[24]={0};
    uint32_t count=3;
    memcpy(owner,&vector,8); memcpy(owner+8,&count,4); memcpy(owner+16,&count,4);
    ((void(*)(void*))0x7704d8)(owner);
    memcpy(&count,owner+16,4);
    assert(!count && free_owned==mapped && free_heap==3-mapped && wrapper_frees==3);
    free(vector);
    assert(!atomic_load(&store.live) && !pcm_store_destroy(&store));
    assert(!munmap((void*)0x424000,16384)); assert(!munmap((void*)0x76c000,16384));
    assert(!munmap((void*)0x770000,16384)); assert(!munmap((void*)0x774000,16384));
    printf("{\"passed\":true,\"patched\":%d,\"case\":\"%s\",\"mapped\":%u,"
           "\"shared_file_pages_after_constructor\":%u,\"heap_fallbacks\":%u}\n",
           patched,kind,mapped,file_pages,malloc_calls);
}
