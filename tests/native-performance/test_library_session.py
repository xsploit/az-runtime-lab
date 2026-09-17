"""Host-only guards for the legacy Device Library path in the packaged launcher.

Covers configuration validation, the --check preflight and the overlay lower
layers. Native browsing, audio and controller behaviour still need the Pi.
"""
import importlib.util, json, sys, tempfile, unittest
from pathlib import Path
from unittest.mock import patch
BASE=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(BASE));sys.path.insert(0,str(BASE/'analysis'))
spec=importlib.util.spec_from_file_location('session',BASE/'pi/session.py')
session=importlib.util.module_from_spec(spec);spec.loader.exec_module(session)
import prepare_usb_cache

PLAINTEXT=b'SQLite format 3\x00'+b'\0'*32
ENCRYPTED=bytes(range(48))

def layout(root,*,database=ENCRYPTED,stage_name='stage-PIONEER'):
    """Minimal USB + staged library tree; no real firmware or media involved."""
    usb=root/'usb';(usb/'PIONEER/USBANLZ').mkdir(parents=True,exist_ok=True);(usb/'PIONEER/Artwork').mkdir(exist_ok=True)
    stage=root/stage_name;(stage/'rekordbox').mkdir(parents=True,exist_ok=True)
    if database is not None:(stage/'rekordbox/exportLibrary.db').write_bytes(database)
    return usb,stage

def config(root,usb,**extra):
    values={key:str(root/key) for key in ('cache','jemalloc','rootfs','cabinet')}
    values.update(usb=str(usb),audio_device='plughw:CARD=DDJFLX6,DEV=0',**extra)
    path=root/'session.json';path.write_text(json.dumps(values));return path

class LibraryConfigTests(unittest.TestCase):
    def test_absent_key_keeps_plain_usb_browsing(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);usb,_=layout(root)
            self.assertIsNone(session.load_config(config(root,usb))['library_stage'])
    def test_stage_must_be_absolute_and_separate_from_the_usb(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);usb,stage=layout(root)
            self.assertEqual(session.load_config(config(root,usb,library_stage=str(stage)))['library_stage'],str(stage))
            with self.assertRaisesRegex(ValueError,'absolute'):
                session.load_config(config(root,usb,library_stage='stage-PIONEER'))
            with self.assertRaisesRegex(ValueError,'not the original USB'):
                session.load_config(config(root,usb,library_stage=str(usb/'PIONEER')))
    def test_check_reports_missing_plaintext_and_lost_analysis_trees(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);usb,stage=layout(root,database=None)
            c=session.load_config(config(root,usb,library_stage=str(stage)))
            self.assertTrue(any('Stage the legacy library first' in e for e in session.check(c)))
            (stage/'rekordbox/exportLibrary.db').write_bytes(PLAINTEXT)
            self.assertTrue(any('plaintext' in e for e in session.check(c)))
            (stage/'rekordbox/exportLibrary.db').write_bytes(ENCRYPTED)
            self.assertFalse(any('plaintext' in e or 'Stage the legacy' in e for e in session.check(c)))
            (usb/'PIONEER/USBANLZ').rmdir()
            self.assertTrue(any('source analysis/artwork tree' in e for e in session.check(c)))

class OverlayTests(unittest.TestCase):
    """The stage is an extra read-only lower layer, so the writable analysis
    cache and the original USBANLZ/Artwork trees both survive library mode."""
    def prepare(self,usb,cache,stage,mounted=False):
        calls=[]
        def check_output(command,**kwargs):
            if command[3]=='UUID':return 'TEST-UUID\n'
            return ('fuse.fuse-overlayfs\n' if mounted or any('fuse-overlayfs'==c[0] for c in calls) else 'ext4\n')
        def run(command,**kwargs):
            calls.append(command)
            class R:returncode=0 if (command[0]=='mountpoint' and mounted) else (0 if command[0]!='mountpoint' else 1)
            return R
        with patch.object(prepare_usb_cache.subprocess,'check_output',check_output),\
             patch.object(prepare_usb_cache.subprocess,'run',run):
            prepare_usb_cache.prepare(usb,cache,stage)
        return calls
    def test_stage_is_the_upper_lower_layer(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);usb,stage=layout(root);cache=root/'cache'
            mount=[c for c in self.prepare(usb,cache,stage) if c[0]=='fuse-overlayfs'][0]
            options=mount[2]
            self.assertIn(f'lowerdir={stage}:{usb/"PIONEER"}',options)
            self.assertIn(f'upperdir={cache}/upper',options)
            self.assertEqual(json.loads((cache/'identity.json').read_text())['library_stage'],str(stage))
    def test_cache_from_another_stage_is_refused_instead_of_mixed(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);usb,stage=layout(root);cache=root/'cache'
            self.prepare(usb,cache,stage)
            _,other=layout(root,stage_name='other-PIONEER')
            with self.assertRaisesRegex(ValueError,'different USB or library stage'):
                self.prepare(usb,cache,other)
            with self.assertRaisesRegex(ValueError,'different USB or library stage'):
                self.prepare(usb,cache,None)
    def test_unstaged_library_is_rejected_before_mounting(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);usb,stage=layout(root,database=None);cache=root/'cache'
            with self.assertRaisesRegex(ValueError,'exportLibrary.db'):self.prepare(usb,cache,stage)
            with self.assertRaisesRegex(ValueError,'not the original USB'):
                self.prepare(usb,cache,usb/'PIONEER')
if __name__=='__main__':unittest.main()
