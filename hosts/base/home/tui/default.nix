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

}
