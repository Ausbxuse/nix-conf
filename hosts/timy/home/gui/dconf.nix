# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{
  lib,
  user-homedir,
  ...
}:
with lib.hm.gvariant; {
  dconf.settings."org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
    binding = "WLAN";
    command = "${user-homedir}/.local/bin/duo toggle";
    name = "Toggle duo screen mode";
  };
}
