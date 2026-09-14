#define _POSIX_C_SOURCE 200809L
#include <xf86drm.h>
#include <xf86drmMode.h>
#include <drm.h>
#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <errno.h>
#include <stdlib.h>
static uint64_t now(void) {struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return (uint64_t)t.tv_sec*1000000000+t.tv_nsec;}
int main(int argc,char**argv) {
 if(argc!=2)return 2;
 int fd=open(argv[1],O_RDWR|O_CLOEXEC);if(fd<0){perror("open");return 1;}
 uint64_t mono=0; if(drmGetCap(fd,DRM_CAP_TIMESTAMP_MONOTONIC,&mono)||mono!=1){fprintf(stderr,"No monotonic DRM clock\n");return 1;}
 drmModeRes *r=drmModeGetResources(fd);if(!r){perror("resources");return 1;}
 for(int i=0;i<r->count_connectors;i++) {drmModeConnector *c=drmModeGetConnector(fd,r->connectors[i]);if(!c)continue;
 fprintf(stderr,"connector %u type %u type_id %u connected %d encoder %u\n",c->connector_id,c->connector_type,c->connector_type_id,c->connection,c->encoder_id);drmModeFreeConnector(c);}
 uint32_t crtc=0;
 for(int i=0;i<r->count_crtcs;i++) {struct drm_crtc_get_sequence q={.crtc_id=r->crtcs[i]};if(drmIoctl(fd,DRM_IOCTL_CRTC_GET_SEQUENCE,&q)){perror("sequence");continue;}
 fprintf(stderr,"crtc %u active %u sequence %llu timestamp %lld\n",q.crtc_id,q.active,(unsigned long long)q.sequence,(long long)q.sequence_ns);if(q.active){if(crtc)return 2;crtc=q.crtc_id;}}
 drmModeFreeResources(r);if(!crtc)return 1;
 puts("observed_ns,sequence,display_ns");uint64_t start=now(),prev=UINT64_MAX;
 while(now()-start<3000000000ull){struct drm_crtc_get_sequence q={.crtc_id=crtc};if(drmIoctl(fd,DRM_IOCTL_CRTC_GET_SEQUENCE,&q)||!q.active)return 1;
 uint64_t t=now();if(q.sequence!=prev){printf("%llu,%llu,%lld\n",(unsigned long long)t,(unsigned long long)q.sequence,(long long)q.sequence_ns);prev=q.sequence;}
 struct timespec delay={0,500000};nanosleep(&delay,NULL);}
 close(fd);return 0;
}
