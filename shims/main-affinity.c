/* Optional lab policy: replace only main-thread affinity requests. */
#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <dlfcn.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <errno.h>
static int (*next_set)(pthread_t,size_t,const cpu_set_t*);
static pthread_once_t once=PTHREAD_ONCE_INIT;
static cpu_set_t selected;
static int enabled;
static void init(void){
 next_set=dlsym(RTLD_NEXT,"pthread_setaffinity_np");
 const char *p=getenv("LAB_MAIN_CPUS");CPU_ZERO(&selected);
 if(!p || !*p)return;
 while(*p){
  if(*p<'0'||*p>'9')return;
  char *end;errno=0;long n=strtol(p,&end,10);
  if(errno || n<0 || n>=CPU_SETSIZE)return;
  CPU_SET(n,&selected);
  if(!*end){enabled=1;return;}
  if(*end!=',' || !end[1])return;
  p=end+1;
 }
}
int pthread_setaffinity_np(pthread_t thread,size_t size,const cpu_set_t *set){
 pthread_once(&once,init);
 if(!next_set)return ENOSYS;
 if(enabled && syscall(SYS_gettid)==getpid() && pthread_equal(thread,pthread_self()))
  return next_set(thread,sizeof(selected),&selected);
 return next_set(thread,size,set);
}
