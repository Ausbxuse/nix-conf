{
  config,
  lib,
  pkgs,
  username,
  user-homedir,
  ...
}: {
  imports = [
    ../../base/home/gui
    ../../base/home/gnome
    ./tui
  ];

  home = {
    username = "${username}";
    homeDirectory = "${user-homedir}";
    stateVersion = "24.05";
  };
}
