"""Parent-process validation of C++ forwarding, events, null and exception paths."""
import argparse,os,subprocess,struct,json
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('library',type=Path);p.add_argument('allocator',type=Path)
p.add_argument('driver',type=Path);p.add_argument('output',type=Path);a=p.parse_args()
library=a.library.resolve()
child=subprocess.Popen([str(a.driver.resolve())],env=dict(os.environ,LD_PRELOAD=f'{library}:{a.allocator.resolve()}'),
 stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True)
try:
 line=child.stdout.readline().strip()
 if line!='READY':raise RuntimeError(f'Driver failed: {line} {child.stderr.read()}')
 maps=Path(f'/proc/{child.pid}/maps').read_text()
 mapping=next(line for line in maps.splitlines() if line.endswith(str(library)) and line.split()[2]=='00000000')
 base=int(mapping.split('-')[0],16)
 symbols={s.split()[2]:base+int(s.split()[0],16) for s in subprocess.check_output(['nm','-D',str(library)],text=True).splitlines()
          if len(s.split())==3 and s.split()[2].startswith('lab_alloc_')}
 fd=os.open(f'/proc/{child.pid}/mem',os.O_RDONLY)
 try:
  count=struct.unpack('<Q',os.pread(fd,8,symbols['lab_alloc_count']))[0]
  assert count<=512
  rows=[dict(zip(['ready','kind','size','argument2','caller','result'],
        struct.unpack('<6Q',os.pread(fd,48,symbols['lab_alloc_events']+i*48)))) for i in range(count)]
 finally:os.close(fd)
 assert all(row['ready']==1 and row['caller'] for row in rows)
 assert set(row['kind'] for row in rows)=={4,5,6,7}
 for kind,size in {4:12,5:10,6:18,7:14}.items():
  assert any(row['kind']==kind and row['size']==size*1024**2 and row['result'] for row in rows)
 assert any(row['kind']==6 and row['result']==0 for row in rows)
 child.stdin.write('\n');child.stdin.flush();out,err=child.communicate(timeout=5)
 assert child.returncode==0,(child.returncode,err)
 a.output.write_text(json.dumps({'count':count,'records':rows,'checked':[
  'C malloc/calloc/realloc left intact; zeroing and preservation verified',
  'four C++ new entry points forwarded and recorded',
  'throwing allocation failure unwinds through wrapper',
  'nothrow allocation failure returns null and is recorded',
  'all successful allocations can be freed']},indent=2)+'\n')
 print('LARGE_NEW_TRACE_TEST_OK',a.output)
finally:
 if child.poll() is None:child.kill();child.wait()
