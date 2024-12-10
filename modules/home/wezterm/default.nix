{
  lib,
  pkgs,
  ...
}: {
  programs = {
    wezterm = {
      enable = true;
      enableZshIntegration = false;
      enableBashIntegration = true;
      extraConfig = lib.mkDefault (builtins.readFile ./wezterm.lua);
      #TODO: package = git
    };
  };
}
