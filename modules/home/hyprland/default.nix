{pkgs, ...}: {
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
  ];
  programs.hyprlock.enable = true;
  services.hyprpaper.enable = true;
  services.swayosd.enable = true;
  services.swayosd.display = "eDP-1";
  services.wlsunset = {
    enable = true;
    sunrise = "07:00";
    sunset = "14:00";
  };
}
