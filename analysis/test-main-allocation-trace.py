"""Parent-process validation of C import forwarding, events and restored page permissions."""
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
          if len(s.split())==3 and s.split()[2].startswith('lab_c_')}
 fd=os.open(f'/proc/{child.pid}/mem',os.O_RDONLY)
 try:
  count=struct.unpack('<Q',os.pread(fd,8,symbols['lab_c_alloc_count']))[0]
  assert count<=512
  rows=[dict(zip(['ready','kind','size','argument2','caller','result'],
        struct.unpack('<6Q',os.pread(fd,48,symbols['lab_c_alloc_events']+i*48)))) for i in range(count)]
 finally:os.close(fd)
 assert all(row['ready']==1 and row['caller'] for row in rows)
 assert set(row['kind'] for row in rows)=={1,2,3}
 for kind,size in {1:16,2:16,3:32}.items():
  assert any(row['kind']==kind and row['size']==size*1024**2 and row['result'] for row in rows)
 fd=os.open(f'/proc/{child.pid}/mem',os.O_RDONLY)
 try:
  values={key:struct.unpack('<Q',os.pread(fd,8,symbols['lab_c_trace_'+key]))[0] for key in ['installed','error','page','permissions']}
 finally:os.close(fd)
 assert values['installed']==7 and values['error']==0
 actual=next(line.split()[1] for line in maps.splitlines() if int(line.split('-')[0],16)<=values['page']<int(line.split()[0].split('-')[1],16))
 observed=(1 if actual[0]=='r' else 0)|(2 if actual[1]=='w' else 0)|(4 if actual[2]=='x' else 0)
 assert observed==values['permissions']
 child.stdin.write('\n');child.stdin.flush();out,err=child.communicate(timeout=5)
 assert child.returncode==0,(child.returncode,err)
 a.output.write_text(json.dumps({'count':count,'records':rows,'installation':values,'checked':[
  'malloc/calloc/realloc forwarded; zeroing and preservation verified',
  'C++ allocation success, exceptions and nothrow behavior unaffected',
  'all successful allocations freed', 'original import-page permissions restored']},indent=2)+'\n')
 print('MAIN_ALLOCATION_TRACE_TEST_OK',a.output)

finally:
 if child.poll() is None:child.kill();child.wait()
