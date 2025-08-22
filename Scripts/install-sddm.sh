#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/functions.sh"

yay -Sy --noconfirm --needed sddm xorg-server xorg-xinit xterm archlinux-themes-sddm

sudo mkdir -p /etc/sddm.conf.d
sudo tee /etc/sddm.conf.d/theme.conf >/dev/null <<EOF
[Theme]
Current=archlinux-simplyblack
CursorTheme=
EOF

sudo mkdir -p /etc/share/xsessions
sudo tee /usr/share/xsessions/terminal-session.desktop >/dev/null <<EOF
[Desktop Entry]
Name=Terminal
Comment=Minimal Terminal  Session
Exec=xterm
Type=Application
EOF

sudo systemctl disable getty@tty1
sudo systemctl enable sddm

