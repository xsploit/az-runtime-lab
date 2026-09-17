"""Real service FIFO/socket test with synthetic Sound Color packets only."""
import json
import os
import select
import socket
import stat
import subprocess
import tempfile
import time
import unittest
from pathlib import Path

from az_mixer_packet import SOUND_COLOR_SELECTOR_BITS, crc16

ROOT = Path(__file__).resolve().parent


def packet(selectors=(), colors=(0, 0, 0, 0), hui01=False):
    frame = bytearray(128)
    frame[0:2] = b'\x34\x12'
    for selector in selectors:
        frame[21] |= 1 << SOUND_COLOR_SELECTOR_BITS[selector - 1]
    if hui01:
        frame[23] |= (1 << 2) | (1 << 1)
    for channel, raw in enumerate(colors):
        frame[61 + channel] = raw >> 2
        frame[65] |= (raw & 3) << (6 - 2 * channel)
    frame[96:98] = crc16(frame[:96]).to_bytes(2, 'little')
    return bytes(frame)


class CfxFeedbackServiceTests(unittest.TestCase):
    def test_ordered_observation_explicit_policy_and_bounded_retry(self):
        with tempfile.TemporaryDirectory(prefix='az-cfx-service-') as td:
            directory = Path(td)
            baseline = directory / 'baseline'
            mixer_path = directory / 'mixer'
            input_path = directory / 'input'
            fifo_path = directory / 'fifo'
            baseline.write_bytes(packet())
            os.mkfifo(fifo_path)
            fifo_fd = os.open(fifo_path, os.O_RDWR | os.O_NONBLOCK)
            with socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as mixer, \
                    socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as sender:
                mixer.bind(str(mixer_path))
                mixer.setblocking(False)
                process = subprocess.Popen([
                    'python3', str(ROOT / 'run_rx_feedback.py'),
                    str(baseline), str(mixer_path), str(input_path), str(fifo_path),
                    '--mode', 'tap', '--seconds', '8',
                    '--cfx-selector-map', '1:6,2:5,3:4,4:3,5:2,6:1',
                    '--cfx-parameter', '.25',
                ], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

                def wait_ready():
                    deadline = time.monotonic() + 3
                    while not input_path.exists():
                        self.assertIsNone(process.poll())
                        self.assertLess(time.monotonic(), deadline)
                        time.sleep(.005)
                    self.assertTrue(stat.S_ISSOCK(input_path.lstat().st_mode))

                def collect(duration=.1):
                    deadline = time.monotonic() + duration
                    commands = []
                    while time.monotonic() < deadline:
                        if mixer in select.select([mixer], [], [], .01)[0]:
                            try:
                                while True:
                                    value = mixer.recv(512)
                                    if value.startswith(b'F1 '):
                                        commands.append(value.decode())
                            except BlockingIOError:
                                pass
                    return commands

                def wait_frame():
                    ready = select.select([fifo_fd], [], [], 1)[0]
                    self.assertEqual(ready, [fifo_fd])
                    value = os.read(fifo_fd, 128)
                    self.assertEqual(len(value), 128)
                    return value

                try:
                    wait_ready()
                    sender.sendto(packet(), str(input_path))
                    self.assertEqual(wait_frame(), packet())
                    self.assertEqual(collect(), [])

                    sender.sendto(packet()[:-1], str(input_path))
                    self.assertEqual(select.select([fifo_fd], [], [], .08)[0], [])
                    self.assertEqual(collect(.05), [])
                    corrupt = bytearray(packet([1])); corrupt[96] ^= 1
                    sender.sendto(corrupt, str(input_path))
                    self.assertEqual(select.select([fifo_fd], [], [], .08)[0], [])
                    self.assertEqual(collect(.05), [])

                    hui_only = packet(hui01=True)
                    sender.sendto(hui_only, str(input_path))
                    self.assertEqual(wait_frame(), hui_only)
                    self.assertEqual(collect(.1), [])

                    pressed = packet([1], (0, 1, 510, 1023), hui01=True)
                    sender.sendto(pressed, str(input_path))
                    self.assertEqual(wait_frame(), pressed)
                    initial = collect(.1)
                    self.assertEqual(initial, [
                        'F1 0 6 0 0.25',
                        'F1 1 6 0.000977517106 0.25',
                        'F1 2 6 0.498533726 0.25',
                        'F1 3 6 1 0.25',
                    ])
                    repeats = collect(1.0)
                    self.assertGreaterEqual(len(repeats), 8)
                    self.assertEqual(set(repeats), set(initial))
                    self.assertEqual(collect(.3), [])

                    released = packet(colors=(0, 1, 510, 1023), hui01=True)
                    sender.sendto(released, str(input_path))
                    self.assertEqual(wait_frame(), released)
                    self.assertEqual(collect(.1), [])
                    sender.sendto(pressed, str(input_path))
                    self.assertEqual(wait_frame(), pressed)
                    off = collect(.1)
                    self.assertEqual(off, [
                        f'F1 {channel} 0 {color} 0.25'
                        for channel, color in enumerate(
                            ('0', '0.000977517106', '0.498533726', '1'))
                    ])

                    process.terminate()
                    stdout, stderr = process.communicate(timeout=3)
                    self.assertEqual(process.returncode, 0, stderr)
                    events = [json.loads(line) for line in stdout.splitlines()]
                    observations = [event for event in events
                                    if event.get('event') == 'cfx_observed']
                    self.assertTrue(any(event['selector'] is None and
                                        event['hui_bits'][:2] == [1, 1] and
                                        event['selector_bits'] == [0] * 6
                                        for event in observations))
                    self.assertTrue(any(event['selector'] == 1 and
                                        event['f1_type'] == 6
                                        for event in observations))
                    self.assertTrue(any(event['selector'] == 0 and
                                        event['f1_type'] == 0
                                        for event in observations))
                    stopped = next(event for event in events
                                   if event.get('event') == 'stopped')
                    self.assertEqual(stopped['invalid'], 2)
                finally:
                    if process.poll() is None:
                        process.kill()
                        process.wait()
                    os.close(fifo_fd)

    def test_control_backpressure_keeps_snapshot_pending(self):
        with tempfile.TemporaryDirectory(prefix='az-cfx-backpressure-') as td:
            directory = Path(td)
            baseline = directory / 'baseline'
            mixer_path = directory / 'mixer'
            input_path = directory / 'input'
            fifo_path = directory / 'fifo'
            baseline.write_bytes(packet())
            os.mkfifo(fifo_path)
            fifo_fd = os.open(fifo_path, os.O_RDWR | os.O_NONBLOCK)
            with socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as mixer, \
                    socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as filler, \
                    socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM) as sender:
                mixer.bind(str(mixer_path))
                mixer.setblocking(False)
                filler.connect(str(mixer_path))
                filler.setblocking(False)
                filled = 0
                while filled < 4096:
                    try:
                        filler.send(b'x')
                    except BlockingIOError:
                        break
                    filled += 1
                self.assertGreater(filled, 0)
                self.assertLess(filled, 4096, 'Could not saturate Unix datagram queue')

                process = subprocess.Popen([
                    'python3', str(ROOT / 'run_rx_feedback.py'),
                    str(baseline), str(mixer_path), str(input_path), str(fifo_path),
                    '--mode', 'tap', '--seconds', '5',
                    '--cfx-selector-map', '1:6,2:5,3:4,4:3,5:2,6:1',
                    '--cfx-parameter', '.25',
                ], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

                def wait_frame(expected):
                    ready = select.select([fifo_fd], [], [], 1)[0]
                    self.assertEqual(ready, [fifo_fd])
                    self.assertEqual(os.read(fifo_fd, 128), expected)

                try:
                    deadline = time.monotonic() + 3
                    while not input_path.exists():
                        self.assertIsNone(process.poll())
                        self.assertLess(time.monotonic(), deadline)
                        time.sleep(.005)
                    sender.sendto(packet(), str(input_path))
                    wait_frame(packet())
                    pressed = packet([1])
                    sender.sendto(pressed, str(input_path))
                    wait_frame(pressed)
                    time.sleep(.1)
                    self.assertIsNone(process.poll())

                    commands = []
                    deadline = time.monotonic() + 1
                    while len(commands) < 4:
                        self.assertIsNone(process.poll())
                        self.assertLess(time.monotonic(), deadline)
                        if mixer not in select.select([mixer], [], [], .02)[0]:
                            continue
                        try:
                            while True:
                                value = mixer.recv(512)
                                if value.startswith(b'F1 '):
                                    commands.append(value.decode())
                        except BlockingIOError:
                            pass
                    self.assertEqual(commands[:4], [
                        f'F1 {channel} 6 0 0.25' for channel in range(4)])

                    process.terminate()
                    stdout, stderr = process.communicate(timeout=3)
                    self.assertEqual(process.returncode, 0, stderr)
                    events = [json.loads(line) for line in stdout.splitlines()]
                    delivered = [event for event in events
                                 if event.get('event') == 'cfx_delivered']
                    self.assertGreaterEqual(len(delivered), 4)
                finally:
                    if process.poll() is None:
                        process.kill()
                        process.wait()
                    os.close(fifo_fd)


if __name__ == '__main__':
    unittest.main()
