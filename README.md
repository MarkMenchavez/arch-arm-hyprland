# arch-arm-hyprland  
---
[x] Download Installation Media
https://archboot.com  
archboot-2025.06.29-02.28-6.15.3-3-aarch64-ARCH-local-aarch64.iso  

[x] Create new Virtual Machine  
Type 2 Hypervisor: VMWare Fusion 13.6 @ M1
Operating System: Other 64-bit Arm  
Settings:
* 4 Processor Cores  
* 8192 MB Memory  
* Accelerated 3D Graphics 8192 MB
* Full Resolution Retina Display
* Bridged Networking: Autodetect
* 80 GB Hard Disk NVMe
* Keyboard MAC Profile - Disabled Host Shortcuts

[x] Setup Arch
* Locale: en_US
* Use Offline Mode
* Timezone: Asia/Singapore
* Set Current Local Date and Time
* Launch ArchBoot Setup
    1. Prepare Storage Device: 
        * Quick Setup
            * PARTUUID
            * Single Boot
            * BOOT: 512
            * SWAP: 8192
            * File System: BTRFS
            * ROOT: 40960
            * HOME: Remaining
    2. Install Packages
    3. Configure System
        * Root Password
        * Text Editor: NANO
        * MKINITCPIO: SYSTEMD
        * User Configuration
            * Default Shell: BASH
            * Create User Account
            * Enable as Admistrator and part of WHEEL
            * Enter Full Name
            * User Password
        * System Hostname
    4. Install Boot Loader
        * GRUB_UEFI
    5. Reboot 

[x] Enable Repository Mirrors
```
nano /etc/pacman.d/mirrorlist   # Uncomment Singapore Mirror
```

[x] Install sudo
```
pacman -Syu                     # Full system upgrade
pacman -S sudo                  # Install sudo
```

[x] Allow members of group wheel execute any command  
```
export EDITOR=nano  
sudo visudo  
```

[x] Install AUR helper
```
sudo pacman -S --needed git base-devel  
cd /tmp  
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si  
```

[x] Instal packages
```
yay -S fastfetch cowsay lolcat figlet fortune-mod  # fun terminal utilities
yay -S cmatrix cbonsai asciiquarium                # ascii art
```

[x] Modify .bashrc
```
alias reload='clear && source ~/.bashrc'
alias update='sudo pacman -Syu'

fastfetch
echo mcdm | figlet | lolcat
fortune -s | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat
```

[x] Configure Standard Directories
```
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update
```

[x] Auto clearn old packages
```
sudo pacman -S pacman-contrib
sudo systemctl enable paccache.timer
```

[x] Install packages
```
sudo pacman -S speedtest-cli        # Test Internet bandwidth 
sudo pacman -S gping                # Graphical ping
sudo pacman -S htop                 # Display real-time info of running processes
sudo pacman -S duf                  # Display disk usage
sudo pacman -S lsd                  # List directory contents; Consider alias to ls 
sudo pacman -S tldr                 # Display simple help pages
sudo pacman -S fzf                  # Fuzzy finder
sudo pacman -S bat                  # Print and concatenate files; Consider alias to cat
sudo pacman -S ranger               # Console file manager
```

[x] Install Hyprland
```
sudo pacman -S hyprland
sudo pacman -S foot 
sudo pacman -S aquamarine hyprlang hyprcursor hyprutils hyprgraphics xdg-desktop-portal-hyprland
```

[x] Beautify shell prompt
```
sudo pacman -S nerd-fonts           # TODO: Too many nerd-fonts
sudo pacman -S starship             # Customize Shell Prompt

starship preset tokyo-night -o ~./config/starship.toml

nano .bashrc
if [ "$XDG_SESSION_TYPE" = "Wayland" ]; then
  eval "$(starship init bash)"
fi
```


