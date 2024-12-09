{
  pkgs,
  modulesPath,
  lib,
  ...
}: {
  imports = [(modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")];
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["nixos"];

    substituters = [
      "https://cache.nixos.org"
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Needed for https://github.com/NixOS/nixpkgs/issues/58959
  boot.supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];

  # faster build time
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [
    tmux
    git
    just
    rsync
  ];
}
