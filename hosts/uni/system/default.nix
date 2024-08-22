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
    ../../base/system

    ./kernel.nix
    ./luks.nix

    ./hardware-configuration.nix

    ../../base/system/gaming.nix
    ./nvidia.nix
  ];
}
