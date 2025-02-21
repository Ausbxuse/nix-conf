{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../minimal.nix

    ../../../home/zathura
    ../../../home/firefox
    ../../../home/ghostty

    # ../../../home/programs.nix
    ../../../home/dev-tools.nix

    ../../../home/gnome
    # ../../../home/hyprland
    # ../../../home/fcitx5

    ../../../home/autostart
    ../../../home/applications
    ../../../home/xdg.nix
    ../../../home/themes
    ../../../home/fonts

    inputs.wallpapers.homeManagerModules.wallpaper
    inputs.stardict.homeManagerModules.stardict
  ];
  nixpkgs.config.allowUnfree = true;

  programs.zsh.initExtra = builtins.readFile ./zshrc;
  programs.tmux.extraConfig = builtins.readFile ./tmux.conf;

  home.pointerCursor = {
    name = "capitaine-cursors-white";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    x11.defaultCursor = "capitaine-cursors-white";
  };

  # gtk = {
  #   enable = true;
  #   cursorTheme.name = "capitaine-cursors-white";
  #   cursorTheme.size = 32;
  # };
}
