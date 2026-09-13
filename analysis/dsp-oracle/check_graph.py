#!/usr/bin/env python3
"""Validate new shared graph and shared-module/native composite replay."""
import json,pathlib,subprocess,tempfile
here=pathlib.Path(__file__).resolve().parent;root=here.parents[2];mixer=root/'runtime-lab/mixer'
flags=['-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
results={}
with tempfile.TemporaryDirectory(prefix='cfx-graph-check-') as td:
 for sanitized in [False,True]:
  extra=['-fsanitize=address,undefined','-fno-omit-frame-pointer'] if sanitized else []
  binary=str(pathlib.Path(td)/('graph-asan' if sanitized else 'graph'))
  cmd=['cc',*flags,*extra,*[str(mixer/n) for n in ['test_dsp_graph.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_manager.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','deck_mix.c']],'-lm','-o',binary]
  subprocess.run(cmd,check=True);r=subprocess.run([binary],text=True,capture_output=True)
  results['graph_asan' if sanitized else 'graph']={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr,'command':cmd}
 binary=str(pathlib.Path(td)/'shared-composite')
 cmd=['cc',*flags,'-DHOST_REPLAY','-DCFX_SHARED','-DComposedCfx=LabCfxManager','-Dcomposed_init=lab_cfx_manager_init',
      '-Dcomposed_controls=lab_cfx_manager_controls','-Dcomposed_process=lab_cfx_manager_process',
      str(here/'composite_compare.c'),str(mixer/'cfx_filter.c'),str(mixer/'cfx_crush.c'),str(mixer/'cfx_noise.c'),str(mixer/'cfx_sweep.c'),str(mixer/'cfx_dubecho.c'),str(mixer/'cfx_space.c'),str(mixer/'cfx_manager.c'),'-lm','-o',binary]
 subprocess.run(cmd,check=True);r=subprocess.run([binary,str(here/'native-composite-records.bin')],capture_output=True,text=True)
 results['shared_native_replay']={'returncode':r.returncode,'stdout':r.stdout,'stderr':r.stderr,'command':cmd}
(here/'graph-results.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2))
raise SystemExit(any(v['returncode'] for v in results.values()))
