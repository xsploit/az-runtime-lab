#!/usr/bin/env python3
"""Abstract address-order check for reviewed 142f8 schedule, not DSP emulation."""
import argparse


def hazards(load_cycle, tail_cycle, output_offset):
    events = [(27*n + load_cycle, 0, "load", n) for n in range(22)]
    events += [(27*(n+1) + 26, 1, "store", n + output_offset) for n in range(21)]
    events += [(27*21 + tail_cycle, 1, "store", 21 + output_offset)]
    overwritten = set()
    bad = []
    for cycle, _, kind, index in sorted(events):
        if kind == "store":
            overwritten.add(index)
        elif index in overwritten:
            bad.append((cycle, index))
    return bad


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-offset-elements", type=int, default=0)
    args = parser.parse_args()
    for label, load, tail in [("B4-to-B6", 11, 50), ("A6-to-A8", 12, 48)]:
        bad = hazards(load, tail, args.output_offset_elements)
        print(f"{label}: overwritten-before-load={bad}")
    assert not hazards(11, 50, 0) and not hazards(12, 48, 0)
    assert hazards(11, 50, 2) and hazards(12, 48, 2)
