import argparse,os,subprocess,json
from pathlib import Path
from importlib.machinery import SourceFileLoader
read_bins=SourceFileLoader('bins',str(Path(__file__).with_name('read-allocation-bin.py'))).load_module().read_bins
p=argparse.ArgumentParser();p.add_argument('driver',type=Path);p.add_argument('library',type=Path);p.add_argument('allocator',type=Path);p.add_argument('kind',choices=('new','c'));p.add_argument('output',type=Path);a=p.parse_args()
lib=a.library.resolve();child=subprocess.Popen([str(a.driver.resolve())],env=dict(os.environ,LD_PRELOAD=f'{lib}:{a.allocator.resolve()}'),stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
try:
 line=child.stdout.readline().strip();assert line=='READY',(line,child.poll())
 out=read_bins(child.pid,str(lib),f'lab_bin_{a.kind}_');assert out['overflow']==0
 relevant=[r for r in out['rows'] if r['size']==13000]
 assert sum(r['count'] for r in relevant)==400,relevant
 assert all(r['success']==r['count'] and not r['failed'] for r in relevant)
 child.stdin.write('\n');child.stdin.flush();stdout,stderr=child.communicate(timeout=10);assert child.returncode==0,stderr
 a.output.write_text(json.dumps(out,indent=2)+'\n');print('BIN_TRACE_TEST_OK',a.kind)
finally:
 if child.poll() is None:child.kill();child.wait()
