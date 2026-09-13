#define _GNU_SOURCE
#include "pcm-template-store.h"
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

int pcm_store_init(struct pcm_store *s, size_t count) {
    if (s->arena) return EBUSY;
    if (!count || count > PCM_STORE_CAPACITY) return EINVAL;
    long page = sysconf(_SC_PAGESIZE);
    /* Host 4KiB and target Pi 16KiB supported for standalone tests. */
    if (page != 4096 && page != 16384) return ENOTSUP;
    const size_t stride = 16384, length = count * stride;
    unsigned char template[16384] = {0};
    memset(template, 0xaf, 8);
    memset(template + PCM_STORE_BYTES - 8, 0xef, 8);
    int fd = memfd_create("az-pcm-store-experiment", MFD_CLOEXEC|MFD_ALLOW_SEALING);
    if (fd < 0) return errno;
    int error = 0;
    size_t done = 0;
    while (done < stride) {
        ssize_t n = write(fd, template + done, stride - done);
        if (n < 0 && errno == EINTR) continue;
        if (n <= 0) { error = n < 0 ? errno : EIO; goto close_fd; }
        done += (size_t)n;
    }
    if (fcntl(fd, F_ADD_SEALS, F_SEAL_WRITE|F_SEAL_GROW|F_SEAL_SHRINK|F_SEAL_SEAL)) {
        error = errno; goto close_fd;
    }
    unsigned char *arena = mmap(NULL, length, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    if (arena == MAP_FAILED) { error = errno; goto close_fd; }
    for (size_t i = 0; i < count; ++i) {
#ifdef PCM_STORE_TEST_FAIL_MAP
        if (i == PCM_STORE_TEST_FAIL_MAP) {
            error = ENOMEM; munmap(arena, length); goto close_fd;
        }
#endif
        if (mmap(arena + i*stride, stride, PROT_READ|PROT_WRITE,
                 MAP_PRIVATE|MAP_FIXED, fd, 0) == MAP_FAILED) {
            error = errno; munmap(arena, length); goto close_fd;
        }
    }
    for (size_t i = 0; i < count; ++i) atomic_init(&s->active[i], 0);
    atomic_init(&s->next, 0);
    atomic_init(&s->live, 0);
    s->stride = stride;
    s->capacity = count;
    s->arena = arena;
close_fd:
    close(fd);
    return error;
}

void *pcm_store_take(struct pcm_store *s, size_t bytes) {
    if (!s->arena || bytes != PCM_STORE_BYTES) { errno = EINVAL; return NULL; }
    size_t i = atomic_load(&s->next);
    do {
        if (i >= s->capacity) { errno = ENOMEM; return NULL; }
    } while (!atomic_compare_exchange_weak(&s->next, &i, i + 1));
    atomic_fetch_add(&s->live, 1);
    atomic_store(&s->active[i], 1);
    return s->arena + i*s->stride;
}

int pcm_store_release(struct pcm_store *s, void *raw) {
    uintptr_t p = (uintptr_t)raw, base = (uintptr_t)s->arena;
    if (!s->arena || !raw || p < base || p-base >= s->capacity*s->stride) return 0;
    size_t offset = p-base;
    if (offset % s->stride) return -EINVAL;
    size_t i = offset/s->stride;
    if (!atomic_exchange(&s->active[i], 0)) return -EALREADY;
    atomic_fetch_sub(&s->live, 1);
    return 1;
}

int pcm_store_destroy(struct pcm_store *s) {
    if (!s->arena) return 0;
    if (atomic_load(&s->live)) return EBUSY;
    if (munmap(s->arena, s->capacity*s->stride)) return errno;
    s->arena = NULL;
    s->capacity = s->stride = 0;
    return 0;
}
