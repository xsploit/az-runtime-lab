#define _GNU_SOURCE
#include <sys/mman.h>
#include <unistd.h>
#include <assert.h>
#include <X11/Xutil.h>
#include <stdio.h>
#include "ximage-packed24.h"
int main(void){size_t page=sysconf(_SC_PAGESIZE);unsigned char*p=mmap(0,page*2,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);assert(p!=MAP_FAILED);assert(!mprotect(p+page,page,PROT_NONE));for(unsigned w=1;w<=257;w++){XImage s={0},d;s.width=w;s.height=1;s.format=ZPixmap;s.depth=24;s.bits_per_pixel=24;s.byte_order=LSBFirst;s.bitmap_bit_order=LSBFirst;s.bitmap_unit=32;s.bitmap_pad=8;s.bytes_per_line=w*3;s.red_mask=0xff0000;s.green_mask=0xff00;s.blue_mask=0xff;s.data=(char*)(p+page-w*3);for(unsigned i=0;i<w*3;i++)s.data[i]=(char)(i*11);assert(XInitImage(&s));assert(lab_expand24(&s,0,0,w,1,&d));for(unsigned x=0;x<w;x++)assert(XGetPixel(&s,x,0)==XGetPixel(&d,x,0));free(d.data);}munmap(p,page*2);puts("257 tightly packed widths end immediately at a protected page: passed");}
