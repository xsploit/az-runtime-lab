import sys, re
pid = sys.argv[1]
regions = []; cur = None
for line in open(f"/proc/{pid}/smaps"):
    m = re.match(r"^([0-9a-f]+)-([0-9a-f]+) (\S+) \S+ \S+ \S+\s*(.*)$", line)
    if m:
        cur = {"size": int(m.group(2),16)-int(m.group(1),16), "perm": m.group(3),
               "name": m.group(4) or "[anon]", "rss": 0}
        regions.append(cur)
    elif line.startswith("Rss:") and cur is not None:
        cur["rss"] = int(line.split()[1])
regions.sort(key=lambda r: -r["rss"])
total = sum(r["rss"] for r in regions)
anon = sum(r["rss"] for r in regions if r["name"] == "[anon]")
print(f"  total RSS {total/1024:.0f} MB across {len(regions)} mappings")
print(f"  anonymous (heap/pools/thread stacks): {anon/1024:.0f} MB")
print(f"  {'RSS MB':>8} {'VIRT MB':>9}  perm  name")
for r in regions[:12]:
    print(f"  {r['rss']/1024:8.1f} {r['size']/1048576:9.1f}  {r['perm']}  {r['name'][:46]}")
