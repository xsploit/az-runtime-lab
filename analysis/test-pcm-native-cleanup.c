/* Private laboratory harness: execute pinned firmware cleanup instructions
 * against real mapped PCM storage and real libc wrapper allocations.
 * Code files are supplied by run-pcm-native-cleanup.py, not distributed here.
 */
#define _GNU_SOURCE
#include "../shims/pcm-template-store.h"
#include <assert.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

struct event { unsigned kind; void *pointer; size_t size; int ownership; };
static struct event expected[16];
static unsigned expected_count, seen;
static struct pcm_store store;
static void expect(unsigned kind, void *p, size_t size, int ownership) {
    assert(expected_count < 16);
    expected[expected_count++] = (struct event){kind,p,size,ownership};
}
static void record(unsigned kind, void *p, size_t size, int ownership) {
    assert(seen < expected_count);
    struct event *e = &expected[seen++];
    assert(e->kind == kind && e->pointer == p && e->size == size && e->ownership == ownership);
}
static void dispatch_free(void *p) {
    if (!p) return;
    int owner = pcm_store_release(&store, p);
    assert(owner >= 0);
    record(1,p,0,owner);
    if (!owner) free(p);
}
static void dispatch_sized(void *p, size_t size) {
    record(2,p,size,0);
    free(p);
}
static void dispatch_array(void *p) {
    if (!p) return;
    record(3,p,0,0);
    free(p);
}
static void guard_failure(void) {
    /* Detect native guard branch only; do not emulate its assertion/logger. */
    _Exit(42);
}
static void jump(uintptr_t address, void (*target)(void)) {
    uint32_t instructions[2] = {0x58000050,0xd61f0200}; /* ldr x16,+8; br x16 */
    memcpy((void*)address,instructions,8);
    uintptr_t pointer = (uintptr_t)target;
    memcpy((void*)(address+8),&pointer,8);
}
static void map_code(uintptr_t address, const char *name) {
    void *p = mmap((void*)address,16384,PROT_READ|PROT_WRITE,
                  MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    assert(p == (void*)address);
    if (name) {
        FILE *f = fopen(name,"rb");
        assert(f && fread(p,1,16384,f) == 16384 && !fclose(f));
    }
}
static void executable(uintptr_t address) {
    __builtin___clear_cache((char*)address,(char*)address+16384);
    assert(!mprotect((void*)address,16384,PROT_READ|PROT_EXEC));
}
static void putptr(unsigned char *p, void *v) { memcpy(p,&v,8); }
static void put32(unsigned char *p, uint32_t v) { memcpy(p,&v,4); }

int main(int argc, char **argv) {
    assert(argc == 3 && sysconf(_SC_PAGESIZE) == 16384);
    unsigned variant = (unsigned)strtoul(argv[1],NULL,10);
    const char *kind = argv[2];
    assert(variant < 3);
    map_code(0x424000,NULL);
    map_code(0x768000,"destructors.bin");
    map_code(0x770000,"helper.bin");
    jump(0x424af0,(void(*)(void))dispatch_free);
    jump(0x426660,(void(*)(void))dispatch_sized);
    jump(0x424e50,(void(*)(void))dispatch_array);
    jump(0x768ca0,guard_failure);
    jump(0x76907c,guard_failure);
    jump(0x770658,guard_failure);
    executable(0x424000); executable(0x768000); executable(0x770000);
    assert(!pcm_store_init(&store,8));
    unsigned char *pool = calloc(1,344);
    assert(pool);
    void **vector = NULL;
    unsigned char *wrappers[3] = {0};
    void *raw[3] = {0};
    int owns[3] = {0};
    if (strcmp(kind,"empty")) {
        vector = calloc(4,sizeof(void*));
        assert(vector);
        putptr(pool+0x80,vector); put32(pool+0x88,4); put32(pool+0x90,4);
        for (unsigned i=0; i<3; ++i) {
            wrappers[i] = calloc(1,16);
            assert(wrappers[i]);
            vector[i ? i+1 : 0] = wrappers[i];
            put32(wrappers[i]+8,(!strcmp(kind,"zero") && i==1) ? 0 : 1764);
            if (!strcmp(kind,"null") && i==1) continue;
            if (!strcmp(kind,"mixed") && i==1) {
                raw[i] = malloc(PCM_STORE_BYTES);
                assert(raw[i]);
                memset(raw[i],0xaf,8);
                memset((char*)raw[i]+PCM_STORE_BYTES-8,0xef,8);
            } else {
                raw[i] = pcm_store_take(&store,PCM_STORE_BYTES);
                assert(raw[i]); owns[i] = 1;
            }
            putptr(wrappers[i],(char*)raw[i]+8);
            memset((char*)raw[i]+8,i+1,14112);
        }
        if (!strcmp(kind,"front")) ((char*)raw[0])[3] = 0;
        if (!strcmp(kind,"back")) ((char*)raw[0])[14124] = 0;
        for (int i=2; i>=0; --i) {
            if (raw[i]) expect(1,raw[i],0,owns[i]);
            expect(2,wrappers[i],16,0);
        }
        if (variant != 2) expect(1,vector,0,0);
    }
    if (variant == 0) expect(2,pool,344,0);
    uintptr_t entries[] = {0x768988,0x768d70,0x7704d8};
    ((void(*)(void*))entries[variant])(pool + (variant == 2 ? 0x80 : 0));
    assert(seen == expected_count && !atomic_load(&store.live));
    if (variant == 2) { assert(*(uint32_t*)(pool+0x90) == 0); free(vector); }
    if (variant != 0) free(pool);
    assert(!pcm_store_destroy(&store));
    assert(!munmap((void*)0x424000,16384));
    assert(!munmap((void*)0x768000,16384));
    assert(!munmap((void*)0x770000,16384));
    printf("{\"variant\":%u,\"case\":\"%s\",\"events\":%u,\"passed\":true}\n",variant,kind,seen);
}
