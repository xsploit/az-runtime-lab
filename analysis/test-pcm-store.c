#define _GNU_SOURCE
#include "../shims/pcm-template-store.h"
#include <assert.h>
#include <errno.h>
#include <dirent.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static struct pcm_store store;
static void *pages[PCM_STORE_CAPACITY];
static _Atomic unsigned winners;
static void *release_race(void *raw) {
    int result = pcm_store_release(&store, raw);
    assert(result == 1 || result == -EALREADY);
    if (result == 1) atomic_fetch_add(&winners, 1);
    return NULL;
}
#ifdef PCM_STORE_TEST_FAIL_MAP
static size_t mappings(void) {
    FILE *f = fopen("/proc/self/maps", "r");
    assert(f);
    char line[512]; size_t n = 0;
    while (fgets(line, sizeof(line), f)) ++n;
    assert(!fclose(f));
    return n;
}
static size_t descriptors(void) {
    DIR *d = opendir("/proc/self/fd");
    assert(d);
    size_t n = 0;
    while (readdir(d)) ++n;
    assert(!closedir(d));
    return n;
}
#endif
static void check(void *raw, uint64_t value) {
    uint64_t *p = raw;
    assert(p[0] == UINT64_C(0xafafafafafafafaf));
    assert(p[1765] == UINT64_C(0xefefefefefefefef));
    for (size_t i = 1; i <= 1764; ++i) assert(p[i] == value);
}
static void *worker(void *arg) {
    uintptr_t id = (uintptr_t)arg;
    for (size_t i = id; i < store.capacity; i += 4) {
        pages[i] = pcm_store_take(&store, PCM_STORE_BYTES);
        assert(pages[i]);
        check(pages[i], 0);
        uint64_t *p = pages[i];
        for (size_t j = 1; j <= 1764; ++j) p[j] = i + 1;
    }
    return NULL;
}
int main(void) {
    assert(pcm_store_init(&store, 0) == EINVAL);
    assert(pcm_store_init(&store, PCM_STORE_CAPACITY+1) == EINVAL);
#ifdef PCM_STORE_TEST_FAIL_MAP
    /* A partially mapped arena must be rolled back; no fd/VMA leak. */
    (void)mappings(); (void)descriptors(); /* warm stdio allocations */
    size_t before_maps = mappings(), before_fds = descriptors();
    for (int i = 0; i < 32; ++i) {
        assert(pcm_store_init(&store, 16) == ENOMEM);
        assert(!store.arena && !store.capacity);
        assert(pcm_store_destroy(&store) == 0);
    }
    assert(mappings() == before_maps && descriptors() == before_fds);
    puts("{\"passed\":true,\"scope\":\"injected partial mapping failure\"}");
    return 0;
#endif
    assert(pcm_store_init(&store, 512) == 0);
    assert(pcm_store_init(&store, 512) == EBUSY);
    assert(!pcm_store_take(&store, PCM_STORE_BYTES-1));
    assert(atomic_load(&store.next) == 0);
    pthread_t threads[4];
    for (uintptr_t i = 0; i < 4; ++i) assert(!pthread_create(&threads[i], NULL, worker, (void*)i));
    for (size_t i = 0; i < 4; ++i) assert(!pthread_join(threads[i], NULL));
    assert(atomic_load(&store.live) == 512);
    assert(!pcm_store_take(&store, PCM_STORE_BYTES));
    assert(pcm_store_destroy(&store) == EBUSY);
    void *external = malloc(16);
    assert(external && pcm_store_release(&store, external) == 0);
    free(external);
    assert(pcm_store_release(&store, NULL) == 0);
    assert(pcm_store_release(&store, store.arena + store.capacity*store.stride) == 0);
    for (size_t i = 512; i-- > 0;) {
        check(pages[i], i+1); /* detects aliasing across every concurrent write */
        assert(pcm_store_release(&store, (char*)pages[i]+8) == -EINVAL);
        assert(pcm_store_release(&store, (char*)pages[i]+16383) == -EINVAL);
        assert(pcm_store_release(&store, pages[i]) == 1);
        assert(pcm_store_release(&store, pages[i]) == -EALREADY);
    }
    assert(!atomic_load(&store.live));
    assert(!pcm_store_take(&store, PCM_STORE_BYTES)); /* retirement never reuses */
    assert(!pcm_store_destroy(&store));
    assert(!pcm_store_destroy(&store));
    assert(!pcm_store_init(&store, 8));
    void *p = pcm_store_take(&store, PCM_STORE_BYTES);
    assert(p);
    assert(pcm_store_release(&store, store.arena+store.stride) == -EALREADY);
    for (size_t i = 0; i < 4; ++i) assert(!pthread_create(&threads[i], NULL, release_race, p));
    for (size_t i = 0; i < 4; ++i) assert(!pthread_join(threads[i], NULL));
    assert(atomic_load(&winners) == 1 && !atomic_load(&store.live));
    assert(!pcm_store_destroy(&store));
    printf("{\"passed\":true,\"page_bytes\":%ld,\"threads\":4,\"slots\":512,"
           "\"scope\":\"standalone ownership and COW isolation; no firmware hooks\"}\n", sysconf(_SC_PAGESIZE));
}
