# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  imports = [
    ./kernel.nix
    ./hardware-configuration.nix
    ../../modules/common/system/minimal-gui.nix
    ../../modules/nixos/hardware/rotate-sensor.nix
    ../../modules/nixos/vm.nix
    ../../modules/nixos/gui/gaming.nix
  ];

  nixpkgs.overlays = [(import ../../overlays/mutter.nix)];
}
