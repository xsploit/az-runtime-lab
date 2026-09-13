#define _POSIX_C_SOURCE 200809L
#include "iir_reconstructed.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <float.h>
extern void iir_native(const Stereo *,Stereo *,const Stereo *,Stereo *,Stereo *,unsigned long);
static uint32_t rng=0x31415926u;
static uint32_t next(void){rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;return rng;}
static float rnd(void){return ((int32_t)(next()&65535)-32768)/32768.0f;}
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static uint64_t calls, samples, compared, mismatches, guard_failures;
static double max_abs;
static FILE *records;
typedef struct { uint64_t pre;Stereo v[2];uint64_t post; } History;
static const uint64_t canary=UINT64_C(0xdacafeedbad12345);
static void check(float a,float b){
    compared++;if(bits(a)!=bits(b)){mismatches++;double d=fabs((double)a-b);if(d>max_abs)max_abs=d;
        if(mismatches<5)fprintf(stderr,"Mismatch call %llu: %08x vs %08x\n",(unsigned long long)calls,bits(a),bits(b));}
}
static void paircheck(const Stereo *a,const Stereo *b,size_t n){for(size_t i=0;i<n;i++){check(a[i].l,b[i].l);check(a[i].r,b[i].r);}}
static void transfer(void *buf,size_t n){
#ifdef HOST_REPLAY
    if(fread(buf,1,n,records)!=n){fputs("Truncated native corpus\n",stderr);exit(2);}
#else
    if(fwrite(buf,1,n,records)!=n){perror("native corpus write");exit(2);}
#endif
}
static void run(const Stereo *in,const Stereo *coeff,size_t n,
                Stereo *nx,Stereo *ny,Stereo *cx,Stereo *cy,Stereo *result){
    /* Native main loop reads one extra Stereo after the last useful sample.
       Exactly one readable padding frame is supplied, plus a leading canary. */
    Stereo *source=calloc(n+2,sizeof(Stereo)),*saved=calloc(n+2,sizeof(Stereo));
    Stereo *no=malloc((n+2)*sizeof(Stereo)),*co=malloc((n+2)*sizeof(Stereo));
    /* Reconstructed C gets no trailing readable sample. ASan therefore checks
       that the native lookahead overread was not copied into the new code. */
    Stereo *exact=malloc((n?n:1)*sizeof(Stereo));
    if(!source||!saved||!no||!co||!exact)exit(2);
    memcpy(exact,in,n*sizeof(Stereo));
    source[0]=(Stereo){12345.0f,-12345.0f};memcpy(source+1,in,n*sizeof(Stereo));
    source[n+1]=(Stereo){7654.0f,-7654.0f};memcpy(saved,source,(n+2)*sizeof(Stereo));
    memset(no,0xa5,(n+2)*sizeof(Stereo));memset(co,0xa5,(n+2)*sizeof(Stereo));
    History xn={canary,{{0,0},{0,0}},canary},yn=xn,xc=xn,yc=xn;
    memcpy(xn.v,nx,sizeof xn.v);memcpy(yn.v,ny,sizeof yn.v);
    memcpy(xc.v,cx,sizeof xc.v);memcpy(yc.v,cy,sizeof yc.v);
#ifndef HOST_REPLAY
    iir_native(source+1,no+1,coeff,xn.v,yn.v,(unsigned long)n);
#endif
    transfer(no+1,n*sizeof(Stereo));transfer(xn.v,sizeof xn.v);transfer(yn.v,sizeof yn.v);
    iir_reconstructed(exact,co+1,coeff,xc.v,yc.v,n);
    calls++;samples+=n;paircheck(no+1,co+1,n);paircheck(xn.v,xc.v,2);paircheck(yn.v,yc.v,2);
    unsigned char mark[sizeof(Stereo)];memset(mark,0xa5,sizeof mark);
    if(memcmp(no,mark,sizeof mark)||memcmp(no+n+1,mark,sizeof mark)||
       memcmp(co,mark,sizeof mark)||memcmp(co+n+1,mark,sizeof mark)||
       memcmp(source,saved,(n+2)*sizeof(Stereo))||
       xn.pre!=canary||xn.post!=canary||yn.pre!=canary||yn.post!=canary||
       xc.pre!=canary||xc.post!=canary||yc.pre!=canary||yc.post!=canary)guard_failures++;
    memcpy(nx,xn.v,sizeof xn.v);memcpy(ny,yn.v,sizeof yn.v);
    memcpy(cx,xc.v,sizeof xc.v);memcpy(cy,yc.v,sizeof yc.v);
    if(result)memcpy(result,no+1,n*sizeof(Stereo));
    free(source);free(saved);free(no);free(co);free(exact);
}
static void coeffs(Stereo *c){
    for(int k=0;k<3;k++)c[k]=(Stereo){rnd()*0.5f,rnd()*0.5f};
    c[3]=(Stereo){rnd()*0.3f,rnd()*0.3f};c[4]=(Stereo){rnd()*0.2f,rnd()*0.2f};
}
int main(int argc,char **argv){
    if(argc!=2){fputs("usage: compare native-records.bin\n",stderr);return 2;}
#ifdef HOST_REPLAY
    records=fopen(argv[1],"rb");
#else
    records=fopen(argv[1],"wb");
#endif
    if(!records){perror(argv[1]);return 2;}
    const size_t sizes[]={0,1,2,3,4,7,16,31,32,63,64,65,127,128,129,256,511,512};
    Stereo in[1024],c[5],nx[2],ny[2],cx[2],cy[2];
    /* Random finite stable filters, independent left/right data and histories.
       Sparse impulses and complete silence are included, coefficients vary. */
    for(int trial=0;trial<250;trial++){
        coeffs(c);
        for(size_t j=0;j<sizeof sizes/sizeof *sizes;j++){
            size_t n=sizes[j];
            for(size_t k=0;k<n;k++)in[k]=(Stereo){rnd(),rnd()};
            if(trial%10==0){memset(in,0,sizeof in);if(n)in[0]=(Stereo){1,-0.5f};}
            if(trial%10==1)memset(in,0,sizeof in);
            for(int k=0;k<2;k++){
                nx[k]=cx[k]=(Stereo){rnd(),rnd()};ny[k]=cy[k]=(Stereo){rnd(),rnd()};
                if(trial%10<2)nx[k]=ny[k]=cx[k]=cy[k]=(Stereo){0,0};
            }
            run(in,c,n,nx,ny,cx,cy,NULL);
        }
    }
    /* Continuous state across varying blocks, control changes and empty blocks. */
    memset(nx,0,sizeof nx);memset(ny,0,sizeof ny);memset(cx,0,sizeof cx);memset(cy,0,sizeof cy);
    coeffs(c);
    for(int j=0;j<1000;j++){
        if(j%13==0)coeffs(c);
        size_t n=sizes[next()%(sizeof sizes/sizeof *sizes)];
        for(size_t k=0;k<n;k++)in[k]=(Stereo){rnd(),rnd()};
        run(in,c,n,nx,ny,cx,cy,NULL);
    }
    /* Explicitly quantify native block-partition differences rather than
       requiring an invariant the native arithmetic order does not have. */
    Stereo whole[1024],split[1024];
    coeffs(c);for(size_t k=0;k<1024;k++)in[k]=(Stereo){rnd(),rnd()};
    memset(nx,0,sizeof nx);memset(ny,0,sizeof ny);memset(cx,0,sizeof cx);memset(cy,0,sizeof cy);
    run(in,c,1024,nx,ny,cx,cy,whole);
    memset(nx,0,sizeof nx);memset(ny,0,sizeof ny);memset(cx,0,sizeof cx);memset(cy,0,sizeof cy);
    for(size_t k=0;k<1024;k++)run(in+k,c,1,nx,ny,cx,cy,split+k);
    uint64_t partition_differences=0;double partition_max_abs=0;
    for(size_t k=0;k<1024;k++)for(int side=0;side<2;side++){
        float a=side?whole[k].r:whole[k].l,b=side?split[k].r:split[k].l;
        if(bits(a)!=bits(b)){partition_differences++;double d=fabs((double)a-b);if(d>partition_max_abs)partition_max_abs=d;}
    }
#ifdef HOST_REPLAY
    if(fgetc(records)!=EOF){fputs("Extra bytes in native corpus\n",stderr);return 2;}
#endif
    fclose(records);
    printf("{\"calls\":%llu,\"stereo_frames\":%llu,\"floats_compared_including_state\":%llu,\"bit_mismatches\":%llu,\"max_abs_error\":%.17g,\"guard_failures\":%llu,\"native_partition_different_samples\":%llu,\"native_partition_max_abs\":%.17g}\n",
           (unsigned long long)calls,(unsigned long long)samples,(unsigned long long)compared,
           (unsigned long long)mismatches,max_abs,(unsigned long long)guard_failures,
           (unsigned long long)partition_differences,partition_max_abs);
    return mismatches||guard_failures?1:0;
}
