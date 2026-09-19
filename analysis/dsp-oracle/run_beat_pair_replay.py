#!/usr/bin/env python3
"""Replay private native records on host and ASAN/UBSAN; no Pi access."""
import hashlib
import json
import pathlib
import subprocess

here = pathlib.Path(__file__).resolve().parent
records = here / 'native-beat-pair-audio-records.bin'
native = here / 'beat-pair-audio-persistent-results.json'
report = json.loads(native.read_text())
if report['returncode'] or not report.get('persistent_candidate'):
    raise SystemExit('Need a successful persistent native run first')
sources = ['beat_pair_audio_replay.c', 'echo_audio.c', 'echo_control.c',
           'echo_quantize.c', 'delay_audio.c', 'delay_control.c',
           'delay_quantize.c', 'beat-port/beat_pair.c', 'beat-port/beat_echo.c',
           'beat-port/beat_delay.c']
for name in sources:
    if name in report['source_hashes']:
        if hashlib.sha256((here / name).read_bytes()).hexdigest() != report['source_hashes'][name]:
            raise SystemExit(f'Native evidence stale for {name}')
flags = ['-std=c11', '-O2', '-ffp-contract=off', '-fno-tree-vectorize',
         '-Wall', '-Wextra', '-Werror']
results = {}
for label, extra in [('host', []), ('asan', ['-fsanitize=address,undefined', '-fno-omit-frame-pointer'])]:
    executable = 'beat-pair-audio-host' + ('-asan' if label == 'asan' else '')
    command = ['cc', *flags, *extra, *sources, '-lm', '-o', executable]
    subprocess.run(command, cwd=here, check=True)
    completed = subprocess.run(['./' + executable], cwd=here, text=True,
                               capture_output=True, timeout=60)
    results[label] = dict(command=command, returncode=completed.returncode,
                          stdout=completed.stdout, stderr=completed.stderr)
output = dict(native_report_sha256=hashlib.sha256(native.read_bytes()).hexdigest(),
              records_sha256=hashlib.sha256(records.read_bytes()).hexdigest(),
              source_hashes={name: hashlib.sha256((here / name).read_bytes()).hexdigest()
                             for name in sources + ['run_beat_pair_replay.py']},
              results=results,
              scope='Persistent host reconstruction; modeled state and PCM each block, complete final rings. Native ARM comparison separately checks entire rings every block. No Pi/controller or listening acceptance.')
(here / 'beat-pair-audio-replay-results.json').write_text(json.dumps(output, indent=2) + '\n')
print(json.dumps(results, indent=2))
raise SystemExit(any(result['returncode'] for result in results.values()))
