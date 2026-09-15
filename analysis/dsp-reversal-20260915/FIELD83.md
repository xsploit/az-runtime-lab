# DSP command halfword 83: six-route selector

Evidence is the corrected TI listing `runtime-lab/local/dsp-review-20260915/dsp.private.asm`. DSP program addresses and typed memory accesses are used below. Persistent B14 base `0x11803000` is established at `0x1181f76c-0x1181f770`. This note does not identify host effects or MCU panel controls; the separately owned MCU trace supplies the six-button provenance.

## Command latch and guard

At the IRQ8 direct call site `0x1181ae94`, reader `0x11819420` is invoked after `0x1180e644`. It materializes command address `0x11800aa6` at `0x11819420-0x11819428` and loads an unsigned halfword there at `0x1181942c`. Relative to command base `0x11800a00`, this is **halfword 83** (`0xa6/2`). The same entry packet reads persistent B14 word index 160, absolute `0x11803280`, at `0x11819424`. The equality comparison at `0x11819432` branches to `0x118194a4` when the old state and new command differ; the equal path then tests whether the stored selector is zero (`0x11819438`) and clears or rewrites coefficient regions around `0x11819440-0x11819498`. Thus the reader is stateful and may reinitialize buffers even without a selector change.

The changed-selector path compares candidate values 1-6 at `0x118194e4-0x11819590`, clears/writes global coefficient words at `0x1183cf50` and `0x1183cf70`, and sets transition word 217 (`0x11803364`) to three at `0x11819540`. A second set of candidate tests 3/5/6 appears at `0x118195f4-0x11819610`; the loop at `0x118195dc-0x118195ec` sums four single-precision words beginning at `0x1183cf40`, followed by a floating-point comparison and branch at `0x11819608-0x1181960c`. **Only a predicate-qualified store** writes the candidate selector to state word 160 at `0x11819614`. Parallel issue and branch delay slots mean this bounded trace does not prove the exact acceptance predicate for every input value, even though the downstream selector cases are explicit. State word 162 (`0x11803288`) is set to three at `0x118195d0`, word 218 (`0x11803368`) is set at `0x1181962c`, and state word 161 (`0x11803284`) is set at `0x11819650`; these are companion transition fields, not independent effect names.

## Numeric/algorithm consumer

The main processing path loads state word 160 at `0x11819050` after its block loop. Exact-value comparisons and direct calls are visible:

| State160 value | Compare/call site | Direct destination |
| --- | --- | --- |
| 1 | `0x11819058`, call `0x11819068` | `0x11806900` |
| 2 | `0x11819074`, call `0x11819080` | `0x11805000` |
| 3 | `0x118190a4`, call `0x118190ac` | `0x11808bc0` |
| 4 | `0x118190b0`, call `0x118190b8` | `0x1181fcf0` |
| 5 | `0x1181908c`, call `0x11819094` | `0x11807e00` |
| 6 | `0x118190bc`, call `0x118190c4` | `0x1181fce0` |

The path initializes B12 to zero at `0x11819064`; each of the first three direct destinations can set it to one through its return path (`0x11819070`, `0x11819088`, `0x118190a0`). For an unmatched value, including zero, none of these six direct destinations is called. That supports an inactive/no-selected-route interpretation for zero in this **specific dispatch**, while other processing before and after remains active. It does not prove output bypass, silence, or UI behavior.

The companion state word 161 is loaded at `0x11818f8c` and compared with a caller value at `0x11818fa0`, gating the route block leading to state160 dispatch. Word 162 is loaded in numeric subpaths at `0x11819180`, `0x118191e4`, `0x1181930c`, and `0x11819380`. State word 218 is consumed at the entry of destinations `0x11805000` (`0x11805004`), `0x11806900` (`0x11806904`), `0x11807e00` (`0x11807e04`), and `0x11808bc0` (`0x11808bc4`); state word 217 is read within those algorithm families (for example `0x118058f8`, `0x11806cc0`). These fields are numeric/transition state associated with selector changes. The formulas and semantic names require the separately owned arithmetic and host traces.

## Reset and limits

Reader paths write/reset coefficient regions `0x1183cf40`, `0x1183cf50`, and `0x1183cf70` (examples `0x11819468-0x1181946e`, `0x11819514`, `0x118195e2`) depending on prior/candidate selector tests. Boot/reset listing at `0x80016318-0x800163b0` also writes B14 words 160, 161, 162, 217, and 218, but the relocation/startup context for that address family is not resolved here. An exact selector-to-coefficient table, parameter meanings, and effect names are not proven. The DSP listing does establish a six-case numeric algorithm dispatch driven by halfword 83; the MCU's independently traced six-button selection is consistent with it, not a substitute for naming those routes.
