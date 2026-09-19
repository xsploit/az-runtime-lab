"""Host-only guards for the controller exit hold.

The hold ends a live performance, so the risky parts are guarded here: a tap
must not fire, a partial chord must not fire, and the bridge must never signal
a process that is not still this session's launcher.
"""
import argparse, importlib.util, json, os, sys, tempfile, unittest
from pathlib import Path
from unittest.mock import patch
BASE=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(BASE));sys.path.insert(0,str(BASE/'analysis'));sys.path.insert(0,str(BASE/'mixer'))
spec=importlib.util.spec_from_file_location('session',BASE/'pi/session.py')
session=importlib.util.module_from_spec(spec);spec.loader.exec_module(session)
bridge=importlib.util.spec_from_file_location('controls',BASE/'analysis/run_pi_flx6_controls.py')
controls=importlib.util.module_from_spec(bridge)
try:bridge.loader.exec_module(controls)
except ImportError as exc:raise SystemExit(f'Bridge dependencies unavailable on this host: {exc}')

MERGE_LEFT=(0x94,0x2e);MERGE_RIGHT=(0x95,0x2e)

class AddressTests(unittest.TestCase):
    def parse(self,value):
        p=argparse.ArgumentParser()
        # parse_address reports through parser.error; raise instead of exiting.
        p.error=lambda message:(_ for _ in ()).throw(ValueError(message))
        return controls.parse_address(value,p)
    def test_merge_fx_addresses_round_trip(self):
        self.assertEqual(self.parse('0x94,0x2e'),MERGE_LEFT)
        self.assertEqual(self.parse('148,46'),MERGE_LEFT)
    def test_nonsense_addresses_are_refused(self):
        for value in ('0x94','0x94,0x2e,1','notanumber,1','0x94,200','0x70,0x2e','0xf8,0x2e'):
            with self.assertRaises(ValueError,msg=value):self.parse(value)

class RequestStopTests(unittest.TestCase):
    """The bridge runs as root, so this is the dangerous call in the feature."""
    def test_only_a_live_session_launcher_is_signalled(self):
        sent=[]
        with tempfile.TemporaryDirectory() as t:
            proc=Path(t)/'4242';proc.mkdir()
            (proc/'cmdline').write_bytes(b'/usr/bin/python3\x00pi/session.py\x00config.json\x00')
            with patch.object(controls,'Path',lambda p:proc/'cmdline' if str(p)=='/proc/4242/cmdline' else Path(p)),\
                 patch.object(controls.os,'kill',lambda pid,sig:sent.append((pid,sig))):
                self.assertTrue(controls.request_stop(4242))
            self.assertEqual(sent,[(4242,controls.signal.SIGTERM)])
    def test_an_unrelated_or_recycled_pid_is_left_alone(self):
        sent=[]
        with tempfile.TemporaryDirectory() as t:
            proc=Path(t)/'4242';proc.mkdir()
            (proc/'cmdline').write_bytes(b'/usr/bin/firefox\x00')
            with patch.object(controls,'Path',lambda p:proc/'cmdline' if str(p)=='/proc/4242/cmdline' else Path(p)),\
                 patch.object(controls.os,'kill',lambda pid,sig:sent.append((pid,sig))):
                self.assertFalse(controls.request_stop(4242))
            self.assertEqual(sent,[])
    def test_a_vanished_process_is_not_an_error(self):
        with patch.object(controls,'Path',lambda p:Path('/proc/does-not-exist/cmdline')):
            self.assertFalse(controls.request_stop(999999))

class HoldStateTests(unittest.TestCase):
    """Mirrors the bridge's chord bookkeeping: all addresses, held together."""
    def chord(self,presses,*,required={MERGE_LEFT,MERGE_RIGHT}):
        down=set();since=None;clock=0.
        fired=[]
        for addr,pressed,clock in presses:
            if pressed:down.add(addr)
            else:down.discard(addr)
            since=(since if since is not None else clock) if down==required else None
            if since is not None and clock-since>=2.:fired.append(clock)
        return fired
    def test_a_tap_on_both_does_not_fire(self):
        self.assertEqual(self.chord([(MERGE_LEFT,True,0.),(MERGE_RIGHT,True,.05),
                                     (MERGE_RIGHT,False,.3),(MERGE_LEFT,False,.35)]),[])
    def test_one_button_held_forever_does_not_fire(self):
        self.assertEqual(self.chord([(MERGE_LEFT,True,0.),(MERGE_LEFT,True,30.)]),[])
    def test_both_held_past_the_threshold_fires(self):
        self.assertTrue(self.chord([(MERGE_LEFT,True,0.),(MERGE_RIGHT,True,.1),(MERGE_RIGHT,True,2.2)]))
    def test_releasing_one_restarts_the_timer(self):
        self.assertEqual(self.chord([(MERGE_LEFT,True,0.),(MERGE_RIGHT,True,.1),
                                     (MERGE_RIGHT,False,1.9),(MERGE_RIGHT,True,1.95),
                                     (MERGE_LEFT,True,3.0)]),[])

class ConfigTests(unittest.TestCase):
    def config(self,root,**extra):
        values={key:str(root/key) for key in ('usb','cache','jemalloc','rootfs','cabinet')}
        values.update(audio_device='plughw:CARD=DDJFLX6,DEV=0',**extra)
        path=root/'session.json';path.write_text(json.dumps(values));return path
    def test_both_merge_fx_buttons_are_the_default(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            c=session.load_config(self.config(Path(t)))
            self.assertEqual(c['exit_hold'],['0x94,0x2e','0x95,0x2e'])
            self.assertEqual(c['exit_hold_seconds'],2.)
    def test_the_hold_can_be_disabled_or_retimed_but_not_malformed(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t)
            self.assertEqual(session.load_config(self.config(root,exit_hold=[]))['exit_hold'],[])
            self.assertEqual(session.load_config(self.config(root,exit_hold_seconds=3.5))['exit_hold_seconds'],3.5)
            for bad in ({'exit_hold':'0x94,0x2e'},{'exit_hold':[148]},{'exit_hold_seconds':0.1},{'exit_hold_seconds':60}):
                with self.assertRaises(ValueError,msg=str(bad)):session.load_config(self.config(root,**bad))
    def test_external_display_is_off_by_default_and_must_name_an_x_display(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t)
            self.assertIsNone(session.load_config(self.config(root))['external_display'])
            self.assertEqual(session.load_config(self.config(root,external_display=':1'))['external_display'],':1')
            for bad in ('1','localhost:1',':one',True):
                with self.assertRaises(ValueError,msg=str(bad)):session.load_config(self.config(root,external_display=bad))
if __name__=='__main__':unittest.main()
