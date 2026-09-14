/* Convert supported packed RGB image rectangles without changing pixel values. */
#ifndef LAB_XIMAGE_PACKED24_H
#define LAB_XIMAGE_PACKED24_H
#include <X11/Xlib.h>
#include <limits.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
static int lab_expand24(const XImage *src,int sx,int sy,unsigned w,unsigned h,XImage *dst){
 if(!src || !src->data || src->format!=ZPixmap || src->depth!=24 ||
    src->bits_per_pixel!=24 || src->byte_order!=LSBFirst || src->xoffset!=0 ||
    src->width<=0 || src->height<=0 || src->bytes_per_line<=0 ||
    sx<0 || sy<0 || !w || !h || w>INT_MAX/4 || h>INT_MAX ||
    (unsigned)sx>(unsigned)src->width || w>(unsigned)src->width-(unsigned)sx ||
    (unsigned)sy>(unsigned)src->height || h>(unsigned)src->height-(unsigned)sy ||
    (size_t)src->width*3>(size_t)src->bytes_per_line ||
    (size_t)h>SIZE_MAX/((size_t)w*4) ||
    (size_t)src->height>SIZE_MAX/(size_t)src->bytes_per_line) return 0;
 char *data=malloc((size_t)w*4*h);if(!data)return 0;
 *dst=*src;dst->width=(int)w;dst->height=(int)h;dst->data=data;
 dst->xoffset=0;dst->bits_per_pixel=32;dst->bytes_per_line=(int)w*4;
 dst->bitmap_unit=32;dst->bitmap_pad=32;dst->bitmap_bit_order=LSBFirst;
 for(unsigned y=0;y<h;y++){
  const unsigned char *p=(const unsigned char*)src->data+((size_t)sy+y)*src->bytes_per_line+(size_t)sx*3;
  unsigned char *q=(unsigned char*)data+(size_t)y*w*4;
  /* A four-byte load is valid only when another pixel remains in this row.
   * memcpy permits unaligned addresses without aliasing violations. Keep the
   * byte path for big-endian hosts; XImage byte order is separately validated.
   */
  unsigned x=0;
#if defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
  for(;x+1<w;x++){
   uint32_t pixel;memcpy(&pixel,p+(size_t)3*x,sizeof(pixel));
   pixel &= UINT32_C(0x00ffffff);
   memcpy(q+(size_t)4*x,&pixel,sizeof(pixel));
  }
#endif
  for(;x<w;x++){q[4*x]=p[3*x];q[4*x+1]=p[3*x+1];q[4*x+2]=p[3*x+2];q[4*x+3]=0;}
 }
 if(!XInitImage(dst)){free(data);return 0;}
 return 1;
}
#endif
