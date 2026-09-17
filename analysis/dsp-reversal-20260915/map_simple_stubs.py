#!/usr/bin/env python3
"""Index simple B31 address trampolines in an explicit TI dis6x listing.

Only serial MVK/MVKH/B B31 plus NOP5 stubs are mapped. No bytes emitted.
"""
import argparse,json,re
from pathlib import Path
from group_packets import LINE

def decode(path):
 d={}
 for line in path.read_text().splitlines():
  m=LINE.match(line)
  if m:
   addr,parallel,predicate,mnemonic,operands=m.groups()
   if mnemonic!='.fphead':d[int(addr,16)]=(mnemonic,operands.strip(),predicate.strip() if predicate else None, bool(parallel))
 return d

def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('--listing',required=True,type=Path)
 p.add_argument('--output',required=True,type=Path)
 a=p.parse_args();d=decode(a.listing);stubs=[]
 for site,(mn,op,pred,parallel) in sorted(d.items()):
  if mn.startswith('MVK.') and pred is None and not parallel and (m:=re.fullmatch(r'(0x[0-9a-fA-F]+),B31',op)):
   next_=d.get(site+4);br=d.get(site+8);delay=d.get(site+12)
   if next_ and br and delay and not next_[3] and not br[3] and not delay[3] and delay[:3]==('NOP','5',None) and next_[0].startswith('MVKH.') and next_[2] is None and br[0].startswith('B.') and br[1]=='B31' and br[2] is None:
    h=re.fullmatch(r'(0x[0-9a-fA-F]+),B31',next_[1]);
    if h:
     low=int(m.group(1),16)&0xffff;high=int(h.group(1),16)&0xffff0000
     target=high|low
     callers=[f'0x{at:08x}' for at,(name,operands,_,_) in d.items() if name.startswith(('CALLP.','CALL.')) and re.match(rf'^0x{site:08x}(?:,|\s|$)',operands)]
     stubs.append({'stub':f'0x{site:08x}','branch_site':f'0x{site+8:08x}','target':f'0x{target:08x}','direct_callers':callers})
 out={'scope':'Simple serial unconditional B31 MVK/MVKH/B plus NOP5 only; no general symbolic execution or runtime calls',
      'source_listing':str(a.listing),'stub_count':len(stubs),'stubs':stubs}
 a.output.write_text(json.dumps(out,indent=2)+'\n')
 print(len(stubs), 'serial B31 stubs with NOP5 delay')
if __name__=='__main__':main()
