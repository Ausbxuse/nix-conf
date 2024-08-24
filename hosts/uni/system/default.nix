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
    ../../base/system/gaming.nix

    ./hardware-configuration.nix

    ./nvidia.nix
  ];
}
