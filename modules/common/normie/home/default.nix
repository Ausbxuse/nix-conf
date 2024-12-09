{pkgs, ...}: {
  imports = [
    ../../../home/zathura
    ../../../home/firefox
    ../../../home/wezterm

    ../../../home/zsh
    ../../../home/nvim-minimal
    ../../../home/tmux

    ../../../home/stardict
    ../../../home/programs.nix

    ../../../home/gnome
    ../../../home/hyprland
    ../../../home/fcitx5

    ../../../home/autostart
    ../../../home/applications
    ../../../home/xdg.nix
    ../../../home/themes
    ../../../home/fonts
    ../../../home/wallpapers
    ../../../home/env

    ../../../home/gaming.nix
  ];

  programs.zsh.initExtra = builtins.readFile ./zshrc;
  programs.tmux.extraConfig = builtins.readFile ../../../home/tmux/tmux.conf + "\n" + builtins.readFile ./tmux.conf;

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
  ];

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}
