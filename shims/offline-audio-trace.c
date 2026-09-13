#define _GNU_SOURCE
#include <dlfcn.h>
#include <string.h>
#include <stdio.h>
/* Diagnostic offline shim: no MIDI devices, no MIDI events. Not a controller implementation. */
#include <unistd.h>
int snd_seq_open(void **h,const char*n,int s,int m){*h=0;return -19;}
int snd_seq_nonblock(void*h,int n){return -19;}
int snd_seq_close(void*h){return 0;}
int snd_seq_set_client_name(void*h,const char*n){return -19;}
int snd_seq_client_id(void*h){return -19;}
int snd_seq_create_simple_port(void*h,const char*n,unsigned c,unsigned t){return -19;}
int snd_seq_delete_simple_port(void*h,int p){return -19;}
int snd_seq_connect_from(void*h,int a,int b,int c){return -19;}
int snd_seq_connect_to(void*h,int a,int b,int c){return -19;}
int snd_seq_query_next_client(void*h,void*i){return -19;}
int snd_seq_query_next_port(void*h,void*i){return -19;}
int snd_seq_system_info(void*h,void*i){return -19;}
int snd_seq_poll_descriptors_count(void*h,short e){return 0;}
int snd_seq_poll_descriptors(void*h,void*p,unsigned s,short e){return 0;}
int snd_seq_event_input_pending(void*h,int f){usleep(10000);return 0;}
int snd_seq_event_input(void*h,void**e){usleep(10000);*e=0;return -11;}
int snd_seq_event_output_direct(void*h,void*e){return -19;}


/* Logging only: forward audio calls to the real guest ALSA library. */
static void *alsa_symbol(const char *name){
 void *(*lookup)(void*,const char*)=dlvsym(RTLD_NEXT,"dlsym","GLIBC_2.17");
 void *h=dlopen("libasound.so.2",RTLD_NOW|RTLD_LOCAL);
 return lookup(h,name);
}
int snd_pcm_open(void **p,const char *name,int stream,int mode){
 int (*f)(void**,const char*,int,int)=alsa_symbol("snd_pcm_open");
 int r=f(p,name,stream,mode);fprintf(stderr,"LAB_AUDIO open name=%s stream=%d mode=%d result=%d\n",name,stream,mode,r);return r;
}
int snd_card_next(int *card){
 int (*f)(int*)=alsa_symbol("snd_card_next");int before=*card;int r=f(card);
 static int count=0;if(count++<16)fprintf(stderr,"LAB_AUDIO card_next before=%d after=%d result=%d\n",before,*card,r);return r;
}

int snd_pcm_hw_params_set_channels(void*p,void*h,unsigned v){ int(*f)(void*,void*,unsigned)=alsa_symbol("snd_pcm_hw_params_set_channels");int r=f(p,h,v);fprintf(stderr,"LAB_AUDIO channels=%d result=%d\n",(int)v,r);return r;}
int snd_pcm_hw_params_set_format(void*p,void*h,int v){ int(*f)(void*,void*,int)=alsa_symbol("snd_pcm_hw_params_set_format");int r=f(p,h,v);fprintf(stderr,"LAB_AUDIO format=%d result=%d\n",(int)v,r);return r;}
int snd_pcm_hw_params_set_access(void*p,void*h,int v){ int(*f)(void*,void*,int)=alsa_symbol("snd_pcm_hw_params_set_access");int r=f(p,h,v);fprintf(stderr,"LAB_AUDIO access=%d result=%d\n",(int)v,r);return r;}

/* Opt-in diagnostic build: identify the active PCM transfer API. */
#include <stdatomic.h>
static atomic_ulong writes_i,writes_n,reads_i,reads_n,waits;
#define TRANSFER(name,buffer_type,counter) \
long name(void *p,buffer_type b,unsigned long frames){ \
 static long(*f)(void*,buffer_type,unsigned long); \
 if(!f)f=alsa_symbol(#name); \
 unsigned long count=atomic_fetch_add(&counter,1); \
 long r=f(p,b,frames); \
 if(count<3 || count==99999)fprintf(stderr,"LAB_TRANSFER %s count=%lu frames=%lu result=%ld\n",#name,count+1,frames,r); \
 return r; }
TRANSFER(snd_pcm_writei,const void*,writes_i)
TRANSFER(snd_pcm_writen,void**,writes_n)
TRANSFER(snd_pcm_readi,void*,reads_i)
TRANSFER(snd_pcm_readn,void**,reads_n)
int snd_pcm_wait(void*p,int timeout){
 static int(*f)(void*,int);if(!f)f=alsa_symbol("snd_pcm_wait");
 unsigned long count=atomic_fetch_add(&waits,1);int r=f(p,timeout);
 if(count<3 || count==99999)fprintf(stderr,"LAB_TRANSFER wait count=%lu timeout=%d result=%d\n",count+1,timeout,r);return r;
}

void *dlsym(void *handle,const char *name){
 if(!strcmp(name,"snd_pcm_writei"))return (void*)&snd_pcm_writei;
 if(!strcmp(name,"snd_pcm_writen"))return (void*)&snd_pcm_writen;
 if(!strcmp(name,"snd_pcm_readi"))return (void*)&snd_pcm_readi;
 if(!strcmp(name,"snd_pcm_readn"))return (void*)&snd_pcm_readn;
 if(!strcmp(name,"snd_pcm_wait"))return (void*)&snd_pcm_wait;
 if(!strcmp(name,"snd_pcm_hw_params_set_access")) return (void*)&snd_pcm_hw_params_set_access;
 if(!strcmp(name,"snd_pcm_hw_params_set_format")) return (void*)&snd_pcm_hw_params_set_format;
 if(!strcmp(name,"snd_pcm_hw_params_set_channels")) return (void*)&snd_pcm_hw_params_set_channels;
 if (!strcmp(name,"snd_pcm_open")) return (void*)&snd_pcm_open;
 if (!strcmp(name,"snd_card_next")) return (void*)&snd_card_next;
 if (!strcmp(name,"snd_seq_open")) return (void*)&snd_seq_open;
 if (!strcmp(name,"snd_seq_nonblock")) return (void*)&snd_seq_nonblock;
 if (!strcmp(name,"snd_seq_close")) return (void*)&snd_seq_close;
 if (!strcmp(name,"snd_seq_set_client_name")) return (void*)&snd_seq_set_client_name;
 if (!strcmp(name,"snd_seq_client_id")) return (void*)&snd_seq_client_id;
 if (!strcmp(name,"snd_seq_create_simple_port")) return (void*)&snd_seq_create_simple_port;
 if (!strcmp(name,"snd_seq_delete_simple_port")) return (void*)&snd_seq_delete_simple_port;
 if (!strcmp(name,"snd_seq_connect_from")) return (void*)&snd_seq_connect_from;
 if (!strcmp(name,"snd_seq_connect_to")) return (void*)&snd_seq_connect_to;
 if (!strcmp(name,"snd_seq_query_next_client")) return (void*)&snd_seq_query_next_client;
 if (!strcmp(name,"snd_seq_query_next_port")) return (void*)&snd_seq_query_next_port;
 if (!strcmp(name,"snd_seq_system_info")) return (void*)&snd_seq_system_info;
 if (!strcmp(name,"snd_seq_poll_descriptors_count")) return (void*)&snd_seq_poll_descriptors_count;
 if (!strcmp(name,"snd_seq_poll_descriptors")) return (void*)&snd_seq_poll_descriptors;
 if (!strcmp(name,"snd_seq_event_input_pending")) return (void*)&snd_seq_event_input_pending;
 if (!strcmp(name,"snd_seq_event_input")) return (void*)&snd_seq_event_input;
 if (!strcmp(name,"snd_seq_event_output_direct")) return (void*)&snd_seq_event_output_direct;
 void *(*real)(void*,const char*) = dlvsym(RTLD_NEXT,"dlsym","GLIBC_2.17");
 return real ? real(handle,name) : 0;
}
