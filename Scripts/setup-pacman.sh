#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/functions.sh"

PACMAN_FILE="/etc/pacman.conf"
MIRROR_FILE="/etc/pacman.d/mirrorlist"

# Backup pacman.conf
backup_original "$PACMAN_FILE"

# Enable colored output
sudo sed -i 's/^#Color/Color/' "$PACMAN_FILE"

# Add ILoveCandy if not present
if ! grep -q '^ILoveCandy' "$PACMAN_FILE"; then
  sudo sed -i '/^Color/a ILoveCandy' "$PACMAN_FILE"
fi

# Enable verbose package list
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' "$PACMAN_FILE"

# Backup mirrorlist
backup_original "$MIRROR_FILE"

# Uncomment Singapore ARM mirror (if present)
sudo sed -i '/^# Server = .*sg\.mirror\.archlinuxarm\.org/ s/^# //' "$MIRROR_FILE"

# Ensure correct date and time
sudo timedatectl set-timezone Asia/Singapore
sudo timedatectl set-ntp true
sudo systemctl enable --now systemd-timesyncd
sudo hwclock --systohc

# Install pacman-contrib (contains paccache)
sudo pacman -Sy --noconfirm --needed pacman-contrib

# Enable automatic cache cleanup
sudo systemctl enable --now paccache.timer 
