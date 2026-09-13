#include "dsp_control.h"
#include <assert.h>
#include <string.h>
int main(void){
 LabEqCommand c;memset(&c,0x5a,sizeof c);LabEqCommand before=c;
 const char *bad[]={"EQ1 4 0 .5 .5 .5","EQ1 0 2 .5 .5 .5","EQ1 -1 0 .5 .5 .5","EQ1 0 0 nan .5 .5","EQ1 0 0 .5 inf .5","EQ1 0 0 .5 .5 1.01","EQ1 0 0 .5 .5","EQ1 0 0 .5 .5 .5 garbage","EQ1 0 0 .5.2 .5 .5","EQ1 999999999999999999999999 0 0 0 0"};
 for(unsigned i=0;i<sizeof bad/sizeof *bad;i++){assert(!lab_eq_command_parse(bad[i],strlen(bad[i]),&c));assert(!memcmp(&c,&before,sizeof c));}
 const char nul[]="EQ1 0 0 .5 .5 .5\0suffix";assert(!lab_eq_command_parse(nul,sizeof nul-1,&c));
 const char good[]="EQ1 3 1 .1 .5 .9\n";assert(lab_eq_command_parse(good,sizeof good-1,&c));assert(c.channel==3&&c.mode==1&&c.high==.1f&&c.mid==.5f&&c.low==.9f);
}
