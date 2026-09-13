/* AZ lab only: synthetic mixer fd; no real device access or automatic button events. */
#define open64 usb_fixture_open64
#include "offline-usb-fixture.c"
#undef open64
#include <stdint.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include "mixer-tx-datagram.h"
static atomic_int mixer_fd = ATOMIC_VAR_INIT(-1);
static atomic_int erp_fd = ATOMIC_VAR_INIT(-1);
static atomic_int deck_fd[2]={ATOMIC_VAR_INIT(-1),ATOMIC_VAR_INIT(-1)};
struct config {uint32_t mode,length;uint16_t bits;uint8_t enable;};
static struct config configs[4]={{1,128,16,1},{1,128,16,1},{1,152,16,1},{1,152,16,1}};
int open64(const char *path,int flags,...){
 if(getenv("LAB_DECK_FIXTURE")){
  int group=!strcmp(path,"/dev/subucom_spi5.0")?0:(!strcmp(path,"/dev/subucom_spi2.0")?1:-1);
  if(group>=0){
   const char *fifo=group?"/tmp/deck1-rx.fifo":"/tmp/deck0-rx.fifo";
   int fd=syscall(SYS_openat,AT_FDCWD,fifo,O_RDWR|O_NONBLOCK|O_CLOEXEC,0);
   if(fd>=0){atomic_store(&deck_fd[group],fd);fprintf(stderr,"LAB_DECK group=%d fd=%d\n",group,fd);}
   return fd;
  }
 }
 if(getenv("LAB_ERP_FIXTURE") && !strcmp(path,"/dev/subucom_spi1.0")){
  int fd=syscall(SYS_openat,AT_FDCWD,"/tmp/erp-rx.fifo",O_RDWR|O_NONBLOCK|O_CLOEXEC,0);
  if(fd>=0){atomic_store(&erp_fd,fd);fprintf(stderr,"LAB_ERP opened fixture fd=%d\n",fd);}
  return fd;
 }
 if(!strcmp(path,"/dev/subucom_spi3.0")){
  int fd=syscall(SYS_openat,AT_FDCWD,"/tmp/mixer-rx.fifo",O_RDWR|O_NONBLOCK|O_CLOEXEC,0);
  if(fd>=0){atomic_store(&mixer_fd,fd);fprintf(stderr,"LAB_MIXER opened fixture fd=%d\n",fd);}
  return fd;
 }
 mode_t mode=0;
 if((flags&O_CREAT)||((flags&O_TMPFILE)==O_TMPFILE)){va_list ap;va_start(ap,flags);mode=va_arg(ap,int);va_end(ap);}
 return usb_fixture_open64(path,flags,mode);
}
int ioctl(int fd,unsigned long req,...){
 va_list ap;va_start(ap,req);void *arg=va_arg(ap,void*);va_end(ap);
 int index=fd==atomic_load(&mixer_fd)?0:fd==atomic_load(&erp_fd)?1:fd==atomic_load(&deck_fd[0])?2:fd==atomic_load(&deck_fd[1])?3:-1;
 if(index<0)return syscall(SYS_ioctl,fd,req,arg);
 struct config *cfg=&configs[index];
 switch(req){
 case 0x80027003:memcpy(arg,&cfg->bits,2);return 0;
 case 0x40027003:memcpy(&cfg->bits,arg,2);return 0;
 case 0x80047004:memcpy(arg,&cfg->length,4);return 0;
 case 0x40047004:memcpy(&cfg->length,arg,4);return 0;
 case 0x80047002:memcpy(arg,&cfg->mode,4);return 0;
 case 0x40047002:memcpy(&cfg->mode,arg,4);return 0;
 case 0x80017001:memcpy(arg,&cfg->enable,1);return 0;
 case 0x40017001:memcpy(&cfg->enable,arg,1);return 0;
 case 0x40107000:{
  uint32_t header[2];memcpy(header,arg,8);
  if(header[0]!=0x01000000||header[1]!=(index>=2?152u:128u)){errno=EINVAL;return -1;}
  if(index==0 && getenv("LAB_MIXER_TX_STREAM")){
   uint64_t ptr;memcpy(&ptr,(char*)arg+8,8);
   lab_mixer_tx_datagram((void*)(uintptr_t)ptr);
  }
  /* Bounded, opt-in private diagnostic: mixer TX only, never ERP or keys. */
  if(fd==atomic_load(&mixer_fd) && getenv("LAB_MIXER_TX_CAPTURE")){
   static atomic_flag capture_lock=ATOMIC_FLAG_INIT;
   static unsigned captured;
   if(!atomic_flag_test_and_set(&capture_lock)){
    if(captured<32768){
     uint64_t ptr;memcpy(&ptr,(char*)arg+8,8);
     int out=syscall(SYS_openat,AT_FDCWD,"/tmp/mixer-tx.raw",O_WRONLY|O_CREAT|O_APPEND|O_CLOEXEC|O_NOFOLLOW,0600);
     if(out>=0){
      ssize_t n=syscall(SYS_write,out,(void*)(uintptr_t)ptr,128);
      syscall(SYS_close,out);
      if(n==128)captured++;
      else fprintf(stderr,"LAB_MIXER TX capture incomplete write=%ld\n",(long)n);
     }
    }
    atomic_flag_clear(&capture_lock);
   }
  }
  static atomic_uint tx_count;
  if(atomic_fetch_add(&tx_count,1)==0)fprintf(stderr,"LAB_MIXER first TX accepted length=128\n");
  return 0;
 }
 default:fprintf(stderr,"LAB_MIXER unknown ioctl=%lx\n",req);errno=ENOTTY;return -1;
 }
}
int close(int fd){
 int expected=fd;atomic_compare_exchange_strong(&mixer_fd,&expected,-1);
 expected=fd;atomic_compare_exchange_strong(&erp_fd,&expected,-1);
 for(int i=0;i<2;i++){expected=fd;atomic_compare_exchange_strong(&deck_fd[i],&expected,-1);}
 return syscall(SYS_close,fd);
}
