#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
static void put(void *p,size_t o,uint64_t x){memcpy((char*)p+o,&x,8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 int fd=open(argv[1],O_RDONLY); if(fd<0)return 3;
 void *page=mmap((void*)0xb44000,4096,PROT_READ|PROT_EXEC,MAP_PRIVATE,fd,0);
 close(fd);if(page!=(void*)0xb44000){perror("mmap");return 4;}
 void *(*lookup)(void*,uint32_t,uint16_t,uint8_t)=(void*)0xb44c30;
 uint64_t manager[20]={0},a[20]={0},b[20]={0}; void *records[]={a,b};
 put(manager,64,(uintptr_t)records); put(manager,80,2);
 put(a,128,0x0512345678ULL);put(b,128,0x0612345678ULL);
 ((uint8_t*)a)[136]=2;((uint8_t*)b)[136]=4;
 struct test {uint32_t id;uint16_t key;uint8_t discriminator;void *want;} cases[]={
 {0x12345678,5,0,a},{0x12345678,0xab05,0,a},
 {0x12345678,6,0,b},{0x12345679,5,0,0},
 {0x12345678,7,0,0},{0x12345678,5,2,a},
 {0x12345678,5,1,0},{0x12345678,6,1,b},
 {0x12345678,0xff05,2,a},{0x12345678,0xff05,3,0}};
 unsigned bad=0;for(unsigned i=0;i<sizeof(cases)/sizeof(*cases);i++){
 struct test *t=&cases[i]; if(lookup(manager,t->id,t->key,t->discriminator)!=t->want)bad++;
 }
 put(manager,80,0);if(lookup(manager,0x12345678,5,0)!=0)bad++;
 printf("{\"cases\":11,\"mismatches\":%u}\n",bad);munmap(page,4096);return bad?1:0;
}
