{
  config,
  lib,
  pkgs,
  username,
  user-homedir,
  ...
}: {
  imports = [
    ./gui
    ./gnome
    ./tui
  ];

  home = {
    username = "${username}";
    homeDirectory = "${user-homedir}";
    stateVersion = "24.05";
  };
}
