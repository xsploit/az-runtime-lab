"""Fresh Off -> Echo native manager regression across every beat and BPM bounds.
Run run_beat_shared.py first to rebuild native/shared executables.
"""
from pathlib import Path
import hashlib,json,os,subprocess
here=Path(__file__).resolve().parent
results=[]
for case in range(72):
 env=dict(os.environ,BEAT_INITIAL_CASE=str(case))
 row={'case':case,'bpm100':[0,4000,12000,12800,100000,4294967295][case//12],'requested_beat':case%12}
 for label,cmd in [('native',['qemu-arm-static','./beat-manager-arm']),('host',['./beat-manager-host']),('sanitized',['./beat-manager-host-asan'])]:
  p=subprocess.run([*cmd,'native-beat-initial-records.bin'],cwd=here,env=env,capture_output=True,text=True)
  row[label]={'exit':p.returncode,'stdout':p.stdout,'stderr':p.stderr}
  if p.returncode:
   print(json.dumps(row,indent=2));raise SystemExit(1)
 results.append(row)
report={'scope':'Original ARM manager, Echo and quantize functions against shared reconstruction, fresh Off-to-Echo; complete state/audio/ring replay. No live AZ or physical hardware claim.','results':results,'source_hashes':{p:hashlib.sha256((here/p).read_bytes()).hexdigest() for p in ['beat_manager_compare.c','../../mixer/beat_manager.c','run_beat_initial.py']}}
(here/'beat-initial-results.json').write_text(json.dumps(report,indent=2)+'\n')
print('PASS: 72 fresh transitions, native + host + sanitized, full states/audio/ring')
