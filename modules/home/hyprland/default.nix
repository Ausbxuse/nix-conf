{
  pkgs,
  inputs,
  config,
  ...
}: {
  # TODO: some important features from hyprpanel
  wayland.windowManager.hyprland = {
    enable = false;
    extraConfig = builtins.readFile ./hyprland.conf;
    plugins = [
      # hyprlandPlugins.hypr-dynamic-cursors
      # pkgs.hyprlandPlugins.borders-plus-plus
      pkgs.hyprlandPlugins.hyprexpo
      pkgs.hyprlandPlugins.hyprspace
    ];
  };
  home.packages = with pkgs; [
    inputs.hyprswitch.packages.x86_64-linux.default
    hyprpolkitagent
    hyprpicker
    wluma
    dunst
    waybar
    walker
    flameshot
    wl-clipboard
    playerctl
    brightnessctl
    hyprpanel
    libnotify
  ];
  # programs.gBar = {
  #   enable = true;
  #   config = {
  #     SNIIconSize = {
  #       Discord = 26;
  #       OBS = 23;
  #     };
  #     CenterTime = false;
  #     DateTimeStyle = "%a %D - %H:%M";
  #     WorkspaceSymbols = [" " " "];
  #     NetworkAdapter = "wlo1";
  #     BatteryFolder = "/sys/class/power_supply/BAT0";
  #   };
  #   extraConfig = ''

  #   '';
  # };

  programs.hyprlock.enable = true;
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 500;
          on-timeout = "hyprlock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = ["${config.xdg.dataHome}/wallpapers/1310342.jpg"];
      wallpaper = [
        "eDP-2,${config.xdg.dataHome}/wallpapers/1310342.jpg"
        "eDP-1,${config.xdg.dataHome}/wallpapers/1310342.jpg"
      ];
    };
  };
  services.wlsunset = {
    enable = true;
    sunrise = "07:00";
    sunset = "14:00";
  };
}
