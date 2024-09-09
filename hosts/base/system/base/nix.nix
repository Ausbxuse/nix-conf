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
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    # given the users in this list the right to specify additional substituters via:
    #    1. `nixConfig.substituters` in `flake.nix`
    #    2. command line args `--options substituters http://xxx`
    trusted-users = ["${username}"];

    substituters = [
      # cache mirror located in China
      #"https://mirror.sjtu.edu.cn/nix-channels/store"
      #"https://mirrors.ustc.edu.cn/nix-channels/store"
      #"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };
}
