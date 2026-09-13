"""Verified subset of AZ mixer feedback, preserving all unrelated RX fields.
Type selection: native Delay0/Echo1 only validated here. This is feedback encoding,
not the software DSP's enum (Echo5), and is not a complete BeatFxTime encoding.
"""
from az_mixer_packet import inspect,crc16

# Actual EP147 UI observations, analysis/az-beat-fraction-live.json.
# Do not infer the remaining enum from RX3's different preset table.
VERIFIED_BEAT_PRESETS={(1,16):1,(1,8):3,(1,4):5,(1,3):6,(1,2):7,(2,3):8,
                       (3,4):9,(1,1):10,(2,1):12,(4,1):14,(8,1):16,(16,1):17}

def encode_feedback(baseline,*,effect,bpm_tenths,tap,time_ms,beat_fraction=None):
 if len(baseline)!=128 or not inspect(baseline)['checksum_valid']:raise ValueError('Valid complete RX baseline required')
 if type(effect) is not int or effect not in (0,1):raise ValueError('Only verified Delay0/Echo1 supported')
 if type(bpm_tenths) is not int or not 0<=bpm_tenths<=9999:raise ValueError('BPM tenths must fit four displayed digits')
 if type(tap) is not bool:raise ValueError('Explicit TAP flag required')
 if type(time_ms) is not int or not 0<=time_ms<=32767:raise ValueError('Nonnegative signed16 time required')
 if beat_fraction is not None:
  if (type(beat_fraction) is not tuple or len(beat_fraction)!=2 or
      any(type(v) is not int for v in beat_fraction) or
      beat_fraction not in VERIFIED_BEAT_PRESETS):
   raise ValueError('Explicit verified beat fraction tuple required')
 frame=bytearray(baseline);frame[85]=(frame[85]&15)|(effect<<4);frame[84]=(frame[84]&~64)|(int(tap)<<6)
 frame[88:90]=bpm_tenths.to_bytes(2,'little');frame[90:92]=time_ms.to_bytes(2,'little',signed=True)
 if beat_fraction is not None:
  frame[86]=VERIFIED_BEAT_PRESETS[beat_fraction]
  # A preset must leave adjusted/intermediate display mode. Clear both
  # bits combined by the native bool(RX84 & 12), and its signed offset.
  frame[84]&=~12
  frame[92]=0
  # RX93 high nibble is not established: preserve it, including X-PAD state.
 frame[96:98]=crc16(frame[:96]).to_bytes(2,'little');return bytes(frame)

def encode_applied_echo(baseline,snapshot,*,tap):
 """Translate a settled Q1 Echo snapshot, not an E1 command.

 Caller owns reply freshness/session ordering and the complete RX baseline.
 TAP/AUTO is supplied explicitly: Q1 does not establish that UI mode.
 Quantized-grid tempo needs its own applied-tempo telemetry before support.
 """
 required=('version','attached','active_type','phase','delay_change_pending',
           'quantize_requested','source_bpm100','effect_beat','time_ms')
 if not isinstance(snapshot,dict) or any(type(snapshot.get(k)) is not int for k in required):
  raise ValueError('Complete integer Q1 fields required')
 if (snapshot['version']!=1 or snapshot['attached']!=1 or snapshot['active_type']!=5 or
     snapshot['phase']!=0 or snapshot['delay_change_pending']!=0 or snapshot['quantize_requested']!=0):
  raise ValueError('Settled attached nonquantized Echo required')
 bpm=snapshot['source_bpm100'];beat=snapshot['effect_beat'];ms=snapshot['time_ms']
 if not 4000<=bpm<=99994 or not 0<=beat<=9 or not 1<=ms<=4000:
  raise ValueError('Applied Echo timing outside verified feedback range')
 ratios=((1,16),(1,8),(1,4),(1,2),(3,4),(1,1),(2,1),(4,1),(8,1),(16,1))
 return encode_feedback(baseline,effect=1,bpm_tenths=(bpm+5)//10,tap=tap,
                        time_ms=ms,beat_fraction=ratios[beat])
