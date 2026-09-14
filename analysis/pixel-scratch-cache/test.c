#include <X11/Xutil.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include "scratch-cache.h"
#define malloc lab_scratch_alloc
#define free lab_scratch_free
#include "ximage-packed24.h"
#undef malloc
#undef free
static uint32_t rng=1234567;
static unsigned random32(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
int main(void){
 unsigned long pixels=0;
 for(int k=0;k<300;k++){
  XImage src={0},dst;src.width=1+random32()%257;src.height=1+random32()%67;
  src.format=ZPixmap;src.depth=24;src.bits_per_pixel=24;src.bitmap_unit=32;
  src.byte_order=LSBFirst;src.bitmap_bit_order=LSBFirst;src.bitmap_pad=32;
  src.bytes_per_line=((src.width*3+3)&~3)+(random32()%5)*4;
  src.red_mask=0xff0000;src.green_mask=0xff00;src.blue_mask=0xff;
  size_t size=(size_t)src.bytes_per_line*src.height;
  src.data=malloc(size);char *before=malloc(size);assert(src.data&&before);
  for(size_t i=0;i<size;i++)src.data[i]=(char)random32();
  memcpy(before,src.data,size);assert(XInitImage(&src));
  for(int j=0;j<10;j++){
   int sx=random32()%src.width,sy=random32()%src.height;
   unsigned w=1+random32()%(src.width-sx),h=1+random32()%(src.height-sy);
   assert(lab_expand24(&src,sx,sy,w,h,&dst));
   for(unsigned y=0;y<h;y++)for(unsigned x=0;x<w;x++){
    assert(XGetPixel(&src,sx+x,sy+y)==XGetPixel(&dst,x,y));pixels++;
   }
   assert(!memcmp(before,src.data,size));lab_scratch_free(dst.data);
  }
  assert(!lab_expand24(&src,-1,0,1,1,&dst));assert(!lab_expand24(&src,src.width,0,1,1,&dst));
  assert(!lab_expand24(&src,0,0,UINT_MAX,1,&dst));assert(!lab_expand24(&src,0,0,1,0,&dst));
  src.byte_order=MSBFirst;assert(!lab_expand24(&src,0,0,1,1,&dst));src.byte_order=LSBFirst;
  src.bits_per_pixel=32;assert(!lab_expand24(&src,0,0,1,1,&dst));
  free(before);free(src.data);
 }
 printf("3000 rectangles, %lu XGetPixel comparisons passed; source bytes unchanged\n",pixels);
}
