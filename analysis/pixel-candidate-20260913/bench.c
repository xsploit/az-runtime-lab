#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <time.h>
#include <X11/Xutil.h>
#define lab_expand24 baseline
#include "original.h"
#undef lab_expand24
#undef LAB_XIMAGE_PACKED24_H
#define lab_expand24 candidate
#include "ximage-packed24.h"
#undef lab_expand24
static volatile unsigned long checksum;
static double now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec*1e-9;}
static double run(int opt,XImage*s,unsigned w,unsigned h,int count){double start=now();for(int i=0;i<count;i++){XImage d;int ok=opt?candidate(s,0,0,w,h,&d):baseline(s,0,0,w,h,&d);if(!ok)exit(2);checksum+=(unsigned char)d.data[(i*7)%(w*h*4)];free(d.data);}return now()-start;}
int main(void){unsigned sizes[][2]={{1280,800},{900,162},{128,32},{1,1}};puts("case,round,baseline_seconds,candidate_seconds");for(int k=0;k<4;k++){unsigned w=sizes[k][0],h=sizes[k][1];XImage s={0};s.width=w;s.height=h;s.depth=24;s.bits_per_pixel=24;s.format=ZPixmap;s.byte_order=LSBFirst;s.bitmap_bit_order=LSBFirst;s.bitmap_unit=32;s.bitmap_pad=8;s.bytes_per_line=w*3;s.red_mask=0xff0000;s.green_mask=0xff00;s.blue_mask=0xff;s.data=malloc((size_t)w*h*3);for(size_t j=0;j<(size_t)w*h*3;j++)s.data[j]=(char)(j*73+11);if(!XInitImage(&s))exit(3);int n=k==0?150:k==1?600:20000;run(0,&s,w,h,10);run(1,&s,w,h,10);for(int r=0;r<7;r++){double a,b;if(r%2){b=run(1,&s,w,h,n);a=run(0,&s,w,h,n);}else{a=run(0,&s,w,h,n);b=run(1,&s,w,h,n);}printf("%ux%u,%d,%.9f,%.9f\n",w,h,r,a,b);}free(s.data);}return checksum==0;}
