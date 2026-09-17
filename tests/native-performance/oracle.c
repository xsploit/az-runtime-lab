#include "grid_span.h"
static uint8_t source[400000],native_out[40000],candidate_out[40000];
static uint64_t rng=1234567;
static uint32_t rnd(void){rng^=rng<<13;rng^=rng>>7;rng^=rng<<17;return (uint32_t)rng;}
static int same(const void *a,const void *b,size_t n){const uint8_t*x=a,*y=b;for(size_t i=0;i<n;i++)if(x[i]!=y[i])return 0;return 1;}
static void copy(void*a,const void*b,size_t n){uint8_t*x=a;const uint8_t*y=b;for(size_t i=0;i<n;i++)x[i]=y[i];}
static void fill(void*a,int b,size_t n){uint8_t*x=a;for(size_t i=0;i<n;i++)x[i]=(uint8_t)b;}
static long syscall3(long no,long a,long b,long c){register long x8 __asm__("x8")=no;register long x0 __asm__("x0")=a;register long x1 __asm__("x1")=b;register long x2 __asm__("x2")=c;__asm__ volatile("svc 0":"+r"(x0):"r"(x8),"r"(x1),"r"(x2):"memory");return x0;}
struct Result {uint64_t tests,accepted,rejected,pixel_errors,state_errors,guard_errors;uint64_t first_bad;};
#ifdef HOOK_ORACLE
static int scope;
void oracle_dispatch(LabFill*f,uint8_t*d,int x,int n){
 if(scope && lab_grid_span(f,d,x,n))return;
 ((void(*)(LabFill*,uint8_t*,int,int))0x2500000)(f,d,x,n);
}
#endif
void _start(void){
 struct Result result={0};
 for(unsigned t=0;t<110000;t++){
  LabFill f,g;fill(&f,0,sizeof(f));int w=1+rnd()%25,h=1+rnd()%20;
  if(t>=100000){int widths[]={1,2,3,900,1920,4096};w=widths[rnd()%6];}
  LabBitmap bitmap={source+17,2,w*4+(int)(rnd()%9),4,w,h};
  for(size_t i=0;i<(size_t)(17+bitmap.line_stride*h+17);i++)source[i]=(uint8_t)rnd();
  f.src=&bitmap;f.inverse[0]=f.inverse[4]=1;f.inverse[2]=((int)(rnd()%16385)-8192)/1024.f;f.inverse[5]=(int)(rnd()%25)-12;
  f.offset=.5f;f.offset_int=-128;f.quality=1+rnd()%2;f.max_x=w-1;f.max_y=h-1;f.y=(int)(rnd()%40)-10;
  int x=(int)(rnd()%50)-20,n=1+rnd()%95;
  if(t>=100000)n=1+rnd()%8192;
  if(t>=105000){
   x=(int)(rnd()%524290)-262145;f.y=(int)(rnd()%524290)-262145;
   f.inverse[2]=((int)(rnd()%536870913)-268435456)/1024.f;
   f.inverse[5]=(int)(rnd()%524290)-262145;
  }
  /* Include unsupported affine/quality/fractional-y cases: must fall back without writes. */
  if(t%11==0)f.inverse[1]=.125f;
  if(t%13==0)f.inverse[5]+=.25f;
  if(t%17==0)f.quality=0;
  copy(&g,&f,sizeof(f));fill(native_out,0xAB,sizeof(native_out));fill(candidate_out,0xAB,sizeof(candidate_out));
  #ifdef HOOK_ORACLE
  scope=t%2;
  ((void(*)(LabFill*,uint8_t*,int,int))0x241e480)(&g,candidate_out+19,x,n);
  int accepted=1;
#else
  int accepted=lab_grid_span(&g,candidate_out+19,x,n);
#endif
  result.tests++;
  if(!accepted){result.rejected++;if(!same(&g,&f,sizeof(f)))result.guard_errors++;for(size_t i=0;i<sizeof(candidate_out);i++)if(candidate_out[i]!=0xAB){result.guard_errors++;break;}continue;}
  result.accepted++;
  #ifdef HOOK_ORACLE
  ((void(*)(LabFill*,uint8_t*,int,int))0x2600000)(&f,native_out+19,x,n);
#else
  ((void(*)(LabFill*,uint8_t*,int,int))0x241e480)(&f,native_out+19,x,n);
#endif
  if(!same(native_out,candidate_out,sizeof(native_out))){result.pixel_errors++;if(!result.first_bad)result.first_bad=t+1;}
  if(!same(&f,&g,sizeof(f))){result.state_errors++;if(!result.first_bad)result.first_bad=t+1;}
 }
 syscall3(64,1,(long)&result,sizeof(result));syscall3(93,result.pixel_errors||result.state_errors||result.guard_errors,0,0);
 for(;;){}
}
