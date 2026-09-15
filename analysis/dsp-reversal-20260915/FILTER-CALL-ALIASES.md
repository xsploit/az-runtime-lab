# Filter call buffer relationships

Source: corrected private TI C674x listing. The sample routine `0x118142f8` uses entry A6 and B4 as its two advancing input bases, and entry A8 and B6 as the corresponding output bases. These roles follow its entry copies and pointer setup at `0x1181444c–460`; output count is separately reviewed in [FILTER-BLOCK-SCHEDULE.md](FILTER-BLOCK-SCHEDULE.md).

Three successive call sites in the route3 region have these argument relationships:

| Call site | Input A6 | Output A8 | Input B4 | Output B6 | Proven local relationship |
|---|---|---|---|---|---|
| `0x118092b0` | A15 | A15 | B12 | B12 | Each input shares its corresponding output base |
| `0x118092d0` | A15 | A14 | B12 | B11 | Different source registers; address equality not established |
| `0x118092f0` | A14 | A14 | B11 | B11 | Each input shares its corresponding output base |

The second row must not be described as an in-place pass merely because it sits between two in-place calls. Its exact pointer values and overlapping ranges require upstream provenance. Nor does different register identity prove non-overlapping memory.

At the first listed call, A6/A8 are assigned at `0x118092aa/ac` and B6/B4 at `0x118092a2/a8`. At the middle call the corresponding assignments are `0x118092ca/cc` and `0x118092c2/c8`; at the last call, `0x118092ea/ec` and `0x118092e2/e8`. Parallel moves in each call packet use their incoming source values.

The symbolic recurrence model must represent values loaded before writes overwrite an aliased buffer. Treating all input nodes as independent immutable source buffers is insufficient as a general alias model. The normal same-base schedule can be checked using the reviewed advancing load/store sequence; arbitrary cross-lane or offset overlap remains a separate question. No physical channel names or audio equivalence are established here.

## Exact same-base ordering check

The reviewed core advances input loads at relative cycles11 and12 of each27-cycle body. Output element n is stored at cycle26 of body n+1 for n=0..20; element21 is flushed in the tail. Thus each input element is loaded before its corresponding same-address overwrite. This establishes a block-local same-lane ordering property for the two proven same-base calls, assuming state/coefficient memory and the other lane do not introduce additional overlap.

[check_filter_alias_schedule.py](check_filter_alias_schedule.py) independently exercises this abstract address/event schedule. Both same-base streams report no overwritten-before-load element. Shifting the output base forward by two doubleword elements produces overwritten-before-load hazards, demonstrating why the conclusion cannot be generalized to arbitrary overlapping pointers. This is an address-order probe using reviewed fixed timings, not a DSP instruction simulator, numeric test or proof of all caller memory ranges. Prologue/history and cross-block state remain separate validation requirements.
