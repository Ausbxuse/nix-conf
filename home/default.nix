{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./core
    ./gui
    ./games.nix
    ./xdg.nix
  ];

  home = {
    username = "zhenyu";
    homeDirectory = "/home/zhenyu";

    stateVersion = "23.11";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
      fcitx5-chinese-addons
      librime
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # programs.home-manager.path = "$HOME/.local/src/public/nixos-conf/home";
}
