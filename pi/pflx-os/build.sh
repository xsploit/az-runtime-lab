#!/bin/sh
# Build the mode chooser against the Pi's own Qt6. Run on the Pi.
set -eu
out=${1:-pflx-mode-menu}
here=$(dirname "$0")
g++ -O2 -std=c++17 -fPIC -o "$out" "$here/mode-menu.cpp" \
    $(pkg-config --cflags --libs Qt6Widgets)
echo "built $out"
