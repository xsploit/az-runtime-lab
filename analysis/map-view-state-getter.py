"""Verify pinned AZ RTTI/getter wiring using ELF virtual-address mapping."""
from pathlib import Path
import hashlib,json,struct
b=Path(__file__).resolve().parents[1];d=(b/'xdjaz/rootfs/home/root/pdj/EP147').read_bytes()
sha=hashlib.sha256(d).hexdigest()
assert sha=='736bdc9322c00e5770af459c92cace33d8680825c07f00f909f74dfc473a77a6'
o=struct.unpack_from('<Q',d,40)[0];size,n=struct.unpack_from('<HH',d,58)
sections=[struct.unpack_from('<IIQQQQIIQQ',d,o+i*size) for i in range(n)]
def at(va,size):
 for s in sections:
  if s[1]!=8 and s[3]<=va and va+size<=s[3]+s[5]:return d[s[4]+va-s[3]:s[4]+va-s[3]+size]
 raise ValueError(hex(va))
def q(va):return struct.unpack('<Q',at(va,8))[0]
def name(va):return at(va,128).split(b'\0',1)[0].decode()
assert name(q(0x29cb058))=='N3gui17ViewObjectManagerE'
assert q(0x29cb060)==0x29cae40
assert name(q(0x29cae48))=='N3gui16IViewStateGetterE'
assert q(0x29cb498)==0x29cb050
assert q(0x29cb4b0)==0x198cac0 and q(0x29cb4c8)==0x198ced0
result=dict(sha256=sha,status='static wiring verified; runtime provider identity not yet confirmed',
 interface='gui::IViewStateGetter',implementation='gui::ViewObjectManager',typeinfo='0x29cb050',vtable='0x29cb4a0',
 identity_getter='0x198cac0',flags_getter='0x198ced0',
 identity_path={'manager_offset':'0x18','nested_virtual_slot':'0x1e8','expected_concrete_getter':'0x198f468','current_object_offset':'0x150','identity_within_current_object':'0xf8','null_identity_global':'0x3bd76f0'},
 callback_candidate={'function':'0x204c7b8','provider_member':'0x48','identity_slot':'0x10','flags_slot':'0x28','returned_identity_stack_offset':'0x58','group_reduction':'identity membership OR flags mask, then1/2'},
 limitations=['Provider actual vtable must be captured before applying this layout to live memory','Identity is an opaque native value copied through230e3e0; do not assume C string','Alternate nested virtual overrides must be honored','No production bridge or universal page detector implemented'],
 runtime_attempt={'log':'page-provider-gdb.log','outcome':'Unexpected startup SIGSEGV at0x107fa5c before callback breakpoint; no provider read; cause unestablished'})
(b/'analysis/az-view-state-getter-map.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
