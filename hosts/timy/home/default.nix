{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../base/home
    ./gui/dconf.nix
  ];

  #### Extra configs
  programs.zsh.initExtra = builtins.readFile ./tui/zsh-config/zshrc;
  programs.tmux.extraConfig = builtins.readFile ../../base/home/tui/tmux.conf + "\n" + builtins.readFile ./tui/tmux-config/tmux.conf;

  home.activation.installTimyScripts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tui/bin}/ ${config.home.homeDirectory}/.local/bin/
  '';

  #### packages
  home.packages = with pkgs; [
    # Non essentials
    jupyter
    gnome-graphs
    thunderbird-bin
    brave
    #discord
    spotify
    spotify-tray
    libreoffice
    texliveFull
    # osu-lazer-bin
    gimp
    # font-manager
    foliate
    obs-studio
    scrcpy
    xournalpp
    calibre
    quickemu
    sct

    stylua
    black
    isort
  ];

  #### Services
  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}
