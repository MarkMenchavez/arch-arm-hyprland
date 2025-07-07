# arch-arm-hyprland

https://archboot.com
archboot-2025.06.29-02.28-6.15.3-3-aarch64-ARCH-local-aarch64.iso

VMWare Fusion 13 M1
Other 64-bit Arm

4 Processor Cores
8192 MB Memory
Accelerated 3D Graphics 8192 MB
Full Resolution Retina Display
Bridged Networking: Auto
80 GB Hard Disk NVMe
Keyboard MAC Profile - Disabled Shortcuts

Configure Pacman Mirrors
/etc/pacman.d/mirrorList

Edit sudoers to make group wheel execute any command
export EDITOR=nano
sudo visudo

Full System Upgrade
sudo pacman -Syu 

Install Packages
sudo pacman -S fastfetch cowsay lolcat figlet fortune-mod speedtest-cli htop cmatix git base-devel



