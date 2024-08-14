# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: {
  imports = [
    ./nix.nix
    ./packages.nix
    ./user.nix
    ./env-var.nix
    ./networking.nix
    ./locale.nix
    ./fonts.nix
  ];

  system.stateVersion = "24.05";
}
