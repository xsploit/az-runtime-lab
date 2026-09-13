#define _GNU_SOURCE
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <assert.h>
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
int main(void){
 Display *d=XOpenDisplay(NULL);assert(d);int screen=DefaultScreen(d);assert(DefaultDepth(d,screen)==24);
 void *lib=dlopen("libX11.so.6",RTLD_NOW);assert(lib);
 int (*original)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned)=dlsym(lib,"XPutImage");assert(original);
 unsigned long compared=0;
 for(int k=0;k<100;k++){
  XImage src={0};src.width=67;src.height=31;src.depth=24;src.bits_per_pixel=24;
  src.format=ZPixmap;src.bitmap_unit=32;src.bitmap_pad=32;src.bytes_per_line=204;
  src.red_mask=0xff0000;src.green_mask=0xff00;src.blue_mask=0xff;
  src.data=malloc(204*31);assert(src.data);for(int j=0;j<204*31;j++)src.data[j]=(char)(j*73+k*17);assert(XInitImage(&src));
  Pixmap a=XCreatePixmap(d,RootWindow(d,screen),80,40,24),b=XCreatePixmap(d,RootWindow(d,screen),80,40,24);
  GC gc=XCreateGC(d,a,0,NULL);XSetForeground(d,gc,0x123456);XFillRectangle(d,a,gc,0,0,80,40);XFillRectangle(d,b,gc,0,0,80,40);
  if(k%2){XRectangle clip={8,5,53,24};XSetClipRectangles(d,gc,0,0,&clip,1,Unsorted);}
  int sx=k%13,sy=k%7;unsigned w=67-sx,h=31-sy;
  original(d,a,gc,&src,sx,sy,3,2,w,h);XPutImage(d,b,gc,&src,sx,sy,3,2,w,h);
  XImage *aa=XGetImage(d,a,0,0,80,40,AllPlanes,ZPixmap),*bb=XGetImage(d,b,0,0,80,40,AllPlanes,ZPixmap);assert(aa&&bb);
  for(int y=0;y<40;y++)for(int x=0;x<80;x++){assert(XGetPixel(aa,x,y)==XGetPixel(bb,x,y));compared++;}
  XDestroyImage(aa);XDestroyImage(bb);XFreeGC(d,gc);XFreePixmap(d,a);XFreePixmap(d,b);free(src.data);
 }
 XCloseDisplay(d);dlclose(lib);printf("100 native-vs-shim uploads, %lu server pixels equal, including GC clipping\n",compared);
}
