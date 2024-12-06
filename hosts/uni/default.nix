# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/normie/system.nix
    ../../modules/nixos/hardware/nvidia.nix
  ];

  environment.systemPackages = with pkgs; [
    sof-firmware
  ];
}
