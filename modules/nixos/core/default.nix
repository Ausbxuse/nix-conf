# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{...}: {
  imports = [
    ./env.nix
    ./nix.nix
    ./ssh.nix
    ./tui.nix
    ./user.nix
    ./locale.nix
    ./bootloader.nix
    ./networking.nix
  ];
  system.stateVersion = "24.05";
}
