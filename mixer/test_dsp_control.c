#include "dsp_control.h"
#include <assert.h>
#include <string.h>
int main(void){
 LabFilterCommand s={9,9,9,9};
 const char *bad[]={"F1 -1 1 .5 .5","F1 4 1 .5 .5","F1 0 7 .5 .5","F1 0 1 nan .5","F1 0 1 .5 inf","F1 0 1 -.1 .5","F1 0 1 .5 1.1","F1 0 1 .5","F1 0 1 .5 .5 extra","F1 99999999999999999999999 1 .5 .5","F1 0 1 1e999 .5","F1 0 1 .5.5","M1 0 1 .5 .5"};
 for(unsigned i=0;i<sizeof bad/sizeof *bad;i++){assert(!lab_filter_command_parse(bad[i],strlen(bad[i]),&s));assert(s.channel==9&&s.type==9&&s.color==9&&s.parameter==9);}
 const char embedded[]="F1 0 1 .5 .5\0garbage";assert(!lab_filter_command_parse(embedded,sizeof embedded-1,&s));
 const char *sweep="F1 2 3 .2 .8";assert(lab_filter_command_parse(sweep,strlen(sweep),&s));assert(s.type==3&&s.channel==2);
 const char *crush="F1 2 6 .2 .8";assert(lab_filter_command_parse(crush,strlen(crush),&s));assert(s.type==6&&s.channel==2);
 const char *valid="F1 3 1 0.25 1\n";assert(lab_filter_command_parse(valid,strlen(valid),&s));assert(s.channel==3&&s.type==1&&s.color==.25f&&s.parameter==1);
 assert(!lab_filter_command_parse(NULL,0,&s));
 return 0;
}
