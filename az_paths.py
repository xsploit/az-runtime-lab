"""Portable host paths for research tools. Firmware-internal paths stay fixed."""
from pathlib import Path
import json
import os

ROOT = Path(__file__).resolve().parent

def required_env(name):
    value = os.environ.get(name)
    if not value:
        raise ValueError(f'Set {name} explicitly; see PORTABILITY.md')
    return value

def configured_path(env_name, config_name=None, default=None):
    value = os.environ.get(env_name)
    if not value and config_name and os.environ.get('AZ_CONFIG'):
        value = json.loads(Path(os.environ['AZ_CONFIG']).read_text()).get(config_name)
    if not value:
        if default is not None:
            return Path(default).resolve()
        raise ValueError(f'Set {env_name} or {config_name} in AZ_CONFIG; see PORTABILITY.md')
    path = Path(value).expanduser()
    if not path.is_absolute():
        raise ValueError(f'{env_name} must be an absolute path')
    return path.resolve()

def lab_path(relative=''):
    root = configured_path('AZ_LAB_ROOT', default=ROOT)
    if relative == 'libjemalloc-pi.so.2':
        return configured_path('LAB_PI_JEMALLOC', 'jemalloc')
    if relative == 'benchmark-usb':
        return configured_path('USB_FIXTURE_PATH', 'usb')
    for prefix, env, key in (
        ('xdjaz/state', 'AZ_STATE', 'state'),
        ('xdjaz/rootfs', 'AZ_ROOTFS', 'rootfs'),
        ('private/cabinet-extracted', 'AZ_CABINET', 'cabinet'),
    ):
        if relative == prefix or relative.startswith(prefix+'/'):
            target = configured_path(env, key, root/prefix)
            return target/relative[len(prefix):].lstrip('/')
    return root/relative

def mapping_path():
    return configured_path('AZ_MAPPING', 'mapping', ROOT/'pi/Pioneer-DDJ-FLX6.midi.xml')

def desktop_env():
    result = {key: required_env(key) for key in ('XDG_RUNTIME_DIR','WAYLAND_DISPLAY')}
    if os.environ.get('SWAYSOCK'):
        result['SWAYSOCK'] = os.environ['SWAYSOCK']
    return result

def sway_socket():
    if os.environ.get('SWAYSOCK'):
        return Path(os.environ['SWAYSOCK'])
    matches = list(Path(required_env('XDG_RUNTIME_DIR')).glob('sway-ipc.*.sock'))
    if len(matches) != 1:
        raise ValueError('Set SWAYSOCK to the intended compositor socket')
    return matches[0]

def ssh_target():
    # Uses ordinary OpenSSH config/agent unless explicit overrides are supplied.
    host = required_env('AZ_SSH_HOST')
    if host.startswith('-') or any(c.isspace() for c in host) or ':' in host:
        raise ValueError('AZ_SSH_HOST must be an SSH config alias or user@host')
    options = ['-o','BatchMode=yes','-o','ConnectTimeout=8','-o','StrictHostKeyChecking=yes']
    for variable, option in [('AZ_SSH_KEY','-i'),('AZ_SSH_KNOWN_HOSTS','-o')]:
        if os.environ.get(variable):
            path = str(configured_path(variable))
            options += [option, 'UserKnownHostsFile='+path if option=='-o' else path]
    return options, host

if __name__ == '__main__':
    import argparse
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('path',nargs='?',default='');a=p.parse_args()
    print(lab_path(a.path))
