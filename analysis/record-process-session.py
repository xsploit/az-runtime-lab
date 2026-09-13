"""Read-only Linux process-resource recorder; never starts/stops the target.

JSONL samples expose memory growth and paging. They cannot prove audio fidelity,
underruns, controller responsiveness or physical display frame pacing.
"""
import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import time


def parse_stat(text):
    # comm may contain spaces and parentheses. Remaining fields start at field3.
    fields = text.rsplit(')', 1)[1].split()
    return dict(state=fields[0], start_ticks=int(fields[19]),
                cpu_ticks=int(fields[11]) + int(fields[12]),
                minor_faults=int(fields[7]), major_faults=int(fields[9]),
                threads=int(fields[17]))


def parse_rollup(text):
    result = {}
    for row in text.splitlines():
        fields = row.split()
        if len(fields) == 3 and fields[2] == 'kB' and fields[0].endswith(':'):
            result[fields[0][:-1]] = int(fields[1])
    for required in ('Rss', 'Pss', 'Swap'):
        if required not in result:
            raise ValueError(f'Missing smaps_rollup field: {required}')
    return result


def identity(pid):
    proc = Path(f'/proc/{pid}')
    first = parse_stat((proc / 'stat').read_text())
    with (proc / 'exe').open('rb') as stream:
        digest = hashlib.file_digest(stream, 'sha256').hexdigest()
    exe_stat = (proc / 'exe').stat()
    last = parse_stat((proc / 'stat').read_text())
    if first['start_ticks'] != last['start_ticks']:
        raise RuntimeError('Process identity changed during inspection')
    return dict(pid=pid, start_ticks=last['start_ticks'], exe_sha256=digest,
                exe_device=exe_stat.st_dev, exe_inode=exe_stat.st_ino)


def sample(expected):
    started = time.monotonic()
    proc = Path(f'/proc/{expected["pid"]}')
    first = parse_stat((proc / 'stat').read_text())
    if first['start_ticks'] != expected['start_ticks']:
        raise RuntimeError('PID was reused; refusing replacement process')
    if first['state'] in ('Z', 'X'):
        raise RuntimeError('Target process exited')
    executable = (proc / 'exe').stat()
    if (executable.st_dev, executable.st_ino) != (expected['exe_device'], expected['exe_inode']):
        raise RuntimeError('Target executable changed')
    memory = parse_rollup((proc / 'smaps_rollup').read_text())
    last = parse_stat((proc / 'stat').read_text())
    if last['start_ticks'] != expected['start_ticks'] or last['state'] in ('Z', 'X'):
        raise RuntimeError('Process changed/exited during sample')
    return dict(event='sample', monotonic=time.monotonic(),
                collection_seconds=time.monotonic() - started,
                memory_kib=memory, **last)


def summarize(samples, hz, finished):
    first, last = samples[0], samples[-1]
    elapsed = last['monotonic'] - first['monotonic']
    # Descriptive endpoints, not a regression or attribution to PCM buffers.
    growth = last['memory_kib']['Pss'] - first['memory_kib']['Pss']
    return dict(event='summary', requested_duration_completed=finished,
                sample_count=len(samples), elapsed_seconds=elapsed,
                pss_first_mib=first['memory_kib']['Pss'] / 1024,
                pss_last_mib=last['memory_kib']['Pss'] / 1024,
                pss_peak_mib=max(s['memory_kib']['Pss'] for s in samples) / 1024,
                pss_endpoint_change_mib=growth / 1024,
                pss_endpoint_change_mib_per_minute=growth / 1024 * 60 / elapsed if elapsed else None,
                swap_peak_mib=max(s['memory_kib']['Swap'] for s in samples) / 1024,
                cpu_percent_one_core=100 * (last['cpu_ticks'] - first['cpu_ticks']) / hz / elapsed if elapsed else None,
                minor_faults_delta=last['minor_faults'] - first['minor_faults'],
                major_faults_delta=last['major_faults'] - first['major_faults'])


def collect(expected, duration, interval, output):
    samples = []
    hz = os.sysconf('SC_CLK_TCK')
    start = time.monotonic()
    end = start + duration
    finished = False
    # Exclusive creation preserves previous evidence. Every line is flushed so
    # an interrupted recording remains readable; no target memory is opened.
    with output.open('x') as stream:
        def emit(value):
            stream.write(json.dumps(value, allow_nan=False) + '\n')
            stream.flush()
        emit(dict(event='header', schema=1, target=expected, duration_seconds=duration,
                  interval_seconds=interval, clock_ticks_per_second=hz,
                  page_size=os.sysconf('SC_PAGE_SIZE'), scope=__doc__))
        try:
            while True:
                samples.append(sample(expected))
                emit(samples[-1])
                now = time.monotonic()
                if now >= end:
                    finished = True
                    break
                # Absolute deadlines avoid cumulative drift; skip missed slots.
                slot = math.floor((now - start) / interval) + 1
                deadline = min(end, start + slot * interval)
                time.sleep(max(0, deadline - time.monotonic()))
        except (OSError, ValueError, RuntimeError, KeyboardInterrupt) as error:
            emit(dict(event='terminated', reason=str(error) or type(error).__name__,
                      monotonic=time.monotonic()))
        if samples:
            emit(summarize(samples, hz, finished))
    return finished


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('pid', type=int)
    parser.add_argument('--inspect', action='store_true', help='Print identity and exit')
    parser.add_argument('--expected-start', type=int)
    parser.add_argument('--exe-sha256')
    parser.add_argument('--seconds', type=float, default=1800)
    parser.add_argument('--interval', type=float, default=5)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    if args.pid <= 0:
        parser.error('PID must be positive')
    target = identity(args.pid)
    if args.inspect:
        print(json.dumps(target))
        return 0
    if args.expected_start is None or args.exe_sha256 is None or args.output is None:
        parser.error('Recording requires --expected-start, --exe-sha256 and --output')
    if not 0.1 <= args.seconds <= 28800 or not 0.05 <= args.interval <= 60:
        parser.error('Duration must be 0.1..28800 seconds; interval 0.05..60 seconds')
    if target['start_ticks'] != args.expected_start or target['exe_sha256'] != args.exe_sha256:
        parser.error('Target does not match the explicitly supplied identity')
    return 0 if collect(target, args.seconds, args.interval, args.output) else 2


if __name__ == '__main__':
    raise SystemExit(main())
