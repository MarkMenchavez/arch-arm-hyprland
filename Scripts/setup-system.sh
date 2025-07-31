#!/bin/bash

sudo systemctl mask hwclock.service
sudo systemctl enable systemd-timesyncd --now

sudo systemctl enable paccache.timer

systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now wireplumber.service

#sudo systemctl start upower.service
#sudo systemctl enable upower.service

#sudo systemctl start bluetooth.service
#sudo systemctl enable bluetooth.service

systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hyprpolkitagent.service
#systemctl --user enable --now waybar.service
systemctl --user enable --now hypridle.service

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER
newgrp docker
