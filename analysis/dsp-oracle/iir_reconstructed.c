#include "iir_reconstructed.h"
#include <stdint.h>
#include <string.h>
static float fz(float x) {
#ifdef RX3_NEON_FZ
    uint32_t u;memcpy(&u,&x,4);
    if ((u&0x7f800000u)==0) {u&=0x80000000u;memcpy(&x,&u,4);}
#endif
    return x;
}
static float mul(float a,float b){return fz(fz(a)*fz(b));}
static float add(float a,float b){return fz(fz(a)+fz(b));}
static float sub(float a,float b){return fz(fz(a)-fz(b));}
/* Build with FP contraction disabled. RX3's first two frames use two separate
 * feedback subtractions; later frames sum feedback products first. Keeping
 * this distinction matters for bit-level agreement and block partitioning. */
static float step(float in, float x1, float x2, float y1, float y2,
                  float b0,float b1,float b2,float a1,float a2,int early) {
    float v = add(mul(b0,in),mul(b1,x1));
    v = add(v,mul(b2,x2));
    if (early) { v = sub(v,mul(a1,y1)); v = sub(v,mul(a2,y2)); }
    else { float feedback = add(mul(a1,y1),mul(a2,y2)); v = sub(v,feedback); }
    return v;
}
void iir_reconstructed(const Stereo *in, Stereo *out, const Stereo *c,
                       Stereo *xh, Stereo *yh, size_t n) {
    for (size_t i=0;i<n;i++) {
        Stereo v = {
            step(in[i].l,xh[1].l,xh[0].l,yh[1].l,yh[0].l,
                 c[0].l,c[1].l,c[2].l,c[3].l,c[4].l,i<2),
            step(in[i].r,xh[1].r,xh[0].r,yh[1].r,yh[0].r,
                 c[0].r,c[1].r,c[2].r,c[3].r,c[4].r,i<2)
        };
        xh[0]=xh[1];xh[1]=in[i];yh[0]=yh[1];yh[1]=v;out[i]=v;
    }
}
