# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common/normie/system.nix
  ];
}
