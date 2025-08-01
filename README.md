# arch-arm-hyprland  
---
[x] Download Installation Media
https://archboot.com  
archboot-2025.06.29-02.28-6.15.3-3-aarch64-ARCH-local-aarch64.iso  

[x] Create a new Virtual Machine  
Type 2 Hypervisor: VMWare Fusion 13.6 @ M1  
Operating System: Other 64-bit ARM  
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
            * File System: btrfs
            * ROOT: 40960
            * HOME: Remaining
    2. Install Packages
    3. Configure System
        * Root Password
        * Text Editor: nano
        * MKINITCPIO: systemd
        * User Configuration
            * Default Shell: bash
            * Create User Account
            * Enable as Administrator and part of wheel
            * Enter Full Name
            * User Password
        * System Hostname
    4. Install Boot Loader
        * GRUB_UEFI
    5. Reboot 


[x] Allow members of the group wheel to execute any command
```
nano /etc/pacman.d/mirrorlist   # Uncomment Singapore Mirror
pacman -Syu                     # Full system upgrade
pacman -S sudo                  # Execute a command as the super user 
export EDITOR=nano  
sudo visudo                     # Uncomment %wheel ALL=(ALL:ALL) ALL
```

[x] Configure pacman
```
nano /etc/pacman.conf            

#Enable the following options
Color
VerbosePkgLists
ILoveCandy
```

[ ] Disable root


[x] Execute Scripts
```
./Scripts/install-yay.sh

./Scripts/install-{package-lst}.sh
```
