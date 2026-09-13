#!/usr/bin/env python3
"""Validate new shared graph and shared-module/native composite replay."""
import json,pathlib,subprocess,tempfile
mixer=pathlib.Path(__file__).resolve().parent;root=mixer.parents[1];here=mixer.parent/'analysis/dsp-oracle'
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
results={}
with tempfile.TemporaryDirectory(prefix='cfx-graph-check-') as td:
 for sanitized in [False,True]:
  extra=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if sanitized else []
  binary=str(pathlib.Path(td)/('graph-asan' if sanitized else 'graph'))
  cmd=['cc',*flags,*extra,*[str(mixer/n) for n in ['test_eq_graph.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_manager.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','deck_mix.c','../analysis/dsp-oracle/eq_control.c','../analysis/dsp-oracle/equalizer.c','../analysis/dsp-oracle/isolator.c','../analysis/dsp-oracle/eq_channel.c']],'-lm','-o',binary]
  subprocess.run(cmd,check=True);r=subprocess.run([binary,str(here/"native-equalizer-tables.bin"),str(here/"native-isolator-gain.bin")],text=True,capture_output=True)
  results['graph_asan' if sanitized else 'graph']={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr,'command':cmd}
(here/'eq-graph-results.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2))
raise SystemExit(any(v['returncode'] for v in results.values()))
