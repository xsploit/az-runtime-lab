/* Opt-in lab telemetry. Samples on an ordinary drawing thread, never from a
 * signal handler or a debugger inferior call with allocator threads stopped.
 * No allocator tuning, purge, flush, or firmware changes. Requests are data
 * symbols changed only while debugger threads are stopped; JSON is read with
 * a stable even sequence and bounded length. Unsupported stats are explicit.
 */
#define _GNU_SOURCE
#include <X11/Xlib.h>
#include <dlfcn.h>
#include <errno.h>
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <time.h>

#define CAPACITY (1024u * 1024u)
uint64_t lab_memory_request = 1, lab_memory_done;
uint64_t lab_memory_sequence, lab_memory_length, lab_memory_nanoseconds;
int lab_memory_error;
char lab_memory_json[CAPACITY];
static unsigned busy;

static void append(void *unused, const char *text) {
 (void)unused;
 size_t n = strlen(text);
 if (n > CAPACITY - 1 - lab_memory_length) {
  lab_memory_error = ENOSPC;
  return;
 }
 memcpy(lab_memory_json + lab_memory_length, text, n);
 lab_memory_length += n;
 lab_memory_json[lab_memory_length] = 0;
}

void lab_memory_sample(void) {
 uint64_t request = __atomic_load_n(&lab_memory_request, __ATOMIC_ACQUIRE);
 if (request == __atomic_load_n(&lab_memory_done, __ATOMIC_ACQUIRE)) return;
 if (__atomic_exchange_n(&busy, 1, __ATOMIC_ACQUIRE)) return;
 /* Another thread may have serviced this request before we took the lock. */
 if (request == __atomic_load_n(&lab_memory_done, __ATOMIC_ACQUIRE)) {
  __atomic_store_n(&busy, 0, __ATOMIC_RELEASE);
  return;
 }
 int saved_errno = errno;
 struct timespec start = {0}, end = {0};
 clock_gettime(CLOCK_MONOTONIC, &start);
 __atomic_fetch_add(&lab_memory_sequence, 1, __ATOMIC_SEQ_CST);
 lab_memory_length = 0; lab_memory_error = 0; lab_memory_json[0] = 0;
 void (*print_stats)(void (*)(void *, const char *), void *, const char *) =
  dlsym(RTLD_DEFAULT, "malloc_stats_print");
 /* JSON; omit individual arenas and mutex counters. Keep merged small-bin
  * and large-size-class counts for resident-allocation attribution. */
 if (print_stats) print_stats(append, NULL, "Jax");
 else lab_memory_error = ENOSYS;
 clock_gettime(CLOCK_MONOTONIC, &end);
 lab_memory_nanoseconds = (uint64_t)((end.tv_sec-start.tv_sec)*1000000000LL + end.tv_nsec-start.tv_nsec);
 __atomic_fetch_add(&lab_memory_sequence, 1, __ATOMIC_SEQ_CST);
 __atomic_store_n(&lab_memory_done, request, __ATOMIC_RELEASE);
 __atomic_store_n(&busy, 0, __ATOMIC_RELEASE);
 errno = saved_errno;
}

int XPutImage(Display *d, Drawable target, GC gc, XImage *image,
 int sx, int sy, int dx, int dy, unsigned w, unsigned h) {
 int (*next)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned) = dlsym(RTLD_NEXT,"XPutImage");
 if (!next) { errno=ENOSYS; return 0; }
 int result = next(d,target,gc,image,sx,sy,dx,dy,w,h);
 lab_memory_sample();
 return result;
}
