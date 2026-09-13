/* Experimental rectangle-atomic XPutImage presentation for the private AZ lab.
 * Stage a supported ZPixmap rectangle offscreen, then issue one XCopyArea.
 * XPutImage may split a large upload across protocol requests. This prevents
 * readers/compositors seeing that rectangle between its upload requests; it
 * does not make separate dirty rectangles or physical scanout atomic.
 * Per-call resources avoid cross-thread/display cache lifetime assumptions.
 */
#define _GNU_SOURCE
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <dlfcn.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>
#include <stdlib.h>
int lab_present_enabled=1; /* Lab switch: change only with player threads stopped. */
unsigned long lab_present_uploads,lab_present_fallbacks;
int XPutImage(Display *d,Drawable drawable,GC gc,XImage *im,int sx,int sy,int dx,int dy,unsigned w,unsigned h){
 int (*real)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned)=dlsym(RTLD_NEXT,"XPutImage");
 if(!real){errno=ENOSYS;return 0;}
 if(!lab_present_enabled)return real(d,drawable,gc,im,sx,sy,dx,dy,w,h);
 if(!im || !im->data || im->format!=ZPixmap || im->depth!=24 ||
    (im->bits_per_pixel!=24 && im->bits_per_pixel!=32) || sx<0 || sy<0 ||
    im->width<=0 || im->height<=0 || !w || !h || w>16384 || h>16384 ||
    (uint64_t)w*h>16*1024*1024 || (unsigned)sx>(unsigned)im->width ||
    w>(unsigned)im->width-(unsigned)sx || (unsigned)sy>(unsigned)im->height ||
    h>(unsigned)im->height-(unsigned)sy){
  __atomic_fetch_add(&lab_present_fallbacks,1,__ATOMIC_RELAXED);
  return real(d,drawable,gc,im,sx,sy,dx,dy,w,h);
 }
 Pixmap stage=XCreatePixmap(d,drawable,w,h,24);
 if(!stage)return real(d,drawable,gc,im,sx,sy,dx,dy,w,h);
 XGCValues values={.graphics_exposures=False};
 GC upload=XCreateGC(d,stage,GCGraphicsExposures,&values);
 GC present=XCreateGC(d,drawable,GCGraphicsExposures,&values);
 if(!upload || !present){
  if(upload)XFreeGC(d,upload);
  if(present)XFreeGC(d,present);
  XFreePixmap(d,stage);
  return real(d,drawable,gc,im,sx,sy,dx,dy,w,h);
 }
 /* Preserve raster function, planes, clipping (including server-only clip
  * rectangles), and child-window behavior. Suppress extra NoExpose events
  * because XPutImage did not generate them. Never mutate the caller's GC.
  */
 XCopyGC(d,gc,GCFunction|GCPlaneMask|GCClipXOrigin|GCClipYOrigin|GCClipMask|GCSubwindowMode,present);
 __atomic_fetch_add(&lab_present_uploads,1,__ATOMIC_RELAXED);
 int result=real(d,stage,upload,im,sx,sy,0,0,w,h);
 XCopyArea(d,stage,drawable,present,0,0,w,h,dx,dy);
 XFreeGC(d,present);XFreeGC(d,upload);XFreePixmap(d,stage);
 return result;
}
