/* Runs the original AZ adapter instructions at their original address under QEMU.
 * Input: locally extracted code page. No player boot, devices or cabinet needed.
 */
#include <stdio.h>
#include <stdint.h>
#include <sys/mman.h>
#include <string.h>
int main(int argc,char **argv) {
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb"); if(!f)return 3;
 void *p=mmap((void*)0x21ee000,4096,PROT_READ|PROT_WRITE,
             MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED,-1,0);
 if(p==MAP_FAILED)return 4;
 if(fread(p,1,4096,f)!=4096)return 5;
 fclose(f); if(mprotect(p,4096,PROT_READ|PROT_EXEC))return 6;
 __builtin___clear_cache(p,(char*)p+4096);
 uintptr_t vt[4]={0,0,0,0x21edc30};
 struct {uintptr_t *vt; uint32_t id,max; float scale;} a={vt,0,1023,1.0f};
 struct {uint32_t reserved[2];uint32_t raw;} event={{0,0},0};
 float (*convert)(void*,void*)=(void*)0x21ee490;
 for(unsigned i=0;i<=1024;i++) {
   event.raw=i; float result=convert(&a,&event);
   printf("%u,%.9g\n",i,result);
 }
 return 0;
}
