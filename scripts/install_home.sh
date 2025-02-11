#!/usr/bin/env bash


sed -i \
  -e "s/username = \"[^\"]*\";/username = \"$(whoami)\";/g" \
  -e "s|user-homedir = \"/home/[^\"]*\";|user-homedir = \"$(echo $HOME)\";|g" \
  -e "s/hostname = \"[^\"]*\";/hostname = \"$(hostname)\";/g" \
  ./flake.nix
mkdir -p ~/.config/nix && echo 'extra-experimental-features = nix-command flakes' >>~/.config/nix/nix.conf
nix run nixpkgs#home-manager -- switch --flake .#earthy
