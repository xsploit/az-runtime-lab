"""Sample per-component CPU on one CPU scale, for a stated interval.

Reports each component twice: %core (one busy core = 100%, the `top`
convention) and %machine (all cores = 100%). Mixing those two scales is the
usual way "45%" and "15%" end up non-comparable.
"""
import os, re, sys, time

INTERVAL = float(sys.argv[1]) if len(sys.argv) > 1 else 30.0
HZ = os.sysconf("SC_CLK_TCK")
NCPU = os.cpu_count()

WANTED = [
    ("EP147",        lambda c, a: c == "EP147"),
    ("mix-stream",   lambda c, a: c == "mix-stream"),
    ("Xvfb",         lambda c, a: c == "Xvfb"),
    ("run-az-interactive", lambda c, a: "run-az-interactive.py" in a),
    ("flx6-controls",lambda c, a: "run_pi_flx6_controls.py" in a),
    ("session.py",   lambda c, a: "pi/session.py" in a),
    ("aplay",        lambda c, a: c == "aplay"),
    ("edb_streamd",  lambda c, a: c == "edb_streamd"),
    ("irq/111-i2c",  lambda c, a: c.startswith("irq/111")),
    ("sway",         lambda c, a: c == "sway"),
]

def snapshot():
    out = {}
    for pid in os.listdir("/proc"):
        if not pid.isdigit():
            continue
        try:
            stat = open(f"/proc/{pid}/stat").read()
            comm = stat[stat.index("(") + 1:stat.rindex(")")]
            tail = stat[stat.rindex(")") + 1:].split()
            ticks = int(tail[11]) + int(tail[12])
            args = open(f"/proc/{pid}/cmdline").read().replace("\0", " ")
        except (OSError, ValueError):
            continue
        for label, match in WANTED:
            if match(comm, args):
                cur = out.setdefault(label, [0, 0])
                cur[0] += ticks
                cur[1] += 1
                break
    return out

def cpu_total():
    f = open("/proc/stat").readline().split()[1:]
    vals = [int(x) for x in f]
    idle = vals[3] + vals[4]
    return sum(vals), idle

print(f"sampling {INTERVAL:.0f}s on {NCPU} cores ...", flush=True)
a, (ta, ia) = snapshot(), cpu_total()
time.sleep(INTERVAL)
b, (tb, ib) = snapshot(), cpu_total()

busy = (tb - ta) - (ib - ia)
print(f"\n  {'component':<22}{'%core':>9}{'%machine':>11}   procs")
print(f"  {'-'*22}{'-'*9}{'-'*11}   -----")
rows = []
for label, _ in WANTED:
    if label not in b:
        continue
    delta = b[label][0] - a.get(label, [0, 0])[0]
    per_core = 100.0 * delta / HZ / INTERVAL
    rows.append((per_core, label, b[label][1]))
for per_core, label, n in sorted(rows, reverse=True):
    print(f"  {label:<22}{per_core:8.1f}%{per_core/NCPU:10.1f}%   {n}")
print(f"\n  whole machine busy: {100.0*busy/(tb-ta):.1f}%machine "
      f"({NCPU*100.0*busy/(tb-ta):.0f}%core of {NCPU*100}%core available)")
