#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
int main(int argc, char **argv) {
 assert(argc == 2);
 void (*sample)(void) = dlsym(RTLD_DEFAULT,"lab_memory_sample");
 uint64_t *request=dlsym(RTLD_DEFAULT,"lab_memory_request"), *done=dlsym(RTLD_DEFAULT,"lab_memory_done");
 uint64_t *sequence=dlsym(RTLD_DEFAULT,"lab_memory_sequence"), *length=dlsym(RTLD_DEFAULT,"lab_memory_length");
 int *error=dlsym(RTLD_DEFAULT,"lab_memory_error");
 char *json=dlsym(RTLD_DEFAULT,"lab_memory_json");
 assert(sample && request && done && sequence && length && error && json);
 void *allocation=NULL;
 for (unsigned phase=0;phase<3;phase++) {
  if (phase==1) { allocation=malloc(64u*1024u*1024u); assert(allocation); memset(allocation,0x59,64u*1024u*1024u); }
  if (phase==2) { free(allocation); allocation=NULL; }
  *request=phase+1; errno=EDOM; sample(); assert(errno==EDOM);
  assert(*done==*request && !(*sequence&1) && *length<1024u*1024u);
  uint64_t previous=*sequence; sample(); assert(*sequence==previous);
  if (strcmp(argv[1],"missing")==0) { assert(*error==ENOSYS && *length==0); continue; }
  assert(*error==0 && *length>0);
  char name[4096]; int n=snprintf(name,sizeof(name),"%s/%u.json",argv[1],phase);
  assert(n>0 && n<(int)sizeof(name)); FILE *out=fopen(name,"w"); assert(out);
  assert(fwrite(json,1,*length,out)==*length); assert(fclose(out)==0);
 }
 puts("SNAPSHOT_TEST_OK");
}
