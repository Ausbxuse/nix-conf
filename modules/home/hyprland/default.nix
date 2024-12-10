{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.gBar.homeManagerModules.x86_64-linux.default];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
    # plugins = with pkgs; [
    # hyprlandPlugins.hypr-dynamic-cursors
    # hyprlandPlugins.hyprexpo
    # ];
  };
  home.packages = with pkgs; [
    hyprpolkitagent
    hyprpicker
    dunst
    waybar
    walker
    flameshot
    wl-clipboard
    playerctl
    brightnessctl
  ];
  programs.gBar = {
    enable = true;
    config = {
      SNIIconSize = {
        Discord = 26;
        OBS = 23;
      };
      CenterTime = false;
      DateTimeStyle = "%a %D - %H:%M";
      WorkspaceSymbols = [" " " "];
      NetworkAdapter = "wlo1";
      BatteryFolder = "/sys/class/power_supply/BAT0";
    };
    extraConfig = ''

    '';
  };
  programs.hyprlock.enable = true;
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = ["${config.xdg.dataHome}/wallpapers/1310342.jpg"];
      wallpaper = [
        "DP-2,${config.xdg.dataHome}/wallpapers/1310342.jpg"
        "DP-1,${config.xdg.dataHome}/wallpapers/1310342.jpg"
      ];
    };
  };
  services.swayosd.enable = true;
  services.swayosd.display = "eDP-1";
  services.wlsunset = {
    enable = true;
    sunrise = "07:00";
    sunset = "14:00";
  };
}
