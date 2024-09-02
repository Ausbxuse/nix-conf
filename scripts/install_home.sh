#!/usr/bin/env bash

mkdir -p ~/.config/nix && echo 'extra-experimental-features = nix-command flakes' >>~/.config/nix/nix.conf
nix run nixpkgs#home-manager -- switch --flake .#earthy
