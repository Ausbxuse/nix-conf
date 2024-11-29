{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./dconf.nix
  ];

  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})

    pomodoro
    dconf-editor
    gnome-tweaks
    gnome-shell-extensions
    networkmanager-openvpn
    gnome-extension-manager
    gnomeExtensions.astra-monitor
    gnomeExtensions.colortint
    gnomeExtensions.wallpaper-slideshow
    #gnomeExtensions.open-bar
    gnomeExtensions.media-controls
    gnomeExtensions.gnome-bedtime
    gnomeExtensions.night-light-slider-updated
    gnomeExtensions.hide-cursor
    gnomeExtensions.unite
    gnomeExtensions.blur-my-shell
    gnomeExtensions.forge
    # gnomeExtensions.rounded-window-corners
    gnomeExtensions.kimpanel
    #gnomeExtensions.system-monitor-next
    #gnomeExtensions.net-speed-simplified
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
    #gnomeExtensions.paperwm
    #gnomeExtensions.cronomix
    gnomeExtensions.coverflow-alt-tab
    gnomeExtensions.color-picker
    gnomeExtensions.bluetooth-battery-meter
    gnomeExtensions.just-perfection
    # gnomeExtensions.openweather # incompatible
    gnomeExtensions.status-area-horizontal-spacing
    #gnomeExtensions.dash-to-dock
    #gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.no-overview
    #gnome.cheese
    amberol
    powertop
    xiccd
    moreutils
    plasma5Packages.kdeconnect-kde
    plots
    mpv
    imv
  ];

  #home.activation.installDconf = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #  ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./dconf}/ ${config.xdg.configHome}/dconf/
  #'';
}
