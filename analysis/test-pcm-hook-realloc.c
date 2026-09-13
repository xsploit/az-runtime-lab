/* Include private hook internals to exercise the ownership escape fallback.
 * Run with LAB_AZ_PCM_TEMPLATE absent; no import/code installation occurs. */
#include "../shims/pcm-template-hook.c"
#include <assert.h>
#include <sys/wait.h>
static int fail_allocation;
static void *test_malloc(size_t n) {
    if(fail_allocation) { errno=ENOMEM; return NULL; }
    return malloc(n);
}
static void *page(void) {
    void *p=pcm_store_take(&lab_pcm_store,PCM_STORE_BYTES);
    assert(p); memset(p,0x63,PCM_STORE_BYTES); return p;
}
static void check(const void *p,size_t n) {
    for(size_t i=0;i<n;++i) assert(((const unsigned char*)p)[i]==0x63);
}
int main(void) {
    assert(!getenv("LAB_AZ_PCM_TEMPLATE") && !lab_pcm_installed);
    normal_malloc=test_malloc; normal_free=free; normal_realloc=realloc;
    assert(!pcm_store_init(&lab_pcm_store,8));
    void *p=page();
    void *q=hook_realloc(p,PCM_STORE_BYTES+100);
    assert(q && !owned(q) && atomic_load(&lab_pcm_store.live)==0);
    check(q,PCM_STORE_BYTES); free(q);
    p=page(); q=hook_realloc(p,100);
    assert(q && !owned(q)); check(q,100); free(q);
    p=page(); fail_allocation=1;
    assert(!hook_realloc(p,100) && errno==ENOMEM && owned(p));
    check(p,PCM_STORE_BYTES); fail_allocation=0;
    assert(!hook_realloc(p,0) && !atomic_load(&lab_pcm_store.live));
    q=hook_realloc(NULL,100); assert(q); memset(q,0x63,100);
    q=hook_realloc(q,200); assert(q); check(q,100); hook_free(q);
    p=page();
    pid_t child=fork(); assert(child>=0);
    if(!child) { (void)hook_realloc((char*)p+8,100); _exit(99); }
    int status=0; assert(waitpid(child,&status,0)==child);
    assert(WIFEXITED(status) && WEXITSTATUS(status)==125);
    assert(owned(p)); hook_free(p);
    assert(!atomic_load(&lab_pcm_store.live));
    assert(lab_pcm_reallocations==4 && lab_pcm_releases==4);
    assert(!pcm_store_destroy(&lab_pcm_store));
    puts("{\"passed\":true,\"scope\":\"mapped realloc growth, shrink, zero, failure, external forwarding, interior rejection\"}");
}
