# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  imports = [
    ./kernel.nix
    ./hardware-configuration.nix
    ../../modules/common/normie/system.nix
    ../../modules/nixos/hardware/rotate-sensor.nix
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];
}
