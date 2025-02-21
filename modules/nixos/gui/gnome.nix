{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.settings = {
    Theme = {
      cursorTheme = "capitaine-cursors-white";
    };
  };
  services.xserver.libinput.enable = true;
  # TODO: separate hyprland
  # programs.hyprland.enable = true;
  # programs.iio-hyprland.enable = true;

  services.gnome.tinysparql.enable = true;
  # services.gnome.tracker.enable = true;
  services.gnome.sushi.enable = true;

  environment.systemPackages = with pkgs; [
    capitaine-cursors
    xsel
  ];
  environment.gnome.excludePackages = with pkgs; [
    mutter
    baobab # disk usage analyzer
    cheese # photo booth
    eog # image viewer
    epiphany # web browser
    simple-scan # document scanner
    totem # video player
    yelp # help viewer
    evince # document viewer
    file-roller # archive manager
    geary # email client
    seahorse # password manager
    gedit # text editor
    gnome-connections

    # these should be self explanatory
    gnome-calculator
    gnome-calendar
    gnome-characters # input methods have it
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-photos
    # gnome-screenshot
    gnome-system-monitor
    gnome-weather
    gnome-disk-utility
  ];

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts-emoji-blob-bin
      source-han-sans
      wqy_zenhei # Need by steam for Chinese
    ];
  };

  services.interception-tools = {
    enable = true;
    plugins = [
      pkgs.interception-tools-plugins.dual-function-keys
    ];
    udevmonConfig = ''
      - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE \
               | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c /etc/dual-function-keys.yaml \
               | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK]
    '';
  };

  environment.etc."dual-function-keys.yaml".text = ''
    MAPPINGS:
      - KEY: KEY_CAPSLOCK
        TAP: KEY_ESC
        HOLD: KEY_LEFTCTRL
  '';
}
