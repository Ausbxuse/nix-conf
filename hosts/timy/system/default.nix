# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  imports = [
    ../../base/system

    ./kernel.nix

    ./hardware-configuration.nix

    ../../base/system/gaming.nix
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];
}
