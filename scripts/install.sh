#!/usr/bin/env bash

set -e

boot_size="512MiB"
swap_size="512MiB"
disk_dev="/dev/sda"
disk_percent_space_for_os=100
host="spacy"

if [ $disk_dev == "/dev/nvme0n1" ] || [ $disk_dev == "/dev/nvme1n1" ]; then
  part_boot="${disk_dev}p1"
  part_root="${disk_dev}p2"
else
  part_boot="${disk_dev}1"
  part_root="${disk_dev}2"
fi

echo ""
echo "####################################"
echo "########### Confirmation ###########"
echo "####################################"
echo ""
lsblk
echo "${disk_percent_space_for_os}% of $disk_dev will be used for installing NixOS"
echo "Are you sure you want to preceed? [y/N] "
read ans
if [ $ans != "y" ]; then
  echo "aborted, exiting..."
  exit 4
fi

#####################################
#### partitioning and formatting ####
#####################################

parted ${disk_dev} -- mklabel gpt
parted ${disk_dev} -- mkpart ESP fat32 1MiB $boot_size # make boot partition first
parted ${disk_dev} -- set 1 boot on
parted ${disk_dev} -- mkpart primary $boot_size "${disk_percent_space_for_os}%" # allocate remaining size
cryptsetup luksFormat ${part_root}
cryptsetup luksOpen ${part_root} crypted

pvcreate /dev/mapper/crypted
vgcreate vg /dev/mapper/crypted
lvcreate -L $swap_size -n swap vg  # allocate swap with size=$swap_size
lvcreate -l '100%FREE' -n nixos vg # allocate remaining space for nixos root

mkfs.fat -F 32 -n boot ${part_boot}
mkfs.ext4 -L nixos /dev/vg/nixos
mkswap -L swap /dev/vg/swap
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon /dev/vg/swap

#####################################
########### Install Nixos ###########
#####################################

nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/${host}/hardware-configuration.nix
cd /mnt && nixos-install
