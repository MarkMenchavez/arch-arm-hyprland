#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/functions.sh"

yay -Sy --noconfirm --needed sddm archlinux-themes-sddm

sudo mkdir -p /etc/sddn.conf.d
sudo tee /etc/sddm.conf.d/theme.conf >/dev/null <<EOF
[Theme]
Current=archlinux-simplyblack
CursorTheme=
EOF

sudo tee /usr/share/xsessions/bash-session.desktop >/dev/null <<EOF
[Desktop Entry]
Name=Bash
Comment=Plain Bash Session
Exec=/usr/bin/bash
Type=Application
EOF

sudo systemctl disable getty@tty1
sudo systemctl enable sddm

