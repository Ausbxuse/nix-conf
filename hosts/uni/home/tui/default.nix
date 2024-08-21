{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../../base/home/tui/essentials.nix
    ../../../base/home/tui/zsh-config
    ../../../base/home/tui/tmux-config
  ];

  programs.zsh.initExtra = builtins.readFile ./zsh-config/zshrc;
  programs.tmux.extraConfig = builtins.readFile ./tmux-config/tmux.conf;

  home.activation.installStartupScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./bin}/ ${config.home.homeDirectory}/.local/bin/
  '';
}
