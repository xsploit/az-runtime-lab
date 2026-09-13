#!/usr/bin/env python3
"""Build isolated graph/grid tests with sanitizers; no audio devices or live UI."""
import json,pathlib,subprocess,tempfile
m=pathlib.Path(__file__).resolve().parent
common=['beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c']
results={}
with tempfile.TemporaryDirectory(prefix='az-beat-check-') as t:
 for name,test,sources in [('graph',m/'test_beat_graph.c',common+['dsp_graph.c','channel_eq.c','deck_mix.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']),('grid',m.parent/'analysis/dsp-oracle/beat-port/test_grid.c',common)]:
  exe=pathlib.Path(t)/name
  cmd=['cc','-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror','-fsanitize=address,undefined','-fno-omit-frame-pointer',str(test),*[str(m/n) for n in sources],'-lm','-o',str(exe)]
  subprocess.run(cmd,check=True);r=subprocess.run([str(exe)],capture_output=True,text=True)
  results[name]={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr,'command':cmd}
(m.parent/'analysis/az-beat-graph-results.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2));raise SystemExit(any(r['returncode'] for r in results.values()))
