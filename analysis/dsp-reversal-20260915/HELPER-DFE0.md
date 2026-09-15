# 0x1180dfe0: stateful scalar generator interface

The [incoming-edge review](INDIRECT-PROVENANCE.md) connects this routine to six calls through stub `0x80013f60`, including the shared Beat cases8/9 body. The corrected C674x listing establishes the following local interface without assigning an effect name.

| Entry register | Local role | Evidence |
|---|---|---|
| A4 | advancing output word pointer | saved to A5 in the entry packet, then B6 at `0x1180e002`; `STW B3,*B6++[1]` at `0x1180e0a0` |
| B8 | pointer to signed halfword direction/mode | parallel move to A4 at `0x1180dfe2`; LDH at `0x1180dfe4`; subsequent STH and LDH use this pointer |
| B4 | pointer to persistent binary32 scalar word | conditional loads and writes at `0x1180e004`, `0x1180e040/044`, `0x1180e04c`, `0x1180e094/098` |
| A6 | pointer to binary32 step word | moved to B5 at `0x1180dff0`; loads at `0x1180e008/048` |
| B6 | scalar threshold | copied to B16 at `0x1180dfee`; comparisons at `0x1180e024/028` |
| A8 | scalar used by the other reflection path | copied to B17 at `0x1180dfe8`; doubled at `0x1180e070` |

The entry packet's A4-to-A5 move reads the original output pointer while its parallel B8-to-A4 move installs the mode pointer. Treating them as serial assignments would lose the output pointer. B6 is similarly saved before being repurposed for output.

For mode zero, the visible scalar path adds the current value and step with ADDSP, compares the result against the B16 threshold, and conditionally reflects it using `SUBSP(round_sp(B16+B16), result)`. For nonzero mode, it subtracts the step, compares against zero, and conditionally uses `SUBSP(round_sp(B17+B17), result)`. Threshold crossing writes direction values 1 or 0 into the halfword state. The exact per-iteration state/output equations are under packet and load-latency review; these descriptions are operation traces, not an approved scalar replacement.

The loop starts with A0=21 and uses `[A0] BDEC` at `0x1180e084`. Output stores occur in its delay stream. The nearby LDH at `0x1180e090` must not be treated as updating A2 immediately for the store predicate at `0x1180e094`; C674x load latency matters. No timing units, signal identity, NaN handling, complete recurrence, or audio parity is established here.
