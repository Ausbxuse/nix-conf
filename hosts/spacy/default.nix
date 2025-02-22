# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./disk.nix
    ./hardware-configuration.nix
    ../../modules/common/system/minimal-gui.nix
  ];
}
