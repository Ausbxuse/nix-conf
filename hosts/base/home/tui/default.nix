{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./essentials.nix
    ./zsh-config
    ./tmux-config
  ];

  #programs.zsh.initExtra = builtins.readFile ./zsh-config/zshrc;
  #programs.tmux.extraConfig = builtins.readFile ./tmux-config/tmux.conf;
}
