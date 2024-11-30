{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../base/home
    ./dconf.nix
  ];

  # Overrides
  programs.zsh.initExtra = builtins.readFile ./zshrc;
  programs.tmux.extraConfig = builtins.readFile ../../base/home/tui/tmux.conf + "\n" + builtins.readFile ./tmux.conf;

  home.activation.installUniStartupScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
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
