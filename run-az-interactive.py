
# Locate shared helpers from this checkout, independent of the caller's cwd.
import sys as _az_sys
from pathlib import Path as _AzPath
_az_sys.path.insert(0, str(_AzPath(__file__).resolve().parents[0]))
from az_paths import lab_path, mapping_path

from pathlib import Path
from display_timing import publish_timing, SyntheticVsync, prepare_native_timing_directory
import subprocess,os,time,json,tempfile,stat,errno,sys,itertools,signal
# The session supervisor stops this launcher with SIGTERM. Default disposition
# would end the process in place and leak the temp dirs (scroll overlay, mixer,
# clock) that the finally blocks below remove; unwind instead.
signal.signal(signal.SIGTERM,lambda signum,frame:sys.exit(128+signum))
if any(os.environ.get(x) for x in ('NATIVE_NAVIGATION','LAB_GDB','TRACE','MOUNT_TRACE','LOAD_TRACE','FADER_TRACE','ONAIR_TRACE','MIC_CONTROL_TRACE')):raise ValueError('Pi probe does not support QEMU-specific tracing or guest discovery')
base=Path(__file__).resolve().parent;model=os.environ.get('PLAYER','xdjaz');lab=base/model;lab.mkdir(exist_ok=True);root=lab_path(model+'/rootfs');state=lab_path(model+'/state');state.mkdir(parents=True,exist_ok=True)
clock_temp,clock_directory=prepare_native_timing_directory(state/'sys/module/rockchipdrm/parameters')
print(json.dumps(dict(event='native_timing_directory',path=str(clock_directory),memory_backed=clock_temp is not None)),flush=True)
for d in ['settings','mnt/debug','sys/class/thermal/thermal_zone0','sys/class/thermal/thermal_zone1','sys/module/rockchipdrm/parameters','tmp','run']:(state/d).mkdir(parents=True,exist_ok=True)
(state/'sys/class/thermal/thermal_zone0/temp').write_text('45000\n');(state/'sys/class/thermal/thermal_zone1/temp').write_text('45000\n');(state/'tmp/testmode').write_text('off\n')
(root/'home/root/settings').mkdir(exist_ok=True)
(root/'lab-shims').mkdir(exist_ok=True)
(root/'qemu').touch(exist_ok=True)
(state/'tmp/mlan0Addr').write_text('00:00:00:00:00:00')
if os.environ.get('PACED_AUDIO') and not (os.environ.get('NULL_AUDIO') and os.environ.get('OFFLINE_MIDI')):
 raise RuntimeError('PACED_AUDIO requires NULL_AUDIO=1 and OFFLINE_MIDI=1')
if os.environ.get('USB_FIXTURE') and not os.environ.get('PACED_AUDIO'):
 raise RuntimeError('USB_FIXTURE requires PACED_AUDIO')
if os.environ.get('MIX_STREAM'):
 if model!='xdjaz' or not os.environ.get('PACED_AUDIO'):raise ValueError('MIX_STREAM requires paced AZ')
 if os.environ.get('AUDIO_CAPTURE'):raise ValueError('Choose MIX_STREAM or AUDIO_CAPTURE')
if os.environ.get('DSP_GRAPH') and not os.environ.get('MIX_STREAM'):
 raise ValueError('DSP_GRAPH requires MIX_STREAM')
if os.environ.get('NATIVE_ROUTING') and not (os.environ.get('MIX_STREAM') and (os.environ.get('MIXER_TX_CAPTURE') or os.environ.get('NATIVE_ROUTING_STREAM'))):
 raise ValueError('NATIVE_ROUTING requires MIX_STREAM and TX capture or stream')
if os.environ.get('NATIVE_ROUTING_STREAM') and not (os.environ.get('NATIVE_ROUTING') and os.environ.get('MIXER_FIXTURE')):
 raise ValueError('NATIVE_ROUTING_STREAM requires NATIVE_ROUTING and MIXER_FIXTURE')
if os.environ.get('RX_FEEDBACK'):
 if not (model=='xdjaz' and os.environ.get('DSP_GRAPH') and os.environ.get('MIXER_FIXTURE')):
  raise ValueError('RX_FEEDBACK requires AZ, DSP_GRAPH and MIXER_FIXTURE')
 if os.environ.get('LAB_RX_FEEDBACK_MODE') not in ('auto','tap'):
  raise ValueError('RX_FEEDBACK requires explicit LAB_RX_FEEDBACK_MODE=auto or tap')
if os.environ.get('NATIVE_NAVIGATION') and not os.environ.get('RX_FEEDBACK'):
 raise ValueError('NATIVE_NAVIGATION requires RX_FEEDBACK')
if os.environ.get('HEADPHONE_DSP'):
 import math
 if not os.environ.get('DSP_GRAPH'):raise ValueError('HEADPHONE_DSP requires DSP_GRAPH')
 table_path=Path(os.environ.get('LAB_HEADPHONE_TABLES',''))
 scale=float(os.environ.get('LAB_HEADPHONE_SCALE','nan'))
 if not table_path.is_file() or table_path.stat().st_size!=3104:raise ValueError('HEADPHONE_DSP requires explicit 3104-byte private lookup table')
 if not math.isfinite(scale) or scale==0 or abs(scale)>16:raise ValueError('HEADPHONE_DSP requires explicit finite output scale')
duration=int(os.environ.get('LAB_DURATION_SECONDS','20'))
if not 1<=duration<=3600:raise ValueError('Lab duration must be1..3600 seconds')
keep_open=os.environ.get('LAB_KEEP_OPEN','0')
if keep_open not in ('0','1'):raise ValueError('LAB_KEEP_OPEN must be0 or1')
keep_open=keep_open=='1'
if keep_open and any(os.environ.get(k) for k in ('RX_FEEDBACK','NATIVE_NAVIGATION','NATIVE_ROUTING')):
 raise ValueError('LAB_KEEP_OPEN is not supported by the time-limited feedback/navigation/routing helpers')
if os.environ.get('LAB_GDB') or os.environ.get('MIC_CONTROL_TRACE'):
 import hashlib
 if model!='xdjaz' or not os.environ.get('OFFLINE_MIDI'):raise ValueError('Native control probes require offline AZ')
 expected='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
 with (root/'home/root/pdj/EP147').open('rb') as firmware:
  actual=hashlib.file_digest(firmware,'sha256').hexdigest()
 if actual!=expected:raise ValueError('Native control probe addresses do not match this firmware')
if os.environ.get('LAB_AZ_FILE_CACHE_MIB') and os.environ.get('LAB_AZ_SMOOTH_SCROLL')!='1':
 raise ValueError('File-cache experiment requires the guarded smooth-scroll overlay')
if os.environ.get('LAB_AZ_PCM_TEMPLATE'):
 if os.environ['LAB_AZ_PCM_TEMPLATE']!='1' or model!='xdjaz' or os.environ.get('LAB_AZ_SMOOTH_SCROLL')!='1' or os.environ.get('OFFLINE_MIDI')!='1' or os.environ.get('PACED_AUDIO')!='1':
  raise ValueError('PCM template experiment requires pinned smooth-scroll AZ and paced offline fixture')
 if os.environ.get('LAB_MAIN_ALLOCATION_TRACE'):
  raise ValueError('PCM template and main C allocation tracer both replace imports; select one')
 if not (base/'shims/pcm-template-hook.so').is_file():
  raise ValueError('Build shims/pcm-template-hook.so on the Pi before enabling it')
scroll_overlay = None
scroll_executable = None
if os.environ.get('LAB_AZ_SMOOTH_SCROLL'):
 if os.environ['LAB_AZ_SMOOTH_SCROLL'] != '1' or model != 'xdjaz':
  raise ValueError('LAB_AZ_SMOOTH_SCROLL=1 is an AZ-only experiment')
 if os.environ.get('LAB_VSYNC_HZ') != '59.24':
  raise ValueError('Smooth-scroll experiment requires LAB_VSYNC_HZ=59.24')
 from az_scroll_overlay import prepare
 scroll_overlay, scroll_executable, scroll_manifest = prepare(root/'home/root/pdj/EP147', file_cache_mib=int(os.environ['LAB_AZ_FILE_CACHE_MIB']) if os.environ.get('LAB_AZ_FILE_CACHE_MIB') else None)
 print(json.dumps(dict(event='experimental_smooth_scroll', **scroll_manifest)), flush=True)
rd,wr=os.pipe()
with (lab/'xvfb.log').open('w') as log:
  # LAB_XWAYLAND_GLAMOR=gl|es|off selects Xwayland's Glamor backend; 'off' is
 # software rendering into wl_shm buffers (no V3D buffer objects in X).
 if os.environ.get('LAB_XWAYLAND_GLAMOR') not in (None,'gl','es','off'):raise ValueError('LAB_XWAYLAND_GLAMOR must be gl, es or off')
 xwayland_extra=['-glamor',os.environ['LAB_XWAYLAND_GLAMOR']] if os.environ.get('LAB_XWAYLAND_GLAMOR') else []
 xv=subprocess.Popen(['/usr/bin/Xwayland','-displayfd',str(wr),'-geometry','1280x800','-fullscreen','-nolisten','tcp','-ac',*xwayland_extra],pass_fds=(wr,),stdout=log,stderr=log)
os.close(wr);display=os.fdopen(rd).readline().strip()
if not display:raise RuntimeError('Xvfb failed')
sock=f'/tmp/.X11-unix/X{display}'
args=['bwrap','--unshare-all','--die-with-parent','--ro-bind',str(root),'/', '--proc','/proc','--dev','/dev','--bind',str(state/'tmp'),'/tmp','--dir','/tmp/.X11-unix','--ro-bind',sock,sock,'--bind',str(state/'settings'),'/home/root/settings','--ro-bind',str(lab_path('private/cabinet-extracted')),'/home/root/settings/cabinet','--bind',str(state/'mnt'),'/mnt','--ro-bind',str(state/'sys'),'/sys','--tmpfs','/run','--chdir','/home/root/pdj','--setenv','HOME','/home/root','--setenv','PATH','/usr/sbin:/usr/bin:/sbin:/bin','--setenv','DISPLAY',':'+display,'/home/root/pdj/'+('EP145' if model=='cdj3000x' else 'EP147')]
if scroll_executable is not None:
 args[args.index('--chdir'):args.index('--chdir')] = ['--ro-bind', str(scroll_executable), '/home/root/pdj/EP147']
args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(base/'shims'/('fw_printenv-cdj3000x' if model=='cdj3000x' else 'fw_printenv')),'/usr/sbin/fw_printenv','--ro-bind',str(base/'shims'/('fw_printenv-cdj3000x' if model=='cdj3000x' else 'fw_printenv')),'/sbin/fw_printenv']
if os.environ.get('LAB_PI_JEMALLOC'):
 allocator=Path(os.environ['LAB_PI_JEMALLOC']).resolve()
 if not allocator.is_file():raise ValueError('Missing Pi allocator')
 args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(allocator),'/usr/lib/libjemalloc.so.2']
if os.environ.get('NULL_AUDIO'):
 # Bind destination must exist before the rootfs becomes read-only.
 (root/'etc/asound.conf').touch(exist_ok=True)
 args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(base/'shims/asound-null.conf'),'/etc/asound.conf']
if os.environ.get('OFFLINE_MIDI'):
 args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(base/'shims'),'/lab-shims']
 args[-1:-1]=['-E','LD_PRELOAD=/lab-shims/'+(('offline-usb-fixture.so' if os.environ.get('USB_FIXTURE') else 'offline-audio-paced.so') if os.environ.get('PACED_AUDIO') else ('offline-audio-trace.so' if os.environ.get('AUDIO_TRACE') else 'offline-midi.so'))]
if clock_temp is not None:
 args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(clock_directory),'/sys/module/rockchipdrm/parameters']
if os.environ.get('USB_FIXTURE'):
 (root/'media/usb/lab').mkdir(parents=True,exist_ok=True)
 usb_path=Path(os.environ.get('USB_FIXTURE_PATH',str(base/'fixtures/usb'))).resolve()
 args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(usb_path),'/media/usb/lab']
 if os.environ.get('USB_PIONEER_CACHE'):
  cache=Path(os.environ['USB_PIONEER_CACHE']).resolve()
  fs=subprocess.check_output(['findmnt','-n','-o','FSTYPE','--target',str(cache)],text=True).strip()
  if fs not in ('overlay','fuse.fuse-overlayfs'):raise ValueError('USB_PIONEER_CACHE requires a mounted copy-on-write overlay')
  args[args.index('--chdir'):args.index('--chdir')]=['--bind',str(cache),'/media/usb/lab/PIONEER','--setenv','LAB_USB_WRITE_METADATA','1']
 # A staged database alone must not hide source media/analysis. Mount the
 # original trees read-only, after any staged PIONEER overlay.
 if os.environ.get('USB_PIONEER_WRITABLE'):
  if os.environ.get('USB_PIONEER_CACHE'):raise ValueError('USB_PIONEER_WRITABLE and USB_PIONEER_CACHE both claim PIONEER; stage the library as an overlay lower layer instead')
  writable=Path(os.environ['USB_PIONEER_WRITABLE']).resolve(strict=True)
  if not writable.is_dir():raise ValueError('USB_PIONEER_WRITABLE must be a staged PIONEER directory')
  if os.environ.get('USB_MEDIA_SOURCE_ROOT'):
   source_root=Path(os.environ['USB_MEDIA_SOURCE_ROOT']).resolve(strict=True)
   if writable==source_root/'PIONEER':raise ValueError('Use a separate staged PIONEER directory, not the original USB')
  args[args.index('--chdir'):args.index('--chdir')]=['--bind',str(writable),'/media/usb/lab/PIONEER','--setenv','LAB_USB_WRITE_METADATA','1']
 if os.environ.get('USB_MEDIA_SOURCE_ROOT'):
  source_root=Path(os.environ['USB_MEDIA_SOURCE_ROOT']).resolve(strict=True)
  for relative in ('Contents','Music','PIONEER/USBANLZ','PIONEER/Artwork'):
   source=source_root/relative
   if source.is_dir():
    args[args.index('--chdir'):args.index('--chdir')]=['--ro-bind',str(source),'/media/usb/lab/'+relative]
if os.environ.get('MIXER_FIXTURE'):
 if model!='xdjaz' or not os.environ.get('USB_FIXTURE'):
  raise ValueError('MIXER_FIXTURE requires AZ and USB_FIXTURE')
 import stat
 fifo=state/'tmp/mixer-rx.fifo'
 if fifo.exists():
  if not stat.S_ISFIFO(fifo.stat().st_mode):raise ValueError('Mixer fixture path is not a FIFO')
 else:os.mkfifo(fifo,0o600)
 args=[a.replace('/lab-shims/offline-usb-fixture.so','/lab-shims/offline-mixer-fixture.so') for a in args]
if os.environ.get('CDJ_ERP_FIXTURE'):
 if model!='cdj3000x' or not os.environ.get('USB_FIXTURE'):raise ValueError('CDJ_ERP_FIXTURE requires CDJ3000X and USB_FIXTURE')
 fifo=state/'tmp/cdj-erp-rx.fifo'
 if fifo.exists():
  if not stat.S_ISFIFO(fifo.stat().st_mode):raise ValueError('CDJ ERP path is not FIFO')
 else:os.mkfifo(fifo,0o600)
 args=[a.replace('LD_PRELOAD=/lab-shims/offline-usb-fixture.so','LD_PRELOAD=/lab-shims/offline-cdj-erp.so') for a in args]
if os.environ.get('XIMAGE_FAST24'):
 if not os.environ.get('OFFLINE_MIDI'):raise ValueError('XIMAGE_FAST24 requires offline lab launcher')
 if not (base/'shims/ximage-fast24.so').is_file():raise ValueError('Build ximage-fast24.so first')
 args=[a+':/lab-shims/ximage-fast24.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('LAB_XIMAGE_PRESENT'):
 if os.environ['LAB_XIMAGE_PRESENT'] != '1' or os.environ.get('XIMAGE_FAST24') != '1' or not os.environ.get('OFFLINE_MIDI'):
  raise ValueError('LAB_XIMAGE_PRESENT=1 requires XIMAGE_FAST24=1 and offline lab preload')
 if not (base/'shims/ximage-present.so').is_file():raise ValueError('Build shims/ximage-present.so first')
 args=[a+':/lab-shims/ximage-present.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('LAB_MAIN_ALLOCATION_TRACE'):
 if os.environ['LAB_MAIN_ALLOCATION_TRACE'] != '1' or model!='xdjaz' or not os.environ.get('OFFLINE_MIDI'):
  raise ValueError('LAB_MAIN_ALLOCATION_TRACE=1 requires offline AZ')
 if not (base/'shims/main-allocation-trace.so').is_file():raise ValueError('Build shims/main-allocation-trace.so first')
 args=[a+':/lab-shims/main-allocation-trace.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('LAB_AZ_PCM_TEMPLATE'):
 args=[a+':/lab-shims/pcm-template-hook.so' if a.startswith('LD_PRELOAD=') else a for a in args]
 args[args.index('--chdir'):args.index('--chdir')]=['--setenv','LAB_AZ_PCM_TEMPLATE','1']
if os.environ.get('LAB_LARGE_NEW_TRACE'):
 if os.environ['LAB_LARGE_NEW_TRACE'] != '1' or not os.environ.get('OFFLINE_MIDI'):
  raise ValueError('LAB_LARGE_NEW_TRACE=1 requires offline lab preload')
 if not (base/'shims/large-new-trace.so').is_file():raise ValueError('Build shims/large-new-trace.so first')
 args=[a+':/lab-shims/large-new-trace.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('LAB_ALLOCATOR_SNAPSHOT'):
 if os.environ['LAB_ALLOCATOR_SNAPSHOT'] != '1' or not os.environ.get('OFFLINE_MIDI'):
  raise ValueError('LAB_ALLOCATOR_SNAPSHOT=1 requires offline lab preload')
 if not (base/'shims/allocator-snapshot.so').is_file():raise ValueError('Build shims/allocator-snapshot.so first')
 args=[a+':/lab-shims/allocator-snapshot.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('LAB_AZ_FRACTIONAL_GRID'):
 if os.environ['LAB_AZ_FRACTIONAL_GRID'] != '1' or os.environ.get('LAB_AZ_SMOOTH_SCROLL') != '1' or not os.environ.get('OFFLINE_MIDI'):
  raise ValueError('Fractional-grid experiment requires smooth-scroll overlay and offline preload fixture')
 if not (base/'shims/fractional-grid.so').is_file():
  raise ValueError('Build shims/fractional-grid.so on the Pi before enabling the experiment')
 args=[a+':/lab-shims/fractional-grid.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('AFFINITY_TRACE'):
 if not os.environ.get('OFFLINE_MIDI'):raise ValueError('AFFINITY_TRACE requires OFFLINE_MIDI')
 args=[a+':/lab-shims/affinity-trace.so' if a.startswith('LD_PRELOAD=') else a for a in args]
if os.environ.get('MAIN_CPU_LIST'):
 import re
 value=os.environ['MAIN_CPU_LIST']
 if model!='xdjaz' or not os.environ.get('OFFLINE_MIDI'):raise ValueError('MAIN_CPU_LIST requires offline AZ')
 if not re.fullmatch(r'[0-9]+(?:,[0-9]+)*',value):raise ValueError('MAIN_CPU_LIST expects comma-separated CPU numbers')
 cpus={int(x) for x in value.split(',')}
 if not cpus <= os.sched_getaffinity(0) or max(cpus)>=1024:raise ValueError('MAIN_CPU_LIST must use allowed CPUs')
 args=[a+':/lab-shims/main-affinity.so' if a.startswith('LD_PRELOAD=') else a for a in args]
 args[args.index('--chdir'):args.index('--chdir')]=['--setenv','LAB_MAIN_CPUS',','.join(map(str,sorted(cpus)))]
if os.environ.get('DECK_FIXTURE'):
 if not os.environ.get('MIXER_FIXTURE'):raise ValueError('DECK_FIXTURE requires MIXER_FIXTURE')
 for group in range(2):
  fifo=state/f'tmp/deck{group}-rx.fifo'
  if fifo.exists():
   if not stat.S_ISFIFO(fifo.stat().st_mode):raise ValueError('Deck fixture path is not a FIFO')
  else:os.mkfifo(fifo,0o600)
 args[-1:-1]=['-E','LAB_DECK_FIXTURE=1']
if os.environ.get('NATIVE_ROUTING_STREAM'):
 tx_socket=state/'tmp/mixer-tx.sock'
 if tx_socket.exists():raise ValueError('TX socket already exists; inspect prior routing process')
 args[-1:-1]=['-E','LAB_MIXER_TX_STREAM=1']
if os.environ.get('MIXER_TX_CAPTURE'):
 if not os.environ.get('MIXER_FIXTURE'):raise ValueError('MIXER_TX_CAPTURE requires MIXER_FIXTURE')
 (state/'tmp/mixer-tx.raw').unlink(missing_ok=True)
 args[-1:-1]=['-E','LAB_MIXER_TX_CAPTURE=1']
if os.environ.get('ERP_FIXTURE'):
 if not os.environ.get('MIXER_FIXTURE'):raise ValueError('ERP_FIXTURE requires MIXER_FIXTURE')
 fifo=state/'tmp/erp-rx.fifo'
 if fifo.exists():
  if not stat.S_ISFIFO(fifo.stat().st_mode):raise ValueError('ERP fixture path is not a FIFO')
 else:os.mkfifo(fifo,0o600)
 args[-1:-1]=['-E','LAB_ERP_FIXTURE=1']
if os.environ.get('AUDIO_CAPTURE'):
 if model!='xdjaz' or not os.environ.get('PACED_AUDIO'):raise ValueError('AUDIO_CAPTURE requires paced AZ lab')
 args=[a.replace(str(base/'shims/asound-null.conf'),str(base/'shims/asound-capture.conf')) for a in args]
if os.environ.get('MIX_STREAM'):
 fifo=state/'tmp/az-decks.fifo'
 if fifo.exists():
  if not stat.S_ISFIFO(fifo.stat().st_mode):raise ValueError('Mixer input must be a FIFO')
 else:os.mkfifo(fifo,0o600)
 args=[a.replace(str(base/'shims/asound-null.conf'),str(base/'shims/asound-stream.conf')) for a in args]
if os.environ.get('MOUNT_TRACE'):

 if model!='xdjaz':raise ValueError('MOUNT_TRACE addresses apply only to AZ')
 args[-1:-1]=['-d','in_asm,exec,cpu','-dfilter','0xb3d288..0xb3d57c,0x21b9b90..0x21b9c70','-D','/tmp/mount-transition.log']
if os.environ.get('LOAD_TRACE'):
 if model!='xdjaz':raise ValueError('LOAD_TRACE addresses apply only to AZ')
 if os.environ.get('MOUNT_TRACE'):raise ValueError('Choose LOAD_TRACE or MOUNT_TRACE, not both')
 # Request overloads, shared controller closure, and concrete mount-state query.
 args[-1:-1]=['-d','in_asm,exec,cpu','-dfilter','0xa6d308..0xa6d348,0xa6c808..0xa6c848,0xa318a0..0xa318e0,0xb46790..0xb467d0,0x2070758..0x207077c,0x754aa8..0x754ab8','-D','/tmp/load-request.log']
if os.environ.get('FADER_TRACE'):
 if model!='xdjaz' or not os.environ.get('MIXER_FIXTURE'):raise ValueError('FADER_TRACE requires AZ mixer fixture')
 if os.environ.get('LOAD_TRACE') or os.environ.get('MOUNT_TRACE'):raise ValueError('Choose one instruction trace')
 # Raw fader decoding and shared slider adapter/observer dispatch only.
 args[-1:-1]=['-d','in_asm,exec,cpu','-dfilter','0x2153c48..0x2153cec,0x2159560..0x215978c,0x21f4950..0x21f4a24','-D','/tmp/fader-dispatch.log']
if os.environ.get('ONAIR_TRACE'):
 if model!='xdjaz' or not os.environ.get('MIXER_FIXTURE'):raise ValueError('ONAIR_TRACE requires AZ mixer fixture')
 if any(os.environ.get(k) for k in ('FADER_TRACE','LOAD_TRACE','MOUNT_TRACE')):raise ValueError('Choose one instruction trace')
 args[-1:-1]=['-d','in_asm,exec,cpu,nochain','-dfilter','0x2132268..0x213239c,0x101e6d0..0x101e6d4,0x101db38..0x101db60','-D','/tmp/onair-dispatch.log']
if os.environ.get('MIC_CONTROL_TRACE'):
 if model!='xdjaz' or not os.environ.get('MIXER_FIXTURE'):raise ValueError('MIC_CONTROL_TRACE requires AZ mixer fixture')
 if any(os.environ.get(k) for k in ('FADER_TRACE','LOAD_TRACE','MOUNT_TRACE','ONAIR_TRACE')):raise ValueError('Choose one instruction trace')
 # Observe controller construction/action/submission; no guest code or state writes.
 args[-1:-1]=['-d','in_asm,exec,cpu,nochain','-dfilter','0x19eb298..0x19eb2b0,0x19eb3d0..0x19eb3f8,0x19ebcc0..0x19ebd58,0x19ebd70..0x19ebdc4','-D','/tmp/mic-control.log']
if os.environ.get('LAB_GDB'):
 if model!='xdjaz' or not os.environ.get('OFFLINE_MIDI'):raise ValueError('LAB_GDB requires offline AZ')
 debug_socket=state/'tmp/guest-gdb.sock'
 if debug_socket.exists():
  if not stat.S_ISSOCK(debug_socket.stat().st_mode):raise ValueError('Refusing to replace non-socket debugger path')
  debug_socket.unlink()
 args[-1:-1]=['-g','/tmp/guest-gdb.sock']
 print(json.dumps(dict(event='debugger',socket=str(debug_socket))),flush=True)
from native_optimizations import configure
args=configure(args,base,root,model,os.environ)

# Native ARM64 launch: translate QEMU -E options into sandbox environment.
while '-E' in args:
 i=args.index('-E');name,value=args[i+1].split('=',1);del args[i:i+2]
 i=args.index('--chdir');args[i:i]=['--setenv',name,value]

mixproc=None;mixtemp=None;mixlog=None;routingproc=None;routinglog=None
feedbackproc=None;feedbacklog=None;feedbackready=False;feedbackstarted=None
navigationproc=None;navigationlog=None;navigationready=False;navigationstarted=None
def stop_navigation():
 global navigationproc
 if navigationproc is None:return
 navigationproc.terminate()
 try:navigationproc.wait(timeout=2)
 except subprocess.TimeoutExpired:navigationproc.kill();navigationproc.wait()
 print(json.dumps(dict(event='native_navigation_stopped',returncode=navigationproc.returncode)),flush=True)
 navigationproc=None
def stop_feedback():
 global feedbackproc
 if feedbackproc is None:return
 feedbackproc.terminate()
 try:feedbackproc.wait(timeout=2)
 except subprocess.TimeoutExpired:feedbackproc.kill();feedbackproc.wait()
 print(json.dumps(dict(event='rx_feedback_stopped',returncode=feedbackproc.returncode)),flush=True)
 feedbackproc=None
try:
 if os.environ.get('MIX_STREAM'):
  mixtemp=tempfile.TemporaryDirectory(prefix='az-live-mixer-')
  exe=Path(mixtemp.name)/'mix-stream'
  sources=['deck_mix.c','mix_stream.c'];flags=['-O2']
  if os.environ.get('DSP_GRAPH'):
   sources+=['dsp_control.c','dsp_graph.c','channel_eq.c','beat_fx.c','beat_echo.c','beat_control.c','beat_quantize.c','beat_manager.c','beat_grid.c','cfx_filter.c','cfx_crush.c','cfx_noise.c','cfx_sweep.c','cfx_dubecho.c','cfx_space.c','cfx_manager.c']
   flags+=['-D_GNU_SOURCE','-DLAB_DSP_GRAPH','-std=c11','-ffp-contract=off','-fno-tree-vectorize','-Wall','-Wextra','-Werror']
  if os.environ.get('HEADPHONE_DSP'):sources+=['headphone_dsp.c'];flags+=['-DLAB_HEADPHONE_DSP']
  subprocess.run(['cc',*flags,*[str(base/'mixer'/name) for name in sources],'-lm','-o',str(exe)],check=True,timeout=60)
  mixlog=(lab/'mixer-stream.log').open('w')
  mixproc=subprocess.Popen([str(exe),str(state/'tmp/az-decks.fifo'),str(state/'tmp/mixed-output.raw'),str(Path(mixtemp.name)/'control.sock')],stdout=subprocess.DEVNULL,stderr=mixlog)
  print(json.dumps(dict(event='mixer_control',socket=str(Path(mixtemp.name)/'control.sock'),dsp_graph=bool(os.environ.get('DSP_GRAPH')))),flush=True)
 with (lab/('trace-launch.log' if os.environ.get('TRACE') else 'display-launch.log')).open('w') as log:
  vsync_clock = SyntheticVsync(os.environ['LAB_VSYNC_HZ'], time.monotonic_ns()) if os.environ.get('LAB_VSYNC_HZ') else None
  publish_timing(clock_directory/'vsync_time', vsync_clock.sample(time.monotonic_ns())[0] if vsync_clock else time.monotonic_ns())
  proc=subprocess.Popen(args,stdout=log,stderr=log)
  sampler=subprocess.Popen(['python',str(base/'analysis/capture-process.py'),str(proc.pid),str(lab/'process-profile.json'),'20']) if os.environ.get('PROFILE') else None
  try:
   
   print(json.dumps(dict(event="started",display=":"+display,pid=proc.pid,keep_open=keep_open)),flush=True)
   feedbackdeadline=time.monotonic()+30
   for tick in (itertools.count() if keep_open else range(duration*60)):
    if proc.poll() is not None:break
    if os.environ.get('RX_FEEDBACK'):
     if mixproc.poll() is not None:raise RuntimeError('Mixer stopped during RX feedback session')
     input_socket=Path(mixtemp.name)/'rx-input.sock'
     if feedbackproc is None:
      control_socket=Path(mixtemp.name)/'control.sock'
      rx_fifo=state/'tmp/mixer-rx.fifo'
      if control_socket.exists():
       try:probe_fd=os.open(rx_fifo,os.O_WRONLY|os.O_NONBLOCK|os.O_NOFOLLOW)
       except OSError as exc:
        if exc.errno!=errno.ENXIO:raise
       else:
        try:
         if not stat.S_ISFIFO(os.fstat(probe_fd).st_mode):raise ValueError('Expected RX FIFO')
        finally:os.close(probe_fd)
        sys.path.insert(0,str(base/'analysis'))
        from az_mixer_packet import crc16
        packet=bytearray(128);packet[0]=1;packet[96:98]=crc16(packet[:96]).to_bytes(2,'little')
        baseline=Path(mixtemp.name)/'rx-baseline.raw';baseline.write_bytes(packet)
        feedbacklog=(lab/'rx-feedback.log').open('w')
        feedbackproc=subprocess.Popen([sys.executable,str(base/'analysis/run_rx_feedback.py'),str(baseline),str(control_socket),str(input_socket),str(rx_fifo),'--mode',os.environ['LAB_RX_FEEDBACK_MODE'],'--seconds','300'],stdout=feedbacklog,stderr=feedbacklog)
        feedbackstarted=time.monotonic()
      if feedbackproc is None and time.monotonic()>feedbackdeadline:raise RuntimeError('RX feedback reader did not become ready within 30 seconds')
     if feedbackproc is not None:
      if feedbackproc.poll() is not None:raise RuntimeError('RX feedback stopped; inspect rx-feedback.log')
      if not feedbackready:
       if input_socket.exists():
        if not stat.S_ISSOCK(input_socket.lstat().st_mode):raise RuntimeError('Invalid RX input socket')
        feedbackready=True
        print(json.dumps(dict(event='rx_feedback',input_socket=str(input_socket),baseline=str(baseline),mode=os.environ['LAB_RX_FEEDBACK_MODE'])),flush=True)
       elif time.monotonic()-feedbackstarted>5:raise RuntimeError('RX feedback input socket did not become ready')
    if os.environ.get('NATIVE_NAVIGATION') and feedbackready:
     if navigationproc is None:
      from az_guest_process import find_guest
      guest_pid=find_guest(proc.pid)
      if guest_pid is not None:
       navigation_socket=Path(mixtemp.name)/'navigation-midi.sock'
       navigationlog=(lab/'native-navigation.log').open('w')
       navigationproc=subprocess.Popen([sys.executable,str(base/'analysis/run_native_navigation.py'),str(guest_pid),str(baseline),str(input_socket),str(navigation_socket),'--mapping',str(mapping_path()),'--seconds','300'],stdout=navigationlog,stderr=navigationlog)
       navigationstarted=time.monotonic()
      elif time.monotonic()>feedbackdeadline:raise RuntimeError('AZ guest was not found under launcher')
     if navigationproc is not None:
      if navigationproc.poll() is not None:raise RuntimeError('Native navigation stopped; inspect native-navigation.log')
      if not navigationready:
       if navigation_socket.exists():
        if not stat.S_ISSOCK(navigation_socket.lstat().st_mode):raise RuntimeError('Invalid navigation MIDI socket')
        navigationready=True
        print(json.dumps(dict(event='native_navigation',midi_socket=str(navigation_socket),guest_pid=guest_pid)),flush=True)
       elif time.monotonic()-navigationstarted>35:raise RuntimeError('Native navigation did not become ready')
    if os.environ.get('NATIVE_ROUTING'):
     if routingproc is None and (os.environ.get('NATIVE_ROUTING_STREAM') or (state/'tmp/mixer-tx.raw').exists()):
      routinglog=(lab/'native-routing.log').open('w')
      midi_socket=Path(mixtemp.name)/'midi.sock'
      routingproc=subprocess.Popen(['python',str(base/'mixer/live_routing.py'),str(state/('tmp/mixer-tx.sock' if os.environ.get('NATIVE_ROUTING_STREAM') else 'tmp/mixer-tx.raw')),str(Path(mixtemp.name)/'control.sock'),str(midi_socket),'--mapping',str(mapping_path()),'--seconds',str(duration+30),*(['--datagram'] if os.environ.get('NATIVE_ROUTING_STREAM') else []),*(['--headphone-control'] if os.environ.get('HEADPHONE_DSP') else [])],stdout=routinglog,stderr=routinglog)
      print(json.dumps(dict(event='native_routing',midi_socket=str(midi_socket))),flush=True)
     elif routingproc is not None and routingproc.poll() is not None:
      raise RuntimeError('Native routing bridge stopped; inspect native-routing.log')
    if tick==900 and os.environ.get("LAB_CLICK"):
     coords=os.environ["LAB_CLICK"].split(",")
     subprocess.run(["python",str(base/"analysis/click-private-display.py"),":"+display,*coords],check=True,timeout=5)
    if vsync_clock:
     stamp, deadline = vsync_clock.sample(time.monotonic_ns())
     publish_timing(clock_directory/'vsync_time', stamp)
     time.sleep(max(0, (deadline-time.monotonic_ns())/1e9))
    else:
     publish_timing(clock_directory/'vsync_time', time.monotonic_ns())
     time.sleep(1/60)
   if os.environ.get('RX_FEEDBACK') and not feedbackready:raise RuntimeError('AZ run ended before RX feedback became ready')
   if os.environ.get('NATIVE_NAVIGATION') and not navigationready:raise RuntimeError('AZ run ended before native navigation became ready')
   cap=subprocess.run(['ffmpeg','-y','-loglevel','error','-f','x11grab','-video_size','1280x800','-i',':'+display,'-frames:v','1',str(lab/'first-display.png')],timeout=15,capture_output=True,text=True)
   print(json.dumps(dict(pid=proc.pid,running=proc.poll() is None,process_returncode=proc.poll(),screenshot_exit=cap.returncode,screenshot_error=cap.stderr)),flush=True)
  finally:
   stop_navigation()
   stop_feedback()
   proc.terminate()
   try:proc.wait(timeout=5)
   except subprocess.TimeoutExpired:proc.kill();proc.wait()
finally:
 stop_navigation()
 if navigationlog is not None:navigationlog.close()
 stop_feedback()
 if feedbacklog is not None:feedbacklog.close()
 if routingproc is not None:
  routingproc.terminate()
  try:routingproc.wait(timeout=2)
  except subprocess.TimeoutExpired:routingproc.kill();routingproc.wait()
  print(json.dumps(dict(event='native_routing_stopped',returncode=routingproc.returncode)),flush=True)
 if routinglog is not None:routinglog.close()
 if mixproc is not None:
  try:mixproc.wait(timeout=5)
  except subprocess.TimeoutExpired:
   mixproc.terminate()
   try:mixproc.wait(timeout=2)
   except subprocess.TimeoutExpired:mixproc.kill();mixproc.wait()
  print(json.dumps(dict(event='mixer_stopped',returncode=mixproc.returncode)),flush=True)
 if mixlog is not None:mixlog.close()
 if mixtemp is not None:mixtemp.cleanup()
 if 'sampler' in locals() and sampler is not None: sampler.wait(timeout=25)
 xv.terminate();xv.wait(timeout=5)
 if clock_temp is not None:clock_temp.cleanup()
