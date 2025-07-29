#!/bin/bash

clear
echo mcdm | figlet | lolcat
fortune -s | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
