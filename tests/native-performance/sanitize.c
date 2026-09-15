#include "grid_span.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
int main(void){
 unsigned tests=0;
 for(int w=1;w<=4096;w=w<16?w+1:w*2){
  unsigned char *src=malloc((size_t)w*4),*dest=malloc(8192*4);
  for(int k=0;k<w*4;k++)src[k]=(unsigned char)(k*119);
  LabBitmap bm={src,2,w*4,4,w,1};
  for(int phase=0;phase<256;phase++)for(int side=-1;side<=1;side++){
   LabFill f={0};f.src=&bm;f.inverse[0]=f.inverse[4]=1;f.inverse[2]=(float)phase/256;f.offset=.5;f.offset_int=-128;f.quality=1;f.max_x=w-1;
   if(!lab_grid_span(&f,dest,side*w,8192))return 1;tests++;
  }
  LabFill f={0};f.src=&bm;f.inverse[0]=f.inverse[4]=1;f.offset=.5;f.offset_int=-128;f.quality=1;f.max_x=w-1;
  if(lab_grid_span(&f,src,0,w))return 2;
  if(lab_grid_span(&f,dest,0,8193))return 3;
  if(lab_grid_span(&f,dest,0,0))return 4;
  f.inverse[2]=NAN;if(lab_grid_span(&f,dest,0,2))return 5;
  f.inverse[2]=INFINITY;if(lab_grid_span(&f,dest,0,2))return 6;
  free(src);free(dest);
 }
 printf("sanitizer guarded-span cases=%u passed\n",tests);
}
