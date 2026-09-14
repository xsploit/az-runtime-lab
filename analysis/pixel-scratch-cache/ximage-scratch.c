/* Opt-in LD_PRELOAD shim: XPutImage consumes the temporary buffer synchronously.
 * Unsupported formats/rectangles and allocation failures retain native behavior.
 * No image is changed in place; concurrent calls own independent allocations.
 */
#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include "scratch-cache.h"
#define malloc lab_scratch_alloc
#define free lab_scratch_free
#include "ximage-packed24.h"
#undef malloc
#undef free
int XPutImage(Display *d,Drawable drawable,GC gc,XImage *image,int sx,int sy,int dx,int dy,unsigned w,unsigned h){
 /* dlsym is thread-safe; avoid a racy lazy static and guest pthread ABI issues. */
 int (*real)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned)=dlsym(RTLD_NEXT,"XPutImage");
 if(!real){errno=ENOSYS;return 0;}
 XImage expanded;
 if(!lab_expand24(image,sx,sy,w,h,&expanded))return real(d,drawable,gc,image,sx,sy,dx,dy,w,h);
 int result=real(d,drawable,gc,&expanded,0,0,dx,dy,w,h);
 lab_scratch_free(expanded.data);return result;
}
