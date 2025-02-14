# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./kernel.nix
    ./hardware-configuration.nix
    ../../modules/common/normie/system.nix
    ../../modules/nixos/hardware/rotate-sensor.nix
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];

  nixpkgs.overlays = [(import ../../overlays/mutter.nix)];
}
