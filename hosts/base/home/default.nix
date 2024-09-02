{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./gui
    ./gnome
    ./tui
  ];
}
