import os, sys, time
pid = sys.argv[1]; interval = float(sys.argv[2])
HZ = os.sysconf("SC_CLK_TCK"); NCPU = os.cpu_count()
def snap():
    out = {}
    for t in os.listdir(f"/proc/{pid}/task"):
        try:
            s = open(f"/proc/{pid}/task/{t}/stat").read()
            tail = s[s.rindex(")") + 1:].split()
            out[t] = (int(tail[11]) + int(tail[12]),
                      open(f"/proc/{pid}/task/{t}/comm").read().strip())
        except (OSError, ValueError): pass
    return out
a = snap(); time.sleep(interval); b = snap()
rows = sorted(((b[t][0] - a[t][0], b[t][1], t) for t in b if t in a), reverse=True)
busy = [r for r in rows if r[0] > 0]
tot = sum(r[0] for r in rows)
print(f"  threads={len(b)}  used CPU in {interval:.0f}s={len(busy)}")
print(f"  EP147 total: {100.0*tot/HZ/interval:.1f} %core\n")
print(f"  {'%core':>7}  {'share':>6}  thread")
for ticks, name, t in busy[:14]:
    print(f"  {100.0*ticks/HZ/interval:6.1f}%  {100.0*ticks/tot:5.1f}%  {name}")
