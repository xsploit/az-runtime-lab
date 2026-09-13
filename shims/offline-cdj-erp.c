/* Isolated CDJ3000X lab transport. No hardware device access. */
#define open64 usb_fixture_open64
#include "offline-usb-fixture.c"
#undef open64
#include <stdint.h>
#include <sys/ioctl.h>
static atomic_int erp_fd=ATOMIC_VAR_INIT(-1);
static uint32_t cfg_mode=1,cfg_length=64;
static uint16_t cfg_bits=16;
static uint8_t cfg_enable=1;
int open64(const char *path,int flags,...){
 if(!strcmp(path,"/dev/subucom_spi1.0")){
  int fd=syscall(SYS_openat,AT_FDCWD,"/tmp/cdj-erp-rx.fifo",O_RDWR|O_NONBLOCK|O_CLOEXEC,0);
  if(fd>=0){atomic_store(&erp_fd,fd);fprintf(stderr,"LAB_CDJ_ERP fd=%d\n",fd);}return fd;
 }
 mode_t mode=0;
 if((flags&O_CREAT)||((flags&O_TMPFILE)==O_TMPFILE)){va_list ap;va_start(ap,flags);mode=va_arg(ap,int);va_end(ap);}
 return usb_fixture_open64(path,flags,mode);
}
int ioctl(int fd,unsigned long req,...){
 va_list ap;va_start(ap,req);void *arg=va_arg(ap,void*);va_end(ap);
 if(fd!=atomic_load(&erp_fd))return syscall(SYS_ioctl,fd,req,arg);
 switch(req){
 case 0x80027003:memcpy(arg,&cfg_bits,2);return 0;
 case 0x40027003:memcpy(&cfg_bits,arg,2);return 0;
 case 0x80047004:memcpy(arg,&cfg_length,4);return 0;
 case 0x40047004:memcpy(&cfg_length,arg,4);return 0;
 case 0x80047002:memcpy(arg,&cfg_mode,4);return 0;
 case 0x40047002:memcpy(&cfg_mode,arg,4);return 0;
 case 0x80017001:memcpy(arg,&cfg_enable,1);return 0;
 case 0x40017001:memcpy(&cfg_enable,arg,1);return 0;
 case 0x40107000:{uint32_t h[2];memcpy(h,arg,8);
  if(h[0]!=0x01000000||h[1]!=64){fprintf(stderr,"LAB_CDJ_ERP unexpected TX header=%x length=%u\n",h[0],h[1]);errno=EINVAL;return -1;}
  static atomic_uint n;if(atomic_fetch_add(&n,1)==0)fprintf(stderr,"LAB_CDJ_ERP accepted TX64\n");return 0;}
 default:fprintf(stderr,"LAB_CDJ_ERP unknown ioctl=%lx\n",req);errno=ENOTTY;return -1;
 }
}
int close(int fd){int expected=fd;atomic_compare_exchange_strong(&erp_fd,&expected,-1);return syscall(SYS_close,fd);}
