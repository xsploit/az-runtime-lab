#ifndef GRID_SPAN_H
#define GRID_SPAN_H
#include <stdint.h>
#include <stddef.h>
typedef struct { int32_t n,steps,step,modulo,remainder; } LabBres;
typedef struct { uint8_t *data; int32_t format,line_stride,pixel_stride,width,height; } LabBitmap;
typedef struct {
 float inverse[6]; LabBres bx,by; float offset; int32_t offset_int;
 const LabBitmap *dest,*src; int32_t alpha,quality,max_x,max_y,y;
 void *line,*scratch; size_t scratch_size;
} LabFill;
_Static_assert(offsetof(LabFill,src)==0x50,"AZ source reference ABI");
_Static_assert(offsetof(LabFill,y)==0x68,"AZ current row ABI");
_Static_assert(offsetof(LabBitmap,pixel_stride)==0x10,"AZ pixel stride ABI");
int lab_grid_span(LabFill *,uint8_t *,int,int);
#endif
