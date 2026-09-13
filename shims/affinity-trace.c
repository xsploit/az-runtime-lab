#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <dlfcn.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <stdatomic.h>
#include <errno.h>
static int (*real_set)(pthread_t,size_t,const cpu_set_t*);
static pthread_once_t once=PTHREAD_ONCE_INIT;
static atomic_uint count;
static void init(void){real_set=dlsym(RTLD_NEXT,"pthread_setaffinity_np");}
int pthread_setaffinity_np(pthread_t thread,size_t size,const cpu_set_t *set){
 pthread_once(&once,init);
 if(!real_set)return ENOSYS;
 int result=real_set(thread,size,set);
 if(atomic_fetch_add(&count,1)<512){
  uint64_t low=0;const unsigned char *p=(const unsigned char*)set;
  for(size_t i=0;i<size && i<8;i++)low|=(uint64_t)p[i]<<(8*i);
  unsigned flag=0,cpus=0;
  /* Exact AZ EP147 callsite only; diagnostic reads, never writes. */
  if((uintptr_t)__builtin_return_address(0)==0x232dcec){
   flag=*(volatile unsigned char*)(uintptr_t)0x3bd7380;
   cpus=*(volatile unsigned*)(uintptr_t)0x3bd76b8;
  }
  char line[256];int n=snprintf(line,sizeof(line),"LAB_AFFINITY tid=%ld self=%d size=%zu low64=%llx result=%d caller=%p reversal=%u cpus=%u\n",syscall(SYS_gettid),pthread_equal(thread,pthread_self()),size,(unsigned long long)low,result,__builtin_return_address(0),flag,cpus);
  if(n>0 && n<(int)sizeof(line))write(2,line,n);
 }
 return result;
}
static int (*real_sched)(pthread_t,int,const struct sched_param*);
static pthread_once_t sched_once=PTHREAD_ONCE_INIT;
static atomic_uint sched_count;
static void sched_init(void){real_sched=dlsym(RTLD_NEXT,"pthread_setschedparam");}
int pthread_setschedparam(pthread_t thread,int policy,const struct sched_param *param){
 pthread_once(&sched_once,sched_init);
 if(!real_sched)return ENOSYS;
 int result=real_sched(thread,policy,param);
 if(atomic_fetch_add(&sched_count,1)<512){
  char line[200];int n=snprintf(line,sizeof(line),"LAB_SCHED tid=%ld self=%d policy=%d priority=%d result=%d\n",syscall(SYS_gettid),pthread_equal(thread,pthread_self()),policy,param->sched_priority,result);
  if(n>0 && n<(int)sizeof(line))write(2,line,n);
 }
 return result;
}
