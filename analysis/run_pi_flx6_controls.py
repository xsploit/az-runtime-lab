"""One physical FLX6 owner for native AZ navigation and deck1/2 transport.
No audio, jog, pitch, mixer DSP or LED claim. Never run other FIFO pulse writers
while this bridge is active. Exits when the pinned player session ends.
"""
import argparse,fcntl,hashlib,json,os,select,signal,stat,time
from pathlib import Path
from az_live_view import LiveView,ViewUnavailable
from az_live_navigation import LiveNavigation
from flx6_navigation import Navigation
from flx6_transport import Transport
from flx6_midi_stream import MidiStream

def run(a):
    exe=Path(f'/proc/{a.pid}/exe')
    assert hashlib.sha256(exe.read_bytes()).hexdigest()=='137442868569db41daa2c52be4a614d154152e53561b0a7153c8ce2734ae850c'
    lock=open(a.state/'flx6-controls.lock','a');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
    base=bytearray(128);base[0]=1;base[34:36]=a.encoder_counter.to_bytes(2,'little',signed=True)
    nav=Navigation(a.mapping,base);transport=Transport(a.mapping)
    fifos={};epochs={};running=True;count=0;rejected=0
    def stop(*_):
        nonlocal running
        running=False
    signal.signal(signal.SIGTERM,stop);signal.signal(signal.SIGINT,stop)
    for kind,name in [('mixer','mixer-rx.fifo'),('erp','erp-rx.fifo')]:
        p=a.state/name;s=p.stat();assert stat.S_ISFIFO(s.st_mode)
        fifos[kind]=os.open(p,os.O_WRONLY|os.O_NONBLOCK|os.O_CLOEXEC);epochs[kind]=(s.st_dev,s.st_ino)
    def send(kind,packet):
        nonlocal count
        if packet is None:return
        fd=fifos[kind];s=os.fstat(fd);assert (s.st_dev,s.st_ino)==epochs[kind]
        if not select.select([],[fd],[],.1)[1]:raise RuntimeError('Native input pipe stalled')
        if os.write(fd,packet)!=128:raise RuntimeError('Partial native control frame')
        count+=1
    def release():
        send('erp',transport.release_all())
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
            print(json.dumps({'event':'ready','pid':a.pid,'mapping_sha256':hashlib.sha256(a.mapping.read_bytes()).hexdigest(),'scope':'browse/back/view/load and deck1/2 play/cue/keylock'}),flush=True)
            while running:
                view._alive()
                if midi is None:
                    path=device()
                    if path is None:time.sleep(.5);continue
                    midi=os.open(path,os.O_RDONLY|os.O_NONBLOCK|os.O_CLOEXEC);parser=MidiStream()
                    poll=select.poll();poll.register(midi,select.POLLIN|select.POLLHUP|select.POLLERR)
                    print(json.dumps({'event':'connected','device':str(path)}),flush=True)
                events=poll.poll(50)
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
                        packet=adapter.message(*message);send('mixer',packet)
                        packet2=transport.message(*message);send('erp',packet2)
                        if packet is not None or packet2 is not None:print(json.dumps({'event':'mapped','midi':message,'packets':count}),flush=True)
                    except (ValueError,NotImplementedError,ViewUnavailable) as exc:
                        view._alive();rejected+=1;print(json.dumps({'event':'rejected','reason':str(exc)}),flush=True)
    finally:
        try:release()
        except (OSError,RuntimeError):pass
        if midi is not None:os.close(midi)
        for fd in fifos.values():os.close(fd)
        print(json.dumps({'event':'stopped','packets':count,'rejected':rejected,'encoder_counter':nav.encoder.counter}),flush=True)
        lock.close()

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('pid',type=int);p.add_argument('--mapping',type=Path,required=True);p.add_argument('--state',type=Path,required=True);p.add_argument('--encoder-counter',type=int,required=True)
    a=p.parse_args();assert -32768<=a.encoder_counter<=32767;run(a)
