#!/bin/sh
# Deterministic two-deck load from a FRESH AZ launch on the SOURCE page.
# Requires --no-controller (writes the input FIFOs). PLAY toggles: send once.
# Needs /tmp/input.py (the FIFO nav helper) and analysis/send-erp-button.py.
set -u
LAB=${AZ_LAB:-$HOME/az-native-lab}; PP=$LAB:$LAB/analysis:$LAB/mixer; cd "$LAB"
erp() { sudo -n env PYTHONPATH=$PP python3 analysis/send-erp-button.py --button "$1" --group "$2" >/dev/null 2>&1; }
python3 /tmp/input.py reset
for i in 1 2 3 4 5; do python3 /tmp/input.py enter; sleep 3; done   # SOURCE -> Abstract-ALL track list
python3 /tmp/input.py load 1; sleep 5; erp play 0; sleep 3
python3 /tmp/input.py browse; sleep 3                                # WAVEFORM -> browser ('view' goes to SOURCE)
python3 /tmp/input.py rotate 1; sleep 2
python3 /tmp/input.py load 2; sleep 5; erp play 1; sleep 4
