/* Execute the original AZ fader deferred task against guarded synthetic state. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *want=(void*)0x101b000,*p=mmap(want,4096,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
 if(p!=want)return 4;
 if(fread(p,1,4096,f)!=4096)return 5;
 fclose(f);if(mprotect(p,4096,PROT_READ|PROT_EXEC))return 6;
 __builtin___clear_cache(p,(char*)p+4096);
 void (*run)(void*)=(void*)0x101b9d0;
 uint32_t bits[]={0,0x3f000000,0x3f800000,0x7fc01234,0xffffffff};
 unsigned tests=0,fail=0;
 for(int count=0;count<=4;count++)for(int ch=0;ch<5;ch++)for(int v=0;v<5;v++){
  _Alignas(16) unsigned char manager[960],before[960],task[56],task_before[56];
  uint32_t guarded[6]={0xabcdef12,0x11223344,0x11223344,0x11223344,0x11223344,0xabcdef12},expected[6];
  memset(manager,0,sizeof manager);memset(task,0,sizeof task);
  uintptr_t array=(uintptr_t)(guarded+1),mgr=(uintptr_t)manager;
  uint64_t id=0x02b1ffa6b4312d00ULL+ch;
  memcpy(manager+848,&count,4);memcpy(manager+896,&array,8);
  memcpy(task+24,&id,8);memcpy(task+32,&mgr,8);memcpy(task+40,&bits[v],4);
  memcpy(before,manager,sizeof manager);memcpy(task_before,task,sizeof task);memcpy(expected,guarded,sizeof guarded);
  if(ch<4&&ch<count)expected[ch+1]=bits[v];
  run(task);tests++;
  if(memcmp(expected,guarded,sizeof guarded)||memcmp(before,manager,sizeof manager)||memcmp(task_before,task,sizeof task))fail++;
 }
 printf("{\"cases\":%u,\"failures\":%u}\n",tests,fail);return fail?1:0;
}
