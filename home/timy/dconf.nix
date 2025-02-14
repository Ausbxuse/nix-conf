# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings."org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
    binding = "<Super>u";
    command = "toggle-touchpad";
    name = "Touchpad toggle";
  };
}
