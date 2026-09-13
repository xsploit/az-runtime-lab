#include <assert.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include "grid-phase.h"
int main(void) {
 float zooms[]={0.0625f,0.125f,0.25f,0.5f,1,2,4};
 unsigned long n=0; double max_error=0;
 for(unsigned j=0;j<sizeof(zooms)/sizeof(*zooms);++j)
  for(int64_t p=-1000;p<=240000;++p) {
   float c; assert(lab_grid_phase(p,zooms[j],&c));
   float native=(float)p*.15f; native*=zooms[j];
   double target=(double)p*150.0/1000.0*(double)zooms[j];
   double error=fabs((double)truncf(native)-(double)c-target);
   if(error>max_error)max_error=error;
   assert(error<0.0000001);++n;
  }
 float c; assert(!lab_grid_phase(INT64_MAX,.25f,&c));assert(!lab_grid_phase(1,NAN,&c));assert(!lab_grid_phase(1,0,&c));
 printf("%lu coordinate checks; max residual error %.12g pixels; invalid inputs rejected\n",n,max_error);
}
