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
    slurp
    grim
    wl-clipboard
    playerctl
    brightnessctl
    hyprpanel
    libnotify
    jq
  ];
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
