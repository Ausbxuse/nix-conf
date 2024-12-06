{pkgs, ...}: {
  imports = [
    ../../../home/gui
    ../../../home/env
    ../../../home/zsh
    ../../../home/nvim
    ../../../home/tmux
    ../../../home/programs.nix
    ../../../home/gnome
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

    stylua
    black
    isort
  ];

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}
