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
    ./hardware-configuration.nix
  ];
}
