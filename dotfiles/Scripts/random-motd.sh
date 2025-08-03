#!/bin/bash

clear
echo mcdm | figlet -f $(ls /usr/share/figlet/fonts/*.flf | shuf -n1) | lolcat
fortune -s | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
