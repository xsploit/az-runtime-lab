from pathlib import Path
import subprocess
b=Path(__file__).resolve().parent
src=['test_headphone_graph.c','headphone_dsp.c','deck_mix.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
import tempfile
with tempfile.TemporaryDirectory() as tmp:
 for name,extra in [('normal',[]),('sanitized',['-fsanitize=address,undefined'])]:
  exe=str(Path(tmp)/name)
  subprocess.run(['cc','-DLAB_HEADPHONE_DSP','-std=c11','-O2','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror',*extra,*[str(b/x) for x in src],'-lm','-o',exe],check=True)
  subprocess.run([exe,str(b.parent/'analysis/headphone-oracle/tables.bin')],check=True)
