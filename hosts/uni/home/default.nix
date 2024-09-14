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

  # Overrides
  programs.zsh.initExtra = builtins.readFile ./tui/zsh-config/zshrc;
  programs.tmux.extraConfig = builtins.readFile ./tui/tmux-config/tmux.conf;
  programs.wezterm.extraConfig = builtins.readFile ./gui/wezterm/wezterm.lua;

  home.activation.installUniStartupScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./tui/bin}/ ${config.home.homeDirectory}/.local/bin/
  '';

  # Packages
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
    #quickemu
    xsel
    ueberzugpp
  ];

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}
