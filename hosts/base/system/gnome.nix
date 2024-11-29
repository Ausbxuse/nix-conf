{
  config,
  lib,
  inputs,
  options,
  pkgs,
  ...
}: let
  # mypkgs = import (builtins.fetchTarball {
  #   url = "https://github.com/NixOS/nixpkgs/archive/0c19708cf035f50d28eb4b2b8e7a79d4dc52f6bb.tar.gz"; # 46.1
  #   #url="https://github.com/NixOS/nixpkgs/archive/67b4bf1df4ae54d6866d78ccbd1ac7e8a8db8b73.tar.gz"; # 46.2
  #   sha256 = "0ngw2shvl24swam5pzhcs9hvbwrgzsbcdlhpvzqc7nfk8lc28sp3";
  # }) {system = "x86_64-linux";};
in {
  #nixpkgs.overlays = [
  #  (final: prev: {
  #    gnome = mypkgs.gnome;
  #  })
  #];

  # nixpkgs.overlays = [
  #   # GNOME 46: triple-buffering-v4-46
  #   (final: prev: {
  #     gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
  #       mutter = gnomePrev.mutter.overrideAttrs (old: {
  #         src = pkgs.fetchFromGitLab  {
  #           domain = "gitlab.gnome.org";
  #           owner = "vanvugt";
  #           repo = "mutter";
  #           rev = "triple-buffering-v4-46";
  #           hash = "sha256-fkPjB/5DPBX06t7yj0Rb3UEuu5b9mu3aS+jhH18+lpI=";
  #         };
  #       });
  #     });
  #   })
  # ];
  # nixpkgs.config.allowAliases = true;
  # DE
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.settings = {
    Theme = {
      cursorTheme = "capitaine-cursors-white";
    };
  };
  services.gnome.tracker.enable = true;
  services.gnome.sushi.enable = true;

  environment.systemPackages = with pkgs; [
    capitaine-cursors
  ];
  environment.gnome.excludePackages = with pkgs; [
    #baobab      # disk usage analyzer
    # gnome.cheese # photo booth
    cheese # photo booth
    # gnome.eog # image viewer
    eog # image viewer
    epiphany # web browser
    simple-scan # document scanner
    # gnome.totem # video player
    totem # video player
    yelp # help viewer
    evince # document viewer
    file-roller # archive manager
    geary # email client
    #seahorse # password manager
    gedit # text editor
    gnome-connections

    # these should be self explanatory
    #gnome-calculator
    #gnome-calendar
    gnome-characters # input methods have it
    gnome-clocks
    gnome-contacts
    #gnome-font-viewer
    #gnome.gnome-logs
    #gnome-maps
    gnome-music
    #gnome-photos
    #gnome-screenshot
    #gnome-system-monitor
    #gnome-weather
    #gnome-disk-utility
  ];
}
