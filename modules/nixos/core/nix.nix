{
  config,
  lib,
  inputs,
  options,
  pkgs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    glibc
    glib
    libGL
    zlib
    fontconfig
    xorg.libX11
    libxkbcommon
    freetype
    dbus
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    # given the users in this list the right to specify additional substituters via:
    #    1. `nixConfig.substituters` in `flake.nix`
    #    2. command line args `--options substituters http://xxx`
    trusted-users = ["${username}"];

    substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://cache.nixos.org"
      "https://ausbxuse.cachix.org"
      "https://wezterm.cachix.org"
      # cache mirror located in China
      #"https://mirror.sjtu.edu.cn/nix-channels/store"
      #"https://mirrors.ustc.edu.cn/nix-channels/store"
      #"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      # "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
    ];
  };
}
