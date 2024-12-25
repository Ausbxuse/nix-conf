{
  inputs,
  lib,
  ...
}: {
  programs = {
    wezterm = {
      enable = true;
      enableZshIntegration = false;
      enableBashIntegration = true;
      extraConfig = lib.mkDefault (builtins.readFile ./wezterm.lua);
      # package = inputs.wezterm.packages.x86_64-linux.default;
    };
  };
}
