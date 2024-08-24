{
  config,
  lib,
  pkgs,
  username,
  user-homedir,
  ...
}: {
  imports = [
    ../../base/home
  ];

  # Overrides
  programs.zsh.initExtra = builtins.readFile ./tui/zsh-config/zshrc;
  programs.tmux.extraConfig = builtins.readFile ./tui/tmux-config/tmux.conf;

  home.activation.installTimyScripts = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tui/bin}/ ${config.home.homeDirectory}/.local/bin/
  '';

  # packages
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
    wl-clipboard
    scrcpy
    xournalpp
    calibre
    quickemu
  ];

  # Services
  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}
