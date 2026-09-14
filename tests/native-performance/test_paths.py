"""Offline portability regression suite; never contacts or starts a DJ device."""
import ast
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT))
import az_paths


def source_files():
    names=subprocess.check_output(['git','ls-files','--cached','--others','--exclude-standard'],cwd=ROOT,text=True).splitlines()
    return sorted({ROOT/n for n in names if Path(n).suffix in ('.py','.sh','.c','.h','.cpp','.cc','.js','.conf','.html')})

class PathsTests(unittest.TestCase):
    def test_no_machine_paths_in_source(self):
        forbidden=[r'/home/(?!root(?:/|[\'\"]|$))[A-Za-z0-9_-]+/',
                   r'/media/(?!usb/)[A-Za-z0-9_-]+/[A-Za-z0-9_-]+',
                   r'/run/user/\d+',r'/mnt/[a-zA-Z]/Users/',
                   r'\b\w+@(?:pflx\.local|192\.168\.)',
                   r'/tmp/piflex-(?:ssh-key|known-hosts)',
                   r"base\.parent\s*/\s*['\"]rx3-research/bitedj-mapping"]
        failures=[]
        for p in source_files():
            for number,line in enumerate(p.read_text().splitlines(),1):
                if any(re.search(pattern,line) for pattern in forbidden):
                    failures.append(f'{p.relative_to(ROOT)}:{number}')
        self.assertEqual(failures,[])

    def test_config_precedence_and_missing_inputs(self):
        with tempfile.TemporaryDirectory(prefix='AZ paths ') as tmp, patch.dict(os.environ,{},clear=True):
            base=Path(tmp);config=base/'session config.json';state=base/'state one'
            config.write_text(json.dumps(dict(state=str(state),rootfs=str(base/'firmware'),jemalloc=str(base/'allocator.so'),mapping=str(base/'controller.xml'),usb=str(base/'music'))))
            with self.assertRaisesRegex(ValueError,'AZ_SSH_HOST'):az_paths.ssh_target()
            with self.assertRaisesRegex(ValueError,'LAB_PI_JEMALLOC'):az_paths.lab_path('libjemalloc-pi.so.2')
            os.environ['AZ_CONFIG']=str(config)
            self.assertEqual(az_paths.lab_path('xdjaz/state/tmp/erp-rx.fifo'),state/'tmp/erp-rx.fifo')
            self.assertEqual(az_paths.lab_path('xdjaz/rootfs/home/root/pdj/EP147'),base/'firmware/home/root/pdj/EP147')
            self.assertEqual(az_paths.lab_path('libjemalloc-pi.so.2'),base/'allocator.so')
            self.assertEqual(az_paths.lab_path('benchmark-usb'),base/'music')
            self.assertEqual(az_paths.mapping_path(),base/'controller.xml')
            os.environ['AZ_STATE']=str(base/'override')
            self.assertEqual(az_paths.lab_path('xdjaz/state/tmp'),base/'override/tmp')
            os.environ['AZ_STATE']='relative/path'
            with self.assertRaisesRegex(ValueError,'absolute'):az_paths.lab_path('xdjaz/state')

    def test_explicit_ssh_and_desktop(self):
        with tempfile.TemporaryDirectory(prefix='AZ desktop ') as tmp, patch.dict(os.environ,{},clear=True):
            base=Path(tmp)
            with self.assertRaisesRegex(ValueError,'XDG_RUNTIME_DIR'):az_paths.desktop_env()
            os.environ.update(AZ_SSH_HOST='my-pi-alias',AZ_SSH_KEY=str(base/'key file'),XDG_RUNTIME_DIR=tmp,WAYLAND_DISPLAY='wayland-custom')
            options,host=az_paths.ssh_target()
            self.assertEqual(host,'my-pi-alias');self.assertIn(str(base/'key file'),options)
            self.assertIn('StrictHostKeyChecking=yes',options)
            self.assertEqual(az_paths.desktop_env()['WAYLAND_DISPLAY'],'wayland-custom')
            with self.assertRaisesRegex(ValueError,'SWAYSOCK'):az_paths.sway_socket()
            (base/'sway-ipc.first.sock').touch()
            self.assertEqual(az_paths.sway_socket(),base/'sway-ipc.first.sock')
            (base/'sway-ipc.second.sock').touch()
            with self.assertRaisesRegex(ValueError,'SWAYSOCK'):az_paths.sway_socket()

    def test_relocated_research_imports(self):
        # Execute only each helper bootstrap, never its probe body.
        with tempfile.TemporaryDirectory(prefix='AZ relocated ') as tmp:
            root=Path(tmp)/'checkout with spaces';root.mkdir()
            shutil.copy2(ROOT/'az_paths.py',root/'az_paths.py')
            checked=0
            for source in source_files():
                if source.suffix!='.py':continue
                text=source.read_text()
                if not any(line.startswith('# Locate shared helpers from this checkout') for line in text.splitlines()):continue
                statements=ast.parse(text).body;last=next(n.end_lineno for n in statements if isinstance(n,ast.ImportFrom) and n.module=='az_paths')
                lines=text.splitlines()
                start=next(i for i,line in enumerate(lines) if line.startswith('# Locate shared helpers'))
                target=root/source.relative_to(ROOT);target.parent.mkdir(parents=True,exist_ok=True)
                target.write_text('\n'.join(lines[start:last])+"\nfrom az_paths import ROOT, mapping_path\nprint(ROOT)\nprint(mapping_path())\n")
                env={k:v for k,v in os.environ.items() if not k.startswith('AZ_')}
                result=subprocess.check_output([sys.executable,str(target)],cwd='/tmp',env=env,text=True).splitlines()
                self.assertEqual(result,[str(root),str(root/'pi/Pioneer-DDJ-FLX6.midi.xml')]);checked+=1
            self.assertGreater(checked,20)

    def test_python_and_shell_syntax(self):
        for source in source_files():
            if source.suffix=='.py':ast.parse(source.read_text(),filename=str(source))
            elif source.suffix=='.sh':subprocess.run(['bash','-n',str(source)],check=True,capture_output=True)

    def test_shell_missing_config_has_no_actions(self):
        for name in ('analysis/pi-az-two-probe.sh','analysis/pi-bite-two-probe.sh','analysis/panel-rate-test/launch.sh','analysis/drm-display-clock/launch-memory.sh'):
            # No required environment: must exit before starting/stopping anything.
            result=subprocess.run(['bash',str(ROOT/name)],env={'PATH':os.environ['PATH']},cwd='/tmp',capture_output=True,text=True)
            self.assertNotEqual(result.returncode,0)
            self.assertIn('Set ',result.stderr)

    def test_shell_relocated_root_with_spaces(self):
        with tempfile.TemporaryDirectory(prefix='AZ shell ') as tmp:
            root=Path(tmp)/'repo with spaces';target=root/'analysis/panel-rate-test/launch.sh'
            target.parent.mkdir(parents=True)
            # Only run path discovery and the first missing-variable check.
            lines=(ROOT/'analysis/panel-rate-test/launch.sh').read_text().splitlines()
            end=next(i for i,line in enumerate(lines) if line.startswith(': "${'))
            target.write_text('\n'.join(lines[:end])+'\nprintf "%s\\n" "$AZ_LAB_ROOT"\n')
            result=subprocess.check_output(['bash',str(target)],env={'PATH':os.environ['PATH']},cwd='/tmp',text=True)
            self.assertEqual(result.strip(),str(root))

    def test_video_cli_help_from_other_cwd(self):
        for name in ('build.py','build-waveform.py'):
            result=subprocess.run([sys.executable,str(ROOT/'video-comparison'/name),'--help'],cwd='/tmp',capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            self.assertIn('--output',result.stdout)

if __name__=='__main__':unittest.main()
