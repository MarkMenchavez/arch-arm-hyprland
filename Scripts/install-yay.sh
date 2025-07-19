#!/bin/bash

#Synchronize local package database with remote repositories
sudo pacman -Sy

#Install dependencies
sudo pacman -S --needed base-devel git

#Clone yay repository
cd /tmp
git clone https://aur.archlinux.org/yay.git

#Build and install yay using makepkg
cd yay
makepkg -si

