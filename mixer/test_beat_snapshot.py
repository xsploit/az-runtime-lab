"""Applied feedback must survive range adjustment, target changes and reset."""
from pathlib import Path
import subprocess,tempfile
b=Path(__file__).resolve().parent
source=r'''
#include "beat_fx.h"
#include <assert.h>
#include <string.h>
static LabBeatFx fx,before;
static LabBeatFxSnapshot read_state(void){
 LabBeatFxSnapshot s;
 memcpy(&before,&fx,sizeof fx);
 assert(lab_beat_fx_snapshot(&fx,&s)==1);
 assert(memcmp(&before,&fx,sizeof fx)==0);
 return s;
}
static void settle(void){
 for(unsigned n=0;n<1024;n++){
  Stereo samples[64]={{0}};
  beat_manager_begin_round(&fx.manager);
  for(unsigned target=0;target<5;target++)lab_beat_fx_offer(&fx,target,samples);
 }
}
int main(void){
 LabBeatFxSnapshot s;
 assert(lab_beat_fx_snapshot(0,&s)==-1);
 assert(lab_beat_fx_snapshot(&fx,0)==-1);
 lab_beat_fx_init(&fx);
 assert(lab_beat_fx_source(&fx,0,4000,0,0,1,0)==1);
 assert(lab_beat_fx_set(&fx,5,0,8,.5f)==1);
 s=read_state();assert(s.active_type==0&&s.scheduled_type==5);
 settle();s=read_state();
 /* Native regression: Off's12000ms must not replace range-adjusted Echo. */
 assert(s.active_type==5&&s.phase==0&&s.effect_beat==6);
 assert(s.time_ms==3000&&s.delay_samples==132300&&s.on);
 assert(s.source_bpm100==4000&&!s.grid_present&&!s.quantize_requested);
 assert(lab_beat_fx_set(&fx,5,3,8,.5f)==1);
 s=read_state();assert(s.target==0&&s.scheduled_target==3);
 settle();s=read_state();assert(s.target==3&&s.phase==0);
 lab_beat_fx_reset(&fx);s=read_state();
 assert(s.active_type==0&&s.scheduled_type==5&&s.scheduled_target==3);
 assert(s.source_bpm100==4000);
 settle();s=read_state();assert(s.active_type==5&&s.target==3&&s.phase==0);
 return 0;
}
'''
with tempfile.TemporaryDirectory(prefix='beat-snapshot-') as td:
 p=Path(td);(p/'test.c').write_text(source)
 files=['beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c']
 for flags in (['-O2'],['-O1','-g','-fsanitize=address,undefined']):
  subprocess.run(['cc','-std=c11','-Wall','-Wextra','-Werror','-ffp-contract=off',
   '-fno-tree-vectorize',*flags,'-I',str(b),str(p/'test.c'),
   *[str(b/f) for f in files],'-lm','-o',str(p/'test')],check=True)
  subprocess.run([str(p/'test')],check=True)
print('Applied timing, pending target, reset and non-mutating snapshots: normal + ASAN/UBSAN pass')
