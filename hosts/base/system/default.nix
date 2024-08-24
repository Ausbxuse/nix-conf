# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  inputs,
  options,
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ./base
    ./gnome.nix
    ./services
    ./hardware
    ./firmware
    ./luks.nix
    ./kernel.nix
  ];

  networking.hostName = "${hostname}";
}
