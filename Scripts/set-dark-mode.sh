#!/bin/bash

# Set GTK to dark theme
#gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
#gsettings set org.gnome.desktop.interface icon-theme "Adwaita-dark"
#gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set Qt to dark theme
#QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_QPA_PLATFORMTHEME
#qt5ct # Launch qt5ct GUI for theme settings if needed (optional)

# Apply dark icons for Wayland compositors (use a dark icon pack)
# Assuming you have a dark icon theme installed like Papirus-Dark or Adwaita-Dark

#echo "🌙 Dark mode set for Hyprland, GTK, and Qt apps."
