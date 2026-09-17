"""Run one native AZ/FLX6 lab session from explicit local configuration."""
from pathlib import Path
import argparse, fcntl, hashlib, json, os, platform, signal, socket, stat
import subprocess, sys, threading, time, shutil

BASE=Path(__file__).resolve().parents[1]
AZ_HASH='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'

def load_config(path):
    c=json.loads(path.read_text())
    for key in ('usb','cache','jemalloc','rootfs','cabinet'):
        if not isinstance(c.get(key),str) or not Path(c[key]).is_absolute():
            raise ValueError(f'{key} must be an absolute local path')
    if not isinstance(c.get('audio_device'),str) or not c['audio_device']:
        raise ValueError('audio_device must be an ALSA device name from aplay -L')
    c.setdefault('mapping',str(BASE/'pi/Pioneer-DDJ-FLX6.midi.xml'))
    c.setdefault('state',str(BASE/'local/state'))
    for key in ('mapping','state'):
        if not isinstance(c[key],str) or not Path(c[key]).is_absolute():raise ValueError(f'{key} must be an absolute local path')
    c.setdefault('fx_bpm',140)
    if not 40<=float(c['fx_bpm'])<=300:raise ValueError('fx_bpm must be 40..300')
    # Hold these controller addresses together to end the session without a
    # keyboard. The default is both FLX6 Merge FX buttons, which native AZ never
    # uses; needing both is what stops one leaned-on button ending a set.
    c.setdefault('exit_hold',['0x94,0x2e','0x95,0x2e'])
    if not isinstance(c['exit_hold'],list) or not all(isinstance(v,str) for v in c['exit_hold']):
        raise ValueError('exit_hold must be a list of "STATUS,NOTE" controller addresses, or [] to disable')
    c.setdefault('exit_hold_seconds',2.)
    if not .5<=float(c['exit_hold_seconds'])<=10:raise ValueError('exit_hold_seconds must be 0.5..10')
    # Optional: browse the original Rekordbox Device Library export instead of
    # whatever AZ library the USB carries. Omit the key for plain USB browsing.
    c.setdefault('library_stage',None)
    if c['library_stage'] is not None:
        if not isinstance(c['library_stage'],str) or not Path(c['library_stage']).is_absolute():
            raise ValueError('library_stage must be an absolute local path to the staged PIONEER directory')
        if Path(c['library_stage'])==Path(c['usb'])/'PIONEER':raise ValueError('library_stage must be a separate staged directory, not the original USB')
    return c

def check(c):
    import shutil
    errors=[]
    for command in ('python3','cc','bwrap','Xwayland','aplay','sudo','fuse-overlayfs','ffmpeg'):
        if not shutil.which(command):errors.append(f'Install {command}')
    if platform.machine() not in ('aarch64','arm64'):errors.append('Run on native AArch64 Linux (not x86/QEMU)')
    if not os.environ.get('WAYLAND_DISPLAY') or not os.environ.get('XDG_RUNTIME_DIR'):
        errors.append('Run inside the user Wayland desktop session')
    executable=Path(c['rootfs'])/'home/root/pdj/EP147'
    if not executable.is_file():errors.append(f'Supply the extracted AZ rootfs: {executable}')
    elif hashlib.sha256(executable.read_bytes()).hexdigest()!=AZ_HASH:errors.append('Wrong AZ executable: this build supports the documented 1.30 image only')
    for path in (Path(c['usb'])/'PIONEER',Path(c['cabinet'])):
        if not path.is_dir():errors.append(f'Missing directory: {path}')
    if c['library_stage']:
        database=Path(c['library_stage'])/'rekordbox/exportLibrary.db'
        if not database.is_file():errors.append(f'Stage the legacy library first (library/stage_from_usb.py): {database}')
        elif database.read_bytes()[:16]==b'SQLite format 3\x00':errors.append(f'{database} is plaintext; AZ needs your separately encrypted SQLCipher copy')
        for name in ('USBANLZ','Artwork'):
            if not (Path(c['usb'])/'PIONEER'/name).is_dir():errors.append(f'Missing source analysis/artwork tree: {Path(c["usb"])/"PIONEER"/name}')
    for path in (Path(c['jemalloc']),Path(c['mapping']),BASE/'shims/native-build.json'):
        if not path.is_file():errors.append(f'Missing input: {path}')
    for name in ('offline-mixer-fixture','ximage-fast24','ximage-present','fractional-grid','fractional-grid-span','sem-owner'):
        if not (BASE/'shims'/f'{name}.so').is_file():errors.append(f'Build shims/{name}.so with pi/build-shims.py')
    return errors

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('config',type=Path);p.add_argument('--check',action='store_true');p.add_argument('--no-controller',action='store_true',help='Diagnostic mode: no physical MIDI owner');a=p.parse_args()
    c=load_config(a.config);errors=check(c)
    if errors:raise SystemExit('\n'.join(errors))
    if a.check:print('Prerequisites found. Allocator ABI, audio and physical display still require the live test.');return
    if os.geteuid()==0:raise SystemExit('Run as the desktop user; sudo is used only for priorities and the controller bridge')
    for proc in Path('/proc').glob('[0-9]*'):
        try:
            if (proc/'comm').read_text().strip()=='EP147':raise SystemExit('AZ is already running; stop its owning session before starting another')
        except (FileNotFoundError,PermissionError,ProcessLookupError):pass
    local=BASE/'local';local.mkdir(exist_ok=True)
    lock=(local/'session.lock').open('w');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
    if subprocess.run(['sudo','-n','true'],stderr=subprocess.DEVNULL).returncode:
        subprocess.run(['sudo','-v'],check=True)
    subprocess.run([sys.executable,str(BASE/'analysis/prepare_usb_cache.py'),c['usb'],c['cache'],*(['--library-stage',c['library_stage']] if c['library_stage'] else [])],check=True)
    out=local/time.strftime('session-%Y%m%d-%H%M%S');out.mkdir()
    state=Path(c['state'])/'tmp';state.mkdir(parents=True,exist_ok=True)
    fifo=state/'mixed-output.raw'
    if not fifo.exists():os.mkfifo(fifo,0o600)
    if not stat.S_ISFIFO(fifo.stat().st_mode):raise ValueError('Mixed audio path must be a FIFO')
    env={k:v for k,v in os.environ.items() if not (k.startswith(('LAB_','AZ_')) or k in ('OFFLINE_MIDI','NULL_AUDIO','PACED_AUDIO','USB_FIXTURE','MIXER_FIXTURE','ERP_FIXTURE','DECK_FIXTURE','MIX_STREAM','DSP_GRAPH','XIMAGE_FAST24','NATIVE_NAVIGATION','NATIVE_ROUTING','RX_FEEDBACK','AUDIO_CAPTURE','PROFILE','TRACE','HEADPHONE_DSP','MAIN_CPU_LIST','AFFINITY_TRACE','NATIVE_ROUTING_STREAM','MIXER_TX_CAPTURE','CDJ_ERP_FIXTURE','MOUNT_TRACE','LOAD_TRACE','FADER_TRACE','ONAIR_TRACE','MIC_CONTROL_TRACE'))};env.update({k:'1' for k in ('OFFLINE_MIDI','NULL_AUDIO','PACED_AUDIO','USB_FIXTURE','MIXER_FIXTURE','ERP_FIXTURE','DECK_FIXTURE','MIX_STREAM','DSP_GRAPH','XIMAGE_FAST24','LAB_XIMAGE_PRESENT','LAB_AZ_SMOOTH_SCROLL','LAB_AZ_FRACTIONAL_GRID','LAB_KEEP_OPEN','LAB_GRID_SPAN_CANDIDATE','LAB_SEM_OWNER_FIX')})
    # No inherited opt-in memory/tracing or competing control experiments.
    for key in ('LAB_AZ_PCM_TEMPLATE','LAB_MAIN_ALLOCATION_TRACE','NATIVE_NAVIGATION','NATIVE_ROUTING','RX_FEEDBACK','AUDIO_CAPTURE','PROFILE','TRACE'):
        env.pop(key,None)
    env.update(AZ_ROOTFS=c['rootfs'],AZ_CABINET=c['cabinet'],AZ_STATE=c['state'],PLAYER='xdjaz',LAB_PI_JEMALLOC=c['jemalloc'],USB_FIXTURE_PATH=c['usb'],USB_PIONEER_CACHE=str(Path(c['cache'])/'merged'),LAB_VSYNC_HZ='59.24')
    children=[];streams=[];bridge=None
    def start(command,name,**kwargs):
        f=(out/f'{name}.log').open('w');streams.append(f)
        child=subprocess.Popen(command,cwd=BASE,env=env,stdin=subprocess.DEVNULL,stdout=f,stderr=f,start_new_session=True,**kwargs);children.append(child);return child
    def stopped(signum,frame):raise KeyboardInterrupt
    signal.signal(signal.SIGTERM,stopped)
    try:
        audio=subprocess.Popen(['aplay','-q','-D',c['audio_device'],'-t','raw','-f','FLOAT_LE','-c','4','-r','44100','--buffer-time=80000','--period-time=10000',str(fifo)],stderr=subprocess.PIPE,stdout=subprocess.DEVNULL,text=True,start_new_session=True);children.append(audio)
        def observe_audio():
            with (out/'audio-events.jsonl').open('w') as f:
                f.write(json.dumps(dict(event='audio_started',monotonic=time.monotonic(),wall=time.time(),pid=audio.pid))+'\n');f.flush()
                for line in audio.stderr:
                    f.write(json.dumps(dict(monotonic=time.monotonic(),wall=time.time(),text=line.rstrip()))+'\n');f.flush()
        observer=threading.Thread(target=observe_audio,daemon=True);observer.start()
        subprocess.run(['sudo','-n','chrt','-r','-p','10',str(audio.pid)],check=True)
        launcher=start([sys.executable,str(BASE/'run-az-interactive.py')],'launcher')
        player=None;endpoint=None;deadline=time.monotonic()+45
        probe="from az_live_view import LiveView; import sys; v=LiveView(int(sys.argv[1])); print(v.sample()['kind']); v.close()"
        pythonpath=os.pathsep.join(str(BASE/x) for x in ('','analysis','mixer'))
        while time.monotonic()<deadline:
            if launcher.poll() is not None or audio.poll() is not None:raise RuntimeError(f'Player/audio exited; see {out}')
            for proc in Path('/proc').glob('[0-9]*'):
                try:
                    if (proc/'comm').read_text().strip()=='EP147' and os.getpgid(int(proc.name))==launcher.pid:player=int(proc.name)
                except (FileNotFoundError,PermissionError,ProcessLookupError):pass
            for line in (out/'launcher.log').read_text().splitlines():
                try:event=json.loads(line)
                except json.JSONDecodeError:continue
                if event.get('event')=='mixer_control':endpoint=event['socket']
            if player and endpoint:
                ready=subprocess.run(['sudo','-n','env','PYTHONPATH='+pythonpath,sys.executable,'-c',probe,str(player)],capture_output=True,timeout=3)
                if ready.returncode==0:break
            time.sleep(.5)
        else:raise RuntimeError(f'AZ did not become ready; see {out}')
        for proc in Path('/proc').glob('[0-9]*'):
            try:
                if (proc/'cmdline').read_bytes().split(b'\0')[0]==str(Path(endpoint).parent/'mix-stream').encode():
                    subprocess.run(['sudo','-n','chrt','-r','-p','8',proc.name],check=True)
            except (FileNotFoundError,PermissionError,ProcessLookupError):pass
        with socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) as sock:
            sock.sendto(b'M1 441 1 1 1 1 -1 1 -1 1 1 .5 .25 .5 0',endpoint)
        hold=[x for address in c['exit_hold'] for x in ('--exit-hold-address',address)]
        if hold:hold+=['--exit-hold-seconds',str(c['exit_hold_seconds']),'--exit-signal-pid',str(os.getpid())]
        if not a.no_controller:bridge=start(['sudo','-n','env','PYTHONPATH='+pythonpath,sys.executable,str(BASE/'analysis/run_pi_flx6_controls.py'),str(player),'--mapping',c['mapping'],'--state',str(state),'--encoder-counter','0','--mixer-socket',endpoint,'--dsp-graph','--fx-bpm',str(c['fx_bpm']),*hold],'controls')
        (out/'session.json').write_text(json.dumps(dict(supervisor=os.getpid(),player=player,launcher=launcher.pid,audio=audio.pid,bridge=bridge.pid if bridge else None,mixer_socket=endpoint,manual_fx_bpm=c['fx_bpm'],library_stage=c['library_stage']),indent=2))
        library='staged legacy Device Library' if c['library_stage'] else 'the USB library as-is'
        leave='Ctrl+C' if not c['exit_hold'] else f'Ctrl+C, or hold all {len(c["exit_hold"])} mapped exit control(s) together for {c["exit_hold_seconds"]:g}s'
        print(f'AZ session running on {library}. Logs: {out}\n{leave} stops this session. FX tempo is manually set to {c["fx_bpm"]} BPM.',flush=True)
        while all(child.poll() is None for child in children):time.sleep(.5)
        raise RuntimeError(f'A session process exited; inspect {out}')
    except KeyboardInterrupt:pass
    finally:
        if bridge and bridge.poll() is None:
            subprocess.run(['sudo','-n','kill','-TERM','--',str(-bridge.pid)],check=False)
            try:bridge.wait(timeout=5)
            except subprocess.TimeoutExpired:subprocess.run(['sudo','-n','kill','-KILL','--',str(-bridge.pid)],check=False)
        for child in reversed(children):
            if child is bridge or child.poll() is not None:continue
            try:os.killpg(child.pid,signal.SIGTERM);child.wait(timeout=5)
            except ProcessLookupError:pass
            except subprocess.TimeoutExpired:os.killpg(child.pid,signal.SIGKILL);child.wait()
        observer.join(timeout=2) if 'observer' in locals() else None
        for f in streams:f.close()
        for name in ('display-launch.log','mixer-stream.log','xvfb.log'):
            source=BASE/'xdjaz'/name
            if source.is_file():shutil.copy2(source,out/name)

if __name__=='__main__':main()
