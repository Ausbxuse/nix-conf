{
  pkgs,
  inputs,
  config,
  ...
}: {
  # TODO: some important features from hyprpanel
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
    plugins = [
    ];
  };
  home.packages = with pkgs; [
    (inputs.ags.packages.x86_64-linux.default.override {
      extraPackages = [
        inputs.ags.packages.x86_64-linux.battery
        inputs.ags.packages.x86_64-linux.network
        inputs.ags.packages.x86_64-linux.hyprland
        inputs.ags.packages.x86_64-linux.greet
        inputs.ags.packages.x86_64-linux.bluetooth
        inputs.ags.packages.x86_64-linux.auth
        inputs.ags.packages.x86_64-linux.mpris
        inputs.ags.packages.x86_64-linux.wireplumber
        inputs.ags.packages.x86_64-linux.tray
        # cherry pick packages
      ];
    })
    rofi-wayland-unwrapped
    rofi-vpn
    rofi-calc
    rofi-file-browser
    pinentry-rofi
    rofi-bluetooth
    inputs.hyprswitch.packages.x86_64-linux.default
    hyprpolkitagent
    hyprpicker
    wluma
    dunst
    waybar
    slurp
    grim
    wl-clipboard
    playerctl
    brightnessctl
    hyprpanel
    libnotify
    jq
    pomodoro-gtk
    bluetui
  ];
  programs.hyprlock.enable = true;
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        # after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 120;
          on-timeout = "brightnessctl -d intel_backlight -s set 10 ";
          on-resume = "brightnessctl -d intel_backlight -r ";
        }
        {
          timeout = 180;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 240;
          on-timeout = "systemctl suspend";
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
