#!/usr/bin/env python3
"""Offline integration checks for the experimental shared BeatFX wrapper."""
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile

here = Path(__file__).resolve().parent
sources = ['beat-port/test_pair_runtime.c', 'beat-port/pair_runtime.c',
           'beat-port/beat_pair.c', 'beat-port/beat_grid.c', 'beat-port/beat_echo.c', 'beat-port/beat_delay.c',
           'beat_manager_echo.c', 'echo_audio.c', 'echo_control.c', 'echo_quantize.c',
           'delay_audio.c', 'delay_control.c', 'delay_quantize.c']
flags = ['-std=c11', '-O2', '-ffp-contract=off', '-fno-tree-vectorize',
         '-Wall', '-Wextra', '-Werror']
results = {}
with tempfile.TemporaryDirectory(prefix='az-pair-wrapper-') as tmp:
    for name, extra in [('host', []), ('sanitized', ['-fsanitize=address,undefined', '-fno-omit-frame-pointer'])]:
        exe = str(Path(tmp) / name)
        command = ['cc', *flags, *extra, *sources, '-lm', '-o', exe]
        subprocess.run(command, cwd=here, check=True)
        run = subprocess.run([exe], cwd=here, text=True, capture_output=True, timeout=30)
        results[name] = dict(returncode=run.returncode, stdout=run.stdout, stderr=run.stderr)
report = dict(results=results,
              source_hashes={f: hashlib.sha256((here / f).read_bytes()).hexdigest()
                             for f in sources + ['beat-port/pair_runtime.h', 'run_pair_runtime.py']},
              scope='Experimental fixed64-frame44.1kHz host wrapper: input rejection, per-round target offers, deck/master delayed output, independent instances, source/grid invalidation, command validation and reset. Not live AZ/FIFO/controller or native constructor equivalence.')
(here / 'pair-runtime-results.json').write_text(json.dumps(report, indent=2) + '\n')
for name, result in results.items():
    print(name, result['returncode'], result['stdout'].strip(), result['stderr'].strip())
raise SystemExit(any(result['returncode'] for result in results.values()))
