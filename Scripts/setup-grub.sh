#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/functions.sh"

# Install required packages
sudo pacman -Sy --noconfirm plymouth grub-theme-vimix

# Copy theme
sudo cp -r /usr/share/grub/themes/Vimix /boot/grub/themes/

# Modify mkinitcpio.conf
MKINITCPIO_FILE="/etc/mkinitcpio.conf"
backup_original "$MKINITCPIO_FILE"

if ! grep -q 'plymouth' "$MKINITCPIO_FILE"; then
  sudo sed -i '/^HOOKS=/ s/\bsystemd\b/& plymouth/' "$MKINITCPIO_FILE"
  sudo mkinitcpio -P
fi

# Set plymouth theme
sudo plymouth-set-default-theme -R spinfinity

# Modify GRUB config
THEME_PATH="/boot/grub/themes/Vimix/theme.txt"
GFX_MODE="1920x1200x32,1152x864x32,auto"
GRUB_FILE="/etc/default/grub"

backup_original "$GRUB_FILE"

sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/c\GRUB_CMDLINE_LINUX_DEFAULT="quiet splash loglevel=3"' "$GRUB_FILE"
sudo sed -i '/^#\?GRUB_TERMINAL_OUTPUT=/c\GRUB_TERMINAL_OUTPUT=gfxterm' "$GRUB_FILE"

if grep -q '^GRUB_GFXMODE=' "$GRUB_FILE"; then
  sudo sed -i "/^GRUB_GFXMODE=/c\GRUB_GFXMODE=$GFX_MODE" "$GRUB_FILE"
else
  echo "GRUB_GFXMODE=$GFX_MODE" | sudo tee -a "$GRUB_FILE"
fi

if grep -q '^GRUB_THEME=' "$GRUB_FILE"; then
  sudo sed -i "/^GRUB_THEME=/c\GRUB_THEME=\"$THEME_PATH\"" "$GRUB_FILE"
else
  echo "GRUB_THEME=\"$THEME_PATH\"" | sudo tee -a "$GRUB_FILE"
fi

LINUX_FILE="/etc/grub.d/10_linux" 
backup_original "$LINUX_FILE"

#sudo sed -i 's|^echo[[:space:]]\+'\''\$(echo "\$message" | grub_quote)'\''|#echo    '\''$(echo "$message" | grub_quote)'\''|' "$LINUX_FILE"
sudo sed -i '/^[[:space:]]*echo[[:space:]]\+'\''\$(echo "\$message" | grub_quote)'\''/ s/^/#/' "$LINUX_FILE"


sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "[✅] Plymouth and GRUB theme configured successfully!"
