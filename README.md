![](https://img.shields.io/github/license/develpudu/arch-config?label=License)
![](https://img.shields.io/github/stars/develpudu/arch-config?label=Stars)
![](https://img.shields.io/github/forks/develpudu/arch-config?label=Forks)

## Introduction
[arch-config](https://github.com/develpudu/arch-config) is a **bash script** that boostraps **Arch Linux** and configures it:
1. BTRFS bootable snapshots from GRUB
2. LUKS2 encryption
3. [ZRAM](https://fedoraproject.org/wiki/Changes/SwapOnZRAM) as swap
4. [systemd-oomd](https://fedoraproject.org/wiki/Changes/EnableSystemdOomd)
5. Autodetect VMs and provide guest tools (if available)

## How does it work?
1. Download an Arch Linux ISO from [here](https://archlinux.org/download/)
2. Flash the ISO onto an [USB Flash Drive](https://wiki.archlinux.org/index.php/USB_flash_installation_medium)
3. Boot the live environment
4. Set the keyboard layout by using `loadkeys <kblayout>`
5. Connect to the internet
6. Run either one of these (always check twice before piping internet downloaded scripts into bash):
```
Short version:
bash <(curl -sL 4k7f.short.gy/install)
```
```
Long version:
bash <(curl -s https://raw.githubusercontent.com/develpudu/arch-config/master/install.sh)
```

## Partitions layout 

The **partitions layout** is simple and it consists of only two partitions:
1. A **FAT32** partition (512MiB), mounted at `/boot/` as ESP.
2. A **LUKS2 encrypted container**, which takes the rest of the disk space, mounted at `/` as root.

| Partition Number | Label     | Size              | Mountpoint     | Filesystem              |
|------------------|-----------|-------------------|----------------|-------------------------|
| 1                | ESP       | 512 MiB           | /boot/         | FAT32                   |
| 2                | Cryptroot | Rest of the disk  | /              | BTRFS Encrypted (LUKS2) |

## BTRFS subvolumes layout

The **BTRFS subvolumes layout** follows the traditional and suggested layout used by **Snapper**, you can find it [here](https://wiki.archlinux.org/index.php/Snapper#Suggested_filesystem_layout).

| Subvolume Number | Subvolume Name | Mountpoint                    |
|------------------|----------------|-------------------------------|
| 1                | @              | /                             |
| 2                | @home          | /home                         |
| 3                | @root          | /root                         |
| 4                | @srv           | /srv                          |
| 5                | @snapshots     | /.snapshots                   |
| 6                | @var_log       | /var/log                      |
| 7                | @var_pkgs      | /var/cache/pacman/pkg         |


## Video

Arch Linux base installation.

[![asciicast](https://asciinema.org/a/444025.png)](https://asciinema.org/a/444025)

## Reference
- [easy-arch](https://github.com/classy-giraffe/easy-arch)
- [eoli3n/arch-config](https://github.com/eoli3n/arch-config)
- [alis](https://github.com/picodotdev/alis)
- [arcolinux](https://github.com/arcolinux)