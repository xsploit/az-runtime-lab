#include "pcm-template-allocation.h"
#include <errno.h>
#include <string.h>

void *pcm_template_allocate(struct pcm_store *store, size_t bytes,
                            uintptr_t caller, void *(*normal_malloc)(size_t)) {
    if (caller != UINT64_C(0x777b00)) return normal_malloc(bytes);
    /* Native clamp accepts 1..1048576 stereo frames, with two 8-byte guards.
     * Reject inconsistent sizes at this specific site rather than guessing. */
    if (bytes < 24 || bytes > ((size_t)1048576+2)*8 || bytes%8) {
        errno = EINVAL;
        return NULL;
    }
    int saved_errno = errno;
    if (store->arena && bytes == PCM_STORE_BYTES) {
        void *raw = pcm_store_take(store,bytes);
        if (raw) return raw; /* Template already contains guards: do not write. */
        errno = saved_errno;
    }
    void *raw = normal_malloc(bytes);
    if (raw) {
        memset(raw,0xaf,8);
        memset((unsigned char*)raw+bytes-8,0xef,8);
    }
    return raw;
}
