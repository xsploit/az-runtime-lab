/* Real-X-server differential test, creating only private pixmaps (no windows).
 * Compare complete results with original XPutImage under raster ops, plane
 * masks, source crops and destination clipping. Requires preload candidate.
 */
#define _GNU_SOURCE
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <assert.h>
#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
int main(void){
 Display *d=XOpenDisplay(NULL);assert(d);int screen=DefaultScreen(d);assert(DefaultDepth(d,screen)==24);
 void *lib=dlopen("libX11.so.6",RTLD_NOW);assert(lib);
 int (*original)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned)=dlsym(lib,"XPutImage");assert(original);
 assert(original!=XPutImage);uint64_t compared=0;unsigned tests=0;
 for(int k=0;k<320;k++){
  int large=k>=304,W=large?1280:83,H=large?800:47;
  XImage src={0};src.width=W;src.height=H;src.depth=24;src.bits_per_pixel=k%2?24:32;
  src.format=ZPixmap;src.bitmap_unit=32;src.bitmap_pad=32;src.bytes_per_line=(W*src.bits_per_pixel/8+3)&~3;
  src.red_mask=0xff0000;src.green_mask=0xff00;src.blue_mask=0xff;
  src.data=malloc((size_t)src.bytes_per_line*H);assert(src.data);
  for(int j=0;j<src.bytes_per_line*H;j++)src.data[j]=(char)(j*73+k*17+(j>>9));
  assert(XInitImage(&src));
  Pixmap a=XCreatePixmap(d,RootWindow(d,screen),W+8,H+8,24),b=XCreatePixmap(d,RootWindow(d,screen),W+8,H+8,24);
  GC gc=XCreateGC(d,a,0,NULL);assert(gc);
  XSetForeground(d,gc,0x123456);XFillRectangle(d,a,gc,0,0,W+8,H+8);XFillRectangle(d,b,gc,0,0,W+8,H+8);
  XSetFunction(d,gc,k%16);XSetPlaneMask(d,gc,k%3?AllPlanes:0x00a5ff);
  if(k%4){XRectangle clip[2]={{8,5,(unsigned short)(W/2),(unsigned short)(H-6)},{(short)(W*3/4),0,(unsigned short)(W/4), (unsigned short)H}};XSetClipRectangles(d,gc,k%7-3,k%5-2,clip,2,Unsorted);}
  int sx=k%13,sy=k%7,dx=k%9-3,dy=k%11-4;unsigned w=W-sx,h=H-sy;
  original(d,a,gc,&src,sx,sy,dx,dy,w,h);XPutImage(d,b,gc,&src,sx,sy,dx,dy,w,h);
  XImage *aa=XGetImage(d,a,0,0,W+8,H+8,AllPlanes,ZPixmap),*bb=XGetImage(d,b,0,0,W+8,H+8,AllPlanes,ZPixmap);assert(aa&&bb);
  for(int y=0;y<H+8;y++)for(int x=0;x<W+8;x++){
   if(XGetPixel(aa,x,y)!=XGetPixel(bb,x,y)){fprintf(stderr,"Mismatch case%d bits%d op%d x%d y%d\n",k,src.bits_per_pixel,k%16,x,y);abort();}compared++;
  }
  XDestroyImage(aa);XDestroyImage(bb);XFreeGC(d,gc);XFreePixmap(d,a);XFreePixmap(d,b);free(src.data);tests++;
 }
 XSync(d,False);assert(XPending(d)==0);XCloseDisplay(d);dlclose(lib);
 printf("{\"cases\":%u,\"server_pixels_equal\":%llu,\"raster_ops\":16,\"extra_events\":0}\n",tests,(unsigned long long)compared);
}
