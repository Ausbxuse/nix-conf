{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file.".config/tmux" = {
    source = ./tmux;
    recursive = true;
  };
}
