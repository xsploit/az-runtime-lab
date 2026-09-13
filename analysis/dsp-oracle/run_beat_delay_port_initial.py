"""Fresh Off -> Delay native manager regression across every beat and BPM bounds.
Run run_beat_delay_port.py first to rebuild native/shared executables.
"""
from pathlib import Path
import hashlib,json,os,subprocess
here=Path(__file__).resolve().parent
results=[]
for case in range(72):
 env=dict(os.environ,BEAT_INITIAL_CASE=str(case))
 row={'case':case,'bpm100':[0,4000,12000,12800,100000,4294967295][case//12],'requested_beat':case%12}
 for label,cmd in [('native',['qemu-arm-static','./beat-delay-port-arm']),('host',['./beat-delay-port-host']),('sanitized',['./beat-delay-port-host-asan'])]:
  p=subprocess.run([*cmd,'native-beat-delay-port-initial-records.bin'],cwd=here,env=env,capture_output=True,text=True)
  row[label]={'exit':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
  if p.returncode:
   print(json.dumps(row,indent=2));raise SystemExit(1)
 results.append(row)
report={'scope':'Original ARM manager, Delay and quantize functions against isolated Delay reconstruction, fresh Off-to-Delay; complete state/audio/ring replay. No live AZ or physical hardware claim.','results':results,'source_hashes':{p:hashlib.sha256((here/p).read_bytes()).hexdigest() for p in ['beat_delay_manager_compare.c','beat-port/beat_manager_delay.c','beat-port/beat_delay.c','beat-port/beat_delay.h','run_beat_delay_port_initial.py']}}
(here/'beat-delay-port-initial-results.json').write_text(json.dumps(report,indent=2)+'\n')
print('PASS: 72 fresh transitions, native + host + sanitized, full states/audio/ring')
