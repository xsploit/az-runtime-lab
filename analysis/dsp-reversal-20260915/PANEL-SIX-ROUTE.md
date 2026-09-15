# Panel to six-route DSP selector

Static evidence joins the decoded mixer MCU to the DSP selection path. Names of the six algorithms remain unassigned; a six-button layout alone is insufficient to label Sound Color FX.

## Panel inputs and MCU selection

MCU parser `0x2730` uses state base `0x20026e78`, with `r5=base+0xc8` at `0x2748`. Panel input byte 9 is unpacked into six bytes `0x20026f46`–`0x20026f4b` at `0x2790`–`0x27be`, in bit order **1,4,0,3,5,2**. These are offsets from the parser input; outer framing is a separate transport concern.

Function `0x9ddc`, gated by helper `0x18ba4`, reads those six bytes. It updates eight-bit shift histories at base `0x20028344`: input indices 0,1,2,3,4,5 go to offsets `0xc,0x10,0x1c,0x14,0x18,0x20` respectively (`0x9dee`–`0x9e58`). The scan at `0x9e66`–`0x9e88` instead visits offsets `0xc+4*i` for i=0..5. Low two history bits equal to 1 identify a rising edge. The selected word at base+`0x24` becomes i+1, or zero when the same selected route is pressed again (`0x9e5e`, `0x9e78`–`0x9e82`). Multiple edges are processed in scan order; do not assume only one can occur.

DSP command builder `0x9f88` adds `0xa6` to its frame pointer, then loads this selected word from `0x20028368` and stores its low halfword (`0x9f9c`–`0x9fa0`). This is command halfword **83**. The frame-fill path is gated by helper `0x18bac`; it is not an unconditional write in all MCU states.

| Selected value | Panel parser byte 9 bit | DSP dispatch target |
|---|---:|---|
| 1 | 1 | `0x11806900` |
| 2 | 4 | `0x11805000` |
| 3 | 3 | `0x11808bc0` |
| 4 | 5 | `0x1181fcf0` |
| 5 | 0 | `0x11807e00` |
| 6 | 2 | `0x1181fce0` |

## DSP end of the chain

Staged command halfword 83 is at `0x11800aa6`. Reader `0x11819420` compares it with persistent word `B14[160]` (`0x11803280`) and conditionally latches the candidate at `0x11819614` amid reset/transition work. It is not an unconditional direct assignment. Dispatch routine `0x11819050` compares that persistent state against values 1..6 and calls the targets above. Zero or an unmatched value calls none of these six targets in this dispatch; that does not prove global dry bypass or absence of tail processing elsewhere.

This establishes an anonymous panel-bit -> MCU edge/selection -> DSP command -> conditional state -> algorithm-dispatch chain. Remaining work: exact guard conditions, algorithm identities, coefficient/state lifecycle, reset timing, routing and audio verification. No hardware traffic was sent and no live control mapping was changed.
