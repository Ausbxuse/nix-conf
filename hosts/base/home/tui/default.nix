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

  programs.zsh.initExtra = lib.mkDefault (builtins.readFile ./zsh-config/zshrc);
  programs.tmux.extraConfig = lib.mkDefault (builtins.readFile ./tmux-config/tmux.conf);
}
