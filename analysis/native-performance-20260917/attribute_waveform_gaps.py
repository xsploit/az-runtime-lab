"""Attribute each waveform-only XDamage gap to on-CPU work, off-CPU waiting, or I/O.

Input: the directory written by capture_waveform_gap.sh. All timestamps are
CLOCK_MONOTONIC seconds. Only intervals whose every intervening page sample was
WAVEFORM are considered; browser gaps are not stalls (see PAGE-CORRELATED-LOAD).
"""
import json,re,sys
from collections import Counter
from pathlib import Path
d=Path(sys.argv[1]);thresh=float(sys.argv[2]) if len(sys.argv)>2 else 25.
meta=(d/'meta.txt').read_text() if (d/'meta.txt').exists() else ''
meta_main=re.search(r'main=(\d+)',meta).group(1) if re.search(r'main=(\d+)',meta) else '0'
dmg=json.loads((d/'damage.json').read_text());start=dmg['start_monotonic']
ev=json.loads((d/'events.json').read_text())
times=[start+s['local_ms']/1000 for s in dmg['samples']]
def page_between(a,b):
    kinds={e['kind'] for e in ev if 'kind' in e and a<=e['observed_at']<=b}
    return kinds or {'(no sample)'}
gaps=[]
for a,b in zip(times,times[1:]):
    if (b-a)*1000>=thresh and page_between(a,b)=={'waveform'}:gaps.append((a,b))
# perf script rows: "<time>: <event>: ..." ; cpu rows carry stacks on following lines
cpu=[];cur=None
for line in (d/'cpu.txt').read_text().split('\n'):
    m=re.match(r'^\s*(\d+\.\d+):\s+\S+',line)
    if m:cur=dict(t=float(m.group(1)),frames=[]);cpu.append(cur)
    elif cur is not None and line.strip():cur['frames'].append(line.strip())
sched=[]
for line in (d/'sched.txt').read_text().split('\n'):
    m=re.match(r'^\s*(\d+\.\d+):\s+(\S+):\s*(.*)$',line)
    if m:sched.append(dict(t=float(m.group(1)),ev=m.group(2),txt=m.group(3)))
def io_delta(a,b):
    inside=[e for e in ev if 'kind' in e and a<=e['observed_at']<=b]
    if len(inside)<2:return {}
    f,l=inside[0],inside[-1]
    return dict(read_bytes=l['read_bytes']-f['read_bytes'],vol=l['vol']-f['vol'],nvol=l['nvol']-f['nvol'],wchan=Counter(e['wchan'] for e in inside).most_common(2),states=Counter(e['state'] for e in inside).most_common(3))
report=dict(threshold_ms=thresh,total_intervals=len(times)-1,waveform_gaps=[])
for a,b in gaps:
    on=[s for s in cpu if a<=s['t']<=b]
    top=Counter(fr.split()[-1] if fr.split() else '?' for s in on for fr in s['frames'][:1]).most_common(6)
    # Only the main thread's own switch-OUTS, inside the gap exactly. Several
    # firmware threads keep the comm 'EP147', so match on prev_pid, not comm.
    main=meta_main
    sw=[s for s in sched if a<=s['t']<=b and 'sched_switch' in s['ev'] and f'prev_pid={main} ' in s['txt']]
    blocks=[]
    for s in sw:
        m=re.search(r'prev_state=(\S+)',s['txt'])
        if m:blocks.append(m.group(1))
    disk=[s for s in sched if a<=s['t']<=b and 'block_rq_issue' in s['ev']]
    report['waveform_gaps'].append(dict(start_s=round(a-start,3),gap_ms=round((b-a)*1000,1),
        oncpu_samples=len(on),expected_if_busy=int((b-a)*997),top_leaf=top,
        switch_outs=len(sw),prev_states=Counter(blocks).most_common(4),disk_requests=len(disk),io=io_delta(a,b)))
report['waveform_gaps'].sort(key=lambda g:-g['gap_ms'])
print(json.dumps(report,indent=1,default=str))
