{
  inputs,
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
      package = inputs.wezterm.packages.x86_64-linux.default;
    };
  };
}
