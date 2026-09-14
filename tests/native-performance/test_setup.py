"""Host-only guards: relocated paths and incorrect firmware/build inputs."""
import hashlib, importlib.util, json, sys, tempfile, unittest
from pathlib import Path
from unittest.mock import patch
BASE=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(BASE))
import native_optimizations as opt
spec=importlib.util.spec_from_file_location('session',BASE/'pi/session.py')
session=importlib.util.module_from_spec(spec);spec.loader.exec_module(session)

class SetupTests(unittest.TestCase):
    def test_config_spaces_and_defaults(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            root=Path(t);config=root/'my settings.json'
            values={key:str(root/key) for key in ('usb','cache','jemalloc','rootfs','cabinet')}
            values['audio_device']='plughw:CARD=DDJFLX6,DEV=0'
            config.write_text(json.dumps(values));got=session.load_config(config)
            self.assertEqual(got['usb'],values['usb']);self.assertTrue(Path(got['mapping']).is_file())
            values['rootfs']='relative/path';config.write_text(json.dumps(values))
            with self.assertRaisesRegex(ValueError,'absolute'):session.load_config(config)
    def test_native_optin_guards(self):
        with tempfile.TemporaryDirectory(prefix='AZ space ') as t:
            base=Path(t);root=base/'private input';exe=root/'home/root/pdj/EP147'
            exe.parent.mkdir(parents=True);exe.write_bytes(b'synthetic ELF test input')
            shims=base/'shims';shims.mkdir()
            names=['fractional-grid-span.so','sem-owner.so']
            for n in names:(shims/n).write_bytes(n.encode())
            hashes={n:hashlib.sha256((shims/n).read_bytes()).hexdigest() for n in names}
            (shims/'native-build.json').write_text(json.dumps({'sha256':hashes}))
            args=['bwrap','--chdir','/home/root/pdj','-E','LD_PRELOAD=/lab-shims/offline-mixer-fixture.so','EP147']
            self.assertIs(opt.configure(args,base,root,'xdjaz',{}),args)
            env=dict(LAB_GRID_SPAN_CANDIDATE='1',LAB_SEM_OWNER_FIX='1',OFFLINE_MIDI='1',LAB_AZ_SMOOTH_SCROLL='1',LAB_AZ_FRACTIONAL_GRID='1')
            with self.assertRaisesRegex(ValueError,'Unsupported'):opt.configure(args,base,root,'xdjaz',env)
            with patch.object(opt,'AZ_SHA256',hashlib.sha256(exe.read_bytes()).hexdigest()):
                result=opt.configure(args,base,root,'xdjaz',env)
                self.assertIn(str(shims/'fractional-grid-span.so'),result)
                self.assertIn('LD_PRELOAD=/lab-shims/offline-mixer-fixture.so:/lab-shims/sem-owner.so',result)
                self.assertNotIn(str(shims/'fractional-grid-span.so'),args)
                with self.assertRaises(ValueError):opt.configure(args,base,root,'cdj3000x',env)
                (shims/'sem-owner.so').write_bytes(b'wrong build')
                with self.assertRaisesRegex(ValueError,'manifest'):opt.configure(args,base,root,'xdjaz',env)
if __name__=='__main__':unittest.main()
