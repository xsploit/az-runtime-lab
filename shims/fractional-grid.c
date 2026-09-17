/* Private opt-in AZ 1.30 Blue-waveform experiment. No firmware file writes.
 * Constructor hooks are scoped to three Blue grid calls and the translation
 * shortcut, whose override is active only on the current grid-drawing thread.
 */
#define _GNU_SOURCE
#include <sys/mman.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#ifndef MAP_FIXED_NOREPLACE
#define MAP_FIXED_NOREPLACE 0x100000
#endif
#include "grid-phase.h"
#ifndef __aarch64__
#error This native hook requires AArch64
#endif

__thread int lab_grid_filter_active __attribute__((tls_model("initial-exec"),visibility("hidden")));
struct phase_entry { void *key, *pixels; float correction; };
static struct phase_entry entries[32];
static unsigned next_slot;
unsigned long lab_grid_updates, lab_grid_draws, lab_grid_fallbacks;
int lab_grid_enabled=1; /* Lab A/B switch; change only while the player is stopped. */

__attribute__((visibility("hidden")))
void lab_grid_record(void *key, int64_t position, void *pixels, float zoom) {
    float phase;
    unsigned i;
    for (i=0; i<32 && entries[i].key != key; ++i) {}
    if (i==32) i=next_slot++ % 32;
    entries[i].key=key;
    entries[i].pixels=NULL;
    if (pixels && lab_grid_phase(position,zoom,&phase)) {
        entries[i].pixels=pixels;
        entries[i].correction=phase;
    }
    if (lab_grid_updates++ < 4)
        fprintf(stderr,"[grid-phase] update key=%p position=%lld zoom=%.8g correction=%.8g valid=%d\n",
                key,(long long)position,zoom,entries[i].correction,entries[i].pixels!=NULL);
}

static void native_draw_at(void *g,void *im,int x,int y,int flag) {
    ((void(*)(void*,void*,int,int,int))0x23b05e0)(g,im,x,y,flag);
}

void lab_grid_draw(void *g,void *im,int x,int y,int flag) {
    if (!lab_grid_enabled) { native_draw_at(g,im,x,y,flag); return; }
    unsigned i;
    for (i=0; i<32 && entries[i].key!=im; ++i) {}
    if (i==32 || !entries[i].pixels || *(void**)im!=entries[i].pixels || flag) {
        ++lab_grid_fallbacks; native_draw_at(g,im,x,y,flag); return;
    }
    void *context=*(void**)g;
    if (!context || *(uintptr_t*)context!=0x3142bc0) {
        ++lab_grid_fallbacks; native_draw_at(g,im,x,y,flag); return;
    }
    void *state=*(void**)((char*)context+8);
    int *quality=(int*)((char*)state+0x60);
    if (*quality!=1 && *quality!=2) {
        ++lab_grid_fallbacks; native_draw_at(g,im,x,y,flag); return;
    }
    float affine[6]={1,0,(float)x+entries[i].correction,0,1,(float)y};
    int previous=lab_grid_filter_active;
    lab_grid_filter_active=1;
    ((void(*)(void*,void*,const float*,int))0x23b04e0)(g,im,affine,flag);
    lab_grid_filter_active=previous;
    ++lab_grid_draws;
}

extern void lab_grid_update(void);
extern void lab_grid_gate(void);
/* Caller-specific update bridge. Original maker preserves x19/x26/d9;
 * its return is retained while recording the exact supplied position/zoom.
 */
__asm__(
 ".text\n.balign 4\n.global lab_grid_update\n.type lab_grid_update,%function\n"
 "lab_grid_update:\n"
 "stp x29,x30,[sp,#-32]!\nmov x29,sp\nstr x20,[sp,#16]\n"
 "movz x16,#0xfe10\nmovk x16,#0x1df,lsl #16\nblr x16\n"
 "mov x20,x0\nadd x0,x19,#0x110\nldr x1,[x26]\nldr x2,[x20]\nfmov s0,s9\n"
 "bl lab_grid_record\nmov x0,x20\nldr x20,[sp,#16]\nldp x29,x30,[sp],#32\nret\n"
 ".size lab_grid_update,.-lab_grid_update\n"
 ".balign 4\n.global lab_grid_gate\n.type lab_grid_gate,%function\n"
 "lab_grid_gate:\n"
 /* First consume the flags from the original TST, before changing them. */
 "b.ne 1f\nmrs x16,tpidr_el0\nadrp x17,:gottprel:lab_grid_filter_active\n"
 "ldr x17,[x17,#:gottprel_lo12:lab_grid_filter_active]\nldr w17,[x16,x17]\ncbnz w17,1f\n"
 "movz x16,#0xae1c\nmovk x16,#0x23f,lsl #16\nbr x16\n"
 "1: movz x16,#0xae74\nmovk x16,#0x23f,lsl #16\nbr x16\n"
 ".size lab_grid_gate,.-lab_grid_gate\n"
);

struct hook { uintptr_t address; uint32_t original; void (*handler)(void); int call; };
static void fail(const char *why) { fprintf(stderr,"[grid-phase] refused: %s\n",why); _exit(78); }

__attribute__((constructor)) static void install(void) {
    char exe[512]; ssize_t n=readlink("/proc/self/exe",exe,sizeof(exe)-1);
    if (n<0) return;
    exe[n]=0;
    char *base=strrchr(exe,'/');
    if (!base || strcmp(base+1,"EP147")) return;
    if (*(uint32_t*)0x1e262e8!=0x52800781 || *(uint32_t*)0x212fc1c!=0xd503201f)
        fail("requires verified scrolling overlay");
    struct hook hooks[]={
        {0x1b97984,0x9409a123,lab_grid_update,1},
        {0x1b857e8,0x9420ab7e,(void(*)(void))lab_grid_draw,1},
        {0x1b85840,0x9420ab68,(void(*)(void))lab_grid_draw,1},
        {0x23fae18,0x540002e1,lab_grid_gate,0}
    };
    for (unsigned i=0;i<4;++i)
        if (*(uint32_t*)hooks[i].address!=hooks[i].original) fail("unexpected call-site bytes");
    size_t page=(size_t)sysconf(_SC_PAGESIZE);
    void *region=MAP_FAILED;
    for (uintptr_t hint=0x5000000;hint<0x7000000;hint+=0x100000) {
        region=mmap((void*)hint,page,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
        if (region!=MAP_FAILED) break;
    }
    if (region==MAP_FAILED) fail("no nearby veneer allocation");
    for (unsigned i=0;i<4;++i) {
        uint32_t *v=(uint32_t*)((char*)region+i*16);
        v[0]=0x58000050; v[1]=0xd61f0200;
        uintptr_t handler=(uintptr_t)hooks[i].handler;
        memcpy(v+2,&handler,8);
    }
    __builtin___clear_cache(region,(char*)region+page);
    if (mprotect(region,page,PROT_READ|PROT_EXEC)) fail("veneer protection");
    for (unsigned i=0;i<4;++i) {
        uintptr_t addr=hooks[i].address, pg=addr & ~(page-1);
        intptr_t delta=(intptr_t)((char*)region+i*16)-(intptr_t)addr;
        if (delta%4 || delta < -(1L<<27) || delta >= (1L<<27)) fail("branch out of range");
        if (mprotect((void*)pg,page,PROT_READ|PROT_WRITE|PROT_EXEC)) fail("text protection");
        *(uint32_t*)addr=(hooks[i].call?0x94000000:0x14000000)|((delta/4)&0x3ffffff);
        __builtin___clear_cache((char*)addr,(char*)addr+4);
        if (mprotect((void*)pg,page,PROT_READ|PROT_EXEC)) fail("restore text protection");
    }
    fprintf(stderr,"[grid-phase] Blue waveform hooks installed, veneers=%p\n",region);
}
