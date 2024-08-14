{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})

    gnome.pomodoro
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome.gnome-shell-extensions
    gnome.networkmanager-openvpn
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
    gnomeExtensions.rounded-window-corners
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
    kdeconnect
    plots
    mpv
    imv
  ];

  home.activation.installDconf = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./dconf}/ ${config.xdg.configHome}/dconf/
  '';
}
