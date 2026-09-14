#define _POSIX_C_SOURCE 200809L
#include <xf86drm.h>
#include <drm.h>
#include <fcntl.h>
#include <unistd.h>
#include <poll.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <signal.h>
#include <errno.h>
#include <sys/stat.h>
static volatile sig_atomic_t stop;
static void ended(int s){(void)s;stop=1;}
static uint64_t now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
static int publish(const char*path,int64_t stamp){
 char tmp[4096],buf[64];if(snprintf(tmp,sizeof(tmp),"%s.drm-%ld.tmp",path,(long)getpid())>=(int)sizeof(tmp))return -1;
 int fd=open(tmp,O_WRONLY|O_CREAT|O_EXCL|O_CLOEXEC,0644);if(fd<0)return -1;
 int n=snprintf(buf,sizeof(buf),"%lld\n",(long long)stamp);ssize_t w=write(fd,buf,n);int c=close(fd);
 if(w!=n||c||rename(tmp,path)){unlink(tmp);return -1;}return 0;
}
int main(int argc,char**argv){
 if(argc!=5){fprintf(stderr,"usage: publish CARD CRTC PATH SECONDS\n");return 2;}
 char *end;unsigned long crtc=strtoul(argv[2],&end,10);if(*end||!crtc||crtc>UINT32_MAX)return 2;
 double seconds=strtod(argv[4],&end);if(*end||seconds<=0||seconds>3600)return 2;
 signal(SIGTERM,ended);signal(SIGINT,ended);
 int fd=open(argv[1],O_RDWR|O_CLOEXEC);if(fd<0){perror("open DRM");return 1;}
 uint64_t mono;if(drmGetCap(fd,DRM_CAP_TIMESTAMP_MONOTONIC,&mono)||mono!=1)return 1;
 struct drm_crtc_get_sequence initial={.crtc_id=(uint32_t)crtc};
 if(drmIoctl(fd,DRM_IOCTL_CRTC_GET_SEQUENCE,&initial)||!initial.active)return 1;
 uint64_t previous=initial.sequence,first=previous,count=0,skips=0,start=now(),late_max=0,publish_max=0,slow_writes=0;
 int rc=0;uint64_t target=0;
 if(drmCrtcQueueSequence(fd,(uint32_t)crtc,DRM_CRTC_SEQUENCE_RELATIVE|DRM_CRTC_SEQUENCE_NEXT_ON_MISS,1,&target,0x415a)){perror("first queue");close(fd);return 1;}
 while(!stop&&now()-start<(uint64_t)(seconds*1e9)){
  struct pollfd pollfd={.fd=fd,.events=POLLIN};int ready;
  do{ready=poll(&pollfd,1,100);}while(ready<0&&errno==EINTR&&!stop);
  if(stop)break;
  if(ready!=1||!(pollfd.revents&POLLIN)){fprintf(stderr,"Display event timeout/error\n");rc=1;break;}
  struct drm_event_crtc_sequence event={0};ssize_t n=read(fd,&event,sizeof(event));uint64_t observed=now();
  if(n!=sizeof(event)||event.base.type!=DRM_EVENT_CRTC_SEQUENCE||event.base.length!=sizeof(event)||event.user_data!=0x415a||event.sequence<=previous||event.time_ns<=0||(uint64_t)event.time_ns>observed||observed-(uint64_t)event.time_ns>100000000){fprintf(stderr,"Invalid/stale event n=%lld type=%u length=%u tag=%llu seq=%llu previous=%llu stamp=%lld observed=%llu\n",(long long)n,event.base.type,event.base.length,(unsigned long long)event.user_data,(unsigned long long)event.sequence,(unsigned long long)previous,(long long)event.time_ns,(unsigned long long)observed);rc=1;break;}
  uint64_t late=observed-(uint64_t)event.time_ns;if(late>late_max)late_max=late;
  skips+=event.sequence-previous-1;previous=event.sequence;
  /* Queue the next refresh before filesystem work so a slow write does not
   * leave a gap with no pending display event. Absolute sequence avoids drift. */
  if(drmCrtcQueueSequence(fd,(uint32_t)crtc,DRM_CRTC_SEQUENCE_NEXT_ON_MISS,event.sequence+1,&target,0x415a)){perror("next queue");rc=1;break;}
  uint64_t before_write=now();
  if(publish(argv[3],event.time_ns)){perror("publish");rc=1;break;}count++;
  uint64_t write_ns=now()-before_write;if(write_ns>publish_max)publish_max=write_ns;if(write_ns>16662000)slow_writes++;
 }
 fprintf(stderr,"maximum_publish_ms=%.6f writes_over_one_refresh=%llu\n",publish_max/1e6,(unsigned long long)slow_writes);
 fprintf(stdout,"{\"events\":%llu,\"sequence_span\":%llu,\"skipped\":%llu,\"maximum_event_lateness_ms\":%.6f,\"elapsed_seconds\":%.6f,\"error\":%d}\n",(unsigned long long)count,(unsigned long long)(previous-first),(unsigned long long)skips,late_max/1e6,(now()-start)/1e9,rc);
 close(fd);return rc;
}
