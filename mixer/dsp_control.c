#include "dsp_control.h"
#include <ctype.h>
#include <errno.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
static int space(unsigned char c){return isspace(c);}
int lab_filter_command_parse(const char *data,size_t length,LabFilterCommand *out){
 char buf[128],*p,*end;LabFilterCommand cmd;
 if(!data||!out||length<3||length>=sizeof buf||memchr(data,0,length))return 0;
 memcpy(buf,data,length);buf[length]=0;
 if(buf[0]!='F'||buf[1]!='1'||!space((unsigned char)buf[2]))return 0;
 p=buf+2;
 for(unsigned i=0;i<2;i++){
  while(space((unsigned char)*p))p++;
  if(*p<'0'||*p>'9')return 0;
  errno=0;unsigned long v=strtoul(p,&end,10);
  if(errno||end==p||!space((unsigned char)*end)||(i?(v!=0&&v!=1&&v!=2&&v!=3&&v!=4&&v!=5&&v!=6):v>3))return 0;
  if(i)cmd.type=(unsigned)v;else cmd.channel=(unsigned)v;p=end;
 }
 for(unsigned i=0;i<2;i++){
  while(space((unsigned char)*p))p++;
  errno=0;float v=strtof(p,&end);
  if(errno||end==p||!isfinite(v)||v<0||v>1||(*end&&!space((unsigned char)*end)))return 0;
  if(i)cmd.parameter=v;else cmd.color=v;p=end;
 }
 while(space((unsigned char)*p))p++;
 if(*p)return 0;
 *out=cmd;return 1;
}

int lab_eq_command_parse(const char *data,size_t length,LabEqCommand *out){
 char buf[128],*p,*end;LabEqCommand cmd;
 if(!data||!out||length<4||length>=sizeof buf||memchr(data,0,length))return 0;
 memcpy(buf,data,length);buf[length]=0;
 if(memcmp(buf,"EQ1",3)||!space((unsigned char)buf[3]))return 0;
 p=buf+3;
 for(unsigned i=0;i<2;i++){
  while(space((unsigned char)*p))p++;
  if(*p<'0'||*p>'9')return 0;
  errno=0;unsigned long v=strtoul(p,&end,10);
  if(errno||end==p||!space((unsigned char)*end)||v>(i?1:3))return 0;
  if(i)cmd.mode=(unsigned)v;else cmd.channel=(unsigned)v;p=end;
 }
 float *values[]={&cmd.high,&cmd.mid,&cmd.low};
 for(unsigned i=0;i<3;i++){
  while(space((unsigned char)*p))p++;
  errno=0;float v=strtof(p,&end);
  if(errno||end==p||!isfinite(v)||v<0||v>1||(*end&&!space((unsigned char)*end)))return 0;
  *values[i]=v;p=end;
 }
 while(space((unsigned char)*p))p++;
 if(*p)return 0;
 *out=cmd;return 1;
}
