{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../../home/zathura
    ../../../home/firefox
    ../../../home/wezterm

    ../../../home/zsh
    ../../../home/nvim
    ../../../home/tmux

    ../../../home/programs.nix

    ../../../home/gnome
    # ../../../home/hyprland
    ../../../home/fcitx5

    ../../../home/autostart
    ../../../home/applications
    ../../../home/xdg.nix
    ../../../home/themes
    ../../../home/fonts
    ../../../home/env

    ../../../home/gaming.nix
  ];

  programs.zsh.initExtra = builtins.readFile ./zshrc;
  programs.tmux.extraConfig = builtins.readFile ./tmux.conf;

  home.packages = with pkgs; [
    # Non essentials
    jupyter
    gnome-graphs
    thunderbird-bin
    brave
    discord
    spotify
    spotify-tray
    libreoffice
    texliveFull
    gimp
    # font-manager
    foliate
    obs-studio
    scrcpy
    calibre
    quickemu
    sct
    gnome-monitor-config

    stylua
    black
    isort
    nodePackages.prettier
  ];

  services.syncthing = {
    enable = true;
    # tray.enable = true;
  };

  home.pointerCursor = {
    name = "capitaine-cursors-white";
    package = pkgs.bibata-cursors;
    size = 64;
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
