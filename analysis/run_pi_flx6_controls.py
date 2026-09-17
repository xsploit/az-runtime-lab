"""Single physical FLX6 owner for native AZ deck/navigation and host mixing.
Native jog calibration, shifted zoom and new pad/button paths need physical QA.
Never run competing FIFO writers. Exits when the pinned player session ends.
"""
import argparse,fcntl,hashlib,json,os,select,signal,stat,time,socket,tempfile
import xml.etree.ElementTree as ET
from flx6_state import MixerState
from pathlib import Path
from az_live_view import LiveView,ViewUnavailable
from az_live_navigation import LiveNavigation
from flx6_navigation import Navigation
from flx6_transport import Transport
from flx6_midi_stream import MidiStream
from flx6_deck import DeckControls
from flx6_fx import Effects
from az_rx_owner import RxOwner
from flx6_fx_feedback import EffectFeedback

def parse_address(value,parser):
    try:
        status,control=(int(part,0) for part in value.split(','))
    except ValueError:parser.error(f'Expected STATUS,NOTE such as 0x94,0x2e: {value!r}')
    if not 0x80<=status<=0xef or not 0<=control<128:parser.error(f'Address outside MIDI channel messages: {value!r}')
    return (status,control)

def request_stop(pid):
    """Ask one specific session supervisor to run its normal Ctrl+C shutdown.

    The bridge runs as root, so refuse to signal anything that is not still the
    launcher this session was started with; PIDs are reused.
    """
    try:command=Path(f'/proc/{pid}/cmdline').read_bytes().split(b'\0')
    except (FileNotFoundError,PermissionError,ProcessLookupError):return False
    if not any(part.endswith(b'session.py') for part in command):return False
    try:os.kill(pid,signal.SIGTERM)
    except (ProcessLookupError,PermissionError):return False
    return True

def run(a):
    exe=Path(f'/proc/{a.pid}/exe')
    assert hashlib.sha256(exe.read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
    lock=open(a.state/'flx6-controls.lock','a');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
    base=bytearray(128);base[0]=1;base[34:36]=a.encoder_counter.to_bytes(2,'little',signed=True)
    nav=Navigation(a.mapping,base);transport=Transport(a.mapping);decks=DeckControls(a.mapping)
    shift_bindings=set();zoom_bindings=set();shift_down=set();unmapped=set()
    for c in ET.parse(a.mapping).findall('.//controls/control'):
        key=c.findtext('key');addr=(int(c.findtext('status'),0),int(c.findtext('midino'),0))
        if key=='PioneerDDJFLX6.shiftPressed':shift_bindings.add(addr)
        if key=='PioneerDDJFLX6.waveformZoom':zoom_bindings.add(addr)
    fx=Effects(a.mapping,a.fx_bpm) if a.dsp_graph else None
    fx_feedback=EffectFeedback() if fx else None
    last_fx_observation=None
    mix=MixerState(a.mapping);mix.assign=[-1,1,-1,1]
    mixsock=socket.socket(socket.AF_UNIX,socket.SOCK_DGRAM) if a.mixer_socket else None
    replydir=None;rxowner=None;query_at=0.;next_query=0.
    if mixsock:mixsock.setblocking(False)
    if fx:
        replydir=tempfile.TemporaryDirectory(prefix='flx6-fx-')
        replypath=Path(replydir.name)/'reply.sock'
        mixsock.bind(str(replypath))
        # The bridge runs as root for native memory reads, the audio mixer does
        # not. Let that specific mixer user traverse and write the reply socket.
        mixer_owner=os.stat(a.mixer_socket,follow_symlinks=False)
        if not stat.S_ISSOCK(mixer_owner.st_mode):raise ValueError('Expected mixer control socket')
        os.chown(replydir.name,mixer_owner.st_uid,mixer_owner.st_gid)
        os.chown(replypath,mixer_owner.st_uid,mixer_owner.st_gid)
        replypath.chmod(0o600)
        rxowner=RxOwner(nav.packet(),epoch=a.mixer_socket,tap=True)
    def update_mix():
        if mixsock:mixsock.sendto(mix.snapshot().encode(),a.mixer_socket)
    checkpoint=a.state/'flx6-session.json' 
    identity=Path(f'/proc/{a.pid}/stat').read_text().rsplit(')',1)[1].split()[19]
    if checkpoint.exists():
        saved=json.loads(checkpoint.read_text())
        if saved['pid']==a.pid and saved['start_ticks']==identity:
            for d in range(2):
                frame=bytes.fromhex(saved['deck_frames'][d])
                if len(frame)!=152:raise ValueError('Invalid saved deck frame')
                decks.frames[d][:]=frame;decks.count[d]=saved['jog_counts'][d]
            nav.encoder.counter=saved['encoder_counter']
            nav.frame[34:36]=nav.encoder.counter.to_bytes(2,'little',signed=True)
    fifos={};epochs={};running=True;count=0;rejected=0
    # Deliberate controller exit: every configured address, which the player
    # itself never uses, held together. Requiring the whole set is what keeps a
    # single leaned-on button from ending a set.
    exit_addresses=set(a.exit_hold_address);exit_down=set();exit_held_since=None
    def stop(*_):
        nonlocal running
        running=False
    signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
    for kind,name in [('mixer','mixer-rx.fifo'),('erp','erp-rx.fifo'),('deck0','deck0-rx.fifo'),('deck1','deck1-rx.fifo')]:
        p=a.state/name;s=p.stat();assert stat.S_ISFIFO(s.st_mode)
        fifos[kind]=os.open(p,os.O_WRONLY|os.O_NONBLOCK|os.O_CLOEXEC);epochs[kind]=(s.st_dev,s.st_ino)
    def send(kind,packet):
        nonlocal count
        if packet is None:return
        if kind=='mixer' and rxowner:packet=rxowner.controls(packet)
        fd=fifos[kind];s=os.fstat(fd);assert (s.st_dev,s.st_ino)==epochs[kind]
        if not select.select([],[fd],[],.1)[1]:raise RuntimeError('Native input pipe stalled')
        if os.write(fd,packet)!=len(packet):raise RuntimeError('Partial native control frame')
        count+=1
    def release():
        shift_down.clear();mix.held.clear();mix.parts.clear()
        if fx:
            fx.release()
            for command in fx.commands():
                try:mixsock.sendto(command.encode(),a.mixer_socket)
                except BlockingIOError:fx.dirty=True;fx.last_source=None;break
        send('erp',transport.release_all())
        for d,p in decks.release_all():send(f'deck{d}',p)
        for status,control in list(nav.down):send('mixer',nav.message(status,control,0))
    def device():
        found=[]
        for card in Path('/proc/asound').glob('card[0-9]*'):
            ident=card/'id'
            if ident.exists() and ident.read_text().strip()=='DDJFLX6':
                p=Path('/dev/snd')/f'midiC{card.name[4:]}D0'
                if p.exists() and stat.S_ISCHR(p.stat().st_mode):found.append(p)
        if len(found)>1:raise RuntimeError('Multiple FLX6 devices; select explicitly before continuing')
        return found[0] if found else None
    midi=None
    try:
        with LiveView(a.pid) as view:
            adapter=LiveNavigation(nav,view)
            print(json.dumps({'event':'ready','pid':a.pid,'mapping_sha256':hashlib.sha256(a.mapping.read_bytes()).hexdigest(),'scope':'deck1/2 jog/tempo/buttons/pads, navigation and shifted zoom, optional host mixer'}),flush=True)
            while running:
                view._alive()
                for d,p in decks.idle():send(f'deck{d}',p)
                if fx:
                    for command in fx.commands():
                        try:mixsock.sendto(command.encode(),a.mixer_socket)
                        except BlockingIOError:fx.dirty=True;fx.last_source=None;break
                    now=time.monotonic()
                    for _ in range(16):
                        try:data,peer=mixsock.recvfrom(4096)
                        except BlockingIOError:break
                        if peer!=a.mixer_socket:continue
                        try:snapshot=json.loads(data)
                        except (ValueError,UnicodeError):continue
                        if fx_feedback.accept(snapshot,now):
                            observation={k:snapshot[k] for k in ('active_type','target','on','source_bpm100','effect_beat','time_ms')}
                            if observation!=last_fx_observation:
                                last_fx_observation=observation
                                print(json.dumps({'event':'applied_fx',**observation}),flush=True)
                        packet=rxowner.feedback(snapshot,epoch=a.mixer_socket,received_at=query_at,now=now)
                        send('mixer',packet)
                    if now>=next_query:
                        try:mixsock.sendto(b'Q1',a.mixer_socket);query_at=now;next_query=now+.2
                        except BlockingIOError:pass
                if midi is None:
                    path=device()
                    if path is None:time.sleep(.5);continue
                    midi=os.open(path,os.O_RDWR|os.O_NONBLOCK|os.O_CLOEXEC);parser=MidiStream()
                    os.write(midi,bytes([0xf0,0,0x20,0x7f,3,1,0xf7]))
                    update_mix()
                    if fx_feedback:fx_feedback.sent.clear()
                    poll=select.poll();poll.register(midi,select.POLLIN|select.POLLHUP|select.POLLERR)
                    print(json.dumps({'event':'connected','device':str(path)}),flush=True)
                if fx_feedback:
                    for packet in fx_feedback.messages(time.monotonic(),fx.led_addresses,fx.led_address):
                        os.write(midi,packet)
                events=poll.poll(50)
                if exit_held_since is not None and time.monotonic()-exit_held_since>=a.exit_hold_seconds:
                    delivered=request_stop(a.exit_signal_pid);exit_held_since=None
                    print(json.dumps({'event':'exit_requested','held_seconds':a.exit_hold_seconds,'supervisor':a.exit_signal_pid,'delivered':delivered}),flush=True)
                    if delivered:running=False;continue
                if not events:continue
                flags=events[0][1]
                if flags&(select.POLLHUP|select.POLLERR):release();os.close(midi);midi=None;continue
                try:chunk=os.read(midi,4096)
                except BlockingIOError:continue
                except OSError:release();os.close(midi);midi=None;continue
                if not chunk:release();os.close(midi);midi=None;continue
                for message in parser.feed(chunk):
                    status,control,value=message
                    try:
                        addr=(status+16 if status&0xf0==0x80 else status,control)
                        pressed=value!=0 and status&0xf0!=0x80
                        if addr in exit_addresses:
                            # A tap is ignored; only holding the complete set counts,
                            # and releasing any one of them restarts the timer.
                            if pressed:exit_down.add(addr)
                            else:exit_down.discard(addr)
                            if exit_down==exit_addresses:
                                if exit_held_since is None:exit_held_since=time.monotonic()
                            else:exit_held_since=None
                            continue
                        if addr in shift_bindings:
                            if pressed:shift_down.add(addr)
                            else:shift_down.discard(addr)
                            continue
                        zoom=addr in zoom_bindings or (bool(shift_down) and nav.bindings.get(addr)=='rotate')
                        if zoom and value:
                            if view.sample()['kind']=='browse':
                                original=nav.frame[32];nav.frame[32]|=64;send('mixer',nav.packet());time.sleep(.03)
                                nav.frame[32]=original;send('mixer',nav.packet())
                                deadline=time.monotonic()+.5
                                while running and time.monotonic()<deadline and view.sample()['kind']!='waveform':time.sleep(.01)
                            if view.sample()['kind']!='waveform':raise ViewUnavailable('Zoom needs the waveform screen')
                            delta=value if value<64 else value-128
                            send('mixer',nav.packet(delta));print(json.dumps({'event':'zoom','delta':delta}),flush=True);continue
                        if fx and fx.message(*message):
                            print(json.dumps({'event':'fx','midi':message}),flush=True);continue
                        if mix.message(*message):
                            update_mix()
                            if addr in mix.bindings and mix.bindings[addr][0]=='pfl':
                                d=mix.bindings[addr][1];os.write(midi,bytes([0x90+d,0x54,127 if mix.cue&(1<<d) else 0]))
                            print(json.dumps({'event':'mix','midi':message,'cue_mask':mix.cue}),flush=True)
                            continue
                        # The physical browse encoder must never adjust waveform zoom.
                        if nav.bindings.get((status,control))=='rotate' and value:
                            sample=view.sample()
                            if sample['kind']!='browse':
                                if sample['kind'] not in ('source','waveform'):raise ViewUnavailable('Browse rotation unsupported on this page')
                                original=nav.frame[32];nav.frame[32]|=64;send('mixer',nav.packet());time.sleep(.03)
                                nav.frame[32]=original;send('mixer',nav.packet())
                                deadline=time.monotonic()+.5
                                while running and time.monotonic()<deadline and view.sample()['kind']!='browse':time.sleep(.01)
                                if view.sample()['kind']!='browse':raise ViewUnavailable('Browse did not open; rotation rejected')
                        deck_packet=decks.message(*message)
                        if deck_packet is not None:send(f'deck{deck_packet[0]}',deck_packet[1])
                        # Select native Hot Cue mode before pad activation; never depend
                        # on a stale pad-mode guess after touchscreen changes.
                        binding=transport.bindings.get((status,control))
                        if value and binding and binding[1].startswith('hotcue_') and binding[0] in (1,2):
                            at=8+8*(binding[0]-1)+5;old=transport.frame[at]
                            transport.frame[at]=old|1;send('erp',transport.packet());time.sleep(.02)
                            transport.frame[at]=old;send('erp',transport.packet())
                        packet=adapter.message(*message);send('mixer',packet)
                        packet2=transport.message(*message);send('erp',packet2)
                        if packet is not None or packet2 is not None or deck_packet is not None:print(json.dumps({'event':'mapped','midi':message,'packets':count}),flush=True)
                        # View/Back deliberately emit nothing on a page that is
                        # already correct. Do not report that as unmapped.
                        elif pressed and nav.bindings.get(addr) in ('view','back'):
                            print(json.dumps({'event':'no_change','midi':message,'action':nav.bindings[addr]}),flush=True)
                        elif addr not in unmapped:
                            unmapped.add(addr);print(json.dumps({'event':'unmapped_address','midi':message}),flush=True)
                    except (ValueError,NotImplementedError,ViewUnavailable) as exc:
                        view._alive();rejected+=1;print(json.dumps({'event':'rejected','reason':str(exc)}),flush=True)
    finally:
        try:release()
        except (OSError,RuntimeError):pass
        if midi is not None:
            if fx_feedback:
                fx_feedback.reset()
                try:
                    for packet in fx_feedback.messages(time.monotonic(),fx.led_addresses,fx.led_address):os.write(midi,packet)
                except OSError:pass
            os.close(midi)
        for fd in fifos.values():os.close(fd)
        print(json.dumps({'event':'stopped','packets':count,'rejected':rejected,'encoder_counter':nav.encoder.counter}),flush=True)
        temporary=checkpoint.with_suffix('.tmp')
        temporary.write_text(json.dumps({'pid':a.pid,'start_ticks':identity,
            'encoder_counter':nav.encoder.counter,'jog_counts':decks.count,
            'deck_frames':[bytes(f).hex() for f in decks.frames]})+'\n')
        temporary.chmod(0o600);temporary.replace(checkpoint)
        if mixsock:mixsock.close()
        if replydir:replydir.cleanup()
        lock.close()

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('pid',type=int);p.add_argument('--mapping',type=Path,required=True);p.add_argument('--state',type=Path,required=True);p.add_argument('--encoder-counter',type=int,required=True);p.add_argument('--mixer-socket')
    p.add_argument('--dsp-graph',action='store_true');p.add_argument('--fx-bpm',type=float,default=120,help='Manual Echo BPM pending native telemetry')
    p.add_argument('--exit-hold-address',action='append',default=[],metavar='STATUS,NOTE',help='Controller address that ends the session when held; repeatable')
    p.add_argument('--exit-hold-seconds',type=float,default=2.,help='Deliberate hold before the session is asked to stop')
    p.add_argument('--exit-signal-pid',type=int,help='Session supervisor to SIGTERM on that hold')
    a=p.parse_args()
    if a.dsp_graph and not a.mixer_socket:p.error('DSP graph requires mixer socket')
    if not 40<=a.fx_bpm<=300:p.error('Manual FX BPM must be 40..300')
    if a.exit_hold_address and not a.exit_signal_pid:p.error('--exit-hold-address requires --exit-signal-pid')
    if not .5<=a.exit_hold_seconds<=10:p.error('--exit-hold-seconds must be 0.5..10')
    a.exit_hold_address=[parse_address(v,p) for v in a.exit_hold_address]
    assert -32768<=a.encoder_counter<=32767;run(a)
