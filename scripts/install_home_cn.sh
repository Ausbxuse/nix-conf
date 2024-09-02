#!/usr/bin/env bash

# Installation script for nixos
# NOTE: must be linux-x86_64 with UEFI

sh <(curl https://mirrors.tuna.tsinghua.edu.cn/nix/latest/install) --no-daemon --no-channel-add
source ~/.nix-profile/etc/profile.d/nix.sh
mkdir -p ~/.config/nix && echo 'substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://cache.nixos.org/' >~/.config/nix/nix.conf
echo 'extra-experimental-features = nix-command flakes' >>~/.config/nix/nix.conf
nix run nixpkgs#home-manager -- --option substituters "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" switch --flake
