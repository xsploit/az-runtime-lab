/* Experimental storage only. No firmware hooks or automatic activation.
 * init/destroy require quiescence. take/release may run concurrently.
 * Slots are never reused; release is ownership retirement, NOT playback recycle.
 */
#ifndef PCM_TEMPLATE_STORE_H
#define PCM_TEMPLATE_STORE_H
#include <stddef.h>
#include <stdatomic.h>
enum { PCM_STORE_CAPACITY = 33850, PCM_STORE_BYTES = 14128 };
struct pcm_store {
    unsigned char *arena;
    size_t stride, capacity;
    _Atomic size_t next, live;
    _Atomic unsigned char active[PCM_STORE_CAPACITY];
};
/* Initialize a zero-initialized store. On error, leave it empty. */
int pcm_store_init(struct pcm_store *s, size_t count);
void *pcm_store_take(struct pcm_store *s, size_t bytes);
/* 0: external pointer (forward to original free); 1: successfully retired;
 * negative errno: owned but invalid/already retired (NEVER forward to free).
 * Null is external, matching libc free(NULL). */
int pcm_store_release(struct pcm_store *s, void *raw);
/* EBUSY while any slot is live; caller must join all users before destruction. */
int pcm_store_destroy(struct pcm_store *s);
#endif
