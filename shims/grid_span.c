/* Original replacement algorithm for the guarded, nonrepeating four-byte AZ
 * image span. No firmware bytes. Return 0 without writes for unsupported cases.
 * Exactly retains 8-bit subpixel weights, +128 rounding, alpha and edge clamping.
 */
#include "grid_span.h"
#ifndef LAB_ROUND
#define LAB_ROUND 128
#endif
#if defined(__aarch64__) && !defined(LAB_SCALAR)
#include <arm_neon.h>
#endif
static int bounded(float x) { return x >= -262144.f && x <= 262144.f; }
static void pixel(uint8_t *d,const uint8_t *s) { for(int c=0;c<4;c++)d[c]=s[c]; }
int lab_grid_span(LabFill *f,uint8_t *d,int x,int n) {
 if(n<=0 || n>8192 || !f || !d)return 0;
 if(f->inverse[0]!=1 || f->inverse[1]!=0 || f->inverse[3]!=0 || f->inverse[4]!=1 || f->offset!=.5f || f->offset_int!=-128 || (f->quality!=1 && f->quality!=2))return 0;
 const LabBitmap *s=f->src;
 if(!s || !s->data || s->pixel_stride!=4 || s->width<=0 || s->width>16384 || s->height<=0 || s->height>16384 || s->line_stride<s->width*4 || s->line_stride>1048576 || f->max_x!=s->width-1 || f->max_y!=s->height-1)return 0;
 uintptr_t begin=(uintptr_t)s->data,end=begin+(size_t)(s->height-1)*s->line_stride+(size_t)s->width*4;
 uintptr_t out=(uintptr_t)d,out_end=out+(size_t)n*4;
 if(end<begin || out_end<out || (out<end && begin<out_end))return 0;
 /* Match native SCVTF/FADD and transform operation ordering. No FMA needed for
  * exact unit diagonal/zero off-diagonal. Bounds also reject NaN/Inf. */
 float sx=(float)x+.5f, sy=(float)f->y+.5f;
 float ex=sx+(float)n;
 if(!bounded(sx)||!bounded(sy)||!bounded(ex)||!bounded(f->inverse[2])||!bounded(f->inverse[5]))return 0;
 sx=sx+f->inverse[2]; ex=ex+f->inverse[2]; sy=sy+f->inverse[5];
 if(!bounded(sx)||!bounded(ex)||!bounded(sy))return 0;
 int a=(int)(sx*256.f),b=(int)(ex*256.f),y=(int)(sy*256.f)-128;
 if(b-a!=n*256 || (y&255))return 0;
 a-=128; int source_x=a>>8, row=y>>8; unsigned frac=(unsigned)a&255;
 if(row<0)row=0;
 if(row>f->max_y)row=f->max_y;
 const uint8_t *line=s->data+(size_t)row*s->line_stride;
 int left=n;
 while(left && source_x<0){pixel(d,line);d+=4;source_x++;left--;}
 int inner=f->max_x-source_x;if(inner<0)inner=0;if(inner>left)inner=left;
 const uint8_t *p=line+(size_t)(source_x<0?0:source_x>f->max_x?f->max_x:source_x)*4;
 int run=inner;
#if defined(__aarch64__) && !defined(LAB_SCALAR)
 uint16x8_t w0=vdupq_n_u16((uint16_t)(256-frac)),w1=vdupq_n_u16((uint16_t)frac),round=vdupq_n_u16(LAB_ROUND);
 while(run>=4){
  uint8x16_t l=vld1q_u8(p),r=vld1q_u8(p+4);
  uint16x8_t lo=vaddq_u16(vmulq_u16(vmovl_u8(vget_low_u8(l)),w0),round);
  uint16x8_t hi=vaddq_u16(vmulq_u16(vmovl_u8(vget_high_u8(l)),w0),round);
  lo=vmlaq_u16(lo,vmovl_u8(vget_low_u8(r)),w1);
  hi=vmlaq_u16(hi,vmovl_u8(vget_high_u8(r)),w1);
  vst1q_u8(d,vcombine_u8(vshrn_n_u16(lo,8),vshrn_n_u16(hi,8)));
  p+=16;d+=16;run-=4;
 }
#endif
 while(run--){for(int c=0;c<4;c++)d[c]=(uint8_t)((p[c]*(256-frac)+p[c+4]*frac+LAB_ROUND)>>8);p+=4;d+=4;}
 left-=inner;
 while(left--){pixel(d,line+(size_t)f->max_x*4);d+=4;}
 /* The caller can observe interpolator fields after generate; preserve these,
  * too, rather than only reproducing the destination bytes. */
 f->bx=(LabBres){a+n*256,n,255,0,n};f->by=(LabBres){y,n,-1,0,n};
 return 1;
}
