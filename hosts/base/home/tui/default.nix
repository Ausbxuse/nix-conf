{
  config,
  lib,
  pkgs,
  username,
  user-homedir,
  ...
}: {

  home = {
    username = "${username}";
    homeDirectory = "${user-homedir}";
    stateVersion = "24.05";
  };

  imports = [
    ./essentials.nix
    ./zsh-config
    ./tmux-config
  ];

  programs.zsh.initExtra = lib.mkDefault (builtins.readFile ./zsh-config/zshrc);
  programs.tmux.extraConfig = lib.mkDefault (builtins.readFile ./tmux-config/tmux.conf);
}
