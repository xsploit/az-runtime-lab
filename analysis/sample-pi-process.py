import os,time,json,sys
from pathlib import Path
pid=int(sys.argv[1]);seconds=int(sys.argv[2]);p=Path('/proc')/str(pid)
def sample():
 s=(p/'stat').read_text().rsplit(')',1)[1].split();status=(p/'status').read_text();return {'cpu_ticks':int(s[11])+int(s[12]),'rss_kib':int(next(x for x in status.splitlines() if x.startswith('VmRSS:')).split()[1]),'threads':int(next(x for x in status.splitlines() if x.startswith('Threads:')).split()[1])}
a=sample();start=time.monotonic();time.sleep(seconds);b=sample();elapsed=time.monotonic()-start
print(json.dumps({'pid':pid,'seconds':elapsed,'cpu_one_core_percent':100*(b['cpu_ticks']-a['cpu_ticks'])/os.sysconf('SC_CLK_TCK')/elapsed,'before':a,'after':b}))
