/* Two independent X clients: upload changing frames to a private pixmap while
 * another reads a vertical strip. No user windows or desktop pixels touched.
 * Mixed generations demonstrate observable intermediate upload requests.
 */
#define _GNU_SOURCE
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <assert.h>
#include <dlfcn.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
typedef int(*put_fn)(Display*,Drawable,GC,XImage*,int,int,int,int,unsigned,unsigned);
struct state{Pixmap target;int height,width;atomic_int stop,ready;unsigned long reads,mixed;};
static double now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec*1e-9;}
static void *reader(void *arg){
 struct state *s=arg;Display *d=XOpenDisplay(NULL);assert(d);atomic_store(&s->ready,1);
 while(!atomic_load(&s->stop)){
  XImage *im=XGetImage(d,s->target,s->width/2,0,1,s->height,AllPlanes,ZPixmap);assert(im);
  unsigned long first=XGetPixel(im,0,0);int mixed=0;
  for(int y=1;y<s->height;y++)if(XGetPixel(im,0,y)!=first){mixed=1;break;}
  s->reads++;s->mixed+=mixed;XDestroyImage(im);
 }
 XCloseDisplay(d);return NULL;
}
static void run(Display *d,put_fn fn,const char *label,int W,int H){
 const int N=240;
 struct state s={.width=W,.height=H};s.target=XCreatePixmap(d,DefaultRootWindow(d),W,H,24);assert(s.target);
 GC gc=XCreateGC(d,s.target,0,NULL);XSetForeground(d,gc,0);XFillRectangle(d,s.target,gc,0,0,W,H);XSync(d,False);
 XImage *im=XCreateImage(d,DefaultVisual(d,DefaultScreen(d)),24,ZPixmap,0,NULL,W,H,32,0);assert(im&&im->bits_per_pixel==32);
 im->data=calloc(im->bytes_per_line,H);assert(im->data);
 pthread_t thread;assert(!pthread_create(&thread,NULL,reader,&s));while(!atomic_load(&s.ready))sched_yield();
 double start=now();
 for(int i=1;i<=N;i++){
  for(int y=0;y<H;y++){uint32_t *row=(uint32_t*)(im->data+y*im->bytes_per_line);for(int x=0;x<W;x++)row[x]=(unsigned)i*0x10101;}
  fn(d,s.target,gc,im,0,0,0,0,W,H);XSync(d,False);
 }
 double elapsed=now()-start;atomic_store(&s.stop,1);pthread_join(thread,NULL);
 printf("{\"phase\":\"%s\",\"uploads\":%d,\"seconds\":%.6f,\"reads\":%lu,\"mixed_generation_reads\":%lu,\"max_request_words\":%ld}\n",label,N,elapsed,s.reads,s.mixed,XMaxRequestSize(d));fflush(stdout);
 assert(s.reads>0);if(fn==XPutImage)assert(s.mixed==0);
 XDestroyImage(im);XFreeGC(d,gc);XFreePixmap(d,s.target);
}
int main(int argc,char **argv){
 int W=argc==3?atoi(argv[1]):1280,H=argc==3?atoi(argv[2]):800;
 assert(W>0 && W<=4096 && H>0 && H<=4096);
 assert(XInitThreads());Display *d=XOpenDisplay(NULL);assert(d);assert(DefaultDepth(d,DefaultScreen(d))==24);
 void *lib=dlopen("libX11.so.6",RTLD_NOW);assert(lib);put_fn original=dlsym(lib,"XPutImage");assert(original&&original!=XPutImage);
 run(d,original,"original",W,H);run(d,XPutImage,"staged-copy",W,H);run(d,original,"original-restored",W,H);XCloseDisplay(d);dlclose(lib);
}
