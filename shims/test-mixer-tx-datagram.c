#define _GNU_SOURCE
#include <stdatomic.h>
#include <errno.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>
static const char *test_path;
#define LAB_MIXER_TX_PATH test_path
#include "mixer-tx-datagram.h"
int main(int argc,char **argv){
 assert(argc==2);test_path=argv[1];unsigned char packet[128]={0},out[128];
 errno=EIO;lab_mixer_tx_datagram(packet);assert(errno==EIO);
 int fd=socket(AF_UNIX,SOCK_DGRAM|SOCK_NONBLOCK,0);assert(fd>=0);
 struct sockaddr_un a={.sun_family=AF_UNIX};assert(strlen(test_path)<sizeof a.sun_path);strcpy(a.sun_path,test_path);assert(!bind(fd,(void*)&a,sizeof a));
 packet[0]=42;lab_mixer_tx_datagram(packet);assert(recv(fd,out,128,0)==128);assert(!memcmp(packet,out,128));
 struct timespec before,after;clock_gettime(CLOCK_MONOTONIC,&before);
 for(int i=0;i<100000;i++)lab_mixer_tx_datagram(packet);
 clock_gettime(CLOCK_MONOTONIC,&after);double seconds=after.tv_sec-before.tv_sec+(after.tv_nsec-before.tv_nsec)*1e-9;assert(seconds<5);
 int count=0;while(recv(fd,out,128,0)==128)count++;assert(count>0);
 packet[0]=99;lab_mixer_tx_datagram(packet);assert(recv(fd,out,128,0)==128&&out[0]==99);
 close(fd);unlink(test_path);lab_mixer_tx_datagram(packet);
 printf("PASS missing reader/full queue/recovery/128-byte boundary;100000 sends %.6fs, queued%d\n",seconds,count);
}
