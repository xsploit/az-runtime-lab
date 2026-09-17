#!/bin/sh
# Install the PiFLX mode chooser. Run on the Pi, as a user with sudo.
#
# Every replaced file is backed up next to its installed copy first, and
# uninstall.sh puts them back. The boot path is the risky part of this change:
# start-pflx-kiosk falls back to BiteDJ whenever the chooser is missing or
# fails, so a broken menu still boots to a working DJ application.
set -eu

here=$(cd "$(dirname "$0")" && pwd)
stamp=$(date -u +%Y%m%dT%H%M%SZ)
backup=/usr/local/share/pflx-mode-menu-backup-$stamp
bin=/usr/local/bin

command -v pkg-config >/dev/null || { echo "install pkg-config" >&2; exit 1; }
pkg-config --exists Qt6Widgets || { echo "install qt6-base-dev" >&2; exit 1; }

echo "building the chooser"
menu=$(mktemp -d)/pflx-mode-menu
sh "$here/build.sh" "$menu"

echo "backing up replaced files to $backup"
sudo mkdir -p "$backup"
for name in start-pflx-kiosk pflx-bitedj-supervisor; do
    [ -e "$bin/$name" ] && sudo cp -p "$bin/$name" "$backup/$name"
done

echo "installing"
sudo install -m 0755 "$menu" "$bin/pflx-mode-menu"
sudo install -m 0755 "$here/pflx-az-session" "$bin/pflx-az-session"
sudo install -m 0755 "$here/pflx-bitedj-supervisor" "$bin/pflx-bitedj-supervisor"
sudo install -m 0755 "$here/start-pflx-kiosk" "$bin/start-pflx-kiosk"

cat <<EOF

installed. rollback:
  sudo cp -p $backup/* $bin/

The chooser appears on the next session restart:
  sudo systemctl restart pflx-session
That ends whatever is currently playing. Check no one is using the device first.
EOF
