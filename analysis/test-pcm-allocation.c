#include "../shims/pcm-template-allocation.h"
#include <assert.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
static struct pcm_store store;
static unsigned calls;
static int fail;
static void *normal(size_t n) {
    ++calls;
    if (fail) { errno=ENOMEM; return NULL; }
    void *p=malloc(n);
    if (p) memset(p,0xcc,n);
    return p;
}
static void guards(void *p,size_t n,unsigned char fill) {
    assert(p);
    unsigned char *b=p;
    for(size_t i=0;i<n;++i) assert(b[i] == (i<8?0xaf:i>=n-8?0xef:fill));
}
int main(void) {
    assert(!pcm_store_init(&store,1));
    void *p=pcm_template_allocate(&store,PCM_STORE_BYTES,0x777b00,normal);
    assert(p && calls==0); guards(p,PCM_STORE_BYTES,0);
    errno=EDOM;
    void *q=pcm_template_allocate(&store,PCM_STORE_BYTES,0x777b00,normal);
    assert(q && calls==1 && errno==EDOM); guards(q,PCM_STORE_BYTES,0xcc);
    assert(pcm_store_release(&store,q)==0); free(q);
    fail=1;
    assert(!pcm_template_allocate(&store,PCM_STORE_BYTES,0x777b00,normal));
    assert(errno==ENOMEM && calls==2);
    fail=0;
    size_t sizes[]={24,32,14120,8388624};
    for(size_t i=0;i<sizeof(sizes)/sizeof(*sizes);++i) {
        q=pcm_template_allocate(&store,sizes[i],0x777b00,normal);
        guards(q,sizes[i],0xcc); free(q);
    }
    unsigned saved_calls=calls;
    size_t invalid[]={0,16,23,25,8388632};
    for(size_t i=0;i<sizeof(invalid)/sizeof(*invalid);++i) {
        assert(!pcm_template_allocate(&store,invalid[i],0x777b00,normal));
        assert(errno==EINVAL && calls==saved_calls);
    }
    q=pcm_template_allocate(&store,PCM_STORE_BYTES,0x777fd8,normal);
    assert(q);
    for(size_t i=0;i<PCM_STORE_BYTES;++i) assert(((unsigned char*)q)[i]==0xcc);
    free(q);
    assert(pcm_store_release(&store,p)==1 && !pcm_store_destroy(&store));
    q=pcm_template_allocate(&store,PCM_STORE_BYTES,0x777b00,normal);
    guards(q,PCM_STORE_BYTES,0xcc); free(q);
    puts("{\"passed\":true,\"scope\":\"allocation call-site filter, template, guarded fallback, limits, failure\"}");
}
