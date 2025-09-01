# Installation

## Base system

1. [Download image](https://archlinux.org/download/) and check SHA256
2. Prepare installation medium ([USB guide](https://archlinux.org/download/))
   1. Find name of USB (device path, not partition): `ls -l /dev/disk/by-id/usb-*`
   2. Copy image (medium shoudn't be mounted at the time, make sure to copy whole path!): `dd bs=4M if=~/Downloads/archlinux-2025.03.01-x86_64.iso of=/dev/disk/by-id/usb-Kingston_DataTraveler_SE9_001A4D5F1A5CBC31A00003F0-0:0 conv=fsync oflag=direct status=progress`
3. Boot medium on target machine
   1. Open boot menu
      - Lenovo Yoga: FN+F12
   2. Load keymap: `loadkeys fi`
   3. Disable speaker modules
      - `rmmod pcspkr`
      - `rmmod snd_pcsp`
4. Connect to a wireless network
   1. Open `iwctl`
   2. List adapters: `adapter list`
   3. Turn adapter on: `adapter phy0 set-property Powered on`
   4. List devices to get station: `device list`
   5. Scan for networks: `station wlan0 scan`
   6. List networks: `station wlan0 get-networks`
   7. Connect with password: `station wlan0 connect UniFi`
   8. Ctrl+C and test with `ping 1.1.1.1`
5. Syncronize clock: `timedatectl`
6. Optionally update system, **ONLY if LUKS setup fails**
   1. Run: `pacman -Suy`
   2. If not enought space: `mount -o remount,size=4G /run/archiso/cowspace`
7. Run: `archinstall`
   1. Select a few mirrons close by, about 5-10
   2. Set locales
      1. Keyboard layout: fi
   3. Bootloader: systemd-boot
   4. Unified kernel images: false
   5. Swap: true
   6. Set correct hostname
   7. Set root password
   8. Create regular user account with sudo permissions
   9. Select profile
      1. Type: desktop
         1. Window manager: Hyprland
         2. Hardware access: polkit
      2. Graphics driver: select appropriate
      3. Greeter: ly
   10. Audio: Pipewire
   11. Kernels: linux and linux-lts
   12. Additional packages: firefox, alacritty, ansible, git
   13. Network: use NetworkManager
   14. Timezone: Europe/Helsinki
   15. NTP: true
   16. Disk configuration
       1. Best effort default
       2. Most likely just ext4
       3. Separate /home partition: false
   17. Disk encryption
       1. Set encryption password
       2. Encryption type: Luks
       3. Select partitions to encrypt
8. Reboot

## Customizations

Some manual steps are required to run automated Ansible installation.

1. Migrate existing SSH key to the new machine (only private key required)
   1. `mkdir ~/.ssh`
   2. `chmod 700 ~/.ssh`
   3. Paste private key: `vim ~/.ssh/id_rsa`
   4. `chmod 600 ~/.ssh/id_rsa`
   5. `ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub`
2. Clone this repository to `~/dotfiles`
3. Copy over config secrets folder to `./secrets`
   1. Make sure permissions are OK:
      - `chown -R ville:ville ./secrets`
      - `chmod -R 700 ./secrets`
