/* Opt-in LD_PRELOAD shim, first in the chain: record every XPutImage the
 * player issues -- CLOCK_MONOTONIC start, call duration through the rest of
 * the chain (fast24 -> present -> libX11), rectangle and byte volume -- as one
 * line per call in the file named by LAB_XIMAGE_STATS. No behaviour change:
 * the call is forwarded unmodified. Output is fully buffered and flushed every
 * 32 records, so the cost per call is two clock reads and a formatted line.
 * Built with the Pi's native compiler: dlsym is pinned to its GLIBC_2.17
 * version so the object loads against the player's glibc 2.29.
 */
#define _GNU_SOURCE
#include <X11/Xlib.h>
#include <dlfcn.h>
#include <errno.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef LAB_OLD_DLSYM
__asm__(".symver dlsym,dlsym@GLIBC_2.17");
#endif
static int (*real)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned);
static FILE *out;static pthread_mutex_t mu=PTHREAD_MUTEX_INITIALIZER;static unsigned long records;
static void flush_at_exit(void)__attribute__((destructor));
static void flush_at_exit(void){if(out)fflush(out);}
int XPutImage(Display *d,Drawable drawable,GC gc,XImage *im,int sx,int sy,int dx,int dy,unsigned w,unsigned h){
 if(!real){real=dlsym(RTLD_NEXT,"XPutImage");if(!real){errno=ENOSYS;return 0;}}
 struct timespec a,b;clock_gettime(CLOCK_MONOTONIC,&a);
 int result=real(d,drawable,gc,im,sx,sy,dx,dy,w,h);
 clock_gettime(CLOCK_MONOTONIC,&b);
 const char *path=getenv("LAB_XIMAGE_STATS");if(!path||!*path)return result;
 pthread_mutex_lock(&mu);
 if(!out){out=fopen(path,"a");if(out)setvbuf(out,NULL,_IOFBF,1<<16);}
 if(out){
  int bpp=im?im->bits_per_pixel:0;
  fprintf(out,"%ld.%09ld %.6f %u %u %d %lu %lu\n",(long)a.tv_sec,a.tv_nsec,
          (double)(b.tv_sec-a.tv_sec)+(double)(b.tv_nsec-a.tv_nsec)/1e9,w,h,bpp,
          (unsigned long)w*h*(unsigned long)(bpp/8),(unsigned long)drawable);
  if((++records&31)==0)fflush(out);
 }
 pthread_mutex_unlock(&mu);
 return result;
}
