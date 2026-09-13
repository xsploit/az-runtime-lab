"""Local-only recorder checks. Results are not AZ or Pi performance evidence."""
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('recorder', HERE / 'record-process-session.py')
r = importlib.util.module_from_spec(spec)
spec.loader.exec_module(r)


class RecorderChecks(unittest.TestCase):
    def test_stat_with_parentheses_and_spaces(self):
        fields = ['S'] + ['0'] * 21
        for index, value in {7: 41, 9: 2, 11: 13, 12: 17, 17: 4, 19: 9876}.items():
            fields[index] = str(value)
        value = r.parse_stat('123 (a tricky ) process (name)) ' + ' '.join(fields))
        self.assertEqual(value, dict(state='S', start_ticks=9876, cpu_ticks=30,
                                     minor_faults=41, major_faults=2, threads=4))

    def test_rollup_requires_actual_pss(self):
        with self.assertRaises(ValueError):
            r.parse_rollup('0000-ffff ---p\nRss: 100 kB\nSwap: 0 kB\n')

    def test_identity_mismatch_rejected(self):
        target = r.identity(__import__('os').getpid())
        with self.assertRaisesRegex(RuntimeError, 'reused'):
            r.sample(dict(target, start_ticks=target['start_ticks'] + 1))
        with self.assertRaisesRegex(RuntimeError, 'executable changed'):
            r.sample(dict(target, exe_inode=target['exe_inode'] + 1))

    def test_completed_recording_and_existing_output(self):
        target = r.identity(__import__('os').getpid())
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'session.jsonl'
            self.assertTrue(r.collect(target, .15, .05, path))
            original = path.read_bytes()
            rows = [json.loads(line) for line in original.splitlines()]
            self.assertEqual(rows[0]['event'], 'header')
            self.assertTrue(rows[-1]['requested_duration_completed'])
            self.assertGreaterEqual(rows[-1]['sample_count'], 2)
            self.assertGreaterEqual(rows[-1]['cpu_percent_one_core'], 0)
            with self.assertRaises(FileExistsError):
                r.collect(target, .1, .05, path)
            self.assertEqual(path.read_bytes(), original)

    def test_exited_process_keeps_partial_evidence(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'session.jsonl'
            child = subprocess.Popen([sys.executable, '-c', 'import time;time.sleep(.3)'])
            try:
                target = r.identity(child.pid)
                self.assertFalse(r.collect(target, 1, .05, path))
                rows = [json.loads(line) for line in path.read_text().splitlines()]
                self.assertTrue(any(row['event'] == 'terminated' for row in rows))
                self.assertFalse(rows[-1]['requested_duration_completed'])
            finally:
                child.wait(timeout=3)


result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromTestCase(RecorderChecks))
(HERE / 'session-recorder-selftest.json').write_text(json.dumps(dict(
    scope=__doc__, tests=result.testsRun, passed=result.wasSuccessful(),
    failures=len(result.failures), errors=len(result.errors)), indent=2) + '\n')
raise SystemExit(0 if result.wasSuccessful() else 1)
