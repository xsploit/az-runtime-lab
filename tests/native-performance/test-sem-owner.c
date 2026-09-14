#define _GNU_SOURCE
#include <assert.h>
#include <dlfcn.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/sem.h>
#include <unistd.h>

/* Synthetic ARM64 callers reproduce the checked call ABI, not player code.
 * All semaphores use IPC_PRIVATE and are removed by this test. */
union arg { int val; struct semid_ds *buf; unsigned short *array; };
static void area(uintptr_t at) {
    long page=sysconf(_SC_PAGESIZE); uintptr_t start=at & ~(uintptr_t)(page-1);
    assert(mmap((void*)start, page, PROT_READ|PROT_WRITE,
                MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE, -1, 0)==(void*)start);
}
static void executable(uintptr_t at) {
    long page=sysconf(_SC_PAGESIZE); uintptr_t start=at & ~(uintptr_t)(page-1);
    __builtin___clear_cache((char*)start,(char*)start+page);
    assert(mprotect((void*)start,page,PROT_READ|PROT_EXEC)==0);
}
static int check(int id, int should_work) {
    assert(id>=0); errno=0;
    int r=semctl(id,0,SETVAL,(union arg){.val=1});
    if (should_work) {
        assert(r==0); struct semid_ds ds;
        assert(semctl(id,0,IPC_STAT,(union arg){.buf=&ds})==0);
        assert((ds.sem_perm.mode&0777)==0600);
        struct sembuf down={0,-1,IPC_NOWAIT},up={0,1,IPC_NOWAIT};
        assert(semop(id,&down,1)==0); assert(semctl(id,0,GETVAL)==0);
        assert(semop(id,&up,1)==0); assert(semctl(id,0,GETVAL)==1);
    } else assert(r==-1 && errno==EACCES);
    assert(semctl(id,0,IPC_RMID)==0); return 1;
}
int main(void) {
    assert(geteuid()!=0);
    void *fn=dlsym(RTLD_DEFAULT,"semget");assert(fn);
    area(0x426fe0); area(0xe453ac);
    uint32_t stub[]={0x58000050,0xd61f0200};
    memcpy((void*)0x426fe0,stub,sizeof stub);memcpy((void*)0x426fe8,&fn,sizeof fn);
    uintptr_t sites[]={0xe453ac,0xe45448,0xe455ec};
    uint32_t branches[]={0x97d7870e,0x97d786e7,0x97d7867e};
    for(int i=0;i<3;i++) {
        uint32_t words[]={0xa9bf7bfd,0x910003fd,0x52804002,0x52800021,branches[i],0xa8c17bfd,0xd65f03c0};
        memcpy((void*)(sites[i]-20),words,sizeof words);
    }
    executable(0x426fe0);executable(0xe453ac);
    int cases=0;
    /* Unrecognized caller must retain the original permissions failure. */
    cases+=check(semget(IPC_PRIVATE,1,IPC_CREAT),0);
    for(int i=0;i<3;i++) {
        int (*call)(key_t)=(void*)(sites[i]-20);
        cases+=check(call(IPC_PRIVATE),1);
    }
    cases+=check(semget(IPC_PRIVATE,1,IPC_CREAT|0600),1);
    printf("PASS: %d native creation/permission/initialization/lock cases\n",cases);
}
