{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["nixos"];

    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
  };

  # faster build time
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
  networking.networkmanager.enable = true;
  environment.systemPackages = with pkgs; [
    tmux
    git
    just
    rsync
    curl
    wget
  ];
}
