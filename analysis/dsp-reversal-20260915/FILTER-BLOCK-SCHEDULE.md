# Sample routine 0x118142f8: counted output schedule

This review isolates store count from the unfinished double-precision recurrence. Source is the corrected private TI C674x listing. TI SPRUFE8B's [BDEC description, printed pages 159–160](https://www.ti.com/lit/ug/sprufe8b/sprufe8b.pdf) specifies that the instruction predicate is ANDed with the counter's nonnegative test, that a taken branch decrements the counter, and that five delay slots precede redirection.

## Entry and counted body

`0x11814446` sets A2=1. `0x11814456` sets A0=21. The counted body starts at `0x11814464`; the only writes to these two registers inside it are the counted branch and the conditional decrement described below.

`[A0] BDEC 0x11814464,A0` at `0x118144b4` takes the branch for A0 values 21 through 1, decrementing each time. When A0 is zero, its explicit predicate suppresses BDEC, even though zero would satisfy BDEC's internal nonnegative test. Therefore the body executes 22 times, with 21 taken back-edges.

Five subsequent execute packets occupy the branch-delay stream: NOP at `0x118144b8`, MPYDP at `0x118144bc`, MPYDP at `0x118144c0`, ADDDP at `0x118144c4`, and the parallel packet `0x118144c8–d4`. This last packet runs before every taken back-edge and before the final fallthrough.

## Output suppression and final flush

The last delay packet contains:

- `[A2] SUB A2,1,A2` at `0x118144c8`.
- `[!A2] STDW A5:A4,*A3++[1]` at `0x118144cc`.
- `[!A2] STDW B5:B4,*B0++[1]` at `0x118144d0`.

All predicates read the packet's incoming A2. The first execution suppresses both stores while changing A2 from 1 to zero. The remaining 21 executions perform one doubleword store through each pointer; neither iteration decrements zero further. After fallthrough, unconditional stores at `0x11814518` and `0x11814520` add one store through B0 and A3, respectively.

The normal path thus performs **22 doubleword stores per output pointer**, advancing each pointer by **176 bytes**. It also executes one advancing LDDW per input pointer at `0x11814484/488` on each of the 22 body executions. This does not establish aliasing, channel identity, the starting sample/history phase, or the values stored. Equal byte size to a different DMA region is not evidence that its integer samples and these double-precision elements represent the same sample count.

## Limits

This is a static count under normal control flow, not a DSP execution result. The DP arithmetic uses staggered register-pair writes and early operand-read rules that require a separate latency-aware recurrence trace. No complete filter equation, transfer function, sample rate, audio parity or controller behavior is established by this count. The [coefficient interface](STORE-LAYOUT.md) is independently documented.

The companion [persistent state map](FILTER-STATE-142F8.md) identifies cached accumulators and the input/output histories retained between blocks. Its evidence limits are separate from this store-count schedule.
