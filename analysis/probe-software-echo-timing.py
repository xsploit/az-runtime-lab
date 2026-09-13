"""Record applied shared Echo timing for AZ feedback integration.

This exercises reconstructed software, not a new native-firmware oracle.
Read applied state after audio processing; E1 requested state can differ.
"""
from pathlib import Path
import json, subprocess, tempfile

base = Path(__file__).resolve().parents[1]
source = r'''
#include "beat_fx.h"
#include <stdio.h>
#include <math.h>
static LabBeatFx fx;
int main(void) {
 unsigned bpms[]={0,1,3999,4000,4001,12000,12800,99999,100000,UINT32_MAX};
 for(unsigned j=0;j<sizeof(bpms)/sizeof(bpms[0]);j++) for(unsigned beat=0;beat<12;beat++) {
  fprintf(stderr,"probe bpm=%u beat=%u\n",bpms[j],beat);
  lab_beat_fx_init(&fx);
  if(lab_beat_fx_source(&fx,0,bpms[j],0,0,1,0)!=1) return 2;
  if(lab_beat_fx_set(&fx,5,0,beat,.5f)!=1) return 3;
  for(unsigned n=0;n<1024;n++) {
   Stereo audio[64]={{0}};
   beat_manager_begin_round(&fx.manager);
   lab_beat_fx_offer(&fx,0,audio);
   if(fx.echo.delay>=fx.echo.ring_length || fx.echo.previous_delay>=fx.echo.ring_length) return 4;
   for(unsigned k=0;k<64;k++) if(!isfinite(audio[k].l)||!isfinite(audio[k].r)) return 5;
  }
  printf("{\"bpm100\":%u,\"requested_beat\":%u,\"active\":%u,"
         "\"phase\":%u,\"manager_beat\":%u,\"echo_beat\":%u,"
         "\"time_ms\":%u,\"delay_samples\":%u}\n",
         bpms[j],beat,fx.manager.active,fx.manager.phase,fx.manager.beat,
         fx.quantize.beat_button,fx.echo.time_ms,fx.echo.delay);
 }
 /* Persistent source/type/preset updates through the public accepted domain. */
 lab_beat_fx_init(&fx);
 unsigned seed=0x195376adu;
 for(unsigned block=0;block<20000;block++) {
  seed=seed*1664525u+1013904223u;
  if(block%13==0) {
   unsigned bpm=block%91==0?UINT32_MAX:seed%100001u;
   if(lab_beat_fx_source(&fx,seed%4,bpm,block*2,0,1,0)!=1) return 6;
   if(lab_beat_fx_set(&fx,block%39==0?0:5,seed%5,(seed>>8)%12,(float)(seed%101)/100)!=1) return 7;
  }
  if(block%997==0) lab_beat_fx_reset(&fx);
  Stereo audio[64];
  for(unsigned k=0;k<64;k++) audio[k]=(Stereo){.01f,-.01f};
  beat_manager_begin_round(&fx.manager);
  for(unsigned target=0;target<5;target++) lab_beat_fx_offer(&fx,target,audio);
  if(fx.echo.delay>=fx.echo.ring_length||fx.echo.previous_delay>=fx.echo.ring_length) return 8;
  for(unsigned k=0;k<64;k++) if(!isfinite(audio[k].l)||!isfinite(audio[k].r)) return 9;
 }
 return 0;
}
'''
with tempfile.TemporaryDirectory(prefix='az-echo-timing-') as tmp:
    p=Path(tmp); (p/'probe.c').write_text(source)
    files=['beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c']
    subprocess.run(['cc','-std=c11','-g','-fsanitize=address,undefined','-O1','-ffp-contract=off','-fno-tree-vectorize',
                    '-Wall','-Wextra','-Werror','-I',str(base/'mixer'),str(p/'probe.c'),
                    *[str(base/'mixer'/name) for name in files],'-lm','-o',str(p/'probe')],check=True)
    rows=[json.loads(line) for line in subprocess.check_output([str(p/'probe')],text=True).splitlines()]
assert len(rows)==120 and all(r['active']==5 and r['phase']==0 for r in rows)
result={'scope':'Applied shared software Echo; no native AZ audio or physical validation',
        'rows':rows,'persistent_stress_blocks':20000,'next':'Publish applied timing rather than echoing requested E1 beat into AZ feedback'}
(base/'analysis/software-echo-applied-timing.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
