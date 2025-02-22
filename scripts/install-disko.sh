#!/usr/bin/env bash

set -e

read -r pw
git clone https://github.com/ausbxuse/nix-conf --depth 1 -b dev
lsblk # sort out the most probable disk (fzf?)
echo -n "$pw" > /tmp/secret.key
sudo disko --mode destroy,format,mount ./hosts/spacy/disk.nix
sudo nixos-generate-config --no-filesystems --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/spacy/
nixos-install --root /mnt --flake .#spacy
