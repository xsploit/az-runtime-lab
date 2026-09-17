#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/sem.h>

/* Only the three verified AZ semaphore-creation call sites. Existing objects,
 * initial values, lock operations and all other callers remain native. */
static int guarded(uintptr_t ra) {
    uint32_t branch;
    switch (ra) {
    case 0xe453ac: branch = 0x97d7870e; break;
    case 0xe45448: branch = 0x97d786e7; break;
    case 0xe455ec: branch = 0x97d7867e; break;
    default: return 0;
    }
    const uint32_t *code = (const uint32_t *)(ra - 12);
    return code[0] == 0x52804002 && code[1] == 0x52800021 && code[2] == branch;
}

int semget(key_t key, int nsems, int flags) {
    /* Resolve per invocation: no mutable function-pointer initialization race.
     * These calls are not in the audio/render hot path. */
    int (*native)(key_t, int, int) = dlsym(RTLD_NEXT, "semget");
    if (!native) { errno = ENOSYS; return -1; }
    uintptr_t ra = (uintptr_t)__builtin_extract_return_addr(__builtin_return_address(0));
    int changed = nsems == 1 && flags == IPC_CREAT && guarded(ra);
    int result = native(key, nsems, changed ? flags | 0600 : flags);
    int saved = errno;
    if (changed)
        fprintf(stderr, "[lab-sem-owner] site=%lx mode=0600 result=%d errno=%d\n",
                (unsigned long)ra, result, result < 0 ? saved : 0);
    errno = saved;
    return result;
}
