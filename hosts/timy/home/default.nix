{
  config,
  lib,
  pkgs,
  username,
  user-homedir,
  ...
}: {
  imports = [
    ../../base/home/gui
    ../../base/home/gnome
    ./tui
  ];

  home = {
    username = "${username}";
    homeDirectory = "${user-homedir}";
    stateVersion = "24.05";
  };

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

  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;
  # programs.home-manager.path = "$HOME/.local/src/public/nixos-conf/home";
}
