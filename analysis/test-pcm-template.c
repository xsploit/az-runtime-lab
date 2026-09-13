/* Synthetic experiment only: does not attach to or alter firmware processes. */
#define _GNU_SOURCE
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <time.h>
#include <unistd.h>

#ifndef PCM_TEST_COUNT
#define PCM_TEST_COUNT 512
#endif
#ifndef PCM_TEST_DIRTY
#define PCM_TEST_DIRTY 128
#endif
enum { SAMPLES = 1764, BYTES = (SAMPLES+2)*8,
       COUNT = PCM_TEST_COUNT, DIRTY = PCM_TEST_DIRTY };
_Static_assert(COUNT > 0 && DIRTY > 0 && DIRTY <= COUNT, "Invalid pool counts");
static const uint64_t FRONT = UINT64_C(0xafafafafafafafaf);
static const uint64_t BACK = UINT64_C(0xefefefefefefefef);
static unsigned long rss_before, pss_before;

static double seconds(void) {
    struct timespec t;
    assert(clock_gettime(CLOCK_MONOTONIC, &t) == 0);
    return t.tv_sec + t.tv_nsec*1e-9;
}

static void snapshot(const char *stage, double elapsed) {
    FILE *f = fopen("/proc/self/smaps_rollup", "r");
    assert(f);
    char line[256];
    unsigned long rss = 0, pss = 0;
    while (fgets(line, sizeof(line), f)) {
        (void)sscanf(line, "Rss: %lu kB", &rss);
        (void)sscanf(line, "Pss: %lu kB", &pss);
    }
    assert(fclose(f) == 0);
    unsigned long vmas = 0, pte = 0;
    f = fopen("/proc/self/maps", "r");
    assert(f);
    while (fgets(line, sizeof(line), f)) ++vmas;
    assert(fclose(f) == 0);
    f = fopen("/proc/self/status", "r");
    assert(f);
    while (fgets(line, sizeof(line), f)) (void)sscanf(line, "VmPTE: %lu kB", &pte);
    assert(fclose(f) == 0);
    struct rusage usage;
    assert(getrusage(RUSAGE_SELF, &usage) == 0);
    if (strcmp(stage, "baseline") == 0) { rss_before = rss; pss_before = pss; }
    printf("{\"stage\":\"%s\",\"rss_kib\":%lu,\"pss_kib\":%lu,"
           "\"rss_delta_kib\":%ld,\"pss_delta_kib\":%ld,\"seconds\":%.6f,"
           "\"vma_count\":%lu,\"pte_kib\":%lu,\"minor_faults\":%ld}\n",
           stage, rss, pss, (long)rss-(long)rss_before,
           (long)pss-(long)pss_before, elapsed, vmas, pte, usage.ru_minflt);
}

int main(void) {
    const size_t page = (size_t)sysconf(_SC_PAGESIZE);
    if (page != 16384) {
        fprintf(stderr, "This experiment requires the Pi's 16KiB kernel pages.\n");
        return 2;
    }
    assert(BYTES <= page);
    unsigned char *template = calloc(1, page);
    assert(template);
    memcpy(template, &FRONT, 8);
    memcpy(template+(SAMPLES+1)*8, &BACK, 8);
    const int fd = memfd_create("az-pcm-template-synthetic", MFD_CLOEXEC|MFD_ALLOW_SEALING);
    assert(fd >= 0);
    assert(write(fd, template, page) == (ssize_t)page);
    assert(fcntl(fd, F_ADD_SEALS, F_SEAL_WRITE|F_SEAL_GROW|F_SEAL_SHRINK|F_SEAL_SEAL) == 0);
    unsigned char *arena = mmap(NULL, COUNT*page, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    assert(arena != MAP_FAILED);
    printf("{\"page_bytes\":%zu,\"aliases\":%d,\"payload_bytes\":%d,\"written_aliases\":%d}\n",
           page, COUNT, SAMPLES*8, DIRTY);
    snapshot("baseline", 0);
    double t = seconds();
    for (unsigned i = 0; i < COUNT; ++i) {
        assert(mmap(arena+i*page, page, PROT_READ|PROT_WRITE,
                    MAP_PRIVATE|MAP_FIXED, fd, 0) == arena+i*page);
    }
    snapshot("views_mapped_unread", seconds()-t);
    t = seconds();
    for (unsigned i = 0; i < COUNT; ++i) {
        const uint64_t *p = (const uint64_t *)(arena+i*page);
        assert(p[0] == FRONT && p[SAMPLES+1] == BACK);
        for (unsigned j = 1; j <= SAMPLES; ++j) assert(p[j] == 0);
    }
    snapshot("shared_template_read", seconds()-t);
    t = seconds();
    for (unsigned i = 0; i < DIRTY; ++i) {
        uint64_t *p = (uint64_t *)(arena+i*page);
        for (unsigned j = 1; j <= SAMPLES; ++j) p[j] = ((uint64_t)i+1)<<32|j;
    }
    for (unsigned i = 0; i < COUNT; ++i) {
        const uint64_t *p = (const uint64_t *)(arena+i*page);
        assert(p[0] == FRONT && p[SAMPLES+1] == BACK);
        for (unsigned j = 1; j <= SAMPLES; ++j)
            assert(p[j] == (i < DIRTY ? ((uint64_t)i+1)<<32|j : 0));
    }
    snapshot("private_payload_write", seconds()-t);
    t = seconds();
    assert(madvise(arena, DIRTY*page, MADV_DONTNEED) == 0);
    for (unsigned i = 0; i < COUNT; ++i) {
        const uint64_t *p = (const uint64_t *)(arena+i*page);
        assert(p[0] == FRONT && p[SAMPLES+1] == BACK);
        for (unsigned j = 1; j <= SAMPLES; ++j) assert(p[j] == 0);
    }
    snapshot("recycled_template_read", seconds()-t);
    /* Control: the firmware currently rewrites guards at every construction.
       Even writing identical bytes causes private COW allocation. */
    t = seconds();
    for (unsigned i = 0; i < COUNT; ++i) {
        volatile uint64_t *p = (volatile uint64_t *)(arena+i*page);
        p[0] = FRONT;
        p[SAMPLES+1] = BACK;
    }
    snapshot("guard_rewrite_control", seconds()-t);
    assert(madvise(arena, COUNT*page, MADV_DONTNEED) == 0);
    for (unsigned i = 0; i < COUNT; ++i) {
        const uint64_t *p = (const uint64_t *)(arena+i*page);
        assert(p[0] == FRONT && p[SAMPLES+1] == BACK);
        for (unsigned j = 1; j <= SAMPLES; ++j) assert(p[j] == 0);
    }
    snapshot("control_recycled", seconds()-t);
    assert(munmap(arena, COUNT*page) == 0);
    assert(close(fd) == 0);
    free(template);
    puts("{\"passed\":true,\"scope\":\"Synthetic pages only; no AZ integration or audio timing verification\"}");
    return 0;
}
